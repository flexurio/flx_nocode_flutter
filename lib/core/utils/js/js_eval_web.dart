import 'dart:js_interop';

@JS('eval')
external JSAny? _eval(String code);

/// JS eval implementation for Flutter Web using eval().
/// Compatible with both JS and WASM targets.
String internalEvalJs(String code) {
  try {
    final result = _eval(code);
    return result?.toString() ?? '';
  } catch (e) {
    throw Exception(e.toString());
  }
}
