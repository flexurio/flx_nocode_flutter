// lib/core/utils/js/string_js_interpolation.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'js_eval.dart';

/// Extension to provide JS interpolation and visibility evaluation on strings.
extension StringJsInterpolationExtension on String {
  /// Replaces all `{{ ... }}` expressions with evaluated JavaScript.
  ///
  /// - Each call builds an isolated JS scope using an IIFE.
  /// - Variables are injected as `const` values inside that scope.
  /// - Helper functions like `now(format)` and numeric helpers are available.
  String interpolateJavascript([Map<String, dynamic>? variables]) {
    return _JsInterpolationProcessor().interpolate(this, variables);
  }

  /// Similar to [interpolateJavascript], but throws if any expression fails to evaluate.
  String interpolateJavascriptStrict([Map<String, dynamic>? variables]) {
    return _JsInterpolationProcessor(throwOnError: true)
        .interpolate(this, variables);
  }

  /// Evaluates the string as a JavaScript boolean expression.
  /// If the string is empty, returns true.
  /// If the string is wrapped in `{{ ... }}`, it strips them before evaluation.
  bool evaluateVisibility([Map<String, dynamic>? variables]) {
    return _JsInterpolationProcessor().evaluateBoolean(this, variables);
  }
}

/// Internal processor for JavaScript interpolation and evaluation.
class _JsInterpolationProcessor {
  static const bool enableLog = false;
  final bool throwOnError;

  final _variableProvider = _JsVariableProvider();
  final _shortcutEvaluator = _JsShortcutEvaluator();
  final _scriptBuilder = _JsScriptBuilder();

  _JsInterpolationProcessor({this.throwOnError = false});

  /// Interpolates `{{ ... }}` blocks in [text] with evaluated values.
  String interpolate(String text, [Map<String, dynamic>? variables]) {
    final regex = RegExp(r'\{\{\s*((?:(?!\}\}).)*)\s*\}\}', dotAll: true);
    if (!text.contains(regex)) return text;

    final allVars = _variableProvider.prepare(variables);

    if (enableLog) {
      _logVariables(allVars);
    }

    return text.replaceAllMapped(regex, (match) {
      final expr = match.group(1)?.trim();
      if (expr == null || expr.isEmpty) return '';

      if (enableLog) {
        debugPrint('  [JS Interpolation] Evaluating: {{ $expr }}');
      }

      final info = _ExpressionInfo.parse(expr);

      // Try shortcut evaluation (faster, handles common cases)
      final shortcutResult =
          _shortcutEvaluator.tryEvaluate(info.targetExpr, allVars);
      if (shortcutResult.success) {
        return info.wrapResult(shortcutResult.value);
      }

      // Fallback to full JS evaluation
      try {
        final script = _scriptBuilder.build(info.targetExpr, allVars);
        final value = evalJs(script);

        if (value == 'undefined' || value == 'null') {
          return info.isJsonWrapper ? value : '';
        }
        return value;
      } catch (e) {
        if (throwOnError) rethrow;

        if (enableLog) {
          debugPrint('  ❌ [JS Interpolation] Failed to evaluate: {{ $expr }}');
          debugPrint('     Error: $e');
          if (allVars.isNotEmpty) {
            debugPrint('     Available keys: ${allVars.keys.join(", ")}');
          }
        }
        return match.group(0) ?? '';
      }
    });
  }

  /// Evaluates [condition] as a boolean JS expression.
  bool evaluateBoolean(String condition, [Map<String, dynamic>? variables]) {
    final sanitizedCondition = condition.trim();
    if (sanitizedCondition.isEmpty) return true;

    try {
      final allVars = _variableProvider.prepare(variables);

      String expr = sanitizedCondition;
      if (sanitizedCondition.startsWith('{{') &&
          sanitizedCondition.endsWith('}}')) {
        expr = sanitizedCondition
            .substring(2, sanitizedCondition.length - 2)
            .trim();
      }

      final script = _scriptBuilder.build(expr, allVars);
      final value = evalJs(script).toLowerCase();
      return value == 'true';
    } catch (e) {
      if (enableLog) {
        debugPrint('  ❌ [JS Visibility] Failed to evaluate: $condition');
        debugPrint('     Error: $e');
      }
      return true; // Default to visible on error to avoid soft-locking UI
    }
  }

  void _logVariables(Map<String, dynamic> vars) {
    const encoder = JsonEncoder.withIndent('  ');
    try {
      debugPrint('  [JS Interpolation] Variables:\n${encoder.convert(vars)}');
    } catch (_) {
      debugPrint('  [JS Interpolation] Variables: $vars');
    }
  }
}

/// Information about an expression, including whether it's wrapped in JSON.stringify.
class _ExpressionInfo {
  final String targetExpr;
  final bool isJsonWrapper;

  _ExpressionInfo(this.targetExpr, this.isJsonWrapper);

  factory _ExpressionInfo.parse(String expr) {
    if (expr.startsWith('JSON.stringify(') && expr.endsWith(')')) {
      final inner =
          expr.substring('JSON.stringify('.length, expr.length - 1).trim();
      return _ExpressionInfo(inner, true);
    }
    return _ExpressionInfo(expr, false);
  }

  String wrapResult(dynamic value) {
    if (isJsonWrapper) {
      try {
        return jsonEncode(value);
      } catch (_) {
        return 'null';
      }
    }
    if (value == null) return '';
    if (value is String || value is num || value is bool) {
      return value.toString();
    }
    return value.toString();
  }
}

/// Provides variables from context, configuration, and system state.
class _JsVariableProvider {
  Map<String, dynamic> prepare([Map<String, dynamic>? variables]) {
    Configuration? config;
    try {
      config = Configuration.instance;
    } catch (_) {}

    UserRepositoryApp? userRepo;
    try {
      userRepo = UserRepositoryApp.instance;
    } catch (_) {}

    final allVars = <String, dynamic>{
      // 1. Context variables
      if (variables != null) ...{
        ...variables,
        if (!variables.containsKey('form'))
          'form': variables['form'] ?? variables,
        if (!variables.containsKey('record'))
          'record': variables['record'] ?? variables['data'] ?? variables,
        if (!variables.containsKey('vars')) 'vars': variables['vars'] ?? {},
        if (!variables.containsKey('data'))
          'data': variables['data'] ?? variables,
        if (!variables.containsKey('current'))
          'current': variables['current'] ?? variables['data'] ?? variables,
        if (!variables.containsKey('http')) 'http': variables['http'] ?? {},
      },

      // 2. Custom global variables
      if (config != null)
        for (final v in config.variables) v.key: v.value,

      // 3. System variables
      'auth_token': userRepo?.token ?? '',
      'user_id': userRepo?.userApp?.id?.toString() ?? '',
      'backend_host': config?.backendHost ?? '',
    };

    return allVars;
  }
}

/// Result of a shortcut evaluation attempt.
class _EvaluationResult {
  final dynamic value;
  final bool success;
  _EvaluationResult.success(this.value) : success = true;
  _EvaluationResult.failure()
      : value = null,
        success = false;
}

/// Evaluates common simple patterns without needing the full JS engine.
class _JsShortcutEvaluator {
  _EvaluationResult tryEvaluate(String expr, Map<String, dynamic> variables) {
    // 1. Simple path access
    if (_isSimplePath(expr)) {
      final val = _resolvePath(expr, variables);
      // We check for null specifically because it could be a valid resolved value (or part of 'null' string)
      if (val != null || expr == 'null') return _EvaluationResult.success(val);
    }

    // 2. String concatenation
    if (_isConcatenation(expr)) {
      final val = _resolveConcatenation(expr, variables);
      if (val != null) return _EvaluationResult.success(val);
    }

    // 3. Date ISO string
    if (expr.startsWith('new Date(') && expr.endsWith(').toISOString()')) {
      final val = _resolveDateToIso(expr, variables);
      if (val != null) return _EvaluationResult.success(val);
    }

    return _EvaluationResult.failure();
  }

  bool _isSimplePath(String expr) {
    return !expr.contains('+') &&
        !expr.contains('(') &&
        !expr.contains('"') &&
        !expr.contains("'");
  }

  bool _isConcatenation(String expr) {
    return expr.contains('+') && !expr.contains('(');
  }

  dynamic _resolvePath(String path, Map<String, dynamic> vars) {
    if (path == 'null') return null;
    final parts = path.split('.');
    dynamic current = vars;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else if (part == 'length' && (current is List || current is String)) {
        current = current.length;
      } else {
        return null;
      }
    }
    return current;
  }

  String? _resolveConcatenation(String expr, Map<String, dynamic> vars) {
    final parts = expr.split('+').map((e) => e.trim()).toList();
    String result = '';
    for (final part in parts) {
      if ((part.startsWith('"') && part.endsWith('"')) ||
          (part.startsWith("'") && part.endsWith("'"))) {
        result += part.substring(1, part.length - 1);
      } else {
        final val = _resolvePath(part, vars);
        if (val == null) return null;
        result += val.toString();
      }
    }
    return result;
  }

  String? _resolveDateToIso(String expr, Map<String, dynamic> vars) {
    final inner = expr
        .substring('new Date('.length, expr.length - ').toISOString()'.length)
        .trim();
    String? resolvedInner;
    if ((inner.startsWith('"') && inner.endsWith('"')) ||
        (inner.startsWith("'") && inner.endsWith("'"))) {
      resolvedInner = inner.substring(1, inner.length - 1);
    } else if (_isConcatenation(inner)) {
      resolvedInner = _resolveConcatenation(inner, vars);
    } else {
      resolvedInner = _resolvePath(inner, vars)?.toString();
    }

    if (resolvedInner != null) {
      if (resolvedInner.isEmpty) return "";
      try {
        final dt = DateTime.parse(resolvedInner);
        return dt.toUtc().toIso8601String();
      } catch (_) {
        return "";
      }
    }
    return "";
  }
}

/// Builds the JS script containing helper functions and injected variables.
class _JsScriptBuilder {
  String build(String expr, Map<String, dynamic> variables) {
    final buffer = StringBuffer();
    buffer.writeln('(function(){');

    _appendHelpers(buffer);
    _appendVariables(buffer, variables);

    buffer.writeln('return $expr;');
    buffer.write('})()');
    return buffer.toString();
  }

  void _appendHelpers(StringBuffer buffer) {
    buffer.writeln('  // Enhanced Date Support');
    buffer.writeln('  const NativeDate = Date;');
    buffer.writeln('  const oldIso = NativeDate.prototype.toISOString;');
    buffer.writeln('  NativeDate.prototype.toISOString = function() {');
    buffer.writeln('    if (isNaN(this.getTime())) return "";');
    buffer.writeln(
        '    try { return oldIso.call(this); } catch(e) { return ""; }');
    buffer.writeln('  };');
    buffer.writeln(
        '  NativeDate.prototype.toJSON = function() { return this.toISOString(); };');
    buffer.writeln('  ');
    buffer.writeln('  function EnhancedDate() {');
    buffer.writeln(
        '    if (!(this instanceof EnhancedDate)) return NativeDate.apply(null, arguments);');
    buffer.writeln('    var date;');
    buffer.writeln('    if (arguments.length === 0) {');
    buffer.writeln('      date = new NativeDate();');
    buffer.writeln('    } else if (arguments.length === 1) {');
    buffer.writeln('      var s = arguments[0];');
    buffer.writeln('      date = new NativeDate(s);');
    buffer
        .writeln('      if (typeof s === "string" && isNaN(date.getTime())) {');
    buffer.writeln(
        '        var m = s.match(/([a-zA-Z]+)\\s+(\\d+),?\\s+(\\d+)/);');
    buffer.writeln('        if (m) {');
    buffer.writeln('          var mi = MONTH_NAMES.indexOf(m[1]);');
    buffer.writeln(
        '          if (mi === -1) mi = MONTH_NAMES_SHORT.indexOf(m[1]);');
    buffer.writeln(
        '          if (mi !== -1) date = new NativeDate(m[3], mi, m[2]);');
    buffer.writeln('        }');
    buffer.writeln('      }');
    buffer.writeln('    } else {');
    buffer.writeln('      var args = Array.prototype.slice.call(arguments);');
    buffer.writeln(
        '      date = new (NativeDate.bind.apply(NativeDate, [null].concat(args)))();');
    buffer.writeln('    }');
    buffer.writeln('    return date;');
    buffer.writeln('  }');
    buffer.writeln('  EnhancedDate.prototype = NativeDate.prototype;');
    buffer.writeln('  EnhancedDate.now = NativeDate.now;');
    buffer.writeln('  EnhancedDate.UTC = NativeDate.UTC;');
    buffer.writeln('  EnhancedDate.parse = NativeDate.parse;');
    buffer.writeln('  var Date = EnhancedDate;');

    buffer.writeln('  function pad(n){return n<10?"0"+n:n;}');

    buffer.writeln('  const MONTH_NAMES=['
        '"January","February","March","April","May","June",'
        '"July","August","September","October","November","December"];');

    buffer.writeln('  const MONTH_NAMES_SHORT=['
        '"Jan","Feb","Mar","Apr","May","Jun",'
        '"Jul","Aug","Sep","Oct","Nov","Dec"];');

    buffer.writeln('  function formatDate(date,fmt){'
        '    if(!date || isNaN(date.getTime())) return "";'
        '    var f = fmt || "yyyy-MM-dd HH:mm:ss";'
        '    return f'
        '      .replace("yyyy",date.getFullYear())'
        '      .replace("YYYY",date.getFullYear())'
        '      .replace("MMMM",MONTH_NAMES[date.getMonth()])'
        '      .replace("MMM",MONTH_NAMES_SHORT[date.getMonth()])'
        '      .replace("MM",pad(date.getMonth()+1))'
        '      .replace("dd",pad(date.getDate()))'
        '      .replace("DD",pad(date.getDate()))'
        '      .replace("HH",pad(date.getHours()))'
        '      .replace("mm",pad(date.getMinutes()))'
        '      .replace("ss",pad(date.getSeconds()));'
        '  }');

    buffer.writeln('  function now(fmt){'
        '    var d=new Date();'
        '    return formatDate(d,fmt);'
        '  }');

    buffer.writeln('  function toNumber(v){'
        '    var n=Number(v);'
        '    return isNaN(n)?0:n;'
        '  }');

    buffer.writeln('  function abs(v){return Math.abs(toNumber(v));}');

    buffer.writeln('  function length(v){'
        '    if(Array.isArray(v)||typeof v==="string") return v.length;'
        '    if(v && typeof v==="object") return Object.keys(v).length;'
        '    return 0;'
        '  }');

    buffer.writeln('  function contains(container,value){'
        '    if(container===null||container===undefined) return false;'
        '    if(Array.isArray(container)) return container.includes(value);'
        '    if(typeof container==="string") return container.includes(String(value));'
        '    if(typeof container==="object") '
        '      return Object.values(container).some(function(v){return v===value;});'
        '    return false;'
        '  }');

    buffer.writeln('  function sum(list,formula){'
        '    if(!Array.isArray(list)) return 0;'
        '    if(!formula){'
        '      return list.reduce(function(acc,v){return acc+toNumber(v);},0);'
        '    }'
        '    var expr=String(formula).replace(/\\s+/g,"");'
        '    var parts=expr.split("*");'
        '    if(parts.length!==2) return 0;'
        '    return list.reduce(function(acc,item){'
        '      if(!item||typeof item!=="object") return acc;'
        '      var a=toNumber(item[parts[0]]);'
        '      var b=toNumber(item[parts[1]]);'
        '      return acc+(a*b);'
        '    },0);'
        '  }');
  }

  void _appendVariables(StringBuffer buffer, Map<String, dynamic> variables) {
    variables.forEach((key, value) {
      final safeKey = key.replaceAll(RegExp(r'[^a-zA-Z0-9_$]'), '_');
      if (safeKey.isEmpty) return;

      try {
        final sanitized = _sanitize(value);
        final jsonValue = jsonEncode(sanitized);
        buffer.writeln('  const $safeKey = $jsonValue;');
      } catch (_) {}
    });
  }

  dynamic _sanitize(dynamic value) {
    if (value == null || value is num || value is bool || value is String) {
      return value;
    }
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), _sanitize(v)));
    }
    if (value is List) {
      return value.map(_sanitize).toList();
    }
    return null; // Skip non-JSON-encodable types
  }
}
