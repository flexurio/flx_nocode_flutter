// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturn _$ProductReturnFromJson(Map<String, dynamic> json) {
  return _ProductReturn.fromJson(json);
}

/// @nodoc
mixin _$ProductReturn {
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
  @JsonKey(name: 'reference_no')
  String get referenceNo => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_discount')
  double get subtotalAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
  Ppn get ppnPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_ppn')
  double get subtotalAfterPpn => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value')
  double get accountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
  ProductReturnStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
  DateTime? get confirmMarketingAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
  DateTime? get confirmPpicAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnCopyWith<ProductReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnCopyWith<$Res> {
  factory $ProductReturnCopyWith(
          ProductReturn value, $Res Function(ProductReturn) then) =
      _$ProductReturnCopyWithImpl<$Res, ProductReturn>;
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
      @JsonKey(name: 'reference_no') String referenceNo,
      String description,
      double subtotal,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'subtotal_after_discount') double subtotalAfterDiscount,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) Ppn ppnPercent,
      @JsonKey(name: 'subtotal_after_ppn') double subtotalAfterPpn,
      double total,
      @JsonKey(name: 'account_value') double accountValue,
      @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
      ProductReturnStatus status,
      @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
      DateTime? confirmMarketingAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
      DateTime? confirmPpicAt});

  $CurrencyCopyWith<$Res> get currency;
  $CustomerCopyWith<$Res> get customer;
  $DepartmentCopyWith<$Res> get department;
  $TransactionTypeCopyWith<$Res> get transactionType;
}

/// @nodoc
class _$ProductReturnCopyWithImpl<$Res, $Val extends ProductReturn>
    implements $ProductReturnCopyWith<$Res> {
  _$ProductReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? referenceNo = null,
    Object? description = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? subtotalAfterDiscount = null,
    Object? ppnValue = null,
    Object? ppnPercent = null,
    Object? subtotalAfterPpn = null,
    Object? total = null,
    Object? accountValue = null,
    Object? status = null,
    Object? confirmMarketingAt = freezed,
    Object? confirmPpicAt = freezed,
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
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      subtotalAfterDiscount: null == subtotalAfterDiscount
          ? _value.subtotalAfterDiscount
          : subtotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as Ppn,
      subtotalAfterPpn: null == subtotalAfterPpn
          ? _value.subtotalAfterPpn
          : subtotalAfterPpn // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReturnStatus,
      confirmMarketingAt: freezed == confirmMarketingAt
          ? _value.confirmMarketingAt
          : confirmMarketingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmPpicAt: freezed == confirmPpicAt
          ? _value.confirmPpicAt
          : confirmPpicAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get transactionType {
    return $TransactionTypeCopyWith<$Res>(_value.transactionType, (value) {
      return _then(_value.copyWith(transactionType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnImplCopyWith<$Res>
    implements $ProductReturnCopyWith<$Res> {
  factory _$$ProductReturnImplCopyWith(
          _$ProductReturnImpl value, $Res Function(_$ProductReturnImpl) then) =
      __$$ProductReturnImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'reference_no') String referenceNo,
      String description,
      double subtotal,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'subtotal_after_discount') double subtotalAfterDiscount,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) Ppn ppnPercent,
      @JsonKey(name: 'subtotal_after_ppn') double subtotalAfterPpn,
      double total,
      @JsonKey(name: 'account_value') double accountValue,
      @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
      ProductReturnStatus status,
      @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
      DateTime? confirmMarketingAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
      DateTime? confirmPpicAt});

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
class __$$ProductReturnImplCopyWithImpl<$Res>
    extends _$ProductReturnCopyWithImpl<$Res, _$ProductReturnImpl>
    implements _$$ProductReturnImplCopyWith<$Res> {
  __$$ProductReturnImplCopyWithImpl(
      _$ProductReturnImpl _value, $Res Function(_$ProductReturnImpl) _then)
      : super(_value, _then);

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
    Object? referenceNo = null,
    Object? description = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? subtotalAfterDiscount = null,
    Object? ppnValue = null,
    Object? ppnPercent = null,
    Object? subtotalAfterPpn = null,
    Object? total = null,
    Object? accountValue = null,
    Object? status = null,
    Object? confirmMarketingAt = freezed,
    Object? confirmPpicAt = freezed,
  }) {
    return _then(_$ProductReturnImpl(
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
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
      subtotalAfterDiscount: null == subtotalAfterDiscount
          ? _value.subtotalAfterDiscount
          : subtotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as Ppn,
      subtotalAfterPpn: null == subtotalAfterPpn
          ? _value.subtotalAfterPpn
          : subtotalAfterPpn // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReturnStatus,
      confirmMarketingAt: freezed == confirmMarketingAt
          ? _value.confirmMarketingAt
          : confirmMarketingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmPpicAt: freezed == confirmPpicAt
          ? _value.confirmPpicAt
          : confirmPpicAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnImpl extends _ProductReturn {
  _$ProductReturnImpl(
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
      @JsonKey(name: 'reference_no') required this.referenceNo,
      required this.description,
      required this.subtotal,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'subtotal_after_discount')
      required this.subtotalAfterDiscount,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
      required this.ppnPercent,
      @JsonKey(name: 'subtotal_after_ppn') required this.subtotalAfterPpn,
      required this.total,
      @JsonKey(name: 'account_value') required this.accountValue,
      @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
      required this.status,
      @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
      this.confirmMarketingAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
      this.confirmPpicAt})
      : super._();

  factory _$ProductReturnImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnImplFromJson(json);

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
  @JsonKey(name: 'reference_no')
  final String referenceNo;
  @override
  final String description;
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
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
  final Ppn ppnPercent;
  @override
  @JsonKey(name: 'subtotal_after_ppn')
  final double subtotalAfterPpn;
  @override
  final double total;
  @override
  @JsonKey(name: 'account_value')
  final double accountValue;
  @override
  @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
  final ProductReturnStatus status;
  @override
  @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
  final DateTime? confirmMarketingAt;
  @override
  @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
  final DateTime? confirmPpicAt;

  @override
  String toString() {
    return 'ProductReturn(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, currency: $currency, customer: $customer, department: $department, transactionType: $transactionType, referenceNo: $referenceNo, description: $description, subtotal: $subtotal, discountPercent: $discountPercent, discountValue: $discountValue, subtotalAfterDiscount: $subtotalAfterDiscount, ppnValue: $ppnValue, ppnPercent: $ppnPercent, subtotalAfterPpn: $subtotalAfterPpn, total: $total, accountValue: $accountValue, status: $status, confirmMarketingAt: $confirmMarketingAt, confirmPpicAt: $confirmPpicAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnImpl &&
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
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.subtotalAfterDiscount, subtotalAfterDiscount) ||
                other.subtotalAfterDiscount == subtotalAfterDiscount) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.ppnPercent, ppnPercent) ||
                other.ppnPercent == ppnPercent) &&
            (identical(other.subtotalAfterPpn, subtotalAfterPpn) ||
                other.subtotalAfterPpn == subtotalAfterPpn) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.accountValue, accountValue) ||
                other.accountValue == accountValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.confirmMarketingAt, confirmMarketingAt) ||
                other.confirmMarketingAt == confirmMarketingAt) &&
            (identical(other.confirmPpicAt, confirmPpicAt) ||
                other.confirmPpicAt == confirmPpicAt));
  }

  @JsonKey(ignore: true)
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
        referenceNo,
        description,
        subtotal,
        discountPercent,
        discountValue,
        subtotalAfterDiscount,
        ppnValue,
        ppnPercent,
        subtotalAfterPpn,
        total,
        accountValue,
        status,
        confirmMarketingAt,
        confirmPpicAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnImplCopyWith<_$ProductReturnImpl> get copyWith =>
      __$$ProductReturnImplCopyWithImpl<_$ProductReturnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnImplToJson(
      this,
    );
  }
}

abstract class _ProductReturn extends ProductReturn {
  factory _ProductReturn(
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
      @JsonKey(name: 'reference_no') required final String referenceNo,
      required final String description,
      required final double subtotal,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'subtotal_after_discount')
      required final double subtotalAfterDiscount,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
      required final Ppn ppnPercent,
      @JsonKey(name: 'subtotal_after_ppn')
      required final double subtotalAfterPpn,
      required final double total,
      @JsonKey(name: 'account_value') required final double accountValue,
      @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
      required final ProductReturnStatus status,
      @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
      final DateTime? confirmMarketingAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
      final DateTime? confirmPpicAt}) = _$ProductReturnImpl;
  _ProductReturn._() : super._();

  factory _ProductReturn.fromJson(Map<String, dynamic> json) =
      _$ProductReturnImpl.fromJson;

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
  @JsonKey(name: 'reference_no')
  String get referenceNo;
  @override
  String get description;
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
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
  Ppn get ppnPercent;
  @override
  @JsonKey(name: 'subtotal_after_ppn')
  double get subtotalAfterPpn;
  @override
  double get total;
  @override
  @JsonKey(name: 'account_value')
  double get accountValue;
  @override
  @JsonKey(name: 'status', fromJson: ProductReturnStatus.fromString)
  ProductReturnStatus get status;
  @override
  @JsonKey(name: 'confirm_marketing_at', fromJson: dateTimeNullable)
  DateTime? get confirmMarketingAt;
  @override
  @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullable)
  DateTime? get confirmPpicAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnImplCopyWith<_$ProductReturnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
