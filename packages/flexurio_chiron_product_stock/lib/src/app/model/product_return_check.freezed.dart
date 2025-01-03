// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnCheck _$ProductReturnCheckFromJson(Map<String, dynamic> json) {
  return _ProductReturnCheck.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnCheck {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
  ProductReturnCheckStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_warehouse_return')
  int get qtyWarehouseReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_warehouse_remaining')
  int get qtyWarehouseRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out_return')
  int get qtyOutReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out_remaining')
  int get qtyOutRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_by_id')
  int get qualityCheckById => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  DateTime get qualityCheckDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnCheckCopyWith<ProductReturnCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnCheckCopyWith<$Res> {
  factory $ProductReturnCheckCopyWith(
          ProductReturnCheck value, $Res Function(ProductReturnCheck) then) =
      _$ProductReturnCheckCopyWithImpl<$Res, ProductReturnCheck>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturnId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      Product productId,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      ProductionOrder batch,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitId,
      int quantity,
      String description,
      @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
      ProductReturnCheckStatus status,
      @JsonKey(name: 'quantity_warehouse_return') int qtyWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining') int qtyWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') int qtyOutReturn,
      @JsonKey(name: 'quantity_out_remaining') int qtyOutRemaining,
      @JsonKey(name: 'quality_assurance_check_by_id') int qualityCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      DateTime qualityCheckDate});

  $ProductReturnCopyWith<$Res> get productReturnId;
  $ProductCopyWith<$Res> get productId;
  $ProductionOrderCopyWith<$Res> get batch;
  $MaterialUnitCopyWith<$Res> get unitId;
}

/// @nodoc
class _$ProductReturnCheckCopyWithImpl<$Res, $Val extends ProductReturnCheck>
    implements $ProductReturnCheckCopyWith<$Res> {
  _$ProductReturnCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productReturnId = null,
    Object? productId = null,
    Object? batch = null,
    Object? unitId = null,
    Object? quantity = null,
    Object? description = null,
    Object? status = null,
    Object? qtyWarehouseReturn = null,
    Object? qtyWarehouseRemaining = null,
    Object? qtyOutReturn = null,
    Object? qtyOutRemaining = null,
    Object? qualityCheckById = null,
    Object? qualityCheckDate = null,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productReturnId: null == productReturnId
          ? _value.productReturnId
          : productReturnId // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as Product,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReturnCheckStatus,
      qtyWarehouseReturn: null == qtyWarehouseReturn
          ? _value.qtyWarehouseReturn
          : qtyWarehouseReturn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyWarehouseRemaining: null == qtyWarehouseRemaining
          ? _value.qtyWarehouseRemaining
          : qtyWarehouseRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutReturn: null == qtyOutReturn
          ? _value.qtyOutReturn
          : qtyOutReturn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutRemaining: null == qtyOutRemaining
          ? _value.qtyOutRemaining
          : qtyOutRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      qualityCheckById: null == qualityCheckById
          ? _value.qualityCheckById
          : qualityCheckById // ignore: cast_nullable_to_non_nullable
              as int,
      qualityCheckDate: null == qualityCheckDate
          ? _value.qualityCheckDate
          : qualityCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturnId {
    return $ProductReturnCopyWith<$Res>(_value.productReturnId, (value) {
      return _then(_value.copyWith(productReturnId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get productId {
    return $ProductCopyWith<$Res>(_value.productId, (value) {
      return _then(_value.copyWith(productId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get batch {
    return $ProductionOrderCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitId {
    return $MaterialUnitCopyWith<$Res>(_value.unitId, (value) {
      return _then(_value.copyWith(unitId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnCheckImplCopyWith<$Res>
    implements $ProductReturnCheckCopyWith<$Res> {
  factory _$$ProductReturnCheckImplCopyWith(_$ProductReturnCheckImpl value,
          $Res Function(_$ProductReturnCheckImpl) then) =
      __$$ProductReturnCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturnId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      Product productId,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      ProductionOrder batch,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitId,
      int quantity,
      String description,
      @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
      ProductReturnCheckStatus status,
      @JsonKey(name: 'quantity_warehouse_return') int qtyWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining') int qtyWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') int qtyOutReturn,
      @JsonKey(name: 'quantity_out_remaining') int qtyOutRemaining,
      @JsonKey(name: 'quality_assurance_check_by_id') int qualityCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      DateTime qualityCheckDate});

  @override
  $ProductReturnCopyWith<$Res> get productReturnId;
  @override
  $ProductCopyWith<$Res> get productId;
  @override
  $ProductionOrderCopyWith<$Res> get batch;
  @override
  $MaterialUnitCopyWith<$Res> get unitId;
}

/// @nodoc
class __$$ProductReturnCheckImplCopyWithImpl<$Res>
    extends _$ProductReturnCheckCopyWithImpl<$Res, _$ProductReturnCheckImpl>
    implements _$$ProductReturnCheckImplCopyWith<$Res> {
  __$$ProductReturnCheckImplCopyWithImpl(_$ProductReturnCheckImpl _value,
      $Res Function(_$ProductReturnCheckImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productReturnId = null,
    Object? productId = null,
    Object? batch = null,
    Object? unitId = null,
    Object? quantity = null,
    Object? description = null,
    Object? status = null,
    Object? qtyWarehouseReturn = null,
    Object? qtyWarehouseRemaining = null,
    Object? qtyOutReturn = null,
    Object? qtyOutRemaining = null,
    Object? qualityCheckById = null,
    Object? qualityCheckDate = null,
  }) {
    return _then(_$ProductReturnCheckImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productReturnId: null == productReturnId
          ? _value.productReturnId
          : productReturnId // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as Product,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReturnCheckStatus,
      qtyWarehouseReturn: null == qtyWarehouseReturn
          ? _value.qtyWarehouseReturn
          : qtyWarehouseReturn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyWarehouseRemaining: null == qtyWarehouseRemaining
          ? _value.qtyWarehouseRemaining
          : qtyWarehouseRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutReturn: null == qtyOutReturn
          ? _value.qtyOutReturn
          : qtyOutReturn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutRemaining: null == qtyOutRemaining
          ? _value.qtyOutRemaining
          : qtyOutRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      qualityCheckById: null == qualityCheckById
          ? _value.qualityCheckById
          : qualityCheckById // ignore: cast_nullable_to_non_nullable
              as int,
      qualityCheckDate: null == qualityCheckDate
          ? _value.qualityCheckDate
          : qualityCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnCheckImpl extends _ProductReturnCheck {
  _$ProductReturnCheckImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required this.productReturnId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.productId,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      required this.batch,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      required this.unitId,
      required this.quantity,
      required this.description,
      @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
      required this.status,
      @JsonKey(name: 'quantity_warehouse_return')
      required this.qtyWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      required this.qtyWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') required this.qtyOutReturn,
      @JsonKey(name: 'quantity_out_remaining') required this.qtyOutRemaining,
      @JsonKey(name: 'quality_assurance_check_by_id')
      required this.qualityCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      required this.qualityCheckDate})
      : super._();

  factory _$ProductReturnCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnCheckImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  final ProductReturn productReturnId;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product productId;
  @override
  @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
  final ProductionOrder batch;
  @override
  @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unitId;
  @override
  final int quantity;
  @override
  final String description;
  @override
  @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
  final ProductReturnCheckStatus status;
  @override
  @JsonKey(name: 'quantity_warehouse_return')
  final int qtyWarehouseReturn;
  @override
  @JsonKey(name: 'quantity_warehouse_remaining')
  final int qtyWarehouseRemaining;
  @override
  @JsonKey(name: 'quantity_out_return')
  final int qtyOutReturn;
  @override
  @JsonKey(name: 'quantity_out_remaining')
  final int qtyOutRemaining;
  @override
  @JsonKey(name: 'quality_assurance_check_by_id')
  final int qualityCheckById;
  @override
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  final DateTime qualityCheckDate;

  @override
  String toString() {
    return 'ProductReturnCheck(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, productReturnId: $productReturnId, productId: $productId, batch: $batch, unitId: $unitId, quantity: $quantity, description: $description, status: $status, qtyWarehouseReturn: $qtyWarehouseReturn, qtyWarehouseRemaining: $qtyWarehouseRemaining, qtyOutReturn: $qtyOutReturn, qtyOutRemaining: $qtyOutRemaining, qualityCheckById: $qualityCheckById, qualityCheckDate: $qualityCheckDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnCheckImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.productReturnId, productReturnId) ||
                other.productReturnId == productReturnId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qtyWarehouseReturn, qtyWarehouseReturn) ||
                other.qtyWarehouseReturn == qtyWarehouseReturn) &&
            (identical(other.qtyWarehouseRemaining, qtyWarehouseRemaining) ||
                other.qtyWarehouseRemaining == qtyWarehouseRemaining) &&
            (identical(other.qtyOutReturn, qtyOutReturn) ||
                other.qtyOutReturn == qtyOutReturn) &&
            (identical(other.qtyOutRemaining, qtyOutRemaining) ||
                other.qtyOutRemaining == qtyOutRemaining) &&
            (identical(other.qualityCheckById, qualityCheckById) ||
                other.qualityCheckById == qualityCheckById) &&
            (identical(other.qualityCheckDate, qualityCheckDate) ||
                other.qualityCheckDate == qualityCheckDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      productReturnId,
      productId,
      batch,
      unitId,
      quantity,
      description,
      status,
      qtyWarehouseReturn,
      qtyWarehouseRemaining,
      qtyOutReturn,
      qtyOutRemaining,
      qualityCheckById,
      qualityCheckDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnCheckImplCopyWith<_$ProductReturnCheckImpl> get copyWith =>
      __$$ProductReturnCheckImplCopyWithImpl<_$ProductReturnCheckImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnCheckImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnCheck extends ProductReturnCheck {
  factory _ProductReturnCheck(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required final ProductReturn productReturnId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product productId,
      @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
      required final ProductionOrder batch,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unitId,
      required final int quantity,
      required final String description,
      @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
      required final ProductReturnCheckStatus status,
      @JsonKey(name: 'quantity_warehouse_return')
      required final int qtyWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      required final int qtyWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') required final int qtyOutReturn,
      @JsonKey(name: 'quantity_out_remaining')
      required final int qtyOutRemaining,
      @JsonKey(name: 'quality_assurance_check_by_id')
      required final int qualityCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      required final DateTime qualityCheckDate}) = _$ProductReturnCheckImpl;
  _ProductReturnCheck._() : super._();

  factory _ProductReturnCheck.fromJson(Map<String, dynamic> json) =
      _$ProductReturnCheckImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturnId;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get productId;
  @override
  @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batch;
  @override
  @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitId;
  @override
  int get quantity;
  @override
  String get description;
  @override
  @JsonKey(name: 'status', fromJson: ProductReturnCheckStatus.fromString)
  ProductReturnCheckStatus get status;
  @override
  @JsonKey(name: 'quantity_warehouse_return')
  int get qtyWarehouseReturn;
  @override
  @JsonKey(name: 'quantity_warehouse_remaining')
  int get qtyWarehouseRemaining;
  @override
  @JsonKey(name: 'quantity_out_return')
  int get qtyOutReturn;
  @override
  @JsonKey(name: 'quantity_out_remaining')
  int get qtyOutRemaining;
  @override
  @JsonKey(name: 'quality_assurance_check_by_id')
  int get qualityCheckById;
  @override
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  DateTime get qualityCheckDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnCheckImplCopyWith<_$ProductReturnCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
