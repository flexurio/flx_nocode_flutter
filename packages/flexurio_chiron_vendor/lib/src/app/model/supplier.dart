import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier.freezed.dart';
part 'supplier.g.dart';

@freezed
class Supplier with _$Supplier {
  const factory Supplier(
    String id,
    String name,
    String address,
    @JsonKey(name: 'city_name') String city,
    @JsonKey(name: 'country_name') String country,
    @JsonKey(name: 'postal_code') int postalCode,
    String phone,
    String fax,
    String pic,
    String email,
    String npwp,
    @JsonKey(name: 'term_of_payment') int termOfPayment,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
  ) = _Supplier;
  const Supplier._();

  factory Supplier.fromJson(Map<String, Object?> json) =>
      _$SupplierFromJson(json);

  factory Supplier.empty() => Supplier(
        '',
        '',
        '',
        '',
        '',
        0,
        '',
        '',
        '',
        '',
        '',
        0,
        DateTime.now(),
        DateTime.now(),
      );

  factory Supplier.none() => Supplier(
        'NONE',
        '',
        '',
        '',
        '',
        0,
        '',
        '',
        '',
        '',
        '',
        0,
        DateTime.now(),
        DateTime.now(),
      );
}
