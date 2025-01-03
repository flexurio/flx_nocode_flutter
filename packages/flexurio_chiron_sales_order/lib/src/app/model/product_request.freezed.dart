// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) {
  return _ProductRequest.fromJson(json);
}

/// @nodoc
mixin _$ProductRequest {
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_discount')
  double get subtotalAfterDiscount => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'exchange_value')
  double get exchangeValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_by')
  int? get confirmBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_of_payment', defaultValue: 0)
  int get termOfPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_product')
  String get typeProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_percent')
  double get ppnPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'status',
      fromJson: ProductRequestStatus.productRequestStatusFromString)
  ProductRequestStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph_22_percent')
  double get pph22Percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph_22_value')
  double get pph22Value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_fee')
  double get bankFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type_id')
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  Currency get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  Customer get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address_id')
  Customer get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_type_id')
  TransactionType get orderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_distributor_date')
  DateTime? get purchaseOrderDistributorDate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_distributor_date_receive')
  DateTime? get purchaseOrderDistributorDateReceive =>
      throw _privateConstructorUsedError;

  /// Serializes this ProductRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRequestCopyWith<ProductRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRequestCopyWith<$Res> {
  factory $ProductRequestCopyWith(
          ProductRequest value, $Res Function(ProductRequest) then) =
      _$ProductRequestCopyWithImpl<$Res, ProductRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      double subtotal,
      @JsonKey(name: 'subtotal_after_discount') double subtotalAfterDiscount,
      double total,
      @JsonKey(name: 'exchange_value') double exchangeValue,
      @JsonKey(name: 'confirm_by') int? confirmBy,
      @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
      DateTime? confirmAt,
      String id,
      double rate,
      @JsonKey(name: 'term_of_payment', defaultValue: 0) int termOfPayment,
      @JsonKey(name: 'type_product') String typeProduct,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'ppn_percent') double ppnPercent,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(
          name: 'status',
          fromJson: ProductRequestStatus.productRequestStatusFromString)
      ProductRequestStatus status,
      @JsonKey(name: 'pph_22_percent') double pph22Percent,
      @JsonKey(name: 'pph_22_value') double pph22Value,
      String description,
      @JsonKey(name: 'bank_fee') double bankFee,
      @JsonKey(name: 'transaction_type_id') TransactionType transactionType,
      @JsonKey(name: 'currency_id') Currency currency,
      @JsonKey(name: 'customer_id') Customer customer,
      @JsonKey(name: 'delivery_address_id') Customer deliveryAddress,
      @JsonKey(name: 'order_type_id') TransactionType orderType,
      @JsonKey(name: 'department_id') Department department,
      @JsonKey(name: 'purchase_order_distributor_date')
      DateTime? purchaseOrderDistributorDate,
      @JsonKey(name: 'purchase_order_distributor_date_receive')
      DateTime? purchaseOrderDistributorDateReceive});

  $TransactionTypeCopyWith<$Res> get transactionType;
  $CurrencyCopyWith<$Res> get currency;
  $CustomerCopyWith<$Res> get customer;
  $CustomerCopyWith<$Res> get deliveryAddress;
  $TransactionTypeCopyWith<$Res> get orderType;
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class _$ProductRequestCopyWithImpl<$Res, $Val extends ProductRequest>
    implements $ProductRequestCopyWith<$Res> {
  _$ProductRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? subtotal = null,
    Object? subtotalAfterDiscount = null,
    Object? total = null,
    Object? exchangeValue = null,
    Object? confirmBy = freezed,
    Object? confirmAt = freezed,
    Object? id = null,
    Object? rate = null,
    Object? termOfPayment = null,
    Object? typeProduct = null,
    Object? purchaseOrderDistributor = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? status = null,
    Object? pph22Percent = null,
    Object? pph22Value = null,
    Object? description = null,
    Object? bankFee = null,
    Object? transactionType = null,
    Object? currency = null,
    Object? customer = null,
    Object? deliveryAddress = null,
    Object? orderType = null,
    Object? department = null,
    Object? purchaseOrderDistributorDate = freezed,
    Object? purchaseOrderDistributorDateReceive = freezed,
  }) {
    return _then(_value.copyWith(
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalAfterDiscount: null == subtotalAfterDiscount
          ? _value.subtotalAfterDiscount
          : subtotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      exchangeValue: null == exchangeValue
          ? _value.exchangeValue
          : exchangeValue // ignore: cast_nullable_to_non_nullable
              as double,
      confirmBy: freezed == confirmBy
          ? _value.confirmBy
          : confirmBy // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmAt: freezed == confirmAt
          ? _value.confirmAt
          : confirmAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      typeProduct: null == typeProduct
          ? _value.typeProduct
          : typeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductRequestStatus,
      pph22Percent: null == pph22Percent
          ? _value.pph22Percent
          : pph22Percent // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bankFee: null == bankFee
          ? _value.bankFee
          : bankFee // ignore: cast_nullable_to_non_nullable
              as double,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Customer,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      purchaseOrderDistributorDate: freezed == purchaseOrderDistributorDate
          ? _value.purchaseOrderDistributorDate
          : purchaseOrderDistributorDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseOrderDistributorDateReceive: freezed ==
              purchaseOrderDistributorDateReceive
          ? _value.purchaseOrderDistributorDateReceive
          : purchaseOrderDistributorDateReceive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get transactionType {
    return $TransactionTypeCopyWith<$Res>(_value.transactionType, (value) {
      return _then(_value.copyWith(transactionType: value) as $Val);
    });
  }

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get deliveryAddress {
    return $CustomerCopyWith<$Res>(_value.deliveryAddress, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get orderType {
    return $TransactionTypeCopyWith<$Res>(_value.orderType, (value) {
      return _then(_value.copyWith(orderType: value) as $Val);
    });
  }

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductRequestImplCopyWith<$Res>
    implements $ProductRequestCopyWith<$Res> {
  factory _$$ProductRequestImplCopyWith(_$ProductRequestImpl value,
          $Res Function(_$ProductRequestImpl) then) =
      __$$ProductRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      double subtotal,
      @JsonKey(name: 'subtotal_after_discount') double subtotalAfterDiscount,
      double total,
      @JsonKey(name: 'exchange_value') double exchangeValue,
      @JsonKey(name: 'confirm_by') int? confirmBy,
      @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
      DateTime? confirmAt,
      String id,
      double rate,
      @JsonKey(name: 'term_of_payment', defaultValue: 0) int termOfPayment,
      @JsonKey(name: 'type_product') String typeProduct,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'ppn_percent') double ppnPercent,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(
          name: 'status',
          fromJson: ProductRequestStatus.productRequestStatusFromString)
      ProductRequestStatus status,
      @JsonKey(name: 'pph_22_percent') double pph22Percent,
      @JsonKey(name: 'pph_22_value') double pph22Value,
      String description,
      @JsonKey(name: 'bank_fee') double bankFee,
      @JsonKey(name: 'transaction_type_id') TransactionType transactionType,
      @JsonKey(name: 'currency_id') Currency currency,
      @JsonKey(name: 'customer_id') Customer customer,
      @JsonKey(name: 'delivery_address_id') Customer deliveryAddress,
      @JsonKey(name: 'order_type_id') TransactionType orderType,
      @JsonKey(name: 'department_id') Department department,
      @JsonKey(name: 'purchase_order_distributor_date')
      DateTime? purchaseOrderDistributorDate,
      @JsonKey(name: 'purchase_order_distributor_date_receive')
      DateTime? purchaseOrderDistributorDateReceive});

  @override
  $TransactionTypeCopyWith<$Res> get transactionType;
  @override
  $CurrencyCopyWith<$Res> get currency;
  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $CustomerCopyWith<$Res> get deliveryAddress;
  @override
  $TransactionTypeCopyWith<$Res> get orderType;
  @override
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$ProductRequestImplCopyWithImpl<$Res>
    extends _$ProductRequestCopyWithImpl<$Res, _$ProductRequestImpl>
    implements _$$ProductRequestImplCopyWith<$Res> {
  __$$ProductRequestImplCopyWithImpl(
      _$ProductRequestImpl _value, $Res Function(_$ProductRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? subtotal = null,
    Object? subtotalAfterDiscount = null,
    Object? total = null,
    Object? exchangeValue = null,
    Object? confirmBy = freezed,
    Object? confirmAt = freezed,
    Object? id = null,
    Object? rate = null,
    Object? termOfPayment = null,
    Object? typeProduct = null,
    Object? purchaseOrderDistributor = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? status = null,
    Object? pph22Percent = null,
    Object? pph22Value = null,
    Object? description = null,
    Object? bankFee = null,
    Object? transactionType = null,
    Object? currency = null,
    Object? customer = null,
    Object? deliveryAddress = null,
    Object? orderType = null,
    Object? department = null,
    Object? purchaseOrderDistributorDate = freezed,
    Object? purchaseOrderDistributorDateReceive = freezed,
  }) {
    return _then(_$ProductRequestImpl(
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalAfterDiscount: null == subtotalAfterDiscount
          ? _value.subtotalAfterDiscount
          : subtotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      exchangeValue: null == exchangeValue
          ? _value.exchangeValue
          : exchangeValue // ignore: cast_nullable_to_non_nullable
              as double,
      confirmBy: freezed == confirmBy
          ? _value.confirmBy
          : confirmBy // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmAt: freezed == confirmAt
          ? _value.confirmAt
          : confirmAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      typeProduct: null == typeProduct
          ? _value.typeProduct
          : typeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductRequestStatus,
      pph22Percent: null == pph22Percent
          ? _value.pph22Percent
          : pph22Percent // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bankFee: null == bankFee
          ? _value.bankFee
          : bankFee // ignore: cast_nullable_to_non_nullable
              as double,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Customer,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      purchaseOrderDistributorDate: freezed == purchaseOrderDistributorDate
          ? _value.purchaseOrderDistributorDate
          : purchaseOrderDistributorDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseOrderDistributorDateReceive: freezed ==
              purchaseOrderDistributorDateReceive
          ? _value.purchaseOrderDistributorDateReceive
          : purchaseOrderDistributorDateReceive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRequestImpl extends _ProductRequest {
  const _$ProductRequestImpl(
      {@JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.subtotal,
      @JsonKey(name: 'subtotal_after_discount')
      required this.subtotalAfterDiscount,
      required this.total,
      @JsonKey(name: 'exchange_value') required this.exchangeValue,
      @JsonKey(name: 'confirm_by') required this.confirmBy,
      @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
      required this.confirmAt,
      required this.id,
      required this.rate,
      @JsonKey(name: 'term_of_payment', defaultValue: 0)
      required this.termOfPayment,
      @JsonKey(name: 'type_product') required this.typeProduct,
      @JsonKey(name: 'purchase_order_distributor')
      required this.purchaseOrderDistributor,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'ppn_percent') required this.ppnPercent,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(
          name: 'status',
          fromJson: ProductRequestStatus.productRequestStatusFromString)
      required this.status,
      @JsonKey(name: 'pph_22_percent') required this.pph22Percent,
      @JsonKey(name: 'pph_22_value') required this.pph22Value,
      required this.description,
      @JsonKey(name: 'bank_fee') required this.bankFee,
      @JsonKey(name: 'transaction_type_id') required this.transactionType,
      @JsonKey(name: 'currency_id') required this.currency,
      @JsonKey(name: 'customer_id') required this.customer,
      @JsonKey(name: 'delivery_address_id') required this.deliveryAddress,
      @JsonKey(name: 'order_type_id') required this.orderType,
      @JsonKey(name: 'department_id') required this.department,
      @JsonKey(name: 'purchase_order_distributor_date')
      required this.purchaseOrderDistributorDate,
      @JsonKey(name: 'purchase_order_distributor_date_receive')
      required this.purchaseOrderDistributorDateReceive})
      : super._();

  factory _$ProductRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRequestImplFromJson(json);

  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final double subtotal;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  final double subtotalAfterDiscount;
  @override
  final double total;
  @override
  @JsonKey(name: 'exchange_value')
  final double exchangeValue;
  @override
  @JsonKey(name: 'confirm_by')
  final int? confirmBy;
  @override
  @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
  final DateTime? confirmAt;
  @override
  final String id;
  @override
  final double rate;
  @override
  @JsonKey(name: 'term_of_payment', defaultValue: 0)
  final int termOfPayment;
  @override
  @JsonKey(name: 'type_product')
  final String typeProduct;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  final String purchaseOrderDistributor;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey(name: 'ppn_percent')
  final double ppnPercent;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  @JsonKey(
      name: 'status',
      fromJson: ProductRequestStatus.productRequestStatusFromString)
  final ProductRequestStatus status;
  @override
  @JsonKey(name: 'pph_22_percent')
  final double pph22Percent;
  @override
  @JsonKey(name: 'pph_22_value')
  final double pph22Value;
  @override
  final String description;
  @override
  @JsonKey(name: 'bank_fee')
  final double bankFee;
  @override
  @JsonKey(name: 'transaction_type_id')
  final TransactionType transactionType;
  @override
  @JsonKey(name: 'currency_id')
  final Currency currency;
  @override
  @JsonKey(name: 'customer_id')
  final Customer customer;
  @override
  @JsonKey(name: 'delivery_address_id')
  final Customer deliveryAddress;
  @override
  @JsonKey(name: 'order_type_id')
  final TransactionType orderType;
  @override
  @JsonKey(name: 'department_id')
  final Department department;
  @override
  @JsonKey(name: 'purchase_order_distributor_date')
  final DateTime? purchaseOrderDistributorDate;
  @override
  @JsonKey(name: 'purchase_order_distributor_date_receive')
  final DateTime? purchaseOrderDistributorDateReceive;

  @override
  String toString() {
    return 'ProductRequest(createdById: $createdById, createdAt: $createdAt, updatedById: $updatedById, updatedAt: $updatedAt, subtotal: $subtotal, subtotalAfterDiscount: $subtotalAfterDiscount, total: $total, exchangeValue: $exchangeValue, confirmBy: $confirmBy, confirmAt: $confirmAt, id: $id, rate: $rate, termOfPayment: $termOfPayment, typeProduct: $typeProduct, purchaseOrderDistributor: $purchaseOrderDistributor, discountPercent: $discountPercent, discountValue: $discountValue, ppnPercent: $ppnPercent, ppnValue: $ppnValue, status: $status, pph22Percent: $pph22Percent, pph22Value: $pph22Value, description: $description, bankFee: $bankFee, transactionType: $transactionType, currency: $currency, customer: $customer, deliveryAddress: $deliveryAddress, orderType: $orderType, department: $department, purchaseOrderDistributorDate: $purchaseOrderDistributorDate, purchaseOrderDistributorDateReceive: $purchaseOrderDistributorDateReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRequestImpl &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.subtotalAfterDiscount, subtotalAfterDiscount) ||
                other.subtotalAfterDiscount == subtotalAfterDiscount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.exchangeValue, exchangeValue) ||
                other.exchangeValue == exchangeValue) &&
            (identical(other.confirmBy, confirmBy) ||
                other.confirmBy == confirmBy) &&
            (identical(other.confirmAt, confirmAt) ||
                other.confirmAt == confirmAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.typeProduct, typeProduct) ||
                other.typeProduct == typeProduct) &&
            (identical(
                    other.purchaseOrderDistributor, purchaseOrderDistributor) ||
                other.purchaseOrderDistributor == purchaseOrderDistributor) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.ppnPercent, ppnPercent) ||
                other.ppnPercent == ppnPercent) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pph22Percent, pph22Percent) ||
                other.pph22Percent == pph22Percent) &&
            (identical(other.pph22Value, pph22Value) ||
                other.pph22Value == pph22Value) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bankFee, bankFee) || other.bankFee == bankFee) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.purchaseOrderDistributorDate,
                    purchaseOrderDistributorDate) ||
                other.purchaseOrderDistributorDate ==
                    purchaseOrderDistributorDate) &&
            (identical(other.purchaseOrderDistributorDateReceive,
                    purchaseOrderDistributorDateReceive) ||
                other.purchaseOrderDistributorDateReceive ==
                    purchaseOrderDistributorDateReceive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdById,
        createdAt,
        updatedById,
        updatedAt,
        subtotal,
        subtotalAfterDiscount,
        total,
        exchangeValue,
        confirmBy,
        confirmAt,
        id,
        rate,
        termOfPayment,
        typeProduct,
        purchaseOrderDistributor,
        discountPercent,
        discountValue,
        ppnPercent,
        ppnValue,
        status,
        pph22Percent,
        pph22Value,
        description,
        bankFee,
        transactionType,
        currency,
        customer,
        deliveryAddress,
        orderType,
        department,
        purchaseOrderDistributorDate,
        purchaseOrderDistributorDateReceive
      ]);

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRequestImplCopyWith<_$ProductRequestImpl> get copyWith =>
      __$$ProductRequestImplCopyWithImpl<_$ProductRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRequestImplToJson(
      this,
    );
  }
}

abstract class _ProductRequest extends ProductRequest {
  const factory _ProductRequest(
      {@JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      required final double subtotal,
      @JsonKey(name: 'subtotal_after_discount')
      required final double subtotalAfterDiscount,
      required final double total,
      @JsonKey(name: 'exchange_value') required final double exchangeValue,
      @JsonKey(name: 'confirm_by') required final int? confirmBy,
      @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
      required final DateTime? confirmAt,
      required final String id,
      required final double rate,
      @JsonKey(name: 'term_of_payment', defaultValue: 0)
      required final int termOfPayment,
      @JsonKey(name: 'type_product') required final String typeProduct,
      @JsonKey(name: 'purchase_order_distributor')
      required final String purchaseOrderDistributor,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'ppn_percent') required final double ppnPercent,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      @JsonKey(
          name: 'status',
          fromJson: ProductRequestStatus.productRequestStatusFromString)
      required final ProductRequestStatus status,
      @JsonKey(name: 'pph_22_percent') required final double pph22Percent,
      @JsonKey(name: 'pph_22_value') required final double pph22Value,
      required final String description,
      @JsonKey(name: 'bank_fee') required final double bankFee,
      @JsonKey(name: 'transaction_type_id')
      required final TransactionType transactionType,
      @JsonKey(name: 'currency_id') required final Currency currency,
      @JsonKey(name: 'customer_id') required final Customer customer,
      @JsonKey(name: 'delivery_address_id')
      required final Customer deliveryAddress,
      @JsonKey(name: 'order_type_id') required final TransactionType orderType,
      @JsonKey(name: 'department_id') required final Department department,
      @JsonKey(name: 'purchase_order_distributor_date')
      required final DateTime? purchaseOrderDistributorDate,
      @JsonKey(name: 'purchase_order_distributor_date_receive')
      required final DateTime?
          purchaseOrderDistributorDateReceive}) = _$ProductRequestImpl;
  const _ProductRequest._() : super._();

  factory _ProductRequest.fromJson(Map<String, dynamic> json) =
      _$ProductRequestImpl.fromJson;

  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  double get subtotalAfterDiscount;
  @override
  double get total;
  @override
  @JsonKey(name: 'exchange_value')
  double get exchangeValue;
  @override
  @JsonKey(name: 'confirm_by')
  int? get confirmBy;
  @override
  @JsonKey(name: 'confirm_at', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmAt;
  @override
  String get id;
  @override
  double get rate;
  @override
  @JsonKey(name: 'term_of_payment', defaultValue: 0)
  int get termOfPayment;
  @override
  @JsonKey(name: 'type_product')
  String get typeProduct;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  @JsonKey(name: 'ppn_percent')
  double get ppnPercent;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  @JsonKey(
      name: 'status',
      fromJson: ProductRequestStatus.productRequestStatusFromString)
  ProductRequestStatus get status;
  @override
  @JsonKey(name: 'pph_22_percent')
  double get pph22Percent;
  @override
  @JsonKey(name: 'pph_22_value')
  double get pph22Value;
  @override
  String get description;
  @override
  @JsonKey(name: 'bank_fee')
  double get bankFee;
  @override
  @JsonKey(name: 'transaction_type_id')
  TransactionType get transactionType;
  @override
  @JsonKey(name: 'currency_id')
  Currency get currency;
  @override
  @JsonKey(name: 'customer_id')
  Customer get customer;
  @override
  @JsonKey(name: 'delivery_address_id')
  Customer get deliveryAddress;
  @override
  @JsonKey(name: 'order_type_id')
  TransactionType get orderType;
  @override
  @JsonKey(name: 'department_id')
  Department get department;
  @override
  @JsonKey(name: 'purchase_order_distributor_date')
  DateTime? get purchaseOrderDistributorDate;
  @override
  @JsonKey(name: 'purchase_order_distributor_date_receive')
  DateTime? get purchaseOrderDistributorDateReceive;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRequestImplCopyWith<_$ProductRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
