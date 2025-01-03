// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_receive_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceReceiveDetail _$InvoiceReceiveDetailFromJson(Map<String, dynamic> json) {
  return _InvoiceReceiveDetail.fromJson(json);
}

/// @nodoc
mixin _$InvoiceReceiveDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  Material get material => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_invoice')
  int get qtyInvoice => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Serializes this InvoiceReceiveDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceReceiveDetailCopyWith<InvoiceReceiveDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceReceiveDetailCopyWith<$Res> {
  factory $InvoiceReceiveDetailCopyWith(InvoiceReceiveDetail value,
          $Res Function(InvoiceReceiveDetail) then) =
      _$InvoiceReceiveDetailCopyWithImpl<$Res, InvoiceReceiveDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'purchase_order_invoice_id') String invoiceId,
      @JsonKey(name: 'unit_id') String unitId,
      Material material,
      Product product,
      @JsonKey(name: 'quantity_invoice') int qtyInvoice,
      double price,
      double total});

  $MaterialCopyWith<$Res> get material;
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$InvoiceReceiveDetailCopyWithImpl<$Res,
        $Val extends InvoiceReceiveDetail>
    implements $InvoiceReceiveDetailCopyWith<$Res> {
  _$InvoiceReceiveDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? invoiceId = null,
    Object? unitId = null,
    Object? material = null,
    Object? product = null,
    Object? qtyInvoice = null,
    Object? price = null,
    Object? total = null,
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
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      qtyInvoice: null == qtyInvoice
          ? _value.qtyInvoice
          : qtyInvoice // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceReceiveDetailImplCopyWith<$Res>
    implements $InvoiceReceiveDetailCopyWith<$Res> {
  factory _$$InvoiceReceiveDetailImplCopyWith(_$InvoiceReceiveDetailImpl value,
          $Res Function(_$InvoiceReceiveDetailImpl) then) =
      __$$InvoiceReceiveDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'purchase_order_invoice_id') String invoiceId,
      @JsonKey(name: 'unit_id') String unitId,
      Material material,
      Product product,
      @JsonKey(name: 'quantity_invoice') int qtyInvoice,
      double price,
      double total});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$InvoiceReceiveDetailImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveDetailCopyWithImpl<$Res, _$InvoiceReceiveDetailImpl>
    implements _$$InvoiceReceiveDetailImplCopyWith<$Res> {
  __$$InvoiceReceiveDetailImplCopyWithImpl(_$InvoiceReceiveDetailImpl _value,
      $Res Function(_$InvoiceReceiveDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? invoiceId = null,
    Object? unitId = null,
    Object? material = null,
    Object? product = null,
    Object? qtyInvoice = null,
    Object? price = null,
    Object? total = null,
  }) {
    return _then(_$InvoiceReceiveDetailImpl(
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
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      qtyInvoice: null == qtyInvoice
          ? _value.qtyInvoice
          : qtyInvoice // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceReceiveDetailImpl extends _InvoiceReceiveDetail {
  _$InvoiceReceiveDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'purchase_order_invoice_id') required this.invoiceId,
      @JsonKey(name: 'unit_id') required this.unitId,
      required this.material,
      required this.product,
      @JsonKey(name: 'quantity_invoice') required this.qtyInvoice,
      required this.price,
      required this.total})
      : super._();

  factory _$InvoiceReceiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceReceiveDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'purchase_order_invoice_id')
  final String invoiceId;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  final Material material;
  @override
  final Product product;
  @override
  @JsonKey(name: 'quantity_invoice')
  final int qtyInvoice;
  @override
  final double price;
  @override
  final double total;

  @override
  String toString() {
    return 'InvoiceReceiveDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, invoiceId: $invoiceId, unitId: $unitId, material: $material, product: $product, qtyInvoice: $qtyInvoice, price: $price, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceReceiveDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.qtyInvoice, qtyInvoice) ||
                other.qtyInvoice == qtyInvoice) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt,
      invoiceId, unitId, material, product, qtyInvoice, price, total);

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceReceiveDetailImplCopyWith<_$InvoiceReceiveDetailImpl>
      get copyWith =>
          __$$InvoiceReceiveDetailImplCopyWithImpl<_$InvoiceReceiveDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceReceiveDetailImplToJson(
      this,
    );
  }
}

abstract class _InvoiceReceiveDetail extends InvoiceReceiveDetail {
  factory _InvoiceReceiveDetail(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'purchase_order_invoice_id')
      required final String invoiceId,
      @JsonKey(name: 'unit_id') required final String unitId,
      required final Material material,
      required final Product product,
      @JsonKey(name: 'quantity_invoice') required final int qtyInvoice,
      required final double price,
      required final double total}) = _$InvoiceReceiveDetailImpl;
  _InvoiceReceiveDetail._() : super._();

  factory _InvoiceReceiveDetail.fromJson(Map<String, dynamic> json) =
      _$InvoiceReceiveDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'purchase_order_invoice_id')
  String get invoiceId;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  Material get material;
  @override
  Product get product;
  @override
  @JsonKey(name: 'quantity_invoice')
  int get qtyInvoice;
  @override
  double get price;
  @override
  double get total;

  /// Create a copy of InvoiceReceiveDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceReceiveDetailImplCopyWith<_$InvoiceReceiveDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
