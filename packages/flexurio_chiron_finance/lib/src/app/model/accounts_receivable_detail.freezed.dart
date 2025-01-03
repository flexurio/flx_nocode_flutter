// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsReceivableDetail _$AccountsReceivableDetailFromJson(
    Map<String, dynamic> json) {
  return _AccountsReceivableDetail.fromJson(json);
}

/// @nodoc
mixin _$AccountsReceivableDetail {
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_customer')
  String get cityCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_customer')
  String get addressCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_customer')
  int get totalCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type')
  String? get transactionType => throw _privateConstructorUsedError;

  /// Serializes this AccountsReceivableDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsReceivableDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivableDetailCopyWith<AccountsReceivableDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableDetailCopyWith<$Res> {
  factory $AccountsReceivableDetailCopyWith(AccountsReceivableDetail value,
          $Res Function(AccountsReceivableDetail) then) =
      _$AccountsReceivableDetailCopyWithImpl<$Res, AccountsReceivableDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'city_customer') String cityCustomer,
      @JsonKey(name: 'address_customer') String addressCustomer,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'total_customer') int totalCustomer,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'transaction_type') String? transactionType});
}

/// @nodoc
class _$AccountsReceivableDetailCopyWithImpl<$Res,
        $Val extends AccountsReceivableDetail>
    implements $AccountsReceivableDetailCopyWith<$Res> {
  _$AccountsReceivableDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? dueDate = null,
    Object? customer = null,
    Object? cityCustomer = null,
    Object? addressCustomer = null,
    Object? amount = null,
    Object? totalCustomer = null,
    Object? customerId = null,
    Object? transactionType = freezed,
  }) {
    return _then(_value.copyWith(
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      cityCustomer: null == cityCustomer
          ? _value.cityCustomer
          : cityCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      addressCustomer: null == addressCustomer
          ? _value.addressCustomer
          : addressCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCustomer: null == totalCustomer
          ? _value.totalCustomer
          : totalCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsReceivableDetailImplCopyWith<$Res>
    implements $AccountsReceivableDetailCopyWith<$Res> {
  factory _$$AccountsReceivableDetailImplCopyWith(
          _$AccountsReceivableDetailImpl value,
          $Res Function(_$AccountsReceivableDetailImpl) then) =
      __$$AccountsReceivableDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'city_customer') String cityCustomer,
      @JsonKey(name: 'address_customer') String addressCustomer,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'total_customer') int totalCustomer,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'transaction_type') String? transactionType});
}

/// @nodoc
class __$$AccountsReceivableDetailImplCopyWithImpl<$Res>
    extends _$AccountsReceivableDetailCopyWithImpl<$Res,
        _$AccountsReceivableDetailImpl>
    implements _$$AccountsReceivableDetailImplCopyWith<$Res> {
  __$$AccountsReceivableDetailImplCopyWithImpl(
      _$AccountsReceivableDetailImpl _value,
      $Res Function(_$AccountsReceivableDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? dueDate = null,
    Object? customer = null,
    Object? cityCustomer = null,
    Object? addressCustomer = null,
    Object? amount = null,
    Object? totalCustomer = null,
    Object? customerId = null,
    Object? transactionType = freezed,
  }) {
    return _then(_$AccountsReceivableDetailImpl(
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      cityCustomer: null == cityCustomer
          ? _value.cityCustomer
          : cityCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      addressCustomer: null == addressCustomer
          ? _value.addressCustomer
          : addressCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCustomer: null == totalCustomer
          ? _value.totalCustomer
          : totalCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsReceivableDetailImpl extends _AccountsReceivableDetail {
  _$AccountsReceivableDetailImpl(
      {@JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'customer') required this.customer,
      @JsonKey(name: 'city_customer') required this.cityCustomer,
      @JsonKey(name: 'address_customer') required this.addressCustomer,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'total_customer') required this.totalCustomer,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'transaction_type') this.transactionType})
      : super._();

  factory _$AccountsReceivableDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountsReceivableDetailImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'customer')
  final String customer;
  @override
  @JsonKey(name: 'city_customer')
  final String cityCustomer;
  @override
  @JsonKey(name: 'address_customer')
  final String addressCustomer;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  @override
  @JsonKey(name: 'total_customer')
  final int totalCustomer;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'transaction_type')
  final String? transactionType;

  @override
  String toString() {
    return 'AccountsReceivableDetail(transactionNo: $transactionNo, transactionDate: $transactionDate, dueDate: $dueDate, customer: $customer, cityCustomer: $cityCustomer, addressCustomer: $addressCustomer, amount: $amount, totalCustomer: $totalCustomer, customerId: $customerId, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReceivableDetailImpl &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.cityCustomer, cityCustomer) ||
                other.cityCustomer == cityCustomer) &&
            (identical(other.addressCustomer, addressCustomer) ||
                other.addressCustomer == addressCustomer) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.totalCustomer, totalCustomer) ||
                other.totalCustomer == totalCustomer) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionNo,
      transactionDate,
      dueDate,
      customer,
      cityCustomer,
      addressCustomer,
      amount,
      totalCustomer,
      customerId,
      transactionType);

  /// Create a copy of AccountsReceivableDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReceivableDetailImplCopyWith<_$AccountsReceivableDetailImpl>
      get copyWith => __$$AccountsReceivableDetailImplCopyWithImpl<
          _$AccountsReceivableDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsReceivableDetailImplToJson(
      this,
    );
  }
}

abstract class _AccountsReceivableDetail extends AccountsReceivableDetail {
  factory _AccountsReceivableDetail(
      {@JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'customer') required final String customer,
      @JsonKey(name: 'city_customer') required final String cityCustomer,
      @JsonKey(name: 'address_customer') required final String addressCustomer,
      @JsonKey(name: 'amount') required final int amount,
      @JsonKey(name: 'total_customer') required final int totalCustomer,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'transaction_type')
      final String? transactionType}) = _$AccountsReceivableDetailImpl;
  _AccountsReceivableDetail._() : super._();

  factory _AccountsReceivableDetail.fromJson(Map<String, dynamic> json) =
      _$AccountsReceivableDetailImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'customer')
  String get customer;
  @override
  @JsonKey(name: 'city_customer')
  String get cityCustomer;
  @override
  @JsonKey(name: 'address_customer')
  String get addressCustomer;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'total_customer')
  int get totalCustomer;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'transaction_type')
  String? get transactionType;

  /// Create a copy of AccountsReceivableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReceivableDetailImplCopyWith<_$AccountsReceivableDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
