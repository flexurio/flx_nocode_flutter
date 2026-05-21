// lib/core/utils/js/src/helpers/js_math_helpers.dart

import '../js_helper_provider.dart';

class JsMathHelpers implements JsHelperProvider {
  @override
  void append(StringBuffer buffer) {
    buffer.writeln('  function toNumber(v){'
        '    var n=Number(v);'
        '    return isNaN(n)?0:n;'
        '  }');

    buffer.writeln('  function abs(v){return Math.abs(toNumber(v));}');

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
}
