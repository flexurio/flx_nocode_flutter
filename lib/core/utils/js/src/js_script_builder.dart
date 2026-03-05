// lib/core/utils/js/src/js_script_builder.dart

import 'dart:convert';

/// Builds the JS script containing helper functions and injected variables.
class JsScriptBuilder {
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
    buffer.writeln(
        '  var _NativeDate = (typeof globalThis !== "undefined" ? globalThis.Date : Date);');
    buffer.writeln('  function EnhancedDate() {');
    buffer.writeln('    if (!_NativeDate) return null;');
    buffer.writeln(
        '    if (!(this instanceof EnhancedDate)) return _NativeDate.apply(null, arguments);');
    buffer.writeln('    if (arguments.length === 0) return new _NativeDate();');
    buffer.writeln(
        '    if (arguments.length === 1) return new _NativeDate(arguments[0]);');
    buffer.writeln('    var args = Array.prototype.slice.call(arguments);');
    buffer.writeln(
        '    return new (_NativeDate.bind.apply(_NativeDate, [null].concat(args)))();');
    buffer.writeln('  }');
    buffer.writeln('  if (_NativeDate) {');
    buffer.writeln('    EnhancedDate.prototype = _NativeDate.prototype;');
    buffer.writeln('    EnhancedDate.now = _NativeDate.now;');
    buffer.writeln('    EnhancedDate.UTC = _NativeDate.UTC;');
    buffer.writeln('    EnhancedDate.parse = _NativeDate.parse;');
    buffer.writeln('    var Date = EnhancedDate;');
    buffer.writeln('  }');

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
