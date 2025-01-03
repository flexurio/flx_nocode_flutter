import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fuel.freezed.dart';
part 'fuel.g.dart';

@freezed
class Fuel with _$Fuel {
  factory Fuel({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    required int id,
    required String name,
    required double price,
    @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
    required DateTime startDate,
    @JsonKey(name: 'end_date', fromJson: isoDateToDateTime)
    required DateTime endDate,
    @JsonKey(name: 'type_fuel') required String typeFuel,
    required String brand,
  }) = _Fuel;
  const Fuel._();

  factory Fuel.fromJson(Map<String, dynamic> json) => _$FuelFromJson(json);

  factory Fuel.empty() {
    return Fuel(
      createdAt: DateTime.now(),
      createdById: 0,
      updatedAt: DateTime.now(),
      updatedById: 0,
      id: 0,
      name: '',
      price: 0,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      typeFuel: '',
      brand: '',
    );
  }
}
