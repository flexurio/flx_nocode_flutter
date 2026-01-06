import 'package:flutter_js/flutter_js.dart';

JavascriptRuntime? _jsRuntime;

String internalEvalJs(String code) {
  _jsRuntime ??= getJavascriptRuntime();
  final result = _jsRuntime!.evaluate(code);
  if (result.isError) {
    throw Exception(result.stringResult);
  }
  return result.stringResult;
}
