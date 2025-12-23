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
    // In case of JS errors, return empty string or could log it
    return '';
  }
}
