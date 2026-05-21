// lib/core/utils/js/src/helpers/js_date_helpers.dart

import '../js_helper_provider.dart';

class JsDateHelpers implements JsHelperProvider {
  @override
  void append(StringBuffer buffer) {
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

    buffer.writeln('  function startOfMonth(v,fmt){'
        '    var d;'
        '    if(typeof v==="string" && v.length===6 && !isNaN(v)){'
        '      d=new Date(v.substring(0,4),v.substring(4,6)-1,1);'
        '    }else{'
        '      d=new Date(v);'
        '      if(isNaN(d.getTime())) return "";'
        '      d.setDate(1);'
        '    }'
        '    return formatDate(d,fmt||"yyyy-MM-dd");'
        '  }');

    buffer.writeln('  function endOfMonth(v,fmt){'
        '    var d;'
        '    if(typeof v==="string" && v.length===6 && !isNaN(v)){'
        '      d=new Date(v.substring(0,4),v.substring(4,6),0);'
        '    }else{'
        '      d=new Date(v);'
        '      if(isNaN(d.getTime())) return "";'
        '      d.setMonth(d.getMonth()+1,0);'
        '    }'
        '    return formatDate(d,fmt||"yyyy-MM-dd");'
        '  }');
  }
}
