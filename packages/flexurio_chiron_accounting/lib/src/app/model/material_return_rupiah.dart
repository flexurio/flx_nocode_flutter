import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_rupiah.freezed.dart';
part 'material_return_rupiah.g.dart';

@freezed
class MaterialReturnRupiah with _$MaterialReturnRupiah {
  const factory MaterialReturnRupiah({
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    required double quantity,
    required double price,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
  }) = _MaterialReturnRupiah;
  const MaterialReturnRupiah._();

  factory MaterialReturnRupiah.empty() => MaterialReturnRupiah(
    materialId: '', 
    materialName: '', 
    quantity: 0, 
    price: 0,
    materialUnitId: '',
  );
  factory MaterialReturnRupiah.fromJson(Map<String, dynamic> json) => _$MaterialReturnRupiahFromJson(json);
}
