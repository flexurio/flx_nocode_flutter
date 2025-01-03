import 'package:flexurio_chiron_accounting/src/app/model/type_cost.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_other_cost.freezed.dart';
part 'payment_other_cost.g.dart';

@freezed
class PaymentOtherCost with _$PaymentOtherCost {
  factory PaymentOtherCost({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'value') required double amount,
    @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
    required TypeCost typeCost,
  }) = _PaymentOtherCost;

  factory PaymentOtherCost.fromJson(Map<String, dynamic> json) =>
      _$PaymentOtherCostFromJson(json);

  factory PaymentOtherCost.empty() => PaymentOtherCost(
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        id: 0,
        amount: 0,
        typeCost: TypeCost.empty(),
      );

  const PaymentOtherCost._();
}
