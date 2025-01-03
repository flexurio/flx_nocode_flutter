// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_reject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderReject _$PurchaseOrderRejectFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderReject.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderReject {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_old')
  String get materialRequestOld => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_old')
  String get purchaseOrderOld => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_new')
  String get purchaseOrderNew => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderReject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderReject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderRejectCopyWith<PurchaseOrderReject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderRejectCopyWith<$Res> {
  factory $PurchaseOrderRejectCopyWith(
          PurchaseOrderReject value, $Res Function(PurchaseOrderReject) then) =
      _$PurchaseOrderRejectCopyWithImpl<$Res, PurchaseOrderReject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'material_request_old') String materialRequestOld,
      @JsonKey(name: 'purchase_order_old') String purchaseOrderOld,
      @JsonKey(name: 'purchase_order_new') String purchaseOrderNew,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'qty') double quantity,
      @JsonKey(name: 'price') double price});
}

/// @nodoc
class _$PurchaseOrderRejectCopyWithImpl<$Res, $Val extends PurchaseOrderReject>
    implements $PurchaseOrderRejectCopyWith<$Res> {
  _$PurchaseOrderRejectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderReject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? materialRequestOld = null,
    Object? purchaseOrderOld = null,
    Object? purchaseOrderNew = null,
    Object? dateOfNeed = null,
    Object? materialName = null,
    Object? productName = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestOld: null == materialRequestOld
          ? _value.materialRequestOld
          : materialRequestOld // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderOld: null == purchaseOrderOld
          ? _value.purchaseOrderOld
          : purchaseOrderOld // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderNew: null == purchaseOrderNew
          ? _value.purchaseOrderNew
          : purchaseOrderNew // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderRejectImplCopyWith<$Res>
    implements $PurchaseOrderRejectCopyWith<$Res> {
  factory _$$PurchaseOrderRejectImplCopyWith(_$PurchaseOrderRejectImpl value,
          $Res Function(_$PurchaseOrderRejectImpl) then) =
      __$$PurchaseOrderRejectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'material_request_old') String materialRequestOld,
      @JsonKey(name: 'purchase_order_old') String purchaseOrderOld,
      @JsonKey(name: 'purchase_order_new') String purchaseOrderNew,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'qty') double quantity,
      @JsonKey(name: 'price') double price});
}

/// @nodoc
class __$$PurchaseOrderRejectImplCopyWithImpl<$Res>
    extends _$PurchaseOrderRejectCopyWithImpl<$Res, _$PurchaseOrderRejectImpl>
    implements _$$PurchaseOrderRejectImplCopyWith<$Res> {
  __$$PurchaseOrderRejectImplCopyWithImpl(_$PurchaseOrderRejectImpl _value,
      $Res Function(_$PurchaseOrderRejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderReject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? materialRequestOld = null,
    Object? purchaseOrderOld = null,
    Object? purchaseOrderNew = null,
    Object? dateOfNeed = null,
    Object? materialName = null,
    Object? productName = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$PurchaseOrderRejectImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestOld: null == materialRequestOld
          ? _value.materialRequestOld
          : materialRequestOld // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderOld: null == purchaseOrderOld
          ? _value.purchaseOrderOld
          : purchaseOrderOld // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderNew: null == purchaseOrderNew
          ? _value.purchaseOrderNew
          : purchaseOrderNew // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderRejectImpl implements _PurchaseOrderReject {
  const _$PurchaseOrderRejectImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'material_request_old') required this.materialRequestOld,
      @JsonKey(name: 'purchase_order_old') required this.purchaseOrderOld,
      @JsonKey(name: 'purchase_order_new') required this.purchaseOrderNew,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required this.dateOfNeed,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'qty') required this.quantity,
      @JsonKey(name: 'price') required this.price});

  factory _$PurchaseOrderRejectImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderRejectImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'material_request_old')
  final String materialRequestOld;
  @override
  @JsonKey(name: 'purchase_order_old')
  final String purchaseOrderOld;
  @override
  @JsonKey(name: 'purchase_order_new')
  final String purchaseOrderNew;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  final DateTime dateOfNeed;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'qty')
  final double quantity;
  @override
  @JsonKey(name: 'price')
  final double price;

  @override
  String toString() {
    return 'PurchaseOrderReject(createdAt: $createdAt, materialRequestOld: $materialRequestOld, purchaseOrderOld: $purchaseOrderOld, purchaseOrderNew: $purchaseOrderNew, dateOfNeed: $dateOfNeed, materialName: $materialName, productName: $productName, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderRejectImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.materialRequestOld, materialRequestOld) ||
                other.materialRequestOld == materialRequestOld) &&
            (identical(other.purchaseOrderOld, purchaseOrderOld) ||
                other.purchaseOrderOld == purchaseOrderOld) &&
            (identical(other.purchaseOrderNew, purchaseOrderNew) ||
                other.purchaseOrderNew == purchaseOrderNew) &&
            (identical(other.dateOfNeed, dateOfNeed) ||
                other.dateOfNeed == dateOfNeed) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      materialRequestOld,
      purchaseOrderOld,
      purchaseOrderNew,
      dateOfNeed,
      materialName,
      productName,
      quantity,
      price);

  /// Create a copy of PurchaseOrderReject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderRejectImplCopyWith<_$PurchaseOrderRejectImpl> get copyWith =>
      __$$PurchaseOrderRejectImplCopyWithImpl<_$PurchaseOrderRejectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderRejectImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderReject implements PurchaseOrderReject {
  const factory _PurchaseOrderReject(
          {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'material_request_old')
          required final String materialRequestOld,
          @JsonKey(name: 'purchase_order_old')
          required final String purchaseOrderOld,
          @JsonKey(name: 'purchase_order_new')
          required final String purchaseOrderNew,
          @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
          required final DateTime dateOfNeed,
          @JsonKey(name: 'material_name') required final String materialName,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'qty') required final double quantity,
          @JsonKey(name: 'price') required final double price}) =
      _$PurchaseOrderRejectImpl;

  factory _PurchaseOrderReject.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderRejectImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'material_request_old')
  String get materialRequestOld;
  @override
  @JsonKey(name: 'purchase_order_old')
  String get purchaseOrderOld;
  @override
  @JsonKey(name: 'purchase_order_new')
  String get purchaseOrderNew;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'qty')
  double get quantity;
  @override
  @JsonKey(name: 'price')
  double get price;

  /// Create a copy of PurchaseOrderReject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderRejectImplCopyWith<_$PurchaseOrderRejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
