// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrder _$SalesOrderFromJson(Map<String, dynamic> json) {
  return _SalesOrder.fromJson(json);
}

/// @nodoc
mixin _$SalesOrder {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issue_id')
  String get productIssueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
  SalesOrderStatus get status => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_discount')
  double get subtotalAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_percent')
  double get ppnPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'exchanged_value')
  double get exchangedValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph_22_percent')
  double get pph22Percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph_22_value')
  double get pph22Value => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_base_ppn', defaultValue: 0)
  double get taxBasePpn => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_fee')
  double get bankFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_type')
  String get additionalDiscountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_percent')
  double get additionalDiscountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value')
  double get additionalDiscountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'special_discount_percent')
  double get specialDiscountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_toll_in', defaultValue: false)
  bool get isTollIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
  DateTime? get isConfirmAt => throw _privateConstructorUsedError;
  bool get bonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision_no', defaultValue: 0)
  int get revisionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
  ProductRequest? get productRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_open_remark')
  String? get deliveryOrderOpenRemark => throw _privateConstructorUsedError;

  /// Serializes this SalesOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderCopyWith<SalesOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderCopyWith<$Res> {
  factory $SalesOrderCopyWith(
          SalesOrder value, $Res Function(SalesOrder) then) =
      _$SalesOrderCopyWithImpl<$Res, SalesOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      String id,
      @JsonKey(name: 'product_issue_id') String productIssueId,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(
          name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
      SalesOrderStatus status,
      double subtotal,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'subtotal_after_discount') double subtotalAfterDiscount,
      @JsonKey(name: 'ppn_percent') double ppnPercent,
      @JsonKey(name: 'ppn_value') double ppnValue,
      double total,
      @JsonKey(name: 'exchanged_value') double exchangedValue,
      @JsonKey(name: 'pph_22_percent') double pph22Percent,
      @JsonKey(name: 'pph_22_value') double pph22Value,
      @JsonKey(name: 'tax_base_ppn', defaultValue: 0) double taxBasePpn,
      String description,
      @JsonKey(name: 'bank_fee') double bankFee,
      @JsonKey(name: 'additional_discount_type') String additionalDiscountType,
      @JsonKey(name: 'additional_discount_percent')
      double additionalDiscountPercent,
      @JsonKey(name: 'additional_discount_value')
      double additionalDiscountValue,
      @JsonKey(name: 'special_discount_percent') double specialDiscountPercent,
      @JsonKey(name: 'is_toll_in', defaultValue: false) bool isTollIn,
      @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
      DateTime? isConfirmAt,
      bool bonus,
      @JsonKey(name: 'revision_no', defaultValue: 0) int revisionNo,
      @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
      ProductRequest? productRequest,
      @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryDate,
      @JsonKey(name: 'delivery_order_open_remark')
      String? deliveryOrderOpenRemark});

  $ProductRequestCopyWith<$Res>? get productRequest;
}

/// @nodoc
class _$SalesOrderCopyWithImpl<$Res, $Val extends SalesOrder>
    implements $SalesOrderCopyWith<$Res> {
  _$SalesOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? productIssueId = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? status = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? subtotalAfterDiscount = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? exchangedValue = null,
    Object? pph22Percent = null,
    Object? pph22Value = null,
    Object? taxBasePpn = null,
    Object? description = null,
    Object? bankFee = null,
    Object? additionalDiscountType = null,
    Object? additionalDiscountPercent = null,
    Object? additionalDiscountValue = null,
    Object? specialDiscountPercent = null,
    Object? isTollIn = null,
    Object? isConfirmAt = freezed,
    Object? bonus = null,
    Object? revisionNo = null,
    Object? productRequest = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryOrderOpenRemark = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productIssueId: null == productIssueId
          ? _value.productIssueId
          : productIssueId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalesOrderStatus,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalAfterDiscount: null == subtotalAfterDiscount
          ? _value.subtotalAfterDiscount
          : subtotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      exchangedValue: null == exchangedValue
          ? _value.exchangedValue
          : exchangedValue // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Percent: null == pph22Percent
          ? _value.pph22Percent
          : pph22Percent // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as double,
      taxBasePpn: null == taxBasePpn
          ? _value.taxBasePpn
          : taxBasePpn // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bankFee: null == bankFee
          ? _value.bankFee
          : bankFee // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountType: null == additionalDiscountType
          ? _value.additionalDiscountType
          : additionalDiscountType // ignore: cast_nullable_to_non_nullable
              as String,
      additionalDiscountPercent: null == additionalDiscountPercent
          ? _value.additionalDiscountPercent
          : additionalDiscountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValue: null == additionalDiscountValue
          ? _value.additionalDiscountValue
          : additionalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      specialDiscountPercent: null == specialDiscountPercent
          ? _value.specialDiscountPercent
          : specialDiscountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      isTollIn: null == isTollIn
          ? _value.isTollIn
          : isTollIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmAt: freezed == isConfirmAt
          ? _value.isConfirmAt
          : isConfirmAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bonus: null == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as bool,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as int,
      productRequest: freezed == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequest?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderOpenRemark: freezed == deliveryOrderOpenRemark
          ? _value.deliveryOrderOpenRemark
          : deliveryOrderOpenRemark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestCopyWith<$Res>? get productRequest {
    if (_value.productRequest == null) {
      return null;
    }

    return $ProductRequestCopyWith<$Res>(_value.productRequest!, (value) {
      return _then(_value.copyWith(productRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesOrderImplCopyWith<$Res>
    implements $SalesOrderCopyWith<$Res> {
  factory _$$SalesOrderImplCopyWith(
          _$SalesOrderImpl value, $Res Function(_$SalesOrderImpl) then) =
      __$$SalesOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      String id,
      @JsonKey(name: 'product_issue_id') String productIssueId,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(
          name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
      SalesOrderStatus status,
      double subtotal,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'subtotal_after_discount') double subtotalAfterDiscount,
      @JsonKey(name: 'ppn_percent') double ppnPercent,
      @JsonKey(name: 'ppn_value') double ppnValue,
      double total,
      @JsonKey(name: 'exchanged_value') double exchangedValue,
      @JsonKey(name: 'pph_22_percent') double pph22Percent,
      @JsonKey(name: 'pph_22_value') double pph22Value,
      @JsonKey(name: 'tax_base_ppn', defaultValue: 0) double taxBasePpn,
      String description,
      @JsonKey(name: 'bank_fee') double bankFee,
      @JsonKey(name: 'additional_discount_type') String additionalDiscountType,
      @JsonKey(name: 'additional_discount_percent')
      double additionalDiscountPercent,
      @JsonKey(name: 'additional_discount_value')
      double additionalDiscountValue,
      @JsonKey(name: 'special_discount_percent') double specialDiscountPercent,
      @JsonKey(name: 'is_toll_in', defaultValue: false) bool isTollIn,
      @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
      DateTime? isConfirmAt,
      bool bonus,
      @JsonKey(name: 'revision_no', defaultValue: 0) int revisionNo,
      @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
      ProductRequest? productRequest,
      @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryDate,
      @JsonKey(name: 'delivery_order_open_remark')
      String? deliveryOrderOpenRemark});

  @override
  $ProductRequestCopyWith<$Res>? get productRequest;
}

/// @nodoc
class __$$SalesOrderImplCopyWithImpl<$Res>
    extends _$SalesOrderCopyWithImpl<$Res, _$SalesOrderImpl>
    implements _$$SalesOrderImplCopyWith<$Res> {
  __$$SalesOrderImplCopyWithImpl(
      _$SalesOrderImpl _value, $Res Function(_$SalesOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? productIssueId = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? status = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? subtotalAfterDiscount = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? exchangedValue = null,
    Object? pph22Percent = null,
    Object? pph22Value = null,
    Object? taxBasePpn = null,
    Object? description = null,
    Object? bankFee = null,
    Object? additionalDiscountType = null,
    Object? additionalDiscountPercent = null,
    Object? additionalDiscountValue = null,
    Object? specialDiscountPercent = null,
    Object? isTollIn = null,
    Object? isConfirmAt = freezed,
    Object? bonus = null,
    Object? revisionNo = null,
    Object? productRequest = freezed,
    Object? deliveryDate = freezed,
    Object? deliveryOrderOpenRemark = freezed,
  }) {
    return _then(_$SalesOrderImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      productIssueId: null == productIssueId
          ? _value.productIssueId
          : productIssueId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalesOrderStatus,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalAfterDiscount: null == subtotalAfterDiscount
          ? _value.subtotalAfterDiscount
          : subtotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      exchangedValue: null == exchangedValue
          ? _value.exchangedValue
          : exchangedValue // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Percent: null == pph22Percent
          ? _value.pph22Percent
          : pph22Percent // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as double,
      taxBasePpn: null == taxBasePpn
          ? _value.taxBasePpn
          : taxBasePpn // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bankFee: null == bankFee
          ? _value.bankFee
          : bankFee // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountType: null == additionalDiscountType
          ? _value.additionalDiscountType
          : additionalDiscountType // ignore: cast_nullable_to_non_nullable
              as String,
      additionalDiscountPercent: null == additionalDiscountPercent
          ? _value.additionalDiscountPercent
          : additionalDiscountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValue: null == additionalDiscountValue
          ? _value.additionalDiscountValue
          : additionalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      specialDiscountPercent: null == specialDiscountPercent
          ? _value.specialDiscountPercent
          : specialDiscountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      isTollIn: null == isTollIn
          ? _value.isTollIn
          : isTollIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmAt: freezed == isConfirmAt
          ? _value.isConfirmAt
          : isConfirmAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bonus: null == bonus
          ? _value.bonus
          : bonus // ignore: cast_nullable_to_non_nullable
              as bool,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as int,
      productRequest: freezed == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequest?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderOpenRemark: freezed == deliveryOrderOpenRemark
          ? _value.deliveryOrderOpenRemark
          : deliveryOrderOpenRemark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderImpl extends _SalesOrder {
  const _$SalesOrderImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      required this.id,
      @JsonKey(name: 'product_issue_id') required this.productIssueId,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'invoice_id') required this.invoiceId,
      @JsonKey(
          name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
      required this.status,
      required this.subtotal,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'subtotal_after_discount')
      required this.subtotalAfterDiscount,
      @JsonKey(name: 'ppn_percent') required this.ppnPercent,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      required this.total,
      @JsonKey(name: 'exchanged_value') required this.exchangedValue,
      @JsonKey(name: 'pph_22_percent') required this.pph22Percent,
      @JsonKey(name: 'pph_22_value') required this.pph22Value,
      @JsonKey(name: 'tax_base_ppn', defaultValue: 0) required this.taxBasePpn,
      required this.description,
      @JsonKey(name: 'bank_fee') required this.bankFee,
      @JsonKey(name: 'additional_discount_type')
      required this.additionalDiscountType,
      @JsonKey(name: 'additional_discount_percent')
      required this.additionalDiscountPercent,
      @JsonKey(name: 'additional_discount_value')
      required this.additionalDiscountValue,
      @JsonKey(name: 'special_discount_percent')
      required this.specialDiscountPercent,
      @JsonKey(name: 'is_toll_in', defaultValue: false) required this.isTollIn,
      @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
      required this.isConfirmAt,
      required this.bonus,
      @JsonKey(name: 'revision_no', defaultValue: 0) required this.revisionNo,
      @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
      this.productRequest,
      @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
      this.deliveryDate,
      @JsonKey(name: 'delivery_order_open_remark')
      this.deliveryOrderOpenRemark})
      : super._();

  factory _$SalesOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  final String id;
  @override
  @JsonKey(name: 'product_issue_id')
  final String productIssueId;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'invoice_id')
  final String invoiceId;
  @override
  @JsonKey(
      name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
  final SalesOrderStatus status;
  @override
  final double subtotal;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  final double subtotalAfterDiscount;
  @override
  @JsonKey(name: 'ppn_percent')
  final double ppnPercent;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  final double total;
  @override
  @JsonKey(name: 'exchanged_value')
  final double exchangedValue;
  @override
  @JsonKey(name: 'pph_22_percent')
  final double pph22Percent;
  @override
  @JsonKey(name: 'pph_22_value')
  final double pph22Value;
  @override
  @JsonKey(name: 'tax_base_ppn', defaultValue: 0)
  final double taxBasePpn;
  @override
  final String description;
  @override
  @JsonKey(name: 'bank_fee')
  final double bankFee;
  @override
  @JsonKey(name: 'additional_discount_type')
  final String additionalDiscountType;
  @override
  @JsonKey(name: 'additional_discount_percent')
  final double additionalDiscountPercent;
  @override
  @JsonKey(name: 'additional_discount_value')
  final double additionalDiscountValue;
  @override
  @JsonKey(name: 'special_discount_percent')
  final double specialDiscountPercent;
  @override
  @JsonKey(name: 'is_toll_in', defaultValue: false)
  final bool isTollIn;
  @override
  @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
  final DateTime? isConfirmAt;
  @override
  final bool bonus;
  @override
  @JsonKey(name: 'revision_no', defaultValue: 0)
  final int revisionNo;
  @override
  @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
  final ProductRequest? productRequest;
  @override
  @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: 'delivery_order_open_remark')
  final String? deliveryOrderOpenRemark;

  @override
  String toString() {
    return 'SalesOrder(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, id: $id, productIssueId: $productIssueId, deliveryOrderId: $deliveryOrderId, invoiceId: $invoiceId, status: $status, subtotal: $subtotal, discountPercent: $discountPercent, discountValue: $discountValue, subtotalAfterDiscount: $subtotalAfterDiscount, ppnPercent: $ppnPercent, ppnValue: $ppnValue, total: $total, exchangedValue: $exchangedValue, pph22Percent: $pph22Percent, pph22Value: $pph22Value, taxBasePpn: $taxBasePpn, description: $description, bankFee: $bankFee, additionalDiscountType: $additionalDiscountType, additionalDiscountPercent: $additionalDiscountPercent, additionalDiscountValue: $additionalDiscountValue, specialDiscountPercent: $specialDiscountPercent, isTollIn: $isTollIn, isConfirmAt: $isConfirmAt, bonus: $bonus, revisionNo: $revisionNo, productRequest: $productRequest, deliveryDate: $deliveryDate, deliveryOrderOpenRemark: $deliveryOrderOpenRemark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productIssueId, productIssueId) ||
                other.productIssueId == productIssueId) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.subtotalAfterDiscount, subtotalAfterDiscount) ||
                other.subtotalAfterDiscount == subtotalAfterDiscount) &&
            (identical(other.ppnPercent, ppnPercent) ||
                other.ppnPercent == ppnPercent) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.exchangedValue, exchangedValue) ||
                other.exchangedValue == exchangedValue) &&
            (identical(other.pph22Percent, pph22Percent) ||
                other.pph22Percent == pph22Percent) &&
            (identical(other.pph22Value, pph22Value) ||
                other.pph22Value == pph22Value) &&
            (identical(other.taxBasePpn, taxBasePpn) ||
                other.taxBasePpn == taxBasePpn) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bankFee, bankFee) || other.bankFee == bankFee) &&
            (identical(other.additionalDiscountType, additionalDiscountType) ||
                other.additionalDiscountType == additionalDiscountType) &&
            (identical(other.additionalDiscountPercent,
                    additionalDiscountPercent) ||
                other.additionalDiscountPercent == additionalDiscountPercent) &&
            (identical(
                    other.additionalDiscountValue, additionalDiscountValue) ||
                other.additionalDiscountValue == additionalDiscountValue) &&
            (identical(other.specialDiscountPercent, specialDiscountPercent) ||
                other.specialDiscountPercent == specialDiscountPercent) &&
            (identical(other.isTollIn, isTollIn) ||
                other.isTollIn == isTollIn) &&
            (identical(other.isConfirmAt, isConfirmAt) ||
                other.isConfirmAt == isConfirmAt) &&
            (identical(other.bonus, bonus) || other.bonus == bonus) &&
            (identical(other.revisionNo, revisionNo) ||
                other.revisionNo == revisionNo) &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(
                    other.deliveryOrderOpenRemark, deliveryOrderOpenRemark) ||
                other.deliveryOrderOpenRemark == deliveryOrderOpenRemark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        id,
        productIssueId,
        deliveryOrderId,
        invoiceId,
        status,
        subtotal,
        discountPercent,
        discountValue,
        subtotalAfterDiscount,
        ppnPercent,
        ppnValue,
        total,
        exchangedValue,
        pph22Percent,
        pph22Value,
        taxBasePpn,
        description,
        bankFee,
        additionalDiscountType,
        additionalDiscountPercent,
        additionalDiscountValue,
        specialDiscountPercent,
        isTollIn,
        isConfirmAt,
        bonus,
        revisionNo,
        productRequest,
        deliveryDate,
        deliveryOrderOpenRemark
      ]);

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      __$$SalesOrderImplCopyWithImpl<_$SalesOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderImplToJson(
      this,
    );
  }
}

abstract class _SalesOrder extends SalesOrder {
  const factory _SalesOrder(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      required final String id,
      @JsonKey(name: 'product_issue_id') required final String productIssueId,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'invoice_id') required final String invoiceId,
      @JsonKey(
          name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
      required final SalesOrderStatus status,
      required final double subtotal,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'subtotal_after_discount')
      required final double subtotalAfterDiscount,
      @JsonKey(name: 'ppn_percent') required final double ppnPercent,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      required final double total,
      @JsonKey(name: 'exchanged_value') required final double exchangedValue,
      @JsonKey(name: 'pph_22_percent') required final double pph22Percent,
      @JsonKey(name: 'pph_22_value') required final double pph22Value,
      @JsonKey(name: 'tax_base_ppn', defaultValue: 0)
      required final double taxBasePpn,
      required final String description,
      @JsonKey(name: 'bank_fee') required final double bankFee,
      @JsonKey(name: 'additional_discount_type')
      required final String additionalDiscountType,
      @JsonKey(name: 'additional_discount_percent')
      required final double additionalDiscountPercent,
      @JsonKey(name: 'additional_discount_value')
      required final double additionalDiscountValue,
      @JsonKey(name: 'special_discount_percent')
      required final double specialDiscountPercent,
      @JsonKey(name: 'is_toll_in', defaultValue: false)
      required final bool isTollIn,
      @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
      required final DateTime? isConfirmAt,
      required final bool bonus,
      @JsonKey(name: 'revision_no', defaultValue: 0)
      required final int revisionNo,
      @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
      final ProductRequest? productRequest,
      @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
      final DateTime? deliveryDate,
      @JsonKey(name: 'delivery_order_open_remark')
      final String? deliveryOrderOpenRemark}) = _$SalesOrderImpl;
  const _SalesOrder._() : super._();

  factory _SalesOrder.fromJson(Map<String, dynamic> json) =
      _$SalesOrderImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  String get id;
  @override
  @JsonKey(name: 'product_issue_id')
  String get productIssueId;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'invoice_id')
  String get invoiceId;
  @override
  @JsonKey(
      name: 'status', fromJson: SalesOrderStatus.salesOrderStatusFromString)
  SalesOrderStatus get status;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  double get subtotalAfterDiscount;
  @override
  @JsonKey(name: 'ppn_percent')
  double get ppnPercent;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  double get total;
  @override
  @JsonKey(name: 'exchanged_value')
  double get exchangedValue;
  @override
  @JsonKey(name: 'pph_22_percent')
  double get pph22Percent;
  @override
  @JsonKey(name: 'pph_22_value')
  double get pph22Value;
  @override
  @JsonKey(name: 'tax_base_ppn', defaultValue: 0)
  double get taxBasePpn;
  @override
  String get description;
  @override
  @JsonKey(name: 'bank_fee')
  double get bankFee;
  @override
  @JsonKey(name: 'additional_discount_type')
  String get additionalDiscountType;
  @override
  @JsonKey(name: 'additional_discount_percent')
  double get additionalDiscountPercent;
  @override
  @JsonKey(name: 'additional_discount_value')
  double get additionalDiscountValue;
  @override
  @JsonKey(name: 'special_discount_percent')
  double get specialDiscountPercent;
  @override
  @JsonKey(name: 'is_toll_in', defaultValue: false)
  bool get isTollIn;
  @override
  @JsonKey(name: 'is_confirm_at', fromJson: isoDateToDateTime)
  DateTime? get isConfirmAt;
  @override
  bool get bonus;
  @override
  @JsonKey(name: 'revision_no', defaultValue: 0)
  int get revisionNo;
  @override
  @JsonKey(name: 'product_request_id', fromJson: ProductRequest.fromJson)
  ProductRequest? get productRequest;
  @override
  @JsonKey(name: 'is_print_delivery_at', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: 'delivery_order_open_remark')
  String? get deliveryOrderOpenRemark;

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
