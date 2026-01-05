// lib/core/utils/js/string_js_interpolation.dart

import 'dart:convert';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
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
  String interpolateJavascript([Map<String, dynamic>? variables]) {
    String source = this;

    // Early replacement for auth_token if present
    if (source.contains('{{auth_token}}')) {
      final token = UserRepositoryApp.instance.token;
      if (token != null && token.isNotEmpty) {
        source = source.replaceAll('{{auth_token}}', token);
      }
    }

    // Early replacement for user_id if present
    if (source.contains('{{user_id}}')) {
      final userId = UserRepositoryApp.instance.userApp?.id;
      if (userId != null && userId.toString().isNotEmpty) {
        source = source.replaceAll('{{user_id}}', userId.toString());
      }
    }

    // Early replacement for backend_host if present
    if (source.contains('{{backend_host}}')) {
      final host = Configuration.instance.backendHost;
      if (host.isNotEmpty) {
        source = source.replaceAll('{{backend_host}}', host);
      }
    }

    final Map<String, dynamic> allVars = {
      'auth_token': UserRepositoryApp.instance.token ?? '',
      'user_id': UserRepositoryApp.instance.userApp?.id?.toString() ?? '',
      'backend_host': Configuration.instance.backendHost,
      for (final v in Configuration.instance.variables) v.key: v.value,
    };
    if (variables != null) {
      allVars.addAll(variables);
    }

    final regex = RegExp(r'\{\{(.*?)\}\}', dotAll: true);
    if (!source.contains(regex)) return source;

    final result = source.replaceAllMapped(regex, (match) {
      final rawExpr = match.group(1);
      if (rawExpr == null) return '';

      final expr = rawExpr.trim();
      if (expr.isEmpty) return '';

      final script = _buildJsScript(expr, allVars);

      try {
        final value = evalJs(script);

        if (value == 'undefined' || value == 'null') {
          return match.group(0) ?? '';
        }

        return value;
      } catch (e) {
        return match.group(0) ?? '';
      }
    });

    return result;
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
