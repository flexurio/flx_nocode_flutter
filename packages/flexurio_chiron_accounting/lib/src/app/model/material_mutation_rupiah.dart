import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_mutation_rupiah.freezed.dart';
part 'material_mutation_rupiah.g.dart';

@freezed
class MaterialMutationRupiah with _$MaterialMutationRupiah {
  const factory MaterialMutationRupiah({
    required String year,
    required String month,
    required String na,
    required int quantity,
    required String unit,
    required double price,
    required int value,
    required String dk,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'batch_product') required String batchProduct,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime) required DateTime date,
    @JsonKey(name: 'process_date', fromJson: isoDateToDateTime) required DateTime processDate,
    
  }) = _MaterialMutationRupiah;
  const MaterialMutationRupiah._();

  factory MaterialMutationRupiah.empty() =>
    MaterialMutationRupiah(
      year: '', 
      month: '', 
      na: '', 
      quantity: 0, 
      unit: '', 
      price: 0, 
      value: 0, 
      dk: '', 
      transactionId: '', 
      materialId: '', 
      materialName: '', 
      materialGroupId: '', 
      batchProduct: '', 
      date: DateTime(0), 
      processDate: DateTime(0),      
    );
  factory MaterialMutationRupiah.fromJson(Map<String, dynamic> json) => _$MaterialMutationRupiahFromJson(json);
}
