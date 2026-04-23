// lib/core/utils/js/string_js_interpolation.dart

import 'src/js_interpolation_processor.dart';

export 'src/js_interpolation_processor.dart';
export 'src/js_variable_provider.dart';
export 'src/js_shortcut_evaluator.dart';
export 'src/js_script_builder.dart';

/// Extension to provide JS interpolation and visibility evaluation on strings.
extension StringJsInterpolationExtension on String {
  /// Replaces all `{{ ... }}` expressions with evaluated JavaScript.
  ///
  /// - Each call builds an isolated JS scope using an IIFE.
  /// - Variables are injected as `const` values inside that scope.
  /// - Helper functions like `now(format)` and numeric helpers are available.
  String interpolateJavascript([Map<String, dynamic>? variables]) {
    return JsInterpolationProcessor().interpolate(this, variables);
  }

  /// Similar to [interpolateJavascript], but throws if any expression fails to evaluate.
  String interpolateJavascriptStrict([Map<String, dynamic>? variables]) {
    return JsInterpolationProcessor(throwOnError: true)
        .interpolate(this, variables);
  }

  /// Evaluates the string as a JavaScript boolean expression.
  /// If the string is empty, returns true.
  /// If the string is wrapped in `{{ ... }}`, it strips them before evaluation.
  bool evaluateVisibility([Map<String, dynamic>? variables]) {
    return JsInterpolationProcessor().evaluateBoolean(this, variables);
  }
}
