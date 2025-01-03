import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_price.freezed.dart';
part 'product_price.g.dart';

@freezed
class ProductPrice with _$ProductPrice {
  factory ProductPrice({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updateAt,
    @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
    required DateTime startDate,
    @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
    required DateTime? endDate,
    @JsonKey(name: 'product_price') required double price,
    @JsonKey(name: 'bonus_price') required double bonusPrice,
    @JsonKey(name: 'primary_price') required double primaryPrice,
    @JsonKey(name: 'strip_price') required double stripPrice,
    @JsonKey(name: 'tablet_price') required double tabletPrice,
    @JsonKey(fromJson: Product.fromJson) required Product product,
    @JsonKey(name: 'is_used') required bool isUsed,
    @JsonKey(name: 'strip_hpp') required double stripHpp,
    @JsonKey(fromJson: Currency.fromJson) required Currency currency,
    String? name,
  }) = _ProductPrice;
  const ProductPrice._();

  factory ProductPrice.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceFromJson(json);
}
