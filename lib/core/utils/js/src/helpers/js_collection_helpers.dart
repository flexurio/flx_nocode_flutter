// lib/core/utils/js/src/helpers/js_collection_helpers.dart

import '../js_helper_provider.dart';

class JsCollectionHelpers implements JsHelperProvider {
  @override
  void append(StringBuffer buffer) {
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
  }
}
