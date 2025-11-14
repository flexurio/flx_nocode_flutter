import 'js_eval_flutter_js.dart'
    if (dart.library.js_interop) 'js_eval_web.dart';

/// Cross-platform JavaScript eval function.
String evalJs(String code) => internalEvalJs(code);
