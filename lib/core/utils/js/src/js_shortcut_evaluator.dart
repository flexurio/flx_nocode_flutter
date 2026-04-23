// lib/core/utils/js/src/js_shortcut_evaluator.dart

import 'js_date_helper.dart';

/// Result of a shortcut evaluation attempt.
class EvaluationResult {
  /// The evaluated value.
  final dynamic value;

  /// Whether the shortcut evaluation was successful.
  final bool success;

  EvaluationResult.success(this.value) : success = true;
  EvaluationResult.failure()
      : value = null,
        success = false;
}

/// Evaluates common simple JavaScript-like patterns without needing a full JS engine.
/// This provides a significant performance boost for simple expressions and
/// avoids dependencies on native JS libraries in testing/CI environments.
class JsShortcutEvaluator {
  /// Attempts to evaluate the [expr] using simple pattern matching.
  /// Returns [EvaluationResult.success] with the result if patterns were matched,
  /// otherwise returns [EvaluationResult.failure].
  EvaluationResult tryEvaluate(String expr, Map<String, dynamic> variables) {
    final trimmed = expr.trim();
    if (trimmed.isEmpty) return EvaluationResult.success('');

    // 1. Simple path access (e.g. "form.name") or literals (e.g. "null", "true", "'Hello'")
    if (_isSimplePath(trimmed)) {
      final res = _tryResolvePath(trimmed, variables);
      if (res.success) return res;
    }

    // 2. Simple string concatenation (e.g. "'Hello ' + form.name")
    if (_isConcatenation(trimmed)) {
      final val = _resolveConcatenation(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 3. Date Formatting Helper (e.g. "formatDate(new Date(date), 'yyyy-MM-dd')")
    if (trimmed.startsWith('formatDate(')) {
      final val =
          JsDateHelper.resolveFormatDate(trimmed, variables, _resolvePath);
      if (val != null) return EvaluationResult.success(val);
    }

    // 4. Current Time Helper (e.g. "now('HH:mm')")
    if (trimmed.startsWith('now(')) {
      final val = JsDateHelper.resolveNow(trimmed);
      if (val != null) return EvaluationResult.success(val);
    }

    // 5. Date Methods (e.g. "new Date().toISOString()" or ".getFullYear()")
    if (trimmed.startsWith('new Date(')) {
      if (trimmed.endsWith('.toISOString()')) {
        final val =
            JsDateHelper.resolveDateToIso(trimmed, variables, _resolvePath);
        if (val != null) return EvaluationResult.success(val);
      } else if (trimmed.endsWith('.getFullYear()')) {
        final val = JsDateHelper.resolveDateGetFullYear(
            trimmed, variables, _resolvePath);
        if (val != null) return EvaluationResult.success(val);
      }
    }

    // 6. Date Arithmetic (e.g. time difference constants)
    if (trimmed.contains('-') && trimmed.contains('new Date(')) {
      final val =
          JsDateHelper.resolveDateMath(trimmed, variables, _resolvePath);
      if (val != null) return EvaluationResult.success(val);
    }

    // 7. Ternary Expressions (e.g. "condition ? 'yes' : 'no'")
    if (trimmed.contains('?') && trimmed.contains(':')) {
      final val = _resolveTernary(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    // 8. Basic Equality Comparisons (e.g. "a === b")
    if (trimmed.contains('==') || trimmed.contains('!=')) {
      final val = _resolveComparison(trimmed, variables);
      if (val != null) return EvaluationResult.success(val);
    }

    return EvaluationResult.failure();
  }

  bool? _resolveComparison(String expr, Map<String, dynamic> vars) {
    String? op;
    if (expr.contains('===')) {
      op = '===';
    } else if (expr.contains('!==')) {
      op = '!==';
    } else if (expr.contains('==')) {
      op = '==';
    } else if (expr.contains('!=')) {
      op = '!=';
    }

    if (op == null) return null;

    final parts = expr.split(op);
    if (parts.length != 2) return null;

    final leftExpr = parts[0].trim();
    final rightExpr = parts[1].trim();

    final left = _resolvePath(leftExpr, vars);
    final right = _resolvePath(rightExpr, vars);

    if (op == '===' || op == '==') {
      return left == right;
    } else {
      return left != right;
    }
  }

  /// Checks if the expression looks like a simple path or a literal.
  bool _isSimplePath(String expr) {
    if (_isQuoted(expr)) return true;
    return !expr.contains('+') &&
        !expr.contains('-') &&
        !expr.contains('*') &&
        !expr.contains('/') &&
        !expr.contains('(') &&
        !expr.contains('?') &&
        !expr.contains('"') &&
        !expr.contains("'");
  }

  /// Checks if a string is a quoted literal.
  bool _isQuoted(String s) {
    if (s.length < 2) return false;
    return (s.startsWith("'") && s.endsWith("'")) ||
        (s.startsWith('"') && s.endsWith('"'));
  }

  /// Checks if the expression looks like a simple string concatenation.
  bool _isConcatenation(String expr) {
    return expr.contains('+') && !expr.contains('(') && !expr.contains('new ');
  }

  /// Resolves a simple path or literal.
  EvaluationResult _tryResolvePath(String path, Map<String, dynamic> vars) {
    if (path == 'null') return EvaluationResult.success(null);
    if (path == 'true') return EvaluationResult.success(true);
    if (path == 'false') return EvaluationResult.success(false);
    if (path == 'undefined') return EvaluationResult.success(null);

    // Handle string literals
    if (_isQuoted(path)) {
      return EvaluationResult.success(path.substring(1, path.length - 1));
    }

    // Handle numeric literals
    final numVal = num.tryParse(path);
    if (numVal != null) return EvaluationResult.success(numVal);

    // Handle object paths (e.g. a.b.c)
    final parts = path.split('.');
    dynamic current = vars;
    for (final part in parts) {
      if (current is Map && current.containsKey(part)) {
        current = current[part];
      } else if (part == 'length' && (current is List || current is String)) {
        current = current.length;
      } else if (current is Map &&
          !current.containsKey(part) &&
          vars.containsKey(part)) {
        // Fallback to top-level if not found in nested context
        current = vars[part];
      } else {
        return EvaluationResult.failure();
      }
    }
    return EvaluationResult.success(current);
  }

  /// Helper for internal components to resolve paths.
  dynamic _resolvePath(String path, Map<String, dynamic> vars) {
    final trimmed = path.trim();
    final res = _tryResolvePath(trimmed, vars);
    if (res.success) return res.value;

    // If not a simple path, it might be a concatenation (e.g. inside new Date())
    if (_isConcatenation(trimmed)) {
      return _resolveConcatenation(trimmed, vars);
    }
    return null;
  }

  /// Resolves simple string concatenation.
  String? _resolveConcatenation(String expr, Map<String, dynamic> vars) {
    final parts = expr.split('+');
    String result = '';
    for (final part in parts) {
      final trimmed = part.trim();
      if (_isQuoted(trimmed)) {
        result += trimmed.substring(1, trimmed.length - 1);
      } else {
        final val = _resolvePath(trimmed, vars);
        if (val == null) return null;
        result += val.toString();
      }
    }
    return result;
  }

  /// Resolves ternary expressions: condition ? trueVal : falseVal
  dynamic _resolveTernary(String expr, Map<String, dynamic> vars) {
    final qmarkIndex = expr.indexOf('?');
    if (qmarkIndex == -1) return null;

    final condition = expr.substring(0, qmarkIndex).trim();
    final remaining = expr.substring(qmarkIndex + 1);

    final colonIndex = remaining.lastIndexOf(':');
    if (colonIndex == -1) return null;

    final trueValExpr = remaining.substring(0, colonIndex).trim();
    final falseValExpr = remaining.substring(colonIndex + 1).trim();

    final conditionValue = _resolvePath(condition, vars);
    final bool conditionResult = asBool(conditionValue);

    final targetExpr = conditionResult ? trueValExpr : falseValExpr;

    // Recursively try to evaluate the selected branch
    final res = tryEvaluate(targetExpr, vars);
    return res.success ? res.value : _resolvePath(targetExpr, vars);
  }

  /// Converts a value to boolean according to JS-like rules.
  bool asBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;
    if (value is num) return value != 0;
    if (value is String) {
      final s = value.toLowerCase();
      if (s.isEmpty) return false;
      if (s == 'false') return false;
      if (s == 'null') return false;
      if (s == 'undefined') return false;
      return true;
    }
    return true;
  }
}
