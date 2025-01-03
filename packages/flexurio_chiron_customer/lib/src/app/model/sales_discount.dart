import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_discount.freezed.dart';
part 'sales_discount.g.dart';

@freezed
class SalesDiscount with _$SalesDiscount {
  const factory SalesDiscount(
    int id,
    double discount,
  ) = _SalesDiscount;
  const SalesDiscount._();

  factory SalesDiscount.fromJson(Map<String, Object?> json) =>
      _$SalesDiscountFromJson(json);
}
