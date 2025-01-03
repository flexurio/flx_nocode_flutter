// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductIssue _$ProductIssueFromJson(Map<String, dynamic> json) {
  return _ProductIssue.fromJson(json);
}

/// @nodoc
mixin _$ProductIssue {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark', defaultValue: '')
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'expedition', defaultValue: '')
  String get expedition => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_no', defaultValue: '')
  String get shippingNo => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'shipment_via',
      fromJson: ProductIssueShipmentVia.fromString,
      defaultValue: ProductIssueShipmentVia.empty)
  ProductIssueShipmentVia get shipmentVia => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_charge', defaultValue: 0)
  int? get shippingCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_qty', defaultValue: 0)
  int? get packageQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'kilogram_qty', defaultValue: 0)
  int? get kilogramQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
  DateTime? get endPackingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_id', defaultValue: '')
  String? get salesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_reference_others', defaultValue: '')
  String? get noReferenceOthers => throw _privateConstructorUsedError;
  @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
  DateTime? get soInputDate => throw _privateConstructorUsedError;

  /// Serializes this ProductIssue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductIssueCopyWith<ProductIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductIssueCopyWith<$Res> {
  factory $ProductIssueCopyWith(
          ProductIssue value, $Res Function(ProductIssue) then) =
      _$ProductIssueCopyWithImpl<$Res, ProductIssue>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'remark', defaultValue: '') String remark,
      @JsonKey(name: 'expedition', defaultValue: '') String expedition,
      @JsonKey(name: 'shipping_no', defaultValue: '') String shippingNo,
      @JsonKey(
          name: 'shipment_via',
          fromJson: ProductIssueShipmentVia.fromString,
          defaultValue: ProductIssueShipmentVia.empty)
      ProductIssueShipmentVia shipmentVia,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      DateTime? deliveryOrderDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      DateTime? deliveryOrderReceived,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime? deliveryDate,
      @JsonKey(name: 'shipping_charge', defaultValue: 0) int? shippingCharge,
      @JsonKey(name: 'package_qty', defaultValue: 0) int? packageQty,
      @JsonKey(name: 'kilogram_qty', defaultValue: 0) int? kilogramQty,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      DateTime? endPackingDate,
      @JsonKey(name: 'sales_order_id', defaultValue: '') String? salesOrderId,
      @JsonKey(name: 'no_reference_others', defaultValue: '')
      String? noReferenceOthers,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      DateTime? soInputDate});
}

/// @nodoc
class _$ProductIssueCopyWithImpl<$Res, $Val extends ProductIssue>
    implements $ProductIssueCopyWith<$Res> {
  _$ProductIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? invoiceDate = null,
    Object? remark = null,
    Object? expedition = null,
    Object? shippingNo = null,
    Object? shipmentVia = null,
    Object? deliveryOrderDate = freezed,
    Object? deliveryOrderReceived = freezed,
    Object? deliveryDate = freezed,
    Object? shippingCharge = freezed,
    Object? packageQty = freezed,
    Object? kilogramQty = freezed,
    Object? endPackingDate = freezed,
    Object? salesOrderId = freezed,
    Object? noReferenceOthers = freezed,
    Object? soInputDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      expedition: null == expedition
          ? _value.expedition
          : expedition // ignore: cast_nullable_to_non_nullable
              as String,
      shippingNo: null == shippingNo
          ? _value.shippingNo
          : shippingNo // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentVia: null == shipmentVia
          ? _value.shipmentVia
          : shipmentVia // ignore: cast_nullable_to_non_nullable
              as ProductIssueShipmentVia,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderReceived: freezed == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingCharge: freezed == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      packageQty: freezed == packageQty
          ? _value.packageQty
          : packageQty // ignore: cast_nullable_to_non_nullable
              as int?,
      kilogramQty: freezed == kilogramQty
          ? _value.kilogramQty
          : kilogramQty // ignore: cast_nullable_to_non_nullable
              as int?,
      endPackingDate: freezed == endPackingDate
          ? _value.endPackingDate
          : endPackingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      noReferenceOthers: freezed == noReferenceOthers
          ? _value.noReferenceOthers
          : noReferenceOthers // ignore: cast_nullable_to_non_nullable
              as String?,
      soInputDate: freezed == soInputDate
          ? _value.soInputDate
          : soInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductIssueImplCopyWith<$Res>
    implements $ProductIssueCopyWith<$Res> {
  factory _$$ProductIssueImplCopyWith(
          _$ProductIssueImpl value, $Res Function(_$ProductIssueImpl) then) =
      __$$ProductIssueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'remark', defaultValue: '') String remark,
      @JsonKey(name: 'expedition', defaultValue: '') String expedition,
      @JsonKey(name: 'shipping_no', defaultValue: '') String shippingNo,
      @JsonKey(
          name: 'shipment_via',
          fromJson: ProductIssueShipmentVia.fromString,
          defaultValue: ProductIssueShipmentVia.empty)
      ProductIssueShipmentVia shipmentVia,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      DateTime? deliveryOrderDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      DateTime? deliveryOrderReceived,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime? deliveryDate,
      @JsonKey(name: 'shipping_charge', defaultValue: 0) int? shippingCharge,
      @JsonKey(name: 'package_qty', defaultValue: 0) int? packageQty,
      @JsonKey(name: 'kilogram_qty', defaultValue: 0) int? kilogramQty,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      DateTime? endPackingDate,
      @JsonKey(name: 'sales_order_id', defaultValue: '') String? salesOrderId,
      @JsonKey(name: 'no_reference_others', defaultValue: '')
      String? noReferenceOthers,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      DateTime? soInputDate});
}

/// @nodoc
class __$$ProductIssueImplCopyWithImpl<$Res>
    extends _$ProductIssueCopyWithImpl<$Res, _$ProductIssueImpl>
    implements _$$ProductIssueImplCopyWith<$Res> {
  __$$ProductIssueImplCopyWithImpl(
      _$ProductIssueImpl _value, $Res Function(_$ProductIssueImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? invoiceDate = null,
    Object? remark = null,
    Object? expedition = null,
    Object? shippingNo = null,
    Object? shipmentVia = null,
    Object? deliveryOrderDate = freezed,
    Object? deliveryOrderReceived = freezed,
    Object? deliveryDate = freezed,
    Object? shippingCharge = freezed,
    Object? packageQty = freezed,
    Object? kilogramQty = freezed,
    Object? endPackingDate = freezed,
    Object? salesOrderId = freezed,
    Object? noReferenceOthers = freezed,
    Object? soInputDate = freezed,
  }) {
    return _then(_$ProductIssueImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      expedition: null == expedition
          ? _value.expedition
          : expedition // ignore: cast_nullable_to_non_nullable
              as String,
      shippingNo: null == shippingNo
          ? _value.shippingNo
          : shippingNo // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentVia: null == shipmentVia
          ? _value.shipmentVia
          : shipmentVia // ignore: cast_nullable_to_non_nullable
              as ProductIssueShipmentVia,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderReceived: freezed == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingCharge: freezed == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as int?,
      packageQty: freezed == packageQty
          ? _value.packageQty
          : packageQty // ignore: cast_nullable_to_non_nullable
              as int?,
      kilogramQty: freezed == kilogramQty
          ? _value.kilogramQty
          : kilogramQty // ignore: cast_nullable_to_non_nullable
              as int?,
      endPackingDate: freezed == endPackingDate
          ? _value.endPackingDate
          : endPackingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      noReferenceOthers: freezed == noReferenceOthers
          ? _value.noReferenceOthers
          : noReferenceOthers // ignore: cast_nullable_to_non_nullable
              as String?,
      soInputDate: freezed == soInputDate
          ? _value.soInputDate
          : soInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductIssueImpl extends _ProductIssue {
  _$ProductIssueImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'invoice_id') required this.invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required this.invoiceDate,
      @JsonKey(name: 'remark', defaultValue: '') required this.remark,
      @JsonKey(name: 'expedition', defaultValue: '') required this.expedition,
      @JsonKey(name: 'shipping_no', defaultValue: '') required this.shippingNo,
      @JsonKey(
          name: 'shipment_via',
          fromJson: ProductIssueShipmentVia.fromString,
          defaultValue: ProductIssueShipmentVia.empty)
      required this.shipmentVia,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      this.deliveryOrderDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      this.deliveryOrderReceived,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      this.deliveryDate,
      @JsonKey(name: 'shipping_charge', defaultValue: 0) this.shippingCharge,
      @JsonKey(name: 'package_qty', defaultValue: 0) this.packageQty,
      @JsonKey(name: 'kilogram_qty', defaultValue: 0) this.kilogramQty,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      this.endPackingDate,
      @JsonKey(name: 'sales_order_id', defaultValue: '') this.salesOrderId,
      @JsonKey(name: 'no_reference_others', defaultValue: '')
      this.noReferenceOthers,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      this.soInputDate})
      : super._();

  factory _$ProductIssueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductIssueImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'invoice_id')
  final String invoiceId;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  final DateTime invoiceDate;
  @override
  @JsonKey(name: 'remark', defaultValue: '')
  final String remark;
  @override
  @JsonKey(name: 'expedition', defaultValue: '')
  final String expedition;
  @override
  @JsonKey(name: 'shipping_no', defaultValue: '')
  final String shippingNo;
  @override
  @JsonKey(
      name: 'shipment_via',
      fromJson: ProductIssueShipmentVia.fromString,
      defaultValue: ProductIssueShipmentVia.empty)
  final ProductIssueShipmentVia shipmentVia;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
  final DateTime? deliveryOrderDate;
  @override
  @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
  final DateTime? deliveryOrderReceived;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: 'shipping_charge', defaultValue: 0)
  final int? shippingCharge;
  @override
  @JsonKey(name: 'package_qty', defaultValue: 0)
  final int? packageQty;
  @override
  @JsonKey(name: 'kilogram_qty', defaultValue: 0)
  final int? kilogramQty;
  @override
  @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
  final DateTime? endPackingDate;
  @override
  @JsonKey(name: 'sales_order_id', defaultValue: '')
  final String? salesOrderId;
  @override
  @JsonKey(name: 'no_reference_others', defaultValue: '')
  final String? noReferenceOthers;
  @override
  @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
  final DateTime? soInputDate;

  @override
  String toString() {
    return 'ProductIssue(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deliveryOrderId: $deliveryOrderId, invoiceId: $invoiceId, invoiceDate: $invoiceDate, remark: $remark, expedition: $expedition, shippingNo: $shippingNo, shipmentVia: $shipmentVia, deliveryOrderDate: $deliveryOrderDate, deliveryOrderReceived: $deliveryOrderReceived, deliveryDate: $deliveryDate, shippingCharge: $shippingCharge, packageQty: $packageQty, kilogramQty: $kilogramQty, endPackingDate: $endPackingDate, salesOrderId: $salesOrderId, noReferenceOthers: $noReferenceOthers, soInputDate: $soInputDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductIssueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.expedition, expedition) ||
                other.expedition == expedition) &&
            (identical(other.shippingNo, shippingNo) ||
                other.shippingNo == shippingNo) &&
            (identical(other.shipmentVia, shipmentVia) ||
                other.shipmentVia == shipmentVia) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.deliveryOrderReceived, deliveryOrderReceived) ||
                other.deliveryOrderReceived == deliveryOrderReceived) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.shippingCharge, shippingCharge) ||
                other.shippingCharge == shippingCharge) &&
            (identical(other.packageQty, packageQty) ||
                other.packageQty == packageQty) &&
            (identical(other.kilogramQty, kilogramQty) ||
                other.kilogramQty == kilogramQty) &&
            (identical(other.endPackingDate, endPackingDate) ||
                other.endPackingDate == endPackingDate) &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.noReferenceOthers, noReferenceOthers) ||
                other.noReferenceOthers == noReferenceOthers) &&
            (identical(other.soInputDate, soInputDate) ||
                other.soInputDate == soInputDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        deliveryOrderId,
        invoiceId,
        invoiceDate,
        remark,
        expedition,
        shippingNo,
        shipmentVia,
        deliveryOrderDate,
        deliveryOrderReceived,
        deliveryDate,
        shippingCharge,
        packageQty,
        kilogramQty,
        endPackingDate,
        salesOrderId,
        noReferenceOthers,
        soInputDate
      ]);

  /// Create a copy of ProductIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductIssueImplCopyWith<_$ProductIssueImpl> get copyWith =>
      __$$ProductIssueImplCopyWithImpl<_$ProductIssueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductIssueImplToJson(
      this,
    );
  }
}

abstract class _ProductIssue extends ProductIssue {
  factory _ProductIssue(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'invoice_id') required final String invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required final DateTime invoiceDate,
      @JsonKey(name: 'remark', defaultValue: '') required final String remark,
      @JsonKey(name: 'expedition', defaultValue: '')
      required final String expedition,
      @JsonKey(name: 'shipping_no', defaultValue: '')
      required final String shippingNo,
      @JsonKey(
          name: 'shipment_via',
          fromJson: ProductIssueShipmentVia.fromString,
          defaultValue: ProductIssueShipmentVia.empty)
      required final ProductIssueShipmentVia shipmentVia,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      final DateTime? deliveryOrderDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      final DateTime? deliveryOrderReceived,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      final DateTime? deliveryDate,
      @JsonKey(name: 'shipping_charge', defaultValue: 0)
      final int? shippingCharge,
      @JsonKey(name: 'package_qty', defaultValue: 0) final int? packageQty,
      @JsonKey(name: 'kilogram_qty', defaultValue: 0) final int? kilogramQty,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      final DateTime? endPackingDate,
      @JsonKey(name: 'sales_order_id', defaultValue: '')
      final String? salesOrderId,
      @JsonKey(name: 'no_reference_others', defaultValue: '')
      final String? noReferenceOthers,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      final DateTime? soInputDate}) = _$ProductIssueImpl;
  _ProductIssue._() : super._();

  factory _ProductIssue.fromJson(Map<String, dynamic> json) =
      _$ProductIssueImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'invoice_id')
  String get invoiceId;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate;
  @override
  @JsonKey(name: 'remark', defaultValue: '')
  String get remark;
  @override
  @JsonKey(name: 'expedition', defaultValue: '')
  String get expedition;
  @override
  @JsonKey(name: 'shipping_no', defaultValue: '')
  String get shippingNo;
  @override
  @JsonKey(
      name: 'shipment_via',
      fromJson: ProductIssueShipmentVia.fromString,
      defaultValue: ProductIssueShipmentVia.empty)
  ProductIssueShipmentVia get shipmentVia;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderDate;
  @override
  @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderReceived;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: 'shipping_charge', defaultValue: 0)
  int? get shippingCharge;
  @override
  @JsonKey(name: 'package_qty', defaultValue: 0)
  int? get packageQty;
  @override
  @JsonKey(name: 'kilogram_qty', defaultValue: 0)
  int? get kilogramQty;
  @override
  @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
  DateTime? get endPackingDate;
  @override
  @JsonKey(name: 'sales_order_id', defaultValue: '')
  String? get salesOrderId;
  @override
  @JsonKey(name: 'no_reference_others', defaultValue: '')
  String? get noReferenceOthers;
  @override
  @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
  DateTime? get soInputDate;

  /// Create a copy of ProductIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductIssueImplCopyWith<_$ProductIssueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
