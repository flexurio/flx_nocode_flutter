import 'package:freezed_annotation/freezed_annotation.dart';

part 'petty_cash_detail_create.freezed.dart';
part 'petty_cash_detail_create.g.dart';

@freezed
class PettyCashDetailCreate with _$PettyCashDetailCreate {
  const factory PettyCashDetailCreate({
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
    required double quantity,
    required double price,
  }) = _PettyCashDetailCreate;

  const PettyCashDetailCreate._();

  factory PettyCashDetailCreate.fromJson(Map<String, dynamic> json) =>
      _$PettyCashDetailCreateFromJson(json);

  factory PettyCashDetailCreate.empty() => PettyCashDetailCreate(
        materialId: '',
        materialUnitId: '',
        quantity: 0,
        price: 0,
      );
}
