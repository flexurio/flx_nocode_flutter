import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_rupiah.freezed.dart';
part 'material_stock_rupiah.g.dart';

@freezed
class MaterialStockRupiah with _$MaterialStockRupiah {
  const factory MaterialStockRupiah({
    @JsonKey(name: 'year') required String year,
    @JsonKey(name: 'month') required String month,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'na') required String na,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime) required DateTime date,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'unit') required String unit,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'value') required int value,
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'batch_product') required String batchProduct,
    @JsonKey(name: 'dk') required String dk,
    @JsonKey(name: 'process_date', fromJson: isoDateToDateTime) required 
    DateTime processDate,
  }) = _MaterialStockRupiah;
  const MaterialStockRupiah._();

  factory MaterialStockRupiah.empty() => MaterialStockRupiah(
    year: '', 
    month: '', 
    transactionId: '', 
    materialId: '', 
    na: '', 
    date: DateTime(0), 
    materialName: '', 
    quantity: 0, 
    unit: '', 
    price: 0, 
    value: 0, 
    materialGroupId: '', 
    batchProduct: '', 
    dk: '', 
    processDate: DateTime(0),    
  );
  factory MaterialStockRupiah.fromJson(Map<String, dynamic> json) => _$MaterialStockRupiahFromJson(json);
}
