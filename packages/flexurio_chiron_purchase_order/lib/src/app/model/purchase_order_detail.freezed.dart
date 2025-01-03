// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderDetail _$PurchaseOrderDetailFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderDetail.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
  ProductionOrder? get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Material.fromJsonNullable)
  Material? get material => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Product.fromJsonNullable)
  Product? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitConvert => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_po')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_received')
  double? get quantityReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
  double get quantityPurchaseOrderConverted =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
  double get quantityReceivedConverted => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
  MaterialDesign? get materialDesign => throw _privateConstructorUsedError;
  PurchaseRequestDetail? get materialRequestDetail =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', defaultValue: '')
  String? get descriptionPettyCash => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderDetailCopyWith<PurchaseOrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDetailCopyWith<$Res> {
  factory $PurchaseOrderDetailCopyWith(
          PurchaseOrderDetail value, $Res Function(PurchaseOrderDetail) then) =
      _$PurchaseOrderDetailCopyWithImpl<$Res, PurchaseOrderDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
      ProductionOrder? productionOrder,
      @JsonKey(fromJson: Material.fromJsonNullable) Material? material,
      @JsonKey(fromJson: Product.fromJsonNullable) Product? product,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit,
      @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitConvert,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'quantity_po') double quantity,
      @JsonKey(name: 'quantity_received') double? quantityReceived,
      @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
      double quantityPurchaseOrderConverted,
      @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
      double quantityReceivedConverted,
      double price,
      @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
      MaterialDesign? materialDesign,
      PurchaseRequestDetail? materialRequestDetail,
      @JsonKey(name: 'due_date', defaultValue: '')
      String? descriptionPettyCash});

  $ProductionOrderCopyWith<$Res>? get productionOrder;
  $MaterialCopyWith<$Res>? get material;
  $ProductCopyWith<$Res>? get product;
  $MaterialUnitCopyWith<$Res> get unit;
  $MaterialUnitCopyWith<$Res> get unitConvert;
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  $MaterialDesignCopyWith<$Res>? get materialDesign;
  $PurchaseRequestDetailCopyWith<$Res>? get materialRequestDetail;
}

/// @nodoc
class _$PurchaseOrderDetailCopyWithImpl<$Res, $Val extends PurchaseOrderDetail>
    implements $PurchaseOrderDetailCopyWith<$Res> {
  _$PurchaseOrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? productionOrder = freezed,
    Object? material = freezed,
    Object? product = freezed,
    Object? unit = null,
    Object? unitConvert = null,
    Object? purchaseOrder = null,
    Object? quantity = null,
    Object? quantityReceived = freezed,
    Object? quantityPurchaseOrderConverted = null,
    Object? quantityReceivedConverted = null,
    Object? price = null,
    Object? materialDesign = freezed,
    Object? materialRequestDetail = freezed,
    Object? descriptionPettyCash = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productionOrder: freezed == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitConvert: null == unitConvert
          ? _value.unitConvert
          : unitConvert // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceived: freezed == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as double?,
      quantityPurchaseOrderConverted: null == quantityPurchaseOrderConverted
          ? _value.quantityPurchaseOrderConverted
          : quantityPurchaseOrderConverted // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceivedConverted: null == quantityReceivedConverted
          ? _value.quantityReceivedConverted
          : quantityReceivedConverted // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      materialRequestDetail: freezed == materialRequestDetail
          ? _value.materialRequestDetail
          : materialRequestDetail // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestDetail?,
      descriptionPettyCash: freezed == descriptionPettyCash
          ? _value.descriptionPettyCash
          : descriptionPettyCash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res>? get productionOrder {
    if (_value.productionOrder == null) {
      return null;
    }

    return $ProductionOrderCopyWith<$Res>(_value.productionOrder!, (value) {
      return _then(_value.copyWith(productionOrder: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res>? get material {
    if (_value.material == null) {
      return null;
    }

    return $MaterialCopyWith<$Res>(_value.material!, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitConvert {
    return $MaterialUnitCopyWith<$Res>(_value.unitConvert, (value) {
      return _then(_value.copyWith(unitConvert: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res>? get materialDesign {
    if (_value.materialDesign == null) {
      return null;
    }

    return $MaterialDesignCopyWith<$Res>(_value.materialDesign!, (value) {
      return _then(_value.copyWith(materialDesign: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseRequestDetailCopyWith<$Res>? get materialRequestDetail {
    if (_value.materialRequestDetail == null) {
      return null;
    }

    return $PurchaseRequestDetailCopyWith<$Res>(_value.materialRequestDetail!,
        (value) {
      return _then(_value.copyWith(materialRequestDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseOrderDetailImplCopyWith<$Res>
    implements $PurchaseOrderDetailCopyWith<$Res> {
  factory _$$PurchaseOrderDetailImplCopyWith(_$PurchaseOrderDetailImpl value,
          $Res Function(_$PurchaseOrderDetailImpl) then) =
      __$$PurchaseOrderDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
      ProductionOrder? productionOrder,
      @JsonKey(fromJson: Material.fromJsonNullable) Material? material,
      @JsonKey(fromJson: Product.fromJsonNullable) Product? product,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit,
      @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitConvert,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'quantity_po') double quantity,
      @JsonKey(name: 'quantity_received') double? quantityReceived,
      @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
      double quantityPurchaseOrderConverted,
      @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
      double quantityReceivedConverted,
      double price,
      @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
      MaterialDesign? materialDesign,
      PurchaseRequestDetail? materialRequestDetail,
      @JsonKey(name: 'due_date', defaultValue: '')
      String? descriptionPettyCash});

  @override
  $ProductionOrderCopyWith<$Res>? get productionOrder;
  @override
  $MaterialCopyWith<$Res>? get material;
  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $MaterialUnitCopyWith<$Res> get unitConvert;
  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  @override
  $MaterialDesignCopyWith<$Res>? get materialDesign;
  @override
  $PurchaseRequestDetailCopyWith<$Res>? get materialRequestDetail;
}

/// @nodoc
class __$$PurchaseOrderDetailImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailCopyWithImpl<$Res, _$PurchaseOrderDetailImpl>
    implements _$$PurchaseOrderDetailImplCopyWith<$Res> {
  __$$PurchaseOrderDetailImplCopyWithImpl(_$PurchaseOrderDetailImpl _value,
      $Res Function(_$PurchaseOrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? productionOrder = freezed,
    Object? material = freezed,
    Object? product = freezed,
    Object? unit = null,
    Object? unitConvert = null,
    Object? purchaseOrder = null,
    Object? quantity = null,
    Object? quantityReceived = freezed,
    Object? quantityPurchaseOrderConverted = null,
    Object? quantityReceivedConverted = null,
    Object? price = null,
    Object? materialDesign = freezed,
    Object? materialRequestDetail = freezed,
    Object? descriptionPettyCash = freezed,
  }) {
    return _then(_$PurchaseOrderDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productionOrder: freezed == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitConvert: null == unitConvert
          ? _value.unitConvert
          : unitConvert // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceived: freezed == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as double?,
      quantityPurchaseOrderConverted: null == quantityPurchaseOrderConverted
          ? _value.quantityPurchaseOrderConverted
          : quantityPurchaseOrderConverted // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReceivedConverted: null == quantityReceivedConverted
          ? _value.quantityReceivedConverted
          : quantityReceivedConverted // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      materialRequestDetail: freezed == materialRequestDetail
          ? _value.materialRequestDetail
          : materialRequestDetail // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestDetail?,
      descriptionPettyCash: freezed == descriptionPettyCash
          ? _value.descriptionPettyCash
          : descriptionPettyCash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderDetailImpl extends _PurchaseOrderDetail {
  const _$PurchaseOrderDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
      required this.productionOrder,
      @JsonKey(fromJson: Material.fromJsonNullable) required this.material,
      @JsonKey(fromJson: Product.fromJsonNullable) required this.product,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
      required this.unitConvert,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required this.purchaseOrder,
      @JsonKey(name: 'quantity_po') required this.quantity,
      @JsonKey(name: 'quantity_received') this.quantityReceived,
      @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
      required this.quantityPurchaseOrderConverted,
      @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
      required this.quantityReceivedConverted,
      required this.price,
      @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
      this.materialDesign,
      this.materialRequestDetail,
      @JsonKey(name: 'due_date', defaultValue: '') this.descriptionPettyCash})
      : super._();

  factory _$PurchaseOrderDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
  final ProductionOrder? productionOrder;
  @override
  @JsonKey(fromJson: Material.fromJsonNullable)
  final Material? material;
  @override
  @JsonKey(fromJson: Product.fromJsonNullable)
  final Product? product;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unitConvert;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  final PurchaseOrder purchaseOrder;
  @override
  @JsonKey(name: 'quantity_po')
  final double quantity;
  @override
  @JsonKey(name: 'quantity_received')
  final double? quantityReceived;
  @override
  @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
  final double quantityPurchaseOrderConverted;
  @override
  @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
  final double quantityReceivedConverted;
  @override
  final double price;
  @override
  @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
  final MaterialDesign? materialDesign;
  @override
  final PurchaseRequestDetail? materialRequestDetail;
  @override
  @JsonKey(name: 'due_date', defaultValue: '')
  final String? descriptionPettyCash;

  @override
  String toString() {
    return 'PurchaseOrderDetail(id: $id, createdAt: $createdAt, productionOrder: $productionOrder, material: $material, product: $product, unit: $unit, unitConvert: $unitConvert, purchaseOrder: $purchaseOrder, quantity: $quantity, quantityReceived: $quantityReceived, quantityPurchaseOrderConverted: $quantityPurchaseOrderConverted, quantityReceivedConverted: $quantityReceivedConverted, price: $price, materialDesign: $materialDesign, materialRequestDetail: $materialRequestDetail, descriptionPettyCash: $descriptionPettyCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitConvert, unitConvert) ||
                other.unitConvert == unitConvert) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.quantityReceived, quantityReceived) ||
                other.quantityReceived == quantityReceived) &&
            (identical(other.quantityPurchaseOrderConverted,
                    quantityPurchaseOrderConverted) ||
                other.quantityPurchaseOrderConverted ==
                    quantityPurchaseOrderConverted) &&
            (identical(other.quantityReceivedConverted,
                    quantityReceivedConverted) ||
                other.quantityReceivedConverted == quantityReceivedConverted) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign) &&
            (identical(other.materialRequestDetail, materialRequestDetail) ||
                other.materialRequestDetail == materialRequestDetail) &&
            (identical(other.descriptionPettyCash, descriptionPettyCash) ||
                other.descriptionPettyCash == descriptionPettyCash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      productionOrder,
      material,
      product,
      unit,
      unitConvert,
      purchaseOrder,
      quantity,
      quantityReceived,
      quantityPurchaseOrderConverted,
      quantityReceivedConverted,
      price,
      materialDesign,
      materialRequestDetail,
      descriptionPettyCash);

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderDetailImplCopyWith<_$PurchaseOrderDetailImpl> get copyWith =>
      __$$PurchaseOrderDetailImplCopyWithImpl<_$PurchaseOrderDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderDetailImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderDetail extends PurchaseOrderDetail {
  const factory _PurchaseOrderDetail(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
      required final ProductionOrder? productionOrder,
      @JsonKey(fromJson: Material.fromJsonNullable)
      required final Material? material,
      @JsonKey(fromJson: Product.fromJsonNullable)
      required final Product? product,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unit,
      @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unitConvert,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required final PurchaseOrder purchaseOrder,
      @JsonKey(name: 'quantity_po') required final double quantity,
      @JsonKey(name: 'quantity_received') final double? quantityReceived,
      @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
      required final double quantityPurchaseOrderConverted,
      @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
      required final double quantityReceivedConverted,
      required final double price,
      @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
      final MaterialDesign? materialDesign,
      final PurchaseRequestDetail? materialRequestDetail,
      @JsonKey(name: 'due_date', defaultValue: '')
      final String? descriptionPettyCash}) = _$PurchaseOrderDetailImpl;
  const _PurchaseOrderDetail._() : super._();

  factory _PurchaseOrderDetail.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
  ProductionOrder? get productionOrder;
  @override
  @JsonKey(fromJson: Material.fromJsonNullable)
  Material? get material;
  @override
  @JsonKey(fromJson: Product.fromJsonNullable)
  Product? get product;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitConvert;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(name: 'quantity_po')
  double get quantity;
  @override
  @JsonKey(name: 'quantity_received')
  double? get quantityReceived;
  @override
  @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
  double get quantityPurchaseOrderConverted;
  @override
  @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
  double get quantityReceivedConverted;
  @override
  double get price;
  @override
  @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
  MaterialDesign? get materialDesign;
  @override
  PurchaseRequestDetail? get materialRequestDetail;
  @override
  @JsonKey(name: 'due_date', defaultValue: '')
  String? get descriptionPettyCash;

  /// Create a copy of PurchaseOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderDetailImplCopyWith<_$PurchaseOrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
