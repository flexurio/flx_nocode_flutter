// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cogs_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CogsDetail _$CogsDetailFromJson(Map<String, dynamic> json) {
  return _CogsDetail.fromJson(json);
}

/// @nodoc
mixin _$CogsDetail {
  @JsonKey(name: 'transaction_no')
  String get transaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_no')
  String get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'na')
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  num get quantity => throw _privateConstructorUsedError;
  num get price => throw _privateConstructorUsedError;
  num get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String get remark => throw _privateConstructorUsedError;

  /// Serializes this CogsDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CogsDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CogsDetailCopyWith<CogsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CogsDetailCopyWith<$Res> {
  factory $CogsDetailCopyWith(
          CogsDetail value, $Res Function(CogsDetail) then) =
      _$CogsDetailCopyWithImpl<$Res, CogsDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_no') String transaction,
      @JsonKey(name: 'purchase_order_no') String purchaseOrder,
      @JsonKey(name: 'batch_no') String batch,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'na') String na,
      @JsonKey(name: 'qty') num quantity,
      num price,
      num value,
      @JsonKey(name: 'remark') String remark});
}

/// @nodoc
class _$CogsDetailCopyWithImpl<$Res, $Val extends CogsDetail>
    implements $CogsDetailCopyWith<$Res> {
  _$CogsDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CogsDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? purchaseOrder = null,
    Object? batch = null,
    Object? productId = null,
    Object? productName = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? na = null,
    Object? quantity = null,
    Object? price = null,
    Object? value = null,
    Object? remark = null,
  }) {
    return _then(_value.copyWith(
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CogsDetailImplCopyWith<$Res>
    implements $CogsDetailCopyWith<$Res> {
  factory _$$CogsDetailImplCopyWith(
          _$CogsDetailImpl value, $Res Function(_$CogsDetailImpl) then) =
      __$$CogsDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_no') String transaction,
      @JsonKey(name: 'purchase_order_no') String purchaseOrder,
      @JsonKey(name: 'batch_no') String batch,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'na') String na,
      @JsonKey(name: 'qty') num quantity,
      num price,
      num value,
      @JsonKey(name: 'remark') String remark});
}

/// @nodoc
class __$$CogsDetailImplCopyWithImpl<$Res>
    extends _$CogsDetailCopyWithImpl<$Res, _$CogsDetailImpl>
    implements _$$CogsDetailImplCopyWith<$Res> {
  __$$CogsDetailImplCopyWithImpl(
      _$CogsDetailImpl _value, $Res Function(_$CogsDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of CogsDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? purchaseOrder = null,
    Object? batch = null,
    Object? productId = null,
    Object? productName = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? na = null,
    Object? quantity = null,
    Object? price = null,
    Object? value = null,
    Object? remark = null,
  }) {
    return _then(_$CogsDetailImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as String,
      null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String,
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CogsDetailImpl extends _CogsDetail {
  const _$CogsDetailImpl(
      @JsonKey(name: 'transaction_no') this.transaction,
      @JsonKey(name: 'purchase_order_no') this.purchaseOrder,
      @JsonKey(name: 'batch_no') this.batch,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'product_name') this.productName,
      @JsonKey(name: 'material_id') this.materialId,
      @JsonKey(name: 'material_name') this.materialName,
      @JsonKey(name: 'na') this.na,
      @JsonKey(name: 'qty') this.quantity,
      this.price,
      this.value,
      @JsonKey(name: 'remark') this.remark)
      : super._();

  factory _$CogsDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$CogsDetailImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_no')
  final String transaction;
  @override
  @JsonKey(name: 'purchase_order_no')
  final String purchaseOrder;
  @override
  @JsonKey(name: 'batch_no')
  final String batch;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'na')
  final String na;
  @override
  @JsonKey(name: 'qty')
  final num quantity;
  @override
  final num price;
  @override
  final num value;
  @override
  @JsonKey(name: 'remark')
  final String remark;

  @override
  String toString() {
    return 'CogsDetail(transaction: $transaction, purchaseOrder: $purchaseOrder, batch: $batch, productId: $productId, productName: $productName, materialId: $materialId, materialName: $materialName, na: $na, quantity: $quantity, price: $price, value: $value, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CogsDetailImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transaction,
      purchaseOrder,
      batch,
      productId,
      productName,
      materialId,
      materialName,
      na,
      quantity,
      price,
      value,
      remark);

  /// Create a copy of CogsDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CogsDetailImplCopyWith<_$CogsDetailImpl> get copyWith =>
      __$$CogsDetailImplCopyWithImpl<_$CogsDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CogsDetailImplToJson(
      this,
    );
  }
}

abstract class _CogsDetail extends CogsDetail {
  const factory _CogsDetail(
      @JsonKey(name: 'transaction_no') final String transaction,
      @JsonKey(name: 'purchase_order_no') final String purchaseOrder,
      @JsonKey(name: 'batch_no') final String batch,
      @JsonKey(name: 'product_id') final String productId,
      @JsonKey(name: 'product_name') final String productName,
      @JsonKey(name: 'material_id') final String materialId,
      @JsonKey(name: 'material_name') final String materialName,
      @JsonKey(name: 'na') final String na,
      @JsonKey(name: 'qty') final num quantity,
      final num price,
      final num value,
      @JsonKey(name: 'remark') final String remark) = _$CogsDetailImpl;
  const _CogsDetail._() : super._();

  factory _CogsDetail.fromJson(Map<String, dynamic> json) =
      _$CogsDetailImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_no')
  String get transaction;
  @override
  @JsonKey(name: 'purchase_order_no')
  String get purchaseOrder;
  @override
  @JsonKey(name: 'batch_no')
  String get batch;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'na')
  String get na;
  @override
  @JsonKey(name: 'qty')
  num get quantity;
  @override
  num get price;
  @override
  num get value;
  @override
  @JsonKey(name: 'remark')
  String get remark;

  /// Create a copy of CogsDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CogsDetailImplCopyWith<_$CogsDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
