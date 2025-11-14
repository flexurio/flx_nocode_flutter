import 'dart:js_util' as js_util;

/// JS eval implementation for Flutter Web using window.eval().
String internalEvalJs(String code) {
  final result = js_util.callMethod(js_util.globalThis, 'eval', [code]);
  return result?.toString() ?? '';
}
