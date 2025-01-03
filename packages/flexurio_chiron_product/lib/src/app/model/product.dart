import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/src/app/model/product_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

enum ProductType implements ColorType {
  empty('', Colors.transparent),
  antibiotic('ANTIBIOTIK', Color.fromARGB(255, 117, 181, 234)),
  botol('BOTOL', Colors.teal),
  box('BOX', Colors.pink),
  coating('COATING', Colors.teal),
  drySyrup('DRY SYRUP', Colors.orange),
  gel('GEL', Colors.red),
  injeksi('INJEKSI', Colors.purple),
  kaplet('KAPLET', Colors.cyan),
  kapsul('KAPSUL', Colors.teal),
  krim('KRIM', Colors.blue),
  larutan('LARUTAN', Colors.blue),
  liquid('LIQUID', Colors.blue),
  pcs('PCS', Color.fromARGB(255, 245, 158, 152)),
  powder('POWDER', Colors.blue),
  syrup('SYRUP', Colors.blue),
  solid('SOLID', Colors.blue),
  solution('SOLUTION', Colors.blue),
  tablet('TABLET', Colors.blue),
  tehCelup('TEH CELUP', Colors.blue);

  const ProductType(this.productType, this.color);

  List<ProductType> get list => [];

  @override
  String get label => productType;

  @override
  final Color color;
  final String productType;
}

enum DivisionType implements ColorType {
  ethical('ETH', 'ETHICAL', Colors.blue),
  otc('OTC', 'OTC', Colors.teal),
  alkes('ALK', 'ALKES', Colors.lightBlue),
  dvd('DVD', 'DVD', Colors.teal),
  distributor('DIST', 'DISTRIBUTOR', Colors.cyan),
  empty('', '', Colors.transparent);

  const DivisionType(this.id, this.label, this.color);

  final String id;

  @override
  final Color color;

  @override
  final String label;
}

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    @JsonKey(defaultValue: '') required String company,
    @JsonKey(name: 'type', fromJson: _productTypeFromString)
    required ProductType productType,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
    required DateTime nieExpiredDate,
    @JsonKey(name: 'updated_by_id') required int updateById,
    required String name,
    @JsonKey(name: 'product_no') required String productNo,
    @JsonKey(name: 'quantity_pack') required int quantityPack,
    @JsonKey(name: 'quantity_batch') required int quantityBatch,
    @JsonKey(name: 'quantity_strip') required int quantityStrip,
    @JsonKey(name: 'quantity_tablet') required int quantityTablet,
    @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
    required DivisionType division,
    @JsonKey(name: 'expiry_period') required int expiryPeriod,
    @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unitPacking,
    @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unitOrder,
    @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
    required ProductGroup productGroup,
    @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unitSmallest,
    @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unitSecondary,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_phased_out', defaultValue: false)
    required bool isPhasedOut,
    @Default(false)
    @JsonKey(name: 'is_toll_out', defaultValue: false)
    bool tollOut,
    String? nie,
  }) = _Product;

  factory Product.empty() {
    return Product(
      company: '',
      id: '',
      productType: ProductType.empty,
      createAt: DateTime(0),
      createdById: 0,
      updatedAt: DateTime(0),
      nieExpiredDate: DateTime(0),
      updateById: 0,
      name: '',
      productNo: '',
      quantityPack: 0,
      quantityBatch: 0,
      quantityStrip: 0,
      quantityTablet: 0,
      division: DivisionType.empty,
      expiryPeriod: 0,
      unitPacking: MaterialUnit.empty(),
      unitOrder: MaterialUnit.empty(),
      productGroup: ProductGroup.empty(),
      unitSmallest: MaterialUnit.empty(),
      unitSecondary: MaterialUnit.empty(),
      isActive: false,
      isPhasedOut: false,
    );
  }

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  static Product? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$ProductFromJson(json as Map<String, dynamic>);
  }

  bool get isNieValid {
    final now = DateTime.now();
    if (now.isBefore(nieExpiredDate)) {
      return true;
    } else {
      return false;
    }
  }
}

ProductType _productTypeFromString(String productType) {
  if (productType == ProductType.antibiotic.productType) {
    return ProductType.antibiotic;
  }
  if (productType == ProductType.botol.productType) {
    return ProductType.botol;
  }
  if (productType == ProductType.box.productType) {
    return ProductType.box;
  }
  if (productType == ProductType.coating.productType) {
    return ProductType.coating;
  }
  if (productType == ProductType.gel.productType) {
    return ProductType.gel;
  }
  if (productType == ProductType.injeksi.productType) {
    return ProductType.injeksi;
  }
  if (productType == ProductType.kaplet.productType) {
    return ProductType.kaplet;
  }
  if (productType == ProductType.kapsul.productType) {
    return ProductType.kaplet;
  }
  if (productType == ProductType.krim.productType) {
    return ProductType.krim;
  }
  if (productType == ProductType.larutan.productType) {
    return ProductType.larutan;
  }
  if (productType == ProductType.liquid.productType) {
    return ProductType.liquid;
  }
  if (productType == ProductType.pcs.productType) {
    return ProductType.pcs;
  }
  if (productType == ProductType.powder.productType) {
    return ProductType.powder;
  }
  if (productType == ProductType.syrup.productType) {
    return ProductType.syrup;
  }
  if (productType == ProductType.solid.productType) {
    return ProductType.solid;
  }
  if (productType == ProductType.solution.productType) {
    return ProductType.solution;
  }
  if (productType == ProductType.tablet.productType) {
    return ProductType.tablet;
  }
  if (productType == ProductType.tehCelup.productType) {
    return ProductType.tehCelup;
  }
  if (productType == ProductType.empty.productType) {
    return ProductType.empty;
  }
  return ProductType.empty;
}

DivisionType _divisionTypeFromString(String division) {
  if (division == DivisionType.ethical.id) {
    return DivisionType.ethical;
  }
  if (division == DivisionType.otc.id) {
    return DivisionType.otc;
  }
  if (division == DivisionType.alkes.id) {
    return DivisionType.alkes;
  }
  if (division == DivisionType.dvd.id) {
    return DivisionType.dvd;
  }
  if (division == DivisionType.distributor.id) {
    return DivisionType.distributor;
  }
  return DivisionType.empty;
}
