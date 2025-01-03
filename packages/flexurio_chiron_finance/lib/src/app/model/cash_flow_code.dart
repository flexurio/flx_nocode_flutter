import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cash_flow_code.freezed.dart';
part 'cash_flow_code.g.dart';

@freezed
class CashFlowCode with _$CashFlowCode {
  const factory CashFlowCode({
    required String date,
    @JsonKey(name: 'no_transaction') required String noTransaction,
    required String invoice,
    @JsonKey(name: 'rec_from') required String recForm,
    required String description,
    required int amount,
    required String code,
    @JsonKey(name: 'sub_code') required String subCode,
    @JsonKey(name: 'mutation_date', fromJson: isoDateToDateTime)
    required DateTime mutationDate,
    @JsonKey(name: 'transfer_fee') required int transferFee,
    @JsonKey(name: 'total_transfer') required int totalTransfer,
    required String bank,
    required String status,
  }) = _CashFlowCode;
  const CashFlowCode._();

  factory CashFlowCode.fromJson(Map<String, Object?> json) =>
      _$CashFlowCodeFromJson(json);
}
