import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receipt_summary_rupiah.freezed.dart';
part 'material_receipt_summary_rupiah.g.dart';

@freezed
class MaterialReceiptSummaryRupiah with _$MaterialReceiptSummaryRupiah {
  const factory MaterialReceiptSummaryRupiah({
    @JsonKey(name: 'transaction_type_id') required String transactionTypeId,
    @JsonKey(name: 'transaction_type_name') required String transactionTypeName,
    @JsonKey(name: 'value') required int value,
    @JsonKey(name: 'value_summary') required int valueSummary,
  }) = _MaterialReceiptSummaryRupiah;
  const MaterialReceiptSummaryRupiah._();

  factory MaterialReceiptSummaryRupiah.empty() => const MaterialReceiptSummaryRupiah(
    transactionTypeId: '', 
    transactionTypeName: '', 
    value: 0, 
    valueSummary: 0,
  );
  factory MaterialReceiptSummaryRupiah.fromJson(Map<String, dynamic> json) => _$MaterialReceiptSummaryRupiahFromJson(json);
}
