// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnNote _$ProductReturnNoteFromJson(Map<String, dynamic> json) {
  return _ProductReturnNote.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnNote {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
  Currency get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
  Customer get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
  TransactionType get transactionType => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
  DateTime get returnDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_address')
  String get shippingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_name')
  String get addressName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
  DateTime get deliveryNoteDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percentage')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum)
  Ppn get ppnPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by_id')
  int get approvedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
  DateTime? get approvedAt => throw _privateConstructorUsedError;

  /// Serializes this ProductReturnNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReturnNoteCopyWith<ProductReturnNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnNoteCopyWith<$Res> {
  factory $ProductReturnNoteCopyWith(
          ProductReturnNote value, $Res Function(ProductReturnNote) then) =
      _$ProductReturnNoteCopyWithImpl<$Res, ProductReturnNote>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
      Currency currency,
      @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
      Customer customer,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      int rate,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      DateTime returnDate,
      @JsonKey(name: 'shipping_address') String shippingAddress,
      @JsonKey(name: 'address_name') String addressName,
      @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
      DateTime deliveryNoteDate,
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      String remark,
      double subtotal,
      @JsonKey(name: 'discount_percentage') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum) Ppn ppnPercent,
      @JsonKey(name: 'ppn_value') double ppnValue,
      double total,
      @JsonKey(name: 'approved_by_id') int approvedById,
      @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
      DateTime? approvedAt});

  $CurrencyCopyWith<$Res> get currency;
  $CustomerCopyWith<$Res> get customer;
  $DepartmentCopyWith<$Res> get department;
  $TransactionTypeCopyWith<$Res> get transactionType;
}

/// @nodoc
class _$ProductReturnNoteCopyWithImpl<$Res, $Val extends ProductReturnNote>
    implements $ProductReturnNoteCopyWith<$Res> {
  _$ProductReturnNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? currency = null,
    Object? customer = null,
    Object? department = null,
    Object? transactionType = null,
    Object? rate = null,
    Object? purchaseOrderId = null,
    Object? returnDate = null,
    Object? shippingAddress = null,
    Object? addressName = null,
    Object? deliveryNoteDate = null,
    Object? termOfPayment = null,
    Object? remark = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? approvedById = null,
    Object? approvedAt = freezed,
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      returnDate: null == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNoteDate: null == deliveryNoteDate
          ? _value.deliveryNoteDate
          : deliveryNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
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
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as Ppn,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      approvedById: null == approvedById
          ? _value.approvedById
          : approvedById // ignore: cast_nullable_to_non_nullable
              as int,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get transactionType {
    return $TransactionTypeCopyWith<$Res>(_value.transactionType, (value) {
      return _then(_value.copyWith(transactionType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnNoteImplCopyWith<$Res>
    implements $ProductReturnNoteCopyWith<$Res> {
  factory _$$ProductReturnNoteImplCopyWith(_$ProductReturnNoteImpl value,
          $Res Function(_$ProductReturnNoteImpl) then) =
      __$$ProductReturnNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
      Currency currency,
      @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
      Customer customer,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      int rate,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      DateTime returnDate,
      @JsonKey(name: 'shipping_address') String shippingAddress,
      @JsonKey(name: 'address_name') String addressName,
      @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
      DateTime deliveryNoteDate,
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      String remark,
      double subtotal,
      @JsonKey(name: 'discount_percentage') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum) Ppn ppnPercent,
      @JsonKey(name: 'ppn_value') double ppnValue,
      double total,
      @JsonKey(name: 'approved_by_id') int approvedById,
      @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
      DateTime? approvedAt});

  @override
  $CurrencyCopyWith<$Res> get currency;
  @override
  $CustomerCopyWith<$Res> get customer;
  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $TransactionTypeCopyWith<$Res> get transactionType;
}

/// @nodoc
class __$$ProductReturnNoteImplCopyWithImpl<$Res>
    extends _$ProductReturnNoteCopyWithImpl<$Res, _$ProductReturnNoteImpl>
    implements _$$ProductReturnNoteImplCopyWith<$Res> {
  __$$ProductReturnNoteImplCopyWithImpl(_$ProductReturnNoteImpl _value,
      $Res Function(_$ProductReturnNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? currency = null,
    Object? customer = null,
    Object? department = null,
    Object? transactionType = null,
    Object? rate = null,
    Object? purchaseOrderId = null,
    Object? returnDate = null,
    Object? shippingAddress = null,
    Object? addressName = null,
    Object? deliveryNoteDate = null,
    Object? termOfPayment = null,
    Object? remark = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? approvedById = null,
    Object? approvedAt = freezed,
  }) {
    return _then(_$ProductReturnNoteImpl(
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
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      returnDate: null == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shippingAddress: null == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      addressName: null == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryNoteDate: null == deliveryNoteDate
          ? _value.deliveryNoteDate
          : deliveryNoteDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
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
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as Ppn,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      approvedById: null == approvedById
          ? _value.approvedById
          : approvedById // ignore: cast_nullable_to_non_nullable
              as int,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnNoteImpl extends _ProductReturnNote {
  _$ProductReturnNoteImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
      required this.currency,
      @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
      required this.customer,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      required this.department,
      @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
      required this.transactionType,
      required this.rate,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      required this.returnDate,
      @JsonKey(name: 'shipping_address') required this.shippingAddress,
      @JsonKey(name: 'address_name') required this.addressName,
      @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
      required this.deliveryNoteDate,
      @JsonKey(name: 'term_of_payment') required this.termOfPayment,
      required this.remark,
      required this.subtotal,
      @JsonKey(name: 'discount_percentage') required this.discountPercent,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum)
      required this.ppnPercent,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      required this.total,
      @JsonKey(name: 'approved_by_id') required this.approvedById,
      @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
      required this.approvedAt})
      : super._();

  factory _$ProductReturnNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnNoteImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
  final Currency currency;
  @override
  @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
  final Customer customer;
  @override
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
  final TransactionType transactionType;
  @override
  final int rate;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
  final DateTime returnDate;
  @override
  @JsonKey(name: 'shipping_address')
  final String shippingAddress;
  @override
  @JsonKey(name: 'address_name')
  final String addressName;
  @override
  @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
  final DateTime deliveryNoteDate;
  @override
  @JsonKey(name: 'term_of_payment')
  final int termOfPayment;
  @override
  final String remark;
  @override
  final double subtotal;
  @override
  @JsonKey(name: 'discount_percentage')
  final double discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum)
  final Ppn ppnPercent;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  final double total;
  @override
  @JsonKey(name: 'approved_by_id')
  final int approvedById;
  @override
  @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
  final DateTime? approvedAt;

  @override
  String toString() {
    return 'ProductReturnNote(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency, customer: $customer, department: $department, transactionType: $transactionType, rate: $rate, purchaseOrderId: $purchaseOrderId, returnDate: $returnDate, shippingAddress: $shippingAddress, addressName: $addressName, deliveryNoteDate: $deliveryNoteDate, termOfPayment: $termOfPayment, remark: $remark, subtotal: $subtotal, discountPercent: $discountPercent, discountValue: $discountValue, ppnPercent: $ppnPercent, ppnValue: $ppnValue, total: $total, approvedById: $approvedById, approvedAt: $approvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnNoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.deliveryNoteDate, deliveryNoteDate) ||
                other.deliveryNoteDate == deliveryNoteDate) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.ppnPercent, ppnPercent) ||
                other.ppnPercent == ppnPercent) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.approvedById, approvedById) ||
                other.approvedById == approvedById) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        currency,
        customer,
        department,
        transactionType,
        rate,
        purchaseOrderId,
        returnDate,
        shippingAddress,
        addressName,
        deliveryNoteDate,
        termOfPayment,
        remark,
        subtotal,
        discountPercent,
        discountValue,
        ppnPercent,
        ppnValue,
        total,
        approvedById,
        approvedAt
      ]);

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnNoteImplCopyWith<_$ProductReturnNoteImpl> get copyWith =>
      __$$ProductReturnNoteImplCopyWithImpl<_$ProductReturnNoteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnNoteImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnNote extends ProductReturnNote {
  factory _ProductReturnNote(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
      required final Currency currency,
      @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
      required final Customer customer,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      required final Department department,
      @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
      required final TransactionType transactionType,
      required final int rate,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
      required final DateTime returnDate,
      @JsonKey(name: 'shipping_address') required final String shippingAddress,
      @JsonKey(name: 'address_name') required final String addressName,
      @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryNoteDate,
      @JsonKey(name: 'term_of_payment') required final int termOfPayment,
      required final String remark,
      required final double subtotal,
      @JsonKey(name: 'discount_percentage')
      required final double discountPercent,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum)
      required final Ppn ppnPercent,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      required final double total,
      @JsonKey(name: 'approved_by_id') required final int approvedById,
      @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
      required final DateTime? approvedAt}) = _$ProductReturnNoteImpl;
  _ProductReturnNote._() : super._();

  factory _ProductReturnNote.fromJson(Map<String, dynamic> json) =
      _$ProductReturnNoteImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'currency_id', fromJson: Currency.fromJson)
  Currency get currency;
  @override
  @JsonKey(name: 'customer_id', fromJson: Customer.fromJson)
  Customer get customer;
  @override
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'transaction_type_id', fromJson: TransactionType.fromJson)
  TransactionType get transactionType;
  @override
  int get rate;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'return_date', fromJson: isoDateToDateTime)
  DateTime get returnDate;
  @override
  @JsonKey(name: 'shipping_address')
  String get shippingAddress;
  @override
  @JsonKey(name: 'address_name')
  String get addressName;
  @override
  @JsonKey(name: 'delivery_note_date', fromJson: isoDateToDateTime)
  DateTime get deliveryNoteDate;
  @override
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment;
  @override
  String get remark;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'discount_percentage')
  double get discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  @JsonKey(name: 'ppn_percentage', fromJson: Ppn.fromNum)
  Ppn get ppnPercent;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  double get total;
  @override
  @JsonKey(name: 'approved_by_id')
  int get approvedById;
  @override
  @JsonKey(name: 'approved_at', fromJson: dateTimeNullable)
  DateTime? get approvedAt;

  /// Create a copy of ProductReturnNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReturnNoteImplCopyWith<_$ProductReturnNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
