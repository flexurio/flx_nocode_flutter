import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';
part 'bank.g.dart';

@freezed
class Bank with _$Bank {
  const factory Bank({
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
  }) = _Bank;
  const Bank._();

  factory Bank.fromJson(Map<String, Object?> json) => _$BankFromJson(json);
}
