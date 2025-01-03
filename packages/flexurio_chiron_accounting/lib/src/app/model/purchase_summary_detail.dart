import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_summary_detail.freezed.dart';
part 'purchase_summary_detail.g.dart';

@freezed
class PurchaseSummaryDetail with _$PurchaseSummaryDetail {
  const factory PurchaseSummaryDetail({
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'supplier') required String supplier,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) required DateTime transactionDate,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'price') required int price, @JsonKey(name: 'subtotal') required int subtotal, @JsonKey(name: 'ppn_value') required int ppnValue, @JsonKey(name: 'pph22_value') required int pph22Value, @JsonKey(name: 'total') required int total, @JsonKey(name: 'description_total') required String descriptionTotal, @JsonKey(name: 'subtotal_summary') required int subtotalSummary, @JsonKey(name: 'ppn_value_summary') required int ppnValueSummary, @JsonKey(name: 'pph22_value_summary') required int pph22ValueSummary, @JsonKey(name: 'total_summary') required double totalSummary, @JsonKey(name: 'unit_id') String? unitId,
    @JsonKey(name: 'quantity') int? quantity,
  }) = _PurchaseSummaryDetail;
  const PurchaseSummaryDetail._();

  factory PurchaseSummaryDetail.empty() => PurchaseSummaryDetail(
      transactionId: '',
      supplier: '',
      transactionDate: DateTime(0),
      description: '',
      materialName: '',
      price: 0,
      subtotal: 0,
      ppnValue: 0,
      pph22Value: 0,
      total: 0,
      descriptionTotal: '',
      subtotalSummary: 0,
      ppnValueSummary: 0,
      pph22ValueSummary: 0,
      totalSummary: 0,
  );
  factory PurchaseSummaryDetail.fromJson(Map<String, dynamic> json) => _$PurchaseSummaryDetailFromJson(json);
}
