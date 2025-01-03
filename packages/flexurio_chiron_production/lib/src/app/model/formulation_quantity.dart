import 'package:freezed_annotation/freezed_annotation.dart';

part 'formulation_quantity.freezed.dart';
part 'formulation_quantity.g.dart';

@freezed
class FormulationQuantity with _$FormulationQuantity {
  factory FormulationQuantity({required int quantity}) = _Formulation;

  factory FormulationQuantity.fromJson(Map<String, dynamic> json) =>
      _$FormulationQuantityFromJson(json);
}
