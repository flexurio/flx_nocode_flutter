import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_payable_payment.freezed.dart';
part 'accounts_payable_payment.g.dart';

@freezed
class AccountsPayablePayment with _$AccountsPayablePayment {
  const factory AccountsPayablePayment({
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
    required DateTime invoiceReceivedDate, 
    @JsonKey(name: 'remark') required String? remark, 
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'tax_value') required double taxValue,
    @JsonKey(name: 'ppn_value') required double ppnValue,
    @JsonKey(name: 'subtotal_value') required double subtotalValue,
    @JsonKey(name: 'total_value') required double totalValue,
    @JsonKey(name: 'supplier_name') required String? supplierName,
    @JsonKey(name: 'total_supplier') required double? totalSupplier,
    @JsonKey(name: 'total_summary') required double totalSummary,
    @JsonKey(name: 'transaction_no') String? transactionNo,
  }) = _AccountsPayablePayment;
  const AccountsPayablePayment._();

  factory AccountsPayablePayment.empty() =>  AccountsPayablePayment(
    transactionDate: DateTime(0),
    invoiceReceivedDate: DateTime(0),
    remark: null, 
    invoiceNo: '',
    taxValue: 0,
    ppnValue: 0,
    subtotalValue: 0,
    totalValue: 0,
    totalSummary : 0,
    supplierName: null,
    totalSupplier: null,
  );

  
  factory AccountsPayablePayment.fromJson(Map<String, dynamic> json) => _$AccountsPayablePaymentFromJson(json);
}
