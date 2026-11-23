import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class Rule {
  final List<Condition> all;
  final List<Condition> any;
  final Rule? not; // can also negate a compound rule if needed

  Rule({
    List<Condition>? all,
    List<Condition>? any,
    this.not,
  })  : all = all ?? const [],
        any = any ?? const [];

  factory Rule.fromMap(JsonMap map) {
    List<Condition> _parseList(dynamic v) {
      if (v == null) return const [];
      if (v is! List) {
        throw const FormatException('visible_if: "all"/"any" must be an array');
      }
      return v.map((e) => Condition.fromMap(_coerceJsonMap(e))).toList();
    }

    final all = _parseList(map['all']);
    final any = _parseList(map['any']);

    Rule? not;
    if (map['not'] != null) {
      final nv = map['not'];
      if (nv is Map) {
        // Could be either a Condition or nested Rule. Detect by keys.
        final nm = nv.cast<String, dynamic>();
        final looksLikeRule = nm.containsKey('all') ||
            nm.containsKey('any') ||
            nm.containsKey('not');
        not = looksLikeRule
            ? Rule.fromMap(nm)
            : Rule(all: [Condition.fromMap(nm)]);
      } else {
        throw const FormatException('visible_if.not must be an object');
      }
    }

    if (all.isEmpty && any.isEmpty && not == null) {
      throw const FormatException(
          'visible_if must contain at least one of: all, any, not');
    }

    return Rule(all: all, any: any, not: not);
  }

  JsonMap toMap() {
    final m = <String, dynamic>{};
    if (all.isNotEmpty) m['all'] = all.map((c) => c.toMap()).toList();
    if (any.isNotEmpty) m['any'] = any.map((c) => c.toMap()).toList();
    if (not != null) m['not'] = not!.toMap();
    return m;
  }

  bool evaluate(Map<String, dynamic> state) {
    bool evalAll() => all.every((c) => c.evaluate(state));
    bool evalAny() => any.any((c) => c.evaluate(state));

    bool result;
    if (all.isNotEmpty && any.isNotEmpty) {
      result = evalAll() && evalAny(); // AND the groups when both present
    } else if (all.isNotEmpty) {
      result = evalAll();
    } else if (any.isNotEmpty) {
      result = evalAny();
    } else {
      result = true; // only "not" exists, treat base as true before negation
    }
    if (not != null) {
      result = result && !not!.evaluate(state);
    }
    return result;
  }

  String get description {
    final parts = <String>[];
    if (all.isNotEmpty) {
      if (parts.isNotEmpty) parts.add('AND');
      parts.add(all.map((c) => c.description).join(' AND '));
    }
    if (any.isNotEmpty) {
      if (parts.isNotEmpty) parts.add('OR');
      parts.add('(${any.map((c) => c.description).join(' OR ')})');
    }
    if (not != null) {
      if (parts.isNotEmpty) parts.add('AND');
      parts.add('NOT (${not!.description})');
    }
    return parts.join(' ');
  }
}

class Condition {
  static final JsVariableProvider _variableProvider = JsVariableProvider();
  static final RegExp _singleTemplatePathRegex =
      RegExp(r'^\s*\{\{\s*([a-zA-Z0-9_\.]+)\s*\}\}\s*$');

  final String field;
  final String
      op; // '=', '!=', '>', '>=', '<', '<=', 'in', 'not_in', 'empty', 'not_empty', 'contains'
  final dynamic value;

  Condition({
    required this.field,
    required this.op,
    this.value,
  }) : assert(field.trim().isNotEmpty, 'Condition.field is required');

  factory Condition.fromMap(JsonMap map) {
    final field = (map['field'] ?? '').toString().trim();
    final op = (map['op'] ?? '').toString().trim();
    if (field.isEmpty) {
      throw const FormatException('visible_if condition: "field" is required');
    }
    if (op.isEmpty) {
      throw const FormatException('visible_if condition: "op" is required');
    }
    return Condition(field: field, op: op, value: map['value']);
  }

  JsonMap toMap() => {
        'field': field,
        'op': op,
        if (value != null) 'value': value,
      };

  bool evaluate(Map<String, dynamic> state) {
    final allVars = _variableProvider.prepare(state);
    final lhs = _resolveLhs(state, allVars);
    final rhs = _resolveValue(state, allVars);

    switch (op) {
      case '=':
        return _equals(lhs, rhs);
      case '!=':
        return !_equals(lhs, rhs);
      case '>':
        return _compare(lhs, rhs) > 0;
      case '>=':
        return _compare(lhs, rhs) >= 0;
      case '<':
        return _compare(lhs, rhs) < 0;
      case '<=':
        return _compare(lhs, rhs) <= 0;
      case 'in':
        return rhs is Iterable ? _iterableContains(rhs, lhs) : false;
      case 'not_in':
        return rhs is Iterable ? !_iterableContains(rhs, lhs) : true;
      case 'is_empty':
        return _isEmpty(lhs);
      case 'is_not_empty':
        return !_isEmpty(lhs);
      case 'is_null':
        return lhs == null;
      case 'is_not_null':
        return lhs != null;
      case 'contains':
        if (lhs is Iterable) return _iterableContains(lhs, rhs);
        if (lhs is String && rhs != null) return lhs.contains(rhs.toString());
        return false;
      default:
        throw FormatException('Unsupported operator "$op" in visible_if');
    }
  }

  dynamic _resolveLhs(
    Map<String, dynamic> state,
    Map<String, dynamic> allVars,
  ) {
    if (field.contains('{{') || field.contains('[[')) {
      final pathMatch = _singleTemplatePathRegex.firstMatch(field);
      if (pathMatch != null) {
        final lookup = _lookupPath(pathMatch.group(1)!, state, allVars);
        if (lookup.found) return _coerceScalar(lookup.value);
      }
      return _resolveStringExpression(field, state);
    }
    final lookup = _lookupPath(field, state, allVars);
    if (lookup.found) return lookup.value;
    return state[field];
  }

  dynamic _resolveValue(
    Map<String, dynamic> state,
    Map<String, dynamic> allVars,
  ) {
    if (value is String) {
      final strVal = value as String;
      if (strVal.contains('{{') || strVal.contains('[[')) {
        final pathMatch = _singleTemplatePathRegex.firstMatch(strVal);
        if (pathMatch != null) {
          final lookup = _lookupPath(pathMatch.group(1)!, state, allVars);
          if (lookup.found) return _coerceScalar(lookup.value);
        }
        return _resolveStringExpression(strVal, state);
      }

      final numVal = num.tryParse(strVal);
      if (numVal != null) return numVal;
    }

    return value;
  }

  static _PathLookup _lookupPath(
    String path,
    Map<String, dynamic> rawState,
    Map<String, dynamic> allVars,
  ) {
    if (rawState.containsKey(path)) {
      return _PathLookup(true, rawState[path]);
    }
    if (allVars.containsKey(path)) {
      return _PathLookup(true, allVars[path]);
    }

    if (!path.contains('.')) {
      return const _PathLookup(false, null);
    }

    final parts = path.split('.');
    dynamic current = allVars;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else {
        return const _PathLookup(false, null);
      }
    }
    return _PathLookup(true, current);
  }

  static dynamic _coerceScalar(dynamic val) {
    if (val is String) {
      final numVal = num.tryParse(val);
      if (numVal != null) return numVal;
    }
    return val;
  }

  dynamic _resolveStringExpression(String input, Map<String, dynamic> state) {
    try {
      final interpolated = input.interpolateJavascript(state);
      final lowered = interpolated.toLowerCase();
      if (lowered == 'true' || lowered == 'false') {
        return lowered == 'true';
      }
      final numVal = num.tryParse(interpolated);
      if (numVal != null) return numVal;
      return interpolated;
    } catch (_) {
      // Fallback to raw value if interpolation fails
      return input;
    }
  }

  static bool _iterableContains(Iterable container, dynamic target) {
    if (container.contains(target)) return true;
    if (target != null) {
      final targetStr = target.toString();
      return container.any((e) => e?.toString() == targetStr);
    }
    return false;
  }

  static bool _equals(dynamic a, dynamic b) {
    // Strict but handles number/string/boolean gracefully
    if (a is num && b is num) return a == b;
    if (a is num && b is String) {
      final parsed = num.tryParse(b);
      if (parsed != null) return a == parsed;
    }
    if (a is String && b is num) {
      final parsed = num.tryParse(a);
      if (parsed != null) return parsed == b;
    }
    return a == b;
  }

  static int _compare(dynamic a, dynamic b) {
    if (a is num && b is num) return a.compareTo(b);
    if (a is String && b is String) return a.compareTo(b);
    throw const FormatException(
        'Comparison operators require matching scalar types');
    // You may extend for DateTime or other comparable types as needed.
  }

  static bool _isEmpty(dynamic v) {
    if (v == null) return true;
    if (v is String) return v.isEmpty;
    if (v is Iterable) return v.isEmpty;
    if (v is Map) return v.isEmpty;
    return false;
  }

  String get description {
    final cleanField = field.replaceAll(RegExp(r'[{}]'), '').trim();
    switch (op) {
      case '=':
        return '$cleanField == $value';
      case '!=':
        return '$cleanField != $value';
      case '>':
        return '$cleanField > $value';
      case '>=':
        return '$cleanField >= $value';
      case '<':
        return '$cleanField < $value';
      case '<=':
        return '$cleanField <= $value';
      case 'in':
        return '$cleanField in $value';
      case 'not_in':
        return '$cleanField not in $value';
      case 'is_empty':
        return '$cleanField is empty';
      case 'is_not_empty':
        return '$cleanField is not empty';
      case 'is_null':
        return '$cleanField is null';
      case 'is_not_null':
        return '$cleanField is not null';
      case 'contains':
        return '$cleanField contains $value';
      default:
        return '$cleanField $op $value';
    }
  }
}

/// Utility to coerce dynamic into JsonMap with a clear error if not possible.
JsonMap _coerceJsonMap(dynamic v) {
  if (v is Map) return v.cast<String, dynamic>();
  throw const FormatException('Expected an object');
}

class _PathLookup {
  final bool found;
  final dynamic value;

  const _PathLookup(this.found, this.value);
}
