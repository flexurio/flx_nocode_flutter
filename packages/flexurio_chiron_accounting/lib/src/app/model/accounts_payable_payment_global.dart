import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_payable_payment_global.freezed.dart';
part 'accounts_payable_payment_global.g.dart';

@freezed
class AccountsPayablePaymentGlobal with _$AccountsPayablePaymentGlobal {
  const factory AccountsPayablePaymentGlobal({
    @JsonKey(name: 'supplier_id') required String supplierId,
    @JsonKey(name: 'supplier_name') required String supplierName,
    required double total,
    @JsonKey(name: 'total_summary') required double totalSummary,
  }) = _AccountsPayablePaymentGlobal;
  const AccountsPayablePaymentGlobal._();

  factory AccountsPayablePaymentGlobal.empty() => const AccountsPayablePaymentGlobal(
    supplierId: '', 
    supplierName: '', 
    total: 0, 
    totalSummary: 0,
  );
  
  factory AccountsPayablePaymentGlobal.fromJson(Map<String, dynamic> json) => _$AccountsPayablePaymentGlobalFromJson(json);
}
