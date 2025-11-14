import 'dart:js_interop';

@JS('eval')
external Object _eval(String code);

String internalEvalJs(String code) {
  final result = _eval(code);
  return result.toString();
}
