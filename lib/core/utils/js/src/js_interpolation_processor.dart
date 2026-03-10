// lib/core/utils/js/src/js_interpolation_processor.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../js_eval.dart';
import 'js_variable_provider.dart';
import 'js_shortcut_evaluator.dart';
import 'js_script_builder.dart';

/// Internal processor for JavaScript interpolation and evaluation.
class JsInterpolationProcessor {
  static const bool enableLog = false;
  final bool throwOnError;

  final _variableProvider = JsVariableProvider();
  final _shortcutEvaluator = JsShortcutEvaluator();
  final _scriptBuilder = JsScriptBuilder();

  JsInterpolationProcessor({this.throwOnError = false});

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

      final info = ExpressionInfo.parse(expr);

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

      // Try shortcut evaluation first
      final shortcutResult = _shortcutEvaluator.tryEvaluate(expr, allVars);
      if (shortcutResult.success) {
        return _shortcutEvaluator.asBool(shortcutResult.value);
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
class ExpressionInfo {
  final String targetExpr;
  final bool isJsonWrapper;

  ExpressionInfo(this.targetExpr, this.isJsonWrapper);

  factory ExpressionInfo.parse(String expr) {
    if (expr.startsWith('JSON.stringify(') && expr.endsWith(')')) {
      final inner =
          expr.substring('JSON.stringify('.length, expr.length - 1).trim();
      return ExpressionInfo(inner, true);
    }
    return ExpressionInfo(expr, false);
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
