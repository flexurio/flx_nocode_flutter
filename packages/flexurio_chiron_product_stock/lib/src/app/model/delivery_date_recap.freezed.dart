// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_date_recap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryDateRecap _$DeliveryDateRecapFromJson(Map<String, dynamic> json) {
  return _DeliveryDateRecap.fromJson(json);
}

/// @nodoc
mixin _$DeliveryDateRecap {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
  DateTime? get poInputDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
  DateTime? get soInputDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
  DateTime? get endPackingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
  DateTime? get shipmentInputDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String? get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'expedition')
  String? get expedition => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_city')
  String? get customerCity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryDateRecapCopyWith<DeliveryDateRecap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryDateRecapCopyWith<$Res> {
  factory $DeliveryDateRecapCopyWith(
          DeliveryDateRecap value, $Res Function(DeliveryDateRecap) then) =
      _$DeliveryDateRecapCopyWithImpl<$Res, DeliveryDateRecap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime deliveryDate,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'qty') int qty,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      DateTime? deliveryOrderReceived,
      @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
      DateTime? poInputDate,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      DateTime? soInputDate,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      DateTime? endPackingDate,
      @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
      DateTime? shipmentInputDate,
      @JsonKey(name: 'remark') String? remark,
      @JsonKey(name: 'expedition') String? expedition,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'customer_city') String? customerCity});
}

/// @nodoc
class _$DeliveryDateRecapCopyWithImpl<$Res, $Val extends DeliveryDateRecap>
    implements $DeliveryDateRecapCopyWith<$Res> {
  _$DeliveryDateRecapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? invoiceDate = null,
    Object? deliveryOrderDate = null,
    Object? deliveryDate = null,
    Object? batchNoId = null,
    Object? qty = null,
    Object? productName = null,
    Object? expirationDate = null,
    Object? deliveryOrderReceived = freezed,
    Object? poInputDate = freezed,
    Object? soInputDate = freezed,
    Object? endPackingDate = freezed,
    Object? shipmentInputDate = freezed,
    Object? remark = freezed,
    Object? expedition = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? customerCity = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderReceived: freezed == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      poInputDate: freezed == poInputDate
          ? _value.poInputDate
          : poInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soInputDate: freezed == soInputDate
          ? _value.soInputDate
          : soInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPackingDate: freezed == endPackingDate
          ? _value.endPackingDate
          : endPackingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shipmentInputDate: freezed == shipmentInputDate
          ? _value.shipmentInputDate
          : shipmentInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      expedition: freezed == expedition
          ? _value.expedition
          : expedition // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCity: freezed == customerCity
          ? _value.customerCity
          : customerCity // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryDateRecapImplCopyWith<$Res>
    implements $DeliveryDateRecapCopyWith<$Res> {
  factory _$$DeliveryDateRecapImplCopyWith(_$DeliveryDateRecapImpl value,
          $Res Function(_$DeliveryDateRecapImpl) then) =
      __$$DeliveryDateRecapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime deliveryDate,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'qty') int qty,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      DateTime? deliveryOrderReceived,
      @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
      DateTime? poInputDate,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      DateTime? soInputDate,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      DateTime? endPackingDate,
      @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
      DateTime? shipmentInputDate,
      @JsonKey(name: 'remark') String? remark,
      @JsonKey(name: 'expedition') String? expedition,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'customer_name') String? customerName,
      @JsonKey(name: 'customer_city') String? customerCity});
}

/// @nodoc
class __$$DeliveryDateRecapImplCopyWithImpl<$Res>
    extends _$DeliveryDateRecapCopyWithImpl<$Res, _$DeliveryDateRecapImpl>
    implements _$$DeliveryDateRecapImplCopyWith<$Res> {
  __$$DeliveryDateRecapImplCopyWithImpl(_$DeliveryDateRecapImpl _value,
      $Res Function(_$DeliveryDateRecapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? invoiceDate = null,
    Object? deliveryOrderDate = null,
    Object? deliveryDate = null,
    Object? batchNoId = null,
    Object? qty = null,
    Object? productName = null,
    Object? expirationDate = null,
    Object? deliveryOrderReceived = freezed,
    Object? poInputDate = freezed,
    Object? soInputDate = freezed,
    Object? endPackingDate = freezed,
    Object? shipmentInputDate = freezed,
    Object? remark = freezed,
    Object? expedition = freezed,
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? customerCity = freezed,
  }) {
    return _then(_$DeliveryDateRecapImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderReceived: freezed == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      poInputDate: freezed == poInputDate
          ? _value.poInputDate
          : poInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      soInputDate: freezed == soInputDate
          ? _value.soInputDate
          : soInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endPackingDate: freezed == endPackingDate
          ? _value.endPackingDate
          : endPackingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shipmentInputDate: freezed == shipmentInputDate
          ? _value.shipmentInputDate
          : shipmentInputDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      expedition: freezed == expedition
          ? _value.expedition
          : expedition // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCity: freezed == customerCity
          ? _value.customerCity
          : customerCity // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryDateRecapImpl extends _DeliveryDateRecap {
  _$DeliveryDateRecapImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'invoice_id') required this.invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required this.invoiceDate,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      required this.deliveryDate,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'qty') required this.qty,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required this.expirationDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      this.deliveryOrderReceived,
      @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
      this.poInputDate,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      this.soInputDate,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      this.endPackingDate,
      @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
      this.shipmentInputDate,
      @JsonKey(name: 'remark') this.remark,
      @JsonKey(name: 'expedition') this.expedition,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'customer_name') this.customerName,
      @JsonKey(name: 'customer_city') this.customerCity})
      : super._();

  factory _$DeliveryDateRecapImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryDateRecapImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
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
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  final DateTime deliveryDate;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'qty')
  final int qty;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  final DateTime expirationDate;
  @override
  @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
  final DateTime? deliveryOrderReceived;
  @override
  @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
  final DateTime? poInputDate;
  @override
  @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
  final DateTime? soInputDate;
  @override
  @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
  final DateTime? endPackingDate;
  @override
  @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
  final DateTime? shipmentInputDate;
  @override
  @JsonKey(name: 'remark')
  final String? remark;
  @override
  @JsonKey(name: 'expedition')
  final String? expedition;
  @override
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'customer_city')
  final String? customerCity;

  @override
  String toString() {
    return 'DeliveryDateRecap(createdAt: $createdAt, deliveryOrderId: $deliveryOrderId, invoiceId: $invoiceId, invoiceDate: $invoiceDate, deliveryOrderDate: $deliveryOrderDate, deliveryDate: $deliveryDate, batchNoId: $batchNoId, qty: $qty, productName: $productName, expirationDate: $expirationDate, deliveryOrderReceived: $deliveryOrderReceived, poInputDate: $poInputDate, soInputDate: $soInputDate, endPackingDate: $endPackingDate, shipmentInputDate: $shipmentInputDate, remark: $remark, expedition: $expedition, customerId: $customerId, customerName: $customerName, customerCity: $customerCity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryDateRecapImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.deliveryOrderReceived, deliveryOrderReceived) ||
                other.deliveryOrderReceived == deliveryOrderReceived) &&
            (identical(other.poInputDate, poInputDate) ||
                other.poInputDate == poInputDate) &&
            (identical(other.soInputDate, soInputDate) ||
                other.soInputDate == soInputDate) &&
            (identical(other.endPackingDate, endPackingDate) ||
                other.endPackingDate == endPackingDate) &&
            (identical(other.shipmentInputDate, shipmentInputDate) ||
                other.shipmentInputDate == shipmentInputDate) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.expedition, expedition) ||
                other.expedition == expedition) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerCity, customerCity) ||
                other.customerCity == customerCity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        deliveryOrderId,
        invoiceId,
        invoiceDate,
        deliveryOrderDate,
        deliveryDate,
        batchNoId,
        qty,
        productName,
        expirationDate,
        deliveryOrderReceived,
        poInputDate,
        soInputDate,
        endPackingDate,
        shipmentInputDate,
        remark,
        expedition,
        customerId,
        customerName,
        customerCity
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryDateRecapImplCopyWith<_$DeliveryDateRecapImpl> get copyWith =>
      __$$DeliveryDateRecapImplCopyWithImpl<_$DeliveryDateRecapImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryDateRecapImplToJson(
      this,
    );
  }
}

abstract class _DeliveryDateRecap extends DeliveryDateRecap {
  factory _DeliveryDateRecap(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'invoice_id') required final String invoiceId,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required final DateTime invoiceDate,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryOrderDate,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryDate,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'qty') required final int qty,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required final DateTime expirationDate,
      @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
      final DateTime? deliveryOrderReceived,
      @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
      final DateTime? poInputDate,
      @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
      final DateTime? soInputDate,
      @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
      final DateTime? endPackingDate,
      @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
      final DateTime? shipmentInputDate,
      @JsonKey(name: 'remark') final String? remark,
      @JsonKey(name: 'expedition') final String? expedition,
      @JsonKey(name: 'customer_id') final String? customerId,
      @JsonKey(name: 'customer_name') final String? customerName,
      @JsonKey(name: 'customer_city')
      final String? customerCity}) = _$DeliveryDateRecapImpl;
  _DeliveryDateRecap._() : super._();

  factory _DeliveryDateRecap.fromJson(Map<String, dynamic> json) =
      _$DeliveryDateRecapImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
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
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime get deliveryDate;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'qty')
  int get qty;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate;
  @override
  @JsonKey(name: 'delivery_order_received', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderReceived;
  @override
  @JsonKey(name: 'po_input_date', fromJson: dateTimeNullable)
  DateTime? get poInputDate;
  @override
  @JsonKey(name: 'so_input_date', fromJson: dateTimeNullable)
  DateTime? get soInputDate;
  @override
  @JsonKey(name: 'end_packing_date', fromJson: dateTimeNullable)
  DateTime? get endPackingDate;
  @override
  @JsonKey(name: 'shipment_input_date', fromJson: dateTimeNullable)
  DateTime? get shipmentInputDate;
  @override
  @JsonKey(name: 'remark')
  String? get remark;
  @override
  @JsonKey(name: 'expedition')
  String? get expedition;
  @override
  @JsonKey(name: 'customer_id')
  String? get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'customer_city')
  String? get customerCity;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryDateRecapImplCopyWith<_$DeliveryDateRecapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
