import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_status_rupiah.freezed.dart';
part 'material_status_rupiah.g.dart';

@freezed
class MaterialStatusRupiah with _$MaterialStatusRupiah {
  const factory MaterialStatusRupiah({
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) required DateTime transactionDate,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'material_name') required String materialName,
    required String na,
    @JsonKey(name: 'vat_total') required int vatTotal,
    required int price,
    @JsonKey(name: 'quantity_release') required double quantityRelease,
    @JsonKey(name: 'value_release') required double valueRelease,
    @JsonKey(name: 'quantity_reject') required int quantityReject,
    @JsonKey(name: 'value_reject') required int valueReject,
    @JsonKey(name: 'value_release_summary') required double valueReleaseSummary,
    @JsonKey(name: 'value_reject_summary') required int valueRejectSummary,
  }) = _MaterialStatusRupiah;
  const MaterialStatusRupiah._();

  factory MaterialStatusRupiah.empty() =>
    MaterialStatusRupiah(
      transactionId: '', 
      transactionDate: DateTime(0), 
      supplierName: '', 
      materialName: '',
      na: '', 
      vatTotal: 0, 
      price: 0, 
      quantityRelease: 0, 
      valueRelease: 0, 
      quantityReject: 0, 
      valueReject: 0,
      valueReleaseSummary: 0, 
      valueRejectSummary: 0,
    );
  factory MaterialStatusRupiah.fromJson(Map<String, dynamic> json) => _$MaterialStatusRupiahFromJson(json);
}