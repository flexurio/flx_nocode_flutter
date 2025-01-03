import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_status_rupiah_quarantine.freezed.dart';
part 'material_status_rupiah_quarantine.g.dart';

@freezed
class MaterialStatusRupiahQuarantine with _$MaterialStatusRupiahQuarantine {
  const factory MaterialStatusRupiahQuarantine({
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) required DateTime transactionDate,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'material_name') required String materialName,
    required String na,
    @JsonKey(name: 'vat_total') int? vatTotal,
    int? price,
    @JsonKey(name: 'quantity_quarantine') required int quantityQuarantine,
    @JsonKey(name: 'value_quarantine') required int valueQuarantine,
    @JsonKey(name: 'value_quarantine_summary') required int valueQuarantineSummary,
  }) = _MaterialStatusRupiahQuarantine;
  const MaterialStatusRupiahQuarantine._();

  factory MaterialStatusRupiahQuarantine.empty() =>
    MaterialStatusRupiahQuarantine(
      transactionId: '', 
      transactionDate: DateTime(0), 
      supplierName: '', 
      materialName: '', 
      na: '', 
      vatTotal: 0, 
      quantityQuarantine: 0, 
      valueQuarantine: 0, 
      valueQuarantineSummary: 0,
    );
  factory MaterialStatusRupiahQuarantine.fromJson(Map<String, dynamic> json) => _$MaterialStatusRupiahQuarantineFromJson(json);
}