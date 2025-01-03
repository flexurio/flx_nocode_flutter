import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendors.freezed.dart';
part 'vendors.g.dart';

@freezed
class Vendor with _$Vendor {
  const factory Vendor({
    required String id,
    required String name,
    required String address,
    @JsonKey(name: 'city_name') required String city,
    @JsonKey(name: 'country_name') required String country,
    @JsonKey(name: 'postal_code') required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
  }) = _Vendors;
  const Vendor._();

  factory Vendor.empty() => Vendor(
        id: '',
        name: '',
        address: '',
        city: '',
        country: '',
        postalCode: 0,
        phone: '',
        fax: '',
        pic: '',
        email: '',
        npwp: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory Vendor.fromJson(Map<String, Object?> json) => _$VendorFromJson(json);

  static Vendor? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$VendorFromJson(json as Map<String, dynamic>);
  }
}
