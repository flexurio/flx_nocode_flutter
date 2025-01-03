import 'package:flexurio_chiron_finance/src/app/model/cash_flow_code.dart';

Map<String, List<String>> generateCodeAndSubCode(List<CashFlowCode> codes) {
  final groupCodes = <String, List<String>>{};

  for (final code in codes) {
    if (groupCodes.containsKey(code.code)) {
      groupCodes[code.code]?.add(code.description);
    } else {
      groupCodes[code.code] = [code.description];
    }
  }

  return groupCodes;
}
