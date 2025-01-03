import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_discount.freezed.dart';
part 'customer_discount.g.dart';

@freezed
class CustomerDiscount with _$CustomerDiscount {
  factory CustomerDiscount({
    required int id,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
    required DateTime startDate,
    @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
    required DateTime? endDate,
    @JsonKey(fromJson: Customer.fromJson) required Customer customer,
    required double discount,
    // @JsonKey(name: 'is_used') required bool isUsed,
  }) = _CustomerDiscount;
  const CustomerDiscount._();

  factory CustomerDiscount.fromJson(Map<String, dynamic> json) =>
      _$CustomerDiscountFromJson(json);
}
