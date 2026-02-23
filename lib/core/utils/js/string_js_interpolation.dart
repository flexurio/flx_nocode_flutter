// lib/core/utils/js/string_js_interpolation.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'js_eval.dart';

extension StringJsInterpolationExtension on String {
  /// Replaces all `{{ ... }}` expressions with evaluated JavaScript.
  ///
  /// - Each call builds an isolated JS scope using an IIFE:
  ///   `(function(){ ... return <expr>; })()`
  /// - [variables] are injected as `const` values inside that scope.
  /// - Helper `now(format)` and numeric helpers are available.
  static const bool enableLog = false;

  Map<String, dynamic> _prepareVariables([Map<String, dynamic>? variables]) {
    final config = Configuration.instance;
    final userRepo = UserRepositoryApp.instance;

    return <String, dynamic>{
      // 1. Load context variables (form, record, etc.)
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

      // 2. Load custom global variables from config
      for (final v in config.variables) v.key: v.value,

      // 3. System variables (Highest priority, cannot be overwritten by record data)
      'auth_token': userRepo.token ?? '',
      'user_id': userRepo.userApp?.id?.toString() ?? '',
      'backend_host': config.backendHost,
    };
  }

  String interpolateJavascript([Map<String, dynamic>? variables]) {
    final regex = RegExp(r'\{\{\s*((?:(?!\}\}).)*)\s*\}\}', dotAll: true);
    if (!contains(regex)) return this;

    final allVars = _prepareVariables(variables);

    if (enableLog) {
      const encoder = JsonEncoder.withIndent('  ');
      try {
        debugPrint(
            '  [JS Interpolation] Variables:\n${encoder.convert(allVars)}');
      } catch (_) {
        debugPrint('  [JS Interpolation] Variables: $allVars');
      }
    }

    return replaceAllMapped(regex, (match) {
      final expr = match.group(1)?.trim();
      if (expr == null || expr.isEmpty) return '';

      if (enableLog) {
        debugPrint('  [JS Interpolation] Evaluating: {{ $expr }}');
      }

      try {
        final script = _buildJsScript(expr, allVars);
        final value = evalJs(script);

        return (value == 'undefined' || value == 'null') ? '' : value;
      } catch (e) {
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

  /// Evaluates the string as a JavaScript boolean expression.
  /// If the string is empty, returns true.
  /// If the string is wrapped in `{{ ... }}`, it strips them before evaluation.
  bool evaluateVisibility([Map<String, dynamic>? variables]) {
    final condition = trim();
    if (condition.isEmpty) return true;

    try {
      final allVars = _prepareVariables(variables);

      String expr = condition;
      if (condition.startsWith('{{') && condition.endsWith('}}')) {
        expr = condition.substring(2, condition.length - 2).trim();
      }

      final script = _buildJsScript(expr, allVars);
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
        'var f = fmt || "yyyy-MM-dd HH:mm:ss";'
        'return f'
        '.replace("yyyy",date.getFullYear())'
        '.replace("YYYY",date.getFullYear())'
        '.replace("MMMM",MONTH_NAMES[date.getMonth()])'
        '.replace("MMM",MONTH_NAMES_SHORT[date.getMonth()])'
        '.replace("MM",pad(date.getMonth()+1))'
        '.replace("dd",pad(date.getDate()))'
        '.replace("DD",pad(date.getDate()))'
        '.replace("HH",pad(date.getHours()))'
        '.replace("mm",pad(date.getMinutes()))'
        '.replace("ss",pad(date.getSeconds()));'
        '}');

    buffer.writeln('function now(fmt){'
        'var d=new Date();'
        'return formatDate(d,fmt);'
        '}');

    // Numeric helpers
    buffer.writeln('function toNumber(v){'
        'var n=Number(v);'
        'return isNaN(n)?0:n;'
        '}');

    buffer.writeln('function abs(v){return Math.abs(toNumber(v));}');

    buffer.writeln('function length(v){'
        'if(Array.isArray(v)||typeof v==="string") return v.length;'
        'if(v && typeof v==="object") return Object.keys(v).length;'
        'return 0;'
        '}');

    buffer.writeln('function contains(container,value){'
        'if(container===null||container===undefined) return false;'
        'if(Array.isArray(container)) return container.includes(value);'
        'if(typeof container==="string") return container.includes(String(value));'
        'if(typeof container==="object") '
        'return Object.values(container).some(function(v){return v===value;});'
        'return false;'
        '}');

    buffer.writeln('function sum(list,formula){'
        'if(!Array.isArray(list)) return 0;'
        'if(!formula){'
        'return list.reduce(function(acc,v){return acc+toNumber(v);},0);'
        '}'
        'var expr=String(formula).replace(/\\s+/g,"");'
        'var parts=expr.split("*");'
        'if(parts.length!==2) return 0;'
        'return list.reduce(function(acc,item){'
        'if(!item||typeof item!=="object") return acc;'
        'var a=toNumber(item[parts[0]]);'
        'var b=toNumber(item[parts[1]]);'
        'return acc+(a*b);'
        '},0);'
        '}');

    dynamic sanitize(dynamic value) {
      if (value == null || value is num || value is bool || value is String) {
        return value;
      }
      if (value is Map) {
        final result = <String, dynamic>{};
        value.forEach((k, v) {
          if (k == 'form' || k == 'data' || k == 'current') return;
          result[k.toString()] = sanitize(v);
        });
        return result;
      }
      if (value is List) {
        return value.map(sanitize).toList();
      }
      return null; // Skip non-JSON-encodable types like Controllers
    }

    // Inject variables as const (local to this IIFE)
    variables.forEach((key, value) {
      // Ensure key is a valid JS identifier
      final safeKey = key.replaceAll(RegExp(r'[^a-zA-Z0-9_$]'), '_');
      if (safeKey.isEmpty) return;

      try {
        final sanitized = sanitize(value);
        final jsonValue = jsonEncode(sanitized);
        buffer.writeln('const $safeKey = $jsonValue;');
      } catch (e) {
        if (enableLog) {
          debugPrint('Skipping variable "$key": $e');
        }
      }
    });

    buffer.writeln('return $expr;');
    buffer.write('})()');

    return buffer.toString();
  }
}
