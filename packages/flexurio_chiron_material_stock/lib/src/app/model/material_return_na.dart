import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_na.freezed.dart';
part 'material_return_na.g.dart';

@freezed
class MaterialReturnNa with _$MaterialReturnNa {
  factory MaterialReturnNa({
    required String na,
    @JsonKey(name: 'quantity_remaining') required double quantityRemaining,
  }) = _MaterialReturnNa;
  const MaterialReturnNa._();

  factory MaterialReturnNa.fromJson(Map<String, dynamic> json) =>
      _$MaterialReturnNaFromJson(json);
}
