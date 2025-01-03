// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_service_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionServiceOrder _$ProductionServiceOrderFromJson(
    Map<String, dynamic> json) {
  return _ProductionServiceOrder.fromJson(json);
}

/// @nodoc
mixin _$ProductionServiceOrder {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer', fromJson: Customer.fromJson)
  Customer get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bulk')
  bool get isBulk => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_status', fromJson: ProductionProductStatus.fromString)
  ProductionProductStatus get productStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
  ProductionProductScale get productScale => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_rework')
  bool get isRework => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_cancel')
  bool get isCancel => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_rework_by_id')
  int? get cancelReworkById => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
  DateTime? get cancelReworkAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_rework_reason')
  String? get cancelReworkReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionServiceOrderCopyWith<ProductionServiceOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionServiceOrderCopyWith<$Res> {
  factory $ProductionServiceOrderCopyWith(ProductionServiceOrder value,
          $Res Function(ProductionServiceOrder) then) =
      _$ProductionServiceOrderCopyWithImpl<$Res, ProductionServiceOrder>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'customer', fromJson: Customer.fromJson) Customer customer,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      int quantity,
      @JsonKey(name: 'is_bulk') bool isBulk,
      @JsonKey(
          name: 'product_status', fromJson: ProductionProductStatus.fromString)
      ProductionProductStatus productStatus,
      @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
      ProductionProductScale productScale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'is_rework') bool isRework,
      @JsonKey(name: 'is_cancel') bool isCancel,
      String description,
      @JsonKey(name: 'cancel_rework_by_id') int? cancelReworkById,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
      DateTime? cancelReworkAt,
      @JsonKey(name: 'cancel_rework_reason') String? cancelReworkReason,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$ProductionServiceOrderCopyWithImpl<$Res,
        $Val extends ProductionServiceOrder>
    implements $ProductionServiceOrderCopyWith<$Res> {
  _$ProductionServiceOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? batchNo = null,
    Object? productName = null,
    Object? customer = null,
    Object? purchaseOrderId = null,
    Object? quantity = null,
    Object? isBulk = null,
    Object? productStatus = null,
    Object? productScale = null,
    Object? expirationDate = null,
    Object? isRework = null,
    Object? isCancel = null,
    Object? description = null,
    Object? cancelReworkById = freezed,
    Object? cancelReworkAt = freezed,
    Object? cancelReworkReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isBulk: null == isBulk
          ? _value.isBulk
          : isBulk // ignore: cast_nullable_to_non_nullable
              as bool,
      productStatus: null == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductionProductStatus,
      productScale: null == productScale
          ? _value.productScale
          : productScale // ignore: cast_nullable_to_non_nullable
              as ProductionProductScale,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRework: null == isRework
          ? _value.isRework
          : isRework // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancel: null == isCancel
          ? _value.isCancel
          : isCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cancelReworkById: freezed == cancelReworkById
          ? _value.cancelReworkById
          : cancelReworkById // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelReworkAt: freezed == cancelReworkAt
          ? _value.cancelReworkAt
          : cancelReworkAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelReworkReason: freezed == cancelReworkReason
          ? _value.cancelReworkReason
          : cancelReworkReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductionServiceOrderImplCopyWith<$Res>
    implements $ProductionServiceOrderCopyWith<$Res> {
  factory _$$ProductionServiceOrderImplCopyWith(
          _$ProductionServiceOrderImpl value,
          $Res Function(_$ProductionServiceOrderImpl) then) =
      __$$ProductionServiceOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'customer', fromJson: Customer.fromJson) Customer customer,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      int quantity,
      @JsonKey(name: 'is_bulk') bool isBulk,
      @JsonKey(
          name: 'product_status', fromJson: ProductionProductStatus.fromString)
      ProductionProductStatus productStatus,
      @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
      ProductionProductScale productScale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'is_rework') bool isRework,
      @JsonKey(name: 'is_cancel') bool isCancel,
      String description,
      @JsonKey(name: 'cancel_rework_by_id') int? cancelReworkById,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
      DateTime? cancelReworkAt,
      @JsonKey(name: 'cancel_rework_reason') String? cancelReworkReason,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$ProductionServiceOrderImplCopyWithImpl<$Res>
    extends _$ProductionServiceOrderCopyWithImpl<$Res,
        _$ProductionServiceOrderImpl>
    implements _$$ProductionServiceOrderImplCopyWith<$Res> {
  __$$ProductionServiceOrderImplCopyWithImpl(
      _$ProductionServiceOrderImpl _value,
      $Res Function(_$ProductionServiceOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? batchNo = null,
    Object? productName = null,
    Object? customer = null,
    Object? purchaseOrderId = null,
    Object? quantity = null,
    Object? isBulk = null,
    Object? productStatus = null,
    Object? productScale = null,
    Object? expirationDate = null,
    Object? isRework = null,
    Object? isCancel = null,
    Object? description = null,
    Object? cancelReworkById = freezed,
    Object? cancelReworkAt = freezed,
    Object? cancelReworkReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ProductionServiceOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isBulk: null == isBulk
          ? _value.isBulk
          : isBulk // ignore: cast_nullable_to_non_nullable
              as bool,
      productStatus: null == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductionProductStatus,
      productScale: null == productScale
          ? _value.productScale
          : productScale // ignore: cast_nullable_to_non_nullable
              as ProductionProductScale,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRework: null == isRework
          ? _value.isRework
          : isRework // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancel: null == isCancel
          ? _value.isCancel
          : isCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cancelReworkById: freezed == cancelReworkById
          ? _value.cancelReworkById
          : cancelReworkById // ignore: cast_nullable_to_non_nullable
              as int?,
      cancelReworkAt: freezed == cancelReworkAt
          ? _value.cancelReworkAt
          : cancelReworkAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelReworkReason: freezed == cancelReworkReason
          ? _value.cancelReworkReason
          : cancelReworkReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionServiceOrderImpl extends _ProductionServiceOrder {
  const _$ProductionServiceOrderImpl(
      {required this.id,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'customer', fromJson: Customer.fromJson)
      required this.customer,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      required this.quantity,
      @JsonKey(name: 'is_bulk') required this.isBulk,
      @JsonKey(
          name: 'product_status', fromJson: ProductionProductStatus.fromString)
      required this.productStatus,
      @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
      required this.productScale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required this.expirationDate,
      @JsonKey(name: 'is_rework') required this.isRework,
      @JsonKey(name: 'is_cancel') required this.isCancel,
      required this.description,
      @JsonKey(name: 'cancel_rework_by_id') required this.cancelReworkById,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
      required this.cancelReworkAt,
      @JsonKey(name: 'cancel_rework_reason') required this.cancelReworkReason,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt})
      : super._();

  factory _$ProductionServiceOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionServiceOrderImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'customer', fromJson: Customer.fromJson)
  final Customer customer;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'is_bulk')
  final bool isBulk;
  @override
  @JsonKey(name: 'product_status', fromJson: ProductionProductStatus.fromString)
  final ProductionProductStatus productStatus;
  @override
  @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
  final ProductionProductScale productScale;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  final DateTime expirationDate;
  @override
  @JsonKey(name: 'is_rework')
  final bool isRework;
  @override
  @JsonKey(name: 'is_cancel')
  final bool isCancel;
  @override
  final String description;
  @override
  @JsonKey(name: 'cancel_rework_by_id')
  final int? cancelReworkById;
  @override
  @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
  final DateTime? cancelReworkAt;
  @override
  @JsonKey(name: 'cancel_rework_reason')
  final String? cancelReworkReason;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionServiceOrderImplCopyWith<_$ProductionServiceOrderImpl>
      get copyWith => __$$ProductionServiceOrderImplCopyWithImpl<
          _$ProductionServiceOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionServiceOrderImplToJson(
      this,
    );
  }
}

abstract class _ProductionServiceOrder extends ProductionServiceOrder {
  const factory _ProductionServiceOrder(
      {required final String id,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'customer', fromJson: Customer.fromJson)
      required final Customer customer,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      required final int quantity,
      @JsonKey(name: 'is_bulk') required final bool isBulk,
      @JsonKey(
          name: 'product_status', fromJson: ProductionProductStatus.fromString)
      required final ProductionProductStatus productStatus,
      @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
      required final ProductionProductScale productScale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required final DateTime expirationDate,
      @JsonKey(name: 'is_rework') required final bool isRework,
      @JsonKey(name: 'is_cancel') required final bool isCancel,
      required final String description,
      @JsonKey(name: 'cancel_rework_by_id')
      required final int? cancelReworkById,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
      required final DateTime? cancelReworkAt,
      @JsonKey(name: 'cancel_rework_reason')
      required final String? cancelReworkReason,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt}) = _$ProductionServiceOrderImpl;
  const _ProductionServiceOrder._() : super._();

  factory _ProductionServiceOrder.fromJson(Map<String, dynamic> json) =
      _$ProductionServiceOrderImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'customer', fromJson: Customer.fromJson)
  Customer get customer;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'is_bulk')
  bool get isBulk;
  @override
  @JsonKey(name: 'product_status', fromJson: ProductionProductStatus.fromString)
  ProductionProductStatus get productStatus;
  @override
  @JsonKey(name: 'scale', fromJson: ProductionProductScale.fromString)
  ProductionProductScale get productScale;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate;
  @override
  @JsonKey(name: 'is_rework')
  bool get isRework;
  @override
  @JsonKey(name: 'is_cancel')
  bool get isCancel;
  @override
  String get description;
  @override
  @JsonKey(name: 'cancel_rework_by_id')
  int? get cancelReworkById;
  @override
  @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullable)
  DateTime? get cancelReworkAt;
  @override
  @JsonKey(name: 'cancel_rework_reason')
  String? get cancelReworkReason;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductionServiceOrderImplCopyWith<_$ProductionServiceOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}
