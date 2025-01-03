// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_pbf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnPbf _$ProductReturnPbfFromJson(Map<String, dynamic> json) {
  return _ProductReturnPbf.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnPbf {
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issued_name')
  String get productIssuedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issued_qty')
  int get productIssuedQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issued_batch')
  String get productIssuedBatch => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_name')
  String get productReturnName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_qty')
  int get productReturnQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_batch')
  String get productReturnBatch => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnPbfCopyWith<ProductReturnPbf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnPbfCopyWith<$Res> {
  factory $ProductReturnPbfCopyWith(
          ProductReturnPbf value, $Res Function(ProductReturnPbf) then) =
      _$ProductReturnPbfCopyWithImpl<$Res, ProductReturnPbf>;
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'product_issued_name') String productIssuedName,
      @JsonKey(name: 'product_issued_qty') int productIssuedQty,
      @JsonKey(name: 'product_issued_batch') String productIssuedBatch,
      @JsonKey(name: 'product_return_name') String productReturnName,
      @JsonKey(name: 'product_return_qty') int productReturnQty,
      @JsonKey(name: 'product_return_batch') String productReturnBatch,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName});
}

/// @nodoc
class _$ProductReturnPbfCopyWithImpl<$Res, $Val extends ProductReturnPbf>
    implements $ProductReturnPbfCopyWith<$Res> {
  _$ProductReturnPbfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryOrderDate = null,
    Object? productIssuedName = null,
    Object? productIssuedQty = null,
    Object? productIssuedBatch = null,
    Object? productReturnName = null,
    Object? productReturnQty = null,
    Object? productReturnBatch = null,
    Object? customerId = null,
    Object? customerName = null,
  }) {
    return _then(_value.copyWith(
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productIssuedName: null == productIssuedName
          ? _value.productIssuedName
          : productIssuedName // ignore: cast_nullable_to_non_nullable
              as String,
      productIssuedQty: null == productIssuedQty
          ? _value.productIssuedQty
          : productIssuedQty // ignore: cast_nullable_to_non_nullable
              as int,
      productIssuedBatch: null == productIssuedBatch
          ? _value.productIssuedBatch
          : productIssuedBatch // ignore: cast_nullable_to_non_nullable
              as String,
      productReturnName: null == productReturnName
          ? _value.productReturnName
          : productReturnName // ignore: cast_nullable_to_non_nullable
              as String,
      productReturnQty: null == productReturnQty
          ? _value.productReturnQty
          : productReturnQty // ignore: cast_nullable_to_non_nullable
              as int,
      productReturnBatch: null == productReturnBatch
          ? _value.productReturnBatch
          : productReturnBatch // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductReturnPbfImplCopyWith<$Res>
    implements $ProductReturnPbfCopyWith<$Res> {
  factory _$$ProductReturnPbfImplCopyWith(_$ProductReturnPbfImpl value,
          $Res Function(_$ProductReturnPbfImpl) then) =
      __$$ProductReturnPbfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'product_issued_name') String productIssuedName,
      @JsonKey(name: 'product_issued_qty') int productIssuedQty,
      @JsonKey(name: 'product_issued_batch') String productIssuedBatch,
      @JsonKey(name: 'product_return_name') String productReturnName,
      @JsonKey(name: 'product_return_qty') int productReturnQty,
      @JsonKey(name: 'product_return_batch') String productReturnBatch,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName});
}

/// @nodoc
class __$$ProductReturnPbfImplCopyWithImpl<$Res>
    extends _$ProductReturnPbfCopyWithImpl<$Res, _$ProductReturnPbfImpl>
    implements _$$ProductReturnPbfImplCopyWith<$Res> {
  __$$ProductReturnPbfImplCopyWithImpl(_$ProductReturnPbfImpl _value,
      $Res Function(_$ProductReturnPbfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliveryOrderDate = null,
    Object? productIssuedName = null,
    Object? productIssuedQty = null,
    Object? productIssuedBatch = null,
    Object? productReturnName = null,
    Object? productReturnQty = null,
    Object? productReturnBatch = null,
    Object? customerId = null,
    Object? customerName = null,
  }) {
    return _then(_$ProductReturnPbfImpl(
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productIssuedName: null == productIssuedName
          ? _value.productIssuedName
          : productIssuedName // ignore: cast_nullable_to_non_nullable
              as String,
      productIssuedQty: null == productIssuedQty
          ? _value.productIssuedQty
          : productIssuedQty // ignore: cast_nullable_to_non_nullable
              as int,
      productIssuedBatch: null == productIssuedBatch
          ? _value.productIssuedBatch
          : productIssuedBatch // ignore: cast_nullable_to_non_nullable
              as String,
      productReturnName: null == productReturnName
          ? _value.productReturnName
          : productReturnName // ignore: cast_nullable_to_non_nullable
              as String,
      productReturnQty: null == productReturnQty
          ? _value.productReturnQty
          : productReturnQty // ignore: cast_nullable_to_non_nullable
              as int,
      productReturnBatch: null == productReturnBatch
          ? _value.productReturnBatch
          : productReturnBatch // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnPbfImpl extends _ProductReturnPbf {
  _$ProductReturnPbfImpl(
      {@JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate,
      @JsonKey(name: 'product_issued_name') required this.productIssuedName,
      @JsonKey(name: 'product_issued_qty') required this.productIssuedQty,
      @JsonKey(name: 'product_issued_batch') required this.productIssuedBatch,
      @JsonKey(name: 'product_return_name') required this.productReturnName,
      @JsonKey(name: 'product_return_qty') required this.productReturnQty,
      @JsonKey(name: 'product_return_batch') required this.productReturnBatch,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName})
      : super._();

  factory _$ProductReturnPbfImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnPbfImplFromJson(json);

  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;
  @override
  @JsonKey(name: 'product_issued_name')
  final String productIssuedName;
  @override
  @JsonKey(name: 'product_issued_qty')
  final int productIssuedQty;
  @override
  @JsonKey(name: 'product_issued_batch')
  final String productIssuedBatch;
  @override
  @JsonKey(name: 'product_return_name')
  final String productReturnName;
  @override
  @JsonKey(name: 'product_return_qty')
  final int productReturnQty;
  @override
  @JsonKey(name: 'product_return_batch')
  final String productReturnBatch;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;

  @override
  String toString() {
    return 'ProductReturnPbf(deliveryOrderDate: $deliveryOrderDate, productIssuedName: $productIssuedName, productIssuedQty: $productIssuedQty, productIssuedBatch: $productIssuedBatch, productReturnName: $productReturnName, productReturnQty: $productReturnQty, productReturnBatch: $productReturnBatch, customerId: $customerId, customerName: $customerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnPbfImpl &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.productIssuedName, productIssuedName) ||
                other.productIssuedName == productIssuedName) &&
            (identical(other.productIssuedQty, productIssuedQty) ||
                other.productIssuedQty == productIssuedQty) &&
            (identical(other.productIssuedBatch, productIssuedBatch) ||
                other.productIssuedBatch == productIssuedBatch) &&
            (identical(other.productReturnName, productReturnName) ||
                other.productReturnName == productReturnName) &&
            (identical(other.productReturnQty, productReturnQty) ||
                other.productReturnQty == productReturnQty) &&
            (identical(other.productReturnBatch, productReturnBatch) ||
                other.productReturnBatch == productReturnBatch) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      deliveryOrderDate,
      productIssuedName,
      productIssuedQty,
      productIssuedBatch,
      productReturnName,
      productReturnQty,
      productReturnBatch,
      customerId,
      customerName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnPbfImplCopyWith<_$ProductReturnPbfImpl> get copyWith =>
      __$$ProductReturnPbfImplCopyWithImpl<_$ProductReturnPbfImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnPbfImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnPbf extends ProductReturnPbf {
  factory _ProductReturnPbf(
      {@JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryOrderDate,
      @JsonKey(name: 'product_issued_name')
      required final String productIssuedName,
      @JsonKey(name: 'product_issued_qty') required final int productIssuedQty,
      @JsonKey(name: 'product_issued_batch')
      required final String productIssuedBatch,
      @JsonKey(name: 'product_return_name')
      required final String productReturnName,
      @JsonKey(name: 'product_return_qty') required final int productReturnQty,
      @JsonKey(name: 'product_return_batch')
      required final String productReturnBatch,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'customer_name')
      required final String customerName}) = _$ProductReturnPbfImpl;
  _ProductReturnPbf._() : super._();

  factory _ProductReturnPbf.fromJson(Map<String, dynamic> json) =
      _$ProductReturnPbfImpl.fromJson;

  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;
  @override
  @JsonKey(name: 'product_issued_name')
  String get productIssuedName;
  @override
  @JsonKey(name: 'product_issued_qty')
  int get productIssuedQty;
  @override
  @JsonKey(name: 'product_issued_batch')
  String get productIssuedBatch;
  @override
  @JsonKey(name: 'product_return_name')
  String get productReturnName;
  @override
  @JsonKey(name: 'product_return_qty')
  int get productReturnQty;
  @override
  @JsonKey(name: 'product_return_batch')
  String get productReturnBatch;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnPbfImplCopyWith<_$ProductReturnPbfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
