// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnDetail _$ProductReturnDetailFromJson(Map<String, dynamic> json) {
  return _ProductReturnDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  double get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_check')
  int get quantityCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_product_price')
  double get totalProductPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
  DateTime get checkQcAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_qc_by_id')
  int get checkQcById => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_return_note', defaultValue: 0)
  int get quantityReturnNote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnDetailCopyWith<ProductReturnDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnDetailCopyWith<$Res> {
  factory $ProductReturnDetailCopyWith(
          ProductReturnDetail value, $Res Function(ProductReturnDetail) then) =
      _$ProductReturnDetailCopyWithImpl<$Res, ProductReturnDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder batchNo,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit,
      @JsonKey(name: 'product_price') double productPrice,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'quantity_check') int quantityCheck,
      @JsonKey(name: 'total_product_price') double totalProductPrice,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
      DateTime checkQcAt,
      @JsonKey(name: 'check_qc_by_id') int checkQcById,
      @JsonKey(name: 'quantity_return_note', defaultValue: 0)
      int quantityReturnNote});

  $ProductReturnCopyWith<$Res> get productReturn;
  $ProductCopyWith<$Res> get product;
  $ProductionOrderCopyWith<$Res> get batchNo;
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class _$ProductReturnDetailCopyWithImpl<$Res, $Val extends ProductReturnDetail>
    implements $ProductReturnDetailCopyWith<$Res> {
  _$ProductReturnDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? updatedAt = null,
    Object? productReturn = null,
    Object? product = null,
    Object? deliveryOrderId = null,
    Object? batchNo = null,
    Object? unit = null,
    Object? productPrice = null,
    Object? quantity = null,
    Object? quantityRemaining = null,
    Object? quantityCheck = null,
    Object? totalProductPrice = null,
    Object? expirationDate = null,
    Object? checkQcAt = null,
    Object? checkQcById = null,
    Object? quantityReturnNote = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCheck: null == quantityCheck
          ? _value.quantityCheck
          : quantityCheck // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkQcAt: null == checkQcAt
          ? _value.checkQcAt
          : checkQcAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkQcById: null == checkQcById
          ? _value.checkQcById
          : checkQcById // ignore: cast_nullable_to_non_nullable
              as int,
      quantityReturnNote: null == quantityReturnNote
          ? _value.quantityReturnNote
          : quantityReturnNote // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get batchNo {
    return $ProductionOrderCopyWith<$Res>(_value.batchNo, (value) {
      return _then(_value.copyWith(batchNo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnDetailImplCopyWith<$Res>
    implements $ProductReturnDetailCopyWith<$Res> {
  factory _$$ProductReturnDetailImplCopyWith(_$ProductReturnDetailImpl value,
          $Res Function(_$ProductReturnDetailImpl) then) =
      __$$ProductReturnDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder batchNo,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit,
      @JsonKey(name: 'product_price') double productPrice,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'quantity_check') int quantityCheck,
      @JsonKey(name: 'total_product_price') double totalProductPrice,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
      DateTime checkQcAt,
      @JsonKey(name: 'check_qc_by_id') int checkQcById,
      @JsonKey(name: 'quantity_return_note', defaultValue: 0)
      int quantityReturnNote});

  @override
  $ProductReturnCopyWith<$Res> get productReturn;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductionOrderCopyWith<$Res> get batchNo;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class __$$ProductReturnDetailImplCopyWithImpl<$Res>
    extends _$ProductReturnDetailCopyWithImpl<$Res, _$ProductReturnDetailImpl>
    implements _$$ProductReturnDetailImplCopyWith<$Res> {
  __$$ProductReturnDetailImplCopyWithImpl(_$ProductReturnDetailImpl _value,
      $Res Function(_$ProductReturnDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? updatedAt = null,
    Object? productReturn = null,
    Object? product = null,
    Object? deliveryOrderId = null,
    Object? batchNo = null,
    Object? unit = null,
    Object? productPrice = null,
    Object? quantity = null,
    Object? quantityRemaining = null,
    Object? quantityCheck = null,
    Object? totalProductPrice = null,
    Object? expirationDate = null,
    Object? checkQcAt = null,
    Object? checkQcById = null,
    Object? quantityReturnNote = null,
  }) {
    return _then(_$ProductReturnDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCheck: null == quantityCheck
          ? _value.quantityCheck
          : quantityCheck // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkQcAt: null == checkQcAt
          ? _value.checkQcAt
          : checkQcAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkQcById: null == checkQcById
          ? _value.checkQcById
          : checkQcById // ignore: cast_nullable_to_non_nullable
              as int,
      quantityReturnNote: null == quantityReturnNote
          ? _value.quantityReturnNote
          : quantityReturnNote // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnDetailImpl extends _ProductReturnDetail {
  _$ProductReturnDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required this.productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required this.batchNo,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'quantity_remaining') required this.quantityRemaining,
      @JsonKey(name: 'quantity_check') required this.quantityCheck,
      @JsonKey(name: 'total_product_price') required this.totalProductPrice,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required this.expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
      required this.checkQcAt,
      @JsonKey(name: 'check_qc_by_id') required this.checkQcById,
      @JsonKey(name: 'quantity_return_note', defaultValue: 0)
      required this.quantityReturnNote})
      : super._();

  factory _$ProductReturnDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  final ProductReturn productReturn;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  final ProductionOrder batchNo;
  @override
  @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'product_price')
  final double productPrice;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;
  @override
  @JsonKey(name: 'quantity_remaining')
  final int quantityRemaining;
  @override
  @JsonKey(name: 'quantity_check')
  final int quantityCheck;
  @override
  @JsonKey(name: 'total_product_price')
  final double totalProductPrice;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  final DateTime expirationDate;
  @override
  @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
  final DateTime checkQcAt;
  @override
  @JsonKey(name: 'check_qc_by_id')
  final int checkQcById;
  @override
  @JsonKey(name: 'quantity_return_note', defaultValue: 0)
  final int quantityReturnNote;

  @override
  String toString() {
    return 'ProductReturnDetail(id: $id, createAt: $createAt, updatedAt: $updatedAt, productReturn: $productReturn, product: $product, deliveryOrderId: $deliveryOrderId, batchNo: $batchNo, unit: $unit, productPrice: $productPrice, quantity: $quantity, quantityRemaining: $quantityRemaining, quantityCheck: $quantityCheck, totalProductPrice: $totalProductPrice, expirationDate: $expirationDate, checkQcAt: $checkQcAt, checkQcById: $checkQcById, quantityReturnNote: $quantityReturnNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining) &&
            (identical(other.quantityCheck, quantityCheck) ||
                other.quantityCheck == quantityCheck) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.checkQcAt, checkQcAt) ||
                other.checkQcAt == checkQcAt) &&
            (identical(other.checkQcById, checkQcById) ||
                other.checkQcById == checkQcById) &&
            (identical(other.quantityReturnNote, quantityReturnNote) ||
                other.quantityReturnNote == quantityReturnNote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createAt,
      updatedAt,
      productReturn,
      product,
      deliveryOrderId,
      batchNo,
      unit,
      productPrice,
      quantity,
      quantityRemaining,
      quantityCheck,
      totalProductPrice,
      expirationDate,
      checkQcAt,
      checkQcById,
      quantityReturnNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnDetailImplCopyWith<_$ProductReturnDetailImpl> get copyWith =>
      __$$ProductReturnDetailImplCopyWithImpl<_$ProductReturnDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnDetail extends ProductReturnDetail {
  factory _ProductReturnDetail(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required final ProductReturn productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required final ProductionOrder batchNo,
      @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unit,
      @JsonKey(name: 'product_price') required final double productPrice,
      @JsonKey(name: 'quantity') required final int quantity,
      @JsonKey(name: 'quantity_remaining') required final int quantityRemaining,
      @JsonKey(name: 'quantity_check') required final int quantityCheck,
      @JsonKey(name: 'total_product_price')
      required final double totalProductPrice,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required final DateTime expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
      required final DateTime checkQcAt,
      @JsonKey(name: 'check_qc_by_id') required final int checkQcById,
      @JsonKey(name: 'quantity_return_note', defaultValue: 0)
      required final int quantityReturnNote}) = _$ProductReturnDetailImpl;
  _ProductReturnDetail._() : super._();

  factory _ProductReturnDetail.fromJson(Map<String, dynamic> json) =
      _$ProductReturnDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batchNo;
  @override
  @JsonKey(name: 'unit_id', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'product_price')
  double get productPrice;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining;
  @override
  @JsonKey(name: 'quantity_check')
  int get quantityCheck;
  @override
  @JsonKey(name: 'total_product_price')
  double get totalProductPrice;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate;
  @override
  @JsonKey(name: 'check_qc_at', fromJson: isoDateToDateTime)
  DateTime get checkQcAt;
  @override
  @JsonKey(name: 'check_qc_by_id')
  int get checkQcById;
  @override
  @JsonKey(name: 'quantity_return_note', defaultValue: 0)
  int get quantityReturnNote;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnDetailImplCopyWith<_$ProductReturnDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
