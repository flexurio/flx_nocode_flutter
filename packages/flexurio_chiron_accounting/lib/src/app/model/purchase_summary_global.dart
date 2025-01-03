import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_summary_global.freezed.dart';
part 'purchase_summary_global.g.dart';

@freezed
class PurchaseSummaryGlobal with _$PurchaseSummaryGlobal {
  const factory PurchaseSummaryGlobal({
    required String supplier,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'currency_id') required String currencyId,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) required DateTime transactionDate,
    required int subtotal,
    required int rate,
    @JsonKey(name: 'sub_after_ppn') required int subAfterPpn,
    @JsonKey(name: 'ppn_value') required int ppnValue,
    @JsonKey(name: 'total') required int total,
  }) = _PurchaseSummaryGlobal;
  const PurchaseSummaryGlobal._();

  factory PurchaseSummaryGlobal.empty() => PurchaseSummaryGlobal(
    supplier: '',
    transactionId: '',
    currencyId: '',
    transactionDate: DateTime(0),
    subtotal: 0,
    rate: 0,
    ppnValue: 0,
    total: 0, 
    subAfterPpn: 0,
  );

  factory PurchaseSummaryGlobal.fromJson(Map<String, dynamic> json) => _$PurchaseSummaryGlobalFromJson(json);
}
