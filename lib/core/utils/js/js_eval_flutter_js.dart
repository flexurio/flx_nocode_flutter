import 'package:flutter_js/flutter_js.dart';

String internalEvalJs(String code) {
  final js = getJavascriptRuntime();
  final result = js.evaluate(code);
  return result.stringResult;
}
