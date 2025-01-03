import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

enum CustomerType implements ColorType {
  empty('', '-', Colors.transparent),
  tu('TU', 'TU', Colors.green),
  nonTu('NON TU', 'Non TU', Colors.teal);

  const CustomerType(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;
}

CustomerType _customerTypeFromString(String? id) {
  if (id == CustomerType.tu.id) {
    return CustomerType.tu;
  }
  if (id == CustomerType.nonTu.id) {
    return CustomerType.nonTu;
  }
  return CustomerType.empty;
}

enum CustomerCategory implements ColorType {
  empty('', '-', Colors.transparent),
  cash('CASH', 'Cash', Colors.green),
  export('EXPORT', 'Export', Colors.indigo),
  tokoObat('TOKO OBAT', 'Toko Obat', Colors.cyan),
  ybcr('YBCR', 'YBCR', Colors.purple),
  pbf('PBF', 'PBF', Colors.teal);

  const CustomerCategory(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;
}

CustomerCategory _customerCategoryFromString(String? id) {
  if (id == CustomerCategory.cash.id) {
    return CustomerCategory.cash;
  }
  if (id == CustomerCategory.pbf.id) {
    return CustomerCategory.pbf;
  }
  if (id == CustomerCategory.export.id) {
    return CustomerCategory.export;
  }
  if (id == CustomerCategory.tokoObat.id) {
    return CustomerCategory.tokoObat;
  }
  if (id == CustomerCategory.ybcr.id) {
    return CustomerCategory.ybcr;
  }
  return CustomerCategory.empty;
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'city_name') required String cityName,
    @JsonKey(name: 'country_name') required String countryName,
    required String name,
    required String address,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required String nppkp,
    required String province,
    required String? parent,
    @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
    required CustomerType customerType,
    @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
    required CustomerCategory customerCategory,
    @JsonKey(name: 'postal_code', defaultValue: 0) int? postalCode,
    @JsonKey(name: 'is_administration', defaultValue: false)
    bool? isAdministration,
    @JsonKey(name: 'term_of_payment', defaultValue: 0) int? termOfPayment,
    @JsonKey(name: 'discount', defaultValue: 0) double? discount,
  }) = _Customer;
  const Customer._();

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  factory Customer.empty() {
    return Customer(
      id: '',
      createdAt: DateTime.now(),
      createdById: 0,
      updatedAt: DateTime.now(),
      updatedById: 0,
      cityName: '',
      countryName: '',
      name: '',
      address: '',
      postalCode: 0,
      phone: '',
      fax: '',
      pic: '',
      email: '',
      npwp: '',
      termOfPayment: 0,
      nppkp: '',
      discount: 0,
      isAdministration: false,
      province: '',
      parent: '',
      customerType: CustomerType.empty,
      customerCategory: CustomerCategory.empty,
    );
  }
}
