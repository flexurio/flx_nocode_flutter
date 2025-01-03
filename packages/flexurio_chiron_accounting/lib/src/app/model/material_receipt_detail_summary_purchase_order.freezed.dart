// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receipt_detail_summary_purchase_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReceiptDetailSummaryPurchaseOrder
    _$MaterialReceiptDetailSummaryPurchaseOrderFromJson(
        Map<String, dynamic> json) {
  return _MaterialReceiptDetailSummaryPurchaseOrder.fromJson(json);
}

/// @nodoc
mixin _$MaterialReceiptDetailSummaryPurchaseOrder {
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
  DateTime get transactionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_currency_id')
  String get purchaseOrderCurrencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_rate')
  int get purchaseOrderRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_po')
  int get quantityPo => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_received')
  int get quantityReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_received_unit_id')
  String get materialReceivedUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_received_price')
  int? get materialReceivedPrice => throw _privateConstructorUsedError;

  /// Serializes this MaterialReceiptDetailSummaryPurchaseOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialReceiptDetailSummaryPurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialReceiptDetailSummaryPurchaseOrderCopyWith<
          MaterialReceiptDetailSummaryPurchaseOrder>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiptDetailSummaryPurchaseOrderCopyWith<$Res> {
  factory $MaterialReceiptDetailSummaryPurchaseOrderCopyWith(
          MaterialReceiptDetailSummaryPurchaseOrder value,
          $Res Function(MaterialReceiptDetailSummaryPurchaseOrder) then) =
      _$MaterialReceiptDetailSummaryPurchaseOrderCopyWithImpl<$Res,
          MaterialReceiptDetailSummaryPurchaseOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
      DateTime transactionName,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'purchase_order_currency_id')
      String purchaseOrderCurrencyId,
      @JsonKey(name: 'purchase_order_rate') int purchaseOrderRate,
      @JsonKey(name: 'quantity_po') int quantityPo,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'quantity_received') int quantityReceived,
      @JsonKey(name: 'material_received_unit_id') String materialReceivedUnitId,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'material_received_price') int? materialReceivedPrice});
}

/// @nodoc
class _$MaterialReceiptDetailSummaryPurchaseOrderCopyWithImpl<$Res,
        $Val extends MaterialReceiptDetailSummaryPurchaseOrder>
    implements $MaterialReceiptDetailSummaryPurchaseOrderCopyWith<$Res> {
  _$MaterialReceiptDetailSummaryPurchaseOrderCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialReceiptDetailSummaryPurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionName = null,
    Object? supplierName = null,
    Object? materialName = null,
    Object? purchaseOrderId = null,
    Object? purchaseOrderCurrencyId = null,
    Object? purchaseOrderRate = null,
    Object? quantityPo = null,
    Object? materialUnitId = null,
    Object? price = null,
    Object? quantityReceived = null,
    Object? materialReceivedUnitId = null,
    Object? total = null,
    Object? materialReceivedPrice = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionName: null == transactionName
          ? _value.transactionName
          : transactionName // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderCurrencyId: null == purchaseOrderCurrencyId
          ? _value.purchaseOrderCurrencyId
          : purchaseOrderCurrencyId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderRate: null == purchaseOrderRate
          ? _value.purchaseOrderRate
          : purchaseOrderRate // ignore: cast_nullable_to_non_nullable
              as int,
      quantityPo: null == quantityPo
          ? _value.quantityPo
          : quantityPo // ignore: cast_nullable_to_non_nullable
              as int,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantityReceived: null == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceivedUnitId: null == materialReceivedUnitId
          ? _value.materialReceivedUnitId
          : materialReceivedUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceivedPrice: freezed == materialReceivedPrice
          ? _value.materialReceivedPrice
          : materialReceivedPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWith<$Res>
    implements $MaterialReceiptDetailSummaryPurchaseOrderCopyWith<$Res> {
  factory _$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWith(
          _$MaterialReceiptDetailSummaryPurchaseOrderImpl value,
          $Res Function(_$MaterialReceiptDetailSummaryPurchaseOrderImpl) then) =
      __$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
      DateTime transactionName,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'purchase_order_currency_id')
      String purchaseOrderCurrencyId,
      @JsonKey(name: 'purchase_order_rate') int purchaseOrderRate,
      @JsonKey(name: 'quantity_po') int quantityPo,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'quantity_received') int quantityReceived,
      @JsonKey(name: 'material_received_unit_id') String materialReceivedUnitId,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'material_received_price') int? materialReceivedPrice});
}

/// @nodoc
class __$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWithImpl<$Res>
    extends _$MaterialReceiptDetailSummaryPurchaseOrderCopyWithImpl<$Res,
        _$MaterialReceiptDetailSummaryPurchaseOrderImpl>
    implements _$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWith<$Res> {
  __$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWithImpl(
      _$MaterialReceiptDetailSummaryPurchaseOrderImpl _value,
      $Res Function(_$MaterialReceiptDetailSummaryPurchaseOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialReceiptDetailSummaryPurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionName = null,
    Object? supplierName = null,
    Object? materialName = null,
    Object? purchaseOrderId = null,
    Object? purchaseOrderCurrencyId = null,
    Object? purchaseOrderRate = null,
    Object? quantityPo = null,
    Object? materialUnitId = null,
    Object? price = null,
    Object? quantityReceived = null,
    Object? materialReceivedUnitId = null,
    Object? total = null,
    Object? materialReceivedPrice = freezed,
  }) {
    return _then(_$MaterialReceiptDetailSummaryPurchaseOrderImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionName: null == transactionName
          ? _value.transactionName
          : transactionName // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderCurrencyId: null == purchaseOrderCurrencyId
          ? _value.purchaseOrderCurrencyId
          : purchaseOrderCurrencyId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderRate: null == purchaseOrderRate
          ? _value.purchaseOrderRate
          : purchaseOrderRate // ignore: cast_nullable_to_non_nullable
              as int,
      quantityPo: null == quantityPo
          ? _value.quantityPo
          : quantityPo // ignore: cast_nullable_to_non_nullable
              as int,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantityReceived: null == quantityReceived
          ? _value.quantityReceived
          : quantityReceived // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceivedUnitId: null == materialReceivedUnitId
          ? _value.materialReceivedUnitId
          : materialReceivedUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceivedPrice: freezed == materialReceivedPrice
          ? _value.materialReceivedPrice
          : materialReceivedPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReceiptDetailSummaryPurchaseOrderImpl
    extends _MaterialReceiptDetailSummaryPurchaseOrder {
  const _$MaterialReceiptDetailSummaryPurchaseOrderImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
      required this.transactionName,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      @JsonKey(name: 'purchase_order_currency_id')
      required this.purchaseOrderCurrencyId,
      @JsonKey(name: 'purchase_order_rate') required this.purchaseOrderRate,
      @JsonKey(name: 'quantity_po') required this.quantityPo,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'quantity_received') required this.quantityReceived,
      @JsonKey(name: 'material_received_unit_id')
      required this.materialReceivedUnitId,
      @JsonKey(name: 'total') required this.total,
      @JsonKey(name: 'material_received_price') this.materialReceivedPrice})
      : super._();

  factory _$MaterialReceiptDetailSummaryPurchaseOrderImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MaterialReceiptDetailSummaryPurchaseOrderImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
  final DateTime transactionName;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'purchase_order_currency_id')
  final String purchaseOrderCurrencyId;
  @override
  @JsonKey(name: 'purchase_order_rate')
  final int purchaseOrderRate;
  @override
  @JsonKey(name: 'quantity_po')
  final int quantityPo;
  @override
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'quantity_received')
  final int quantityReceived;
  @override
  @JsonKey(name: 'material_received_unit_id')
  final String materialReceivedUnitId;
  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'material_received_price')
  final int? materialReceivedPrice;

  @override
  String toString() {
    return 'MaterialReceiptDetailSummaryPurchaseOrder(transactionId: $transactionId, transactionName: $transactionName, supplierName: $supplierName, materialName: $materialName, purchaseOrderId: $purchaseOrderId, purchaseOrderCurrencyId: $purchaseOrderCurrencyId, purchaseOrderRate: $purchaseOrderRate, quantityPo: $quantityPo, materialUnitId: $materialUnitId, price: $price, quantityReceived: $quantityReceived, materialReceivedUnitId: $materialReceivedUnitId, total: $total, materialReceivedPrice: $materialReceivedPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReceiptDetailSummaryPurchaseOrderImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionName, transactionName) ||
                other.transactionName == transactionName) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(
                    other.purchaseOrderCurrencyId, purchaseOrderCurrencyId) ||
                other.purchaseOrderCurrencyId == purchaseOrderCurrencyId) &&
            (identical(other.purchaseOrderRate, purchaseOrderRate) ||
                other.purchaseOrderRate == purchaseOrderRate) &&
            (identical(other.quantityPo, quantityPo) ||
                other.quantityPo == quantityPo) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantityReceived, quantityReceived) ||
                other.quantityReceived == quantityReceived) &&
            (identical(other.materialReceivedUnitId, materialReceivedUnitId) ||
                other.materialReceivedUnitId == materialReceivedUnitId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.materialReceivedPrice, materialReceivedPrice) ||
                other.materialReceivedPrice == materialReceivedPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      transactionName,
      supplierName,
      materialName,
      purchaseOrderId,
      purchaseOrderCurrencyId,
      purchaseOrderRate,
      quantityPo,
      materialUnitId,
      price,
      quantityReceived,
      materialReceivedUnitId,
      total,
      materialReceivedPrice);

  /// Create a copy of MaterialReceiptDetailSummaryPurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWith<
          _$MaterialReceiptDetailSummaryPurchaseOrderImpl>
      get copyWith =>
          __$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWithImpl<
                  _$MaterialReceiptDetailSummaryPurchaseOrderImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReceiptDetailSummaryPurchaseOrderImplToJson(
      this,
    );
  }
}

abstract class _MaterialReceiptDetailSummaryPurchaseOrder
    extends MaterialReceiptDetailSummaryPurchaseOrder {
  const factory _MaterialReceiptDetailSummaryPurchaseOrder(
      {@JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
      required final DateTime transactionName,
      @JsonKey(name: 'supplier_name') required final String supplierName,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      @JsonKey(name: 'purchase_order_currency_id')
      required final String purchaseOrderCurrencyId,
      @JsonKey(name: 'purchase_order_rate')
      required final int purchaseOrderRate,
      @JsonKey(name: 'quantity_po') required final int quantityPo,
      @JsonKey(name: 'material_unit_id') required final String materialUnitId,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'quantity_received') required final int quantityReceived,
      @JsonKey(name: 'material_received_unit_id')
      required final String materialReceivedUnitId,
      @JsonKey(name: 'total') required final int total,
      @JsonKey(name: 'material_received_price')
      final int?
          materialReceivedPrice}) = _$MaterialReceiptDetailSummaryPurchaseOrderImpl;
  const _MaterialReceiptDetailSummaryPurchaseOrder._() : super._();

  factory _MaterialReceiptDetailSummaryPurchaseOrder.fromJson(
          Map<String, dynamic> json) =
      _$MaterialReceiptDetailSummaryPurchaseOrderImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'transaction_name', fromJson: isoDateToDateTime)
  DateTime get transactionName;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'purchase_order_currency_id')
  String get purchaseOrderCurrencyId;
  @override
  @JsonKey(name: 'purchase_order_rate')
  int get purchaseOrderRate;
  @override
  @JsonKey(name: 'quantity_po')
  int get quantityPo;
  @override
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'quantity_received')
  int get quantityReceived;
  @override
  @JsonKey(name: 'material_received_unit_id')
  String get materialReceivedUnitId;
  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'material_received_price')
  int? get materialReceivedPrice;

  /// Create a copy of MaterialReceiptDetailSummaryPurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialReceiptDetailSummaryPurchaseOrderImplCopyWith<
          _$MaterialReceiptDetailSummaryPurchaseOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}
