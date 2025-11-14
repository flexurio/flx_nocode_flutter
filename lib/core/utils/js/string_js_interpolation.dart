// lib/core/utils/js/string_js_interpolation.dart

import 'dart:convert';
import 'js_eval.dart';

extension StringJsInterpolationExtension on String {
  /// Replaces all `{{ ... }}` expressions with evaluated JavaScript.
  ///
  /// - Each call builds an isolated JS scope using an IIFE:
  ///   `(function(){ ... return <expr>; })()`
  /// - [variables] are injected as `const` values inside that scope.
  /// - Helper `now(format)` is available:
  ///   - now()                    → Date.toString()
  ///   - now("YYYY-MM-DD")
  ///   - now("DD MMM YYYY")
  ///   - now("DD MMMM YYYY HH:mm")
  String interpolateJavascript(Map<String, dynamic> variables) {
    final regex = RegExp(r'\{\{(.*?)\}\}', dotAll: true);

    return replaceAllMapped(regex, (match) {
      final rawExpr = match.group(1);
      if (rawExpr == null) return '';

      final expr = rawExpr.trim();
      if (expr.isEmpty) return '';

      final script = _buildJsScript(expr, variables);

      try {
        final value = evalJs(script);

        if (value.isEmpty || value == 'undefined' || value == 'null') {
          // Fallback: keep original placeholder if result looks invalid
          return match.group(0) ?? '';
        }

        return value;
      } catch (_) {
        // On error: keep original `{{ ... }}` to make debugging easier.
        return match.group(0) ?? '';
      }
    });
  }
}

/// Builds a self-contained JS snippet:
/// (function() {
///   // helpers
///   // injected vars
///   return <expr>;
/// })()
String _buildJsScript(
  String expr,
  Map<String, dynamic> variables,
) {
  final buffer = StringBuffer();

  buffer.writeln('(function(){');

  // Helpers
  buffer.writeln('function pad(n){return n<10?"0"+n:n;}');

  buffer.writeln('const MONTH_NAMES=['
      '"January","February","March","April","May","June",'
      '"July","August","September","October","November","December"];');

  buffer.writeln('const MONTH_NAMES_SHORT=['
      '"Jan","Feb","Mar","Apr","May","Jun",'
      '"Jul","Aug","Sep","Oct","Nov","Dec"];');

  buffer.writeln('function formatDate(date,fmt){'
      'if(!fmt) return date.toString();'
      'return fmt'
      '.replace("YYYY",date.getFullYear())'
      '.replace("MMMM",MONTH_NAMES[date.getMonth()])'
      '.replace("MMM",MONTH_NAMES_SHORT[date.getMonth()])'
      '.replace("MM",pad(date.getMonth()+1))'
      '.replace("DD",pad(date.getDate()))'
      '.replace("HH",pad(date.getHours()))'
      '.replace("mm",pad(date.getMinutes()))'
      '.replace("ss",pad(date.getSeconds()));'
      '}');

  buffer.writeln('function now(fmt){'
      'var d=new Date();'
      'return formatDate(d,fmt);'
      '}');

  // Inject variables as const (local to this IIFE)
  variables.forEach((key, value) {
    final jsonValue = jsonEncode(value);
    // NOTE: assumes `key` is a valid JS identifier.
    buffer.writeln('const $key = $jsonValue;');
  });

  buffer.writeln('return ($expr);');
  buffer.writeln('})()');

  return buffer.toString();
}
