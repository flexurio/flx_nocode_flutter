// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
mixin _$Payment {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(fromJson: PaymentType.fromString)
  PaymentType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ku_cost')
  double get kuCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'stamp_cost')
  double get stampCost => throw _privateConstructorUsedError;
  double get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'art_cost')
  double get artCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_cost')
  double get otherCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate_gap')
  double get rateGap => throw _privateConstructorUsedError;
  @JsonKey(name: 'down_payment')
  double get downPayment => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Department.fromJson)
  Department? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value')
  double get accountAmount => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_repayment')
  String? get chartOfAccountRepayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get chartOfAccount => throw _privateConstructorUsedError;
  bool? get tb => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_id')
  String? get partnerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'partner_name')
  String? get partnerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_receivable_no')
  String? get paidReceivableNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_code')
  String? get transactionCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name', defaultValue: '')
  String get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number', defaultValue: '')
  String get accountNumber => throw _privateConstructorUsedError;

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res, Payment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(fromJson: PaymentType.fromString) PaymentType type,
      @JsonKey(name: 'total') double totalAmount,
      @JsonKey(name: 'ku_cost') double kuCost,
      @JsonKey(name: 'stamp_cost') double stampCost,
      double rounding,
      @JsonKey(name: 'art_cost') double artCost,
      @JsonKey(name: 'other_cost') double otherCost,
      @JsonKey(name: 'rate_gap') double rateGap,
      @JsonKey(name: 'down_payment') double downPayment,
      double rate,
      @JsonKey(fromJson: Department.fromJson) Department? department,
      @JsonKey(name: 'account_value') double accountAmount,
      String remark,
      @JsonKey(name: 'chart_of_account_repayment')
      String? chartOfAccountRepayment,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber chartOfAccount,
      bool? tb,
      @JsonKey(name: 'partner_id') String? partnerId,
      @JsonKey(name: 'partner_name') String? partnerName,
      @JsonKey(name: 'paid_receivable_no') String? paidReceivableNo,
      @JsonKey(name: 'transaction_code') String? transactionCode,
      @JsonKey(name: 'account_name', defaultValue: '') String accountName,
      @JsonKey(name: 'account_number', defaultValue: '') String accountNumber});

  $DepartmentCopyWith<$Res>? get department;
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccount;
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res, $Val extends Payment>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? totalAmount = null,
    Object? kuCost = null,
    Object? stampCost = null,
    Object? rounding = null,
    Object? artCost = null,
    Object? otherCost = null,
    Object? rateGap = null,
    Object? downPayment = null,
    Object? rate = null,
    Object? department = freezed,
    Object? accountAmount = null,
    Object? remark = null,
    Object? chartOfAccountRepayment = freezed,
    Object? chartOfAccount = null,
    Object? tb = freezed,
    Object? partnerId = freezed,
    Object? partnerName = freezed,
    Object? paidReceivableNo = freezed,
    Object? transactionCode = freezed,
    Object? accountName = null,
    Object? accountNumber = null,
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      kuCost: null == kuCost
          ? _value.kuCost
          : kuCost // ignore: cast_nullable_to_non_nullable
              as double,
      stampCost: null == stampCost
          ? _value.stampCost
          : stampCost // ignore: cast_nullable_to_non_nullable
              as double,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double,
      artCost: null == artCost
          ? _value.artCost
          : artCost // ignore: cast_nullable_to_non_nullable
              as double,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as double,
      rateGap: null == rateGap
          ? _value.rateGap
          : rateGap // ignore: cast_nullable_to_non_nullable
              as double,
      downPayment: null == downPayment
          ? _value.downPayment
          : downPayment // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
      accountAmount: null == accountAmount
          ? _value.accountAmount
          : accountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountRepayment: freezed == chartOfAccountRepayment
          ? _value.chartOfAccountRepayment
          : chartOfAccountRepayment // ignore: cast_nullable_to_non_nullable
              as String?,
      chartOfAccount: null == chartOfAccount
          ? _value.chartOfAccount
          : chartOfAccount // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      tb: freezed == tb
          ? _value.tb
          : tb // ignore: cast_nullable_to_non_nullable
              as bool?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerName: freezed == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String?,
      paidReceivableNo: freezed == paidReceivableNo
          ? _value.paidReceivableNo
          : paidReceivableNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionCode: freezed == transactionCode
          ? _value.transactionCode
          : transactionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res>? get department {
    if (_value.department == null) {
      return null;
    }

    return $DepartmentCopyWith<$Res>(_value.department!, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccount {
    return $ChartOfAccountNumberCopyWith<$Res>(_value.chartOfAccount, (value) {
      return _then(_value.copyWith(chartOfAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(fromJson: PaymentType.fromString) PaymentType type,
      @JsonKey(name: 'total') double totalAmount,
      @JsonKey(name: 'ku_cost') double kuCost,
      @JsonKey(name: 'stamp_cost') double stampCost,
      double rounding,
      @JsonKey(name: 'art_cost') double artCost,
      @JsonKey(name: 'other_cost') double otherCost,
      @JsonKey(name: 'rate_gap') double rateGap,
      @JsonKey(name: 'down_payment') double downPayment,
      double rate,
      @JsonKey(fromJson: Department.fromJson) Department? department,
      @JsonKey(name: 'account_value') double accountAmount,
      String remark,
      @JsonKey(name: 'chart_of_account_repayment')
      String? chartOfAccountRepayment,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber chartOfAccount,
      bool? tb,
      @JsonKey(name: 'partner_id') String? partnerId,
      @JsonKey(name: 'partner_name') String? partnerName,
      @JsonKey(name: 'paid_receivable_no') String? paidReceivableNo,
      @JsonKey(name: 'transaction_code') String? transactionCode,
      @JsonKey(name: 'account_name', defaultValue: '') String accountName,
      @JsonKey(name: 'account_number', defaultValue: '') String accountNumber});

  @override
  $DepartmentCopyWith<$Res>? get department;
  @override
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccount;
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$PaymentCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? date = null,
    Object? type = null,
    Object? totalAmount = null,
    Object? kuCost = null,
    Object? stampCost = null,
    Object? rounding = null,
    Object? artCost = null,
    Object? otherCost = null,
    Object? rateGap = null,
    Object? downPayment = null,
    Object? rate = null,
    Object? department = freezed,
    Object? accountAmount = null,
    Object? remark = null,
    Object? chartOfAccountRepayment = freezed,
    Object? chartOfAccount = null,
    Object? tb = freezed,
    Object? partnerId = freezed,
    Object? partnerName = freezed,
    Object? paidReceivableNo = freezed,
    Object? transactionCode = freezed,
    Object? accountName = null,
    Object? accountNumber = null,
  }) {
    return _then(_$PaymentImpl(
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      kuCost: null == kuCost
          ? _value.kuCost
          : kuCost // ignore: cast_nullable_to_non_nullable
              as double,
      stampCost: null == stampCost
          ? _value.stampCost
          : stampCost // ignore: cast_nullable_to_non_nullable
              as double,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double,
      artCost: null == artCost
          ? _value.artCost
          : artCost // ignore: cast_nullable_to_non_nullable
              as double,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as double,
      rateGap: null == rateGap
          ? _value.rateGap
          : rateGap // ignore: cast_nullable_to_non_nullable
              as double,
      downPayment: null == downPayment
          ? _value.downPayment
          : downPayment // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
      accountAmount: null == accountAmount
          ? _value.accountAmount
          : accountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountRepayment: freezed == chartOfAccountRepayment
          ? _value.chartOfAccountRepayment
          : chartOfAccountRepayment // ignore: cast_nullable_to_non_nullable
              as String?,
      chartOfAccount: null == chartOfAccount
          ? _value.chartOfAccount
          : chartOfAccount // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      tb: freezed == tb
          ? _value.tb
          : tb // ignore: cast_nullable_to_non_nullable
              as bool?,
      partnerId: freezed == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String?,
      partnerName: freezed == partnerName
          ? _value.partnerName
          : partnerName // ignore: cast_nullable_to_non_nullable
              as String?,
      paidReceivableNo: freezed == paidReceivableNo
          ? _value.paidReceivableNo
          : paidReceivableNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionCode: freezed == transactionCode
          ? _value.transactionCode
          : transactionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentImpl extends _Payment {
  _$PaymentImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) required this.date,
      @JsonKey(fromJson: PaymentType.fromString) required this.type,
      @JsonKey(name: 'total') required this.totalAmount,
      @JsonKey(name: 'ku_cost') required this.kuCost,
      @JsonKey(name: 'stamp_cost') required this.stampCost,
      required this.rounding,
      @JsonKey(name: 'art_cost') required this.artCost,
      @JsonKey(name: 'other_cost') required this.otherCost,
      @JsonKey(name: 'rate_gap') required this.rateGap,
      @JsonKey(name: 'down_payment') required this.downPayment,
      required this.rate,
      @JsonKey(fromJson: Department.fromJson) required this.department,
      @JsonKey(name: 'account_value') required this.accountAmount,
      required this.remark,
      @JsonKey(name: 'chart_of_account_repayment') this.chartOfAccountRepayment,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      required this.chartOfAccount,
      this.tb,
      @JsonKey(name: 'partner_id') this.partnerId,
      @JsonKey(name: 'partner_name') this.partnerName,
      @JsonKey(name: 'paid_receivable_no') this.paidReceivableNo,
      @JsonKey(name: 'transaction_code') this.transactionCode,
      @JsonKey(name: 'account_name', defaultValue: '')
      required this.accountName,
      @JsonKey(name: 'account_number', defaultValue: '')
      required this.accountNumber})
      : super._();

  factory _$PaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentImplFromJson(json);

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
  final int updateById;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(fromJson: PaymentType.fromString)
  final PaymentType type;
  @override
  @JsonKey(name: 'total')
  final double totalAmount;
  @override
  @JsonKey(name: 'ku_cost')
  final double kuCost;
  @override
  @JsonKey(name: 'stamp_cost')
  final double stampCost;
  @override
  final double rounding;
  @override
  @JsonKey(name: 'art_cost')
  final double artCost;
  @override
  @JsonKey(name: 'other_cost')
  final double otherCost;
  @override
  @JsonKey(name: 'rate_gap')
  final double rateGap;
  @override
  @JsonKey(name: 'down_payment')
  final double downPayment;
  @override
  final double rate;
  @override
  @JsonKey(fromJson: Department.fromJson)
  final Department? department;
  @override
  @JsonKey(name: 'account_value')
  final double accountAmount;
  @override
  final String remark;
  @override
  @JsonKey(name: 'chart_of_account_repayment')
  final String? chartOfAccountRepayment;
  @override
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  final ChartOfAccountNumber chartOfAccount;
  @override
  final bool? tb;
  @override
  @JsonKey(name: 'partner_id')
  final String? partnerId;
  @override
  @JsonKey(name: 'partner_name')
  final String? partnerName;
  @override
  @JsonKey(name: 'paid_receivable_no')
  final String? paidReceivableNo;
  @override
  @JsonKey(name: 'transaction_code')
  final String? transactionCode;
  @override
  @JsonKey(name: 'account_name', defaultValue: '')
  final String accountName;
  @override
  @JsonKey(name: 'account_number', defaultValue: '')
  final String accountNumber;

  @override
  String toString() {
    return 'Payment(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, date: $date, type: $type, totalAmount: $totalAmount, kuCost: $kuCost, stampCost: $stampCost, rounding: $rounding, artCost: $artCost, otherCost: $otherCost, rateGap: $rateGap, downPayment: $downPayment, rate: $rate, department: $department, accountAmount: $accountAmount, remark: $remark, chartOfAccountRepayment: $chartOfAccountRepayment, chartOfAccount: $chartOfAccount, tb: $tb, partnerId: $partnerId, partnerName: $partnerName, paidReceivableNo: $paidReceivableNo, transactionCode: $transactionCode, accountName: $accountName, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.kuCost, kuCost) || other.kuCost == kuCost) &&
            (identical(other.stampCost, stampCost) ||
                other.stampCost == stampCost) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.artCost, artCost) || other.artCost == artCost) &&
            (identical(other.otherCost, otherCost) ||
                other.otherCost == otherCost) &&
            (identical(other.rateGap, rateGap) || other.rateGap == rateGap) &&
            (identical(other.downPayment, downPayment) ||
                other.downPayment == downPayment) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.accountAmount, accountAmount) ||
                other.accountAmount == accountAmount) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(
                    other.chartOfAccountRepayment, chartOfAccountRepayment) ||
                other.chartOfAccountRepayment == chartOfAccountRepayment) &&
            (identical(other.chartOfAccount, chartOfAccount) ||
                other.chartOfAccount == chartOfAccount) &&
            (identical(other.tb, tb) || other.tb == tb) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.partnerName, partnerName) ||
                other.partnerName == partnerName) &&
            (identical(other.paidReceivableNo, paidReceivableNo) ||
                other.paidReceivableNo == paidReceivableNo) &&
            (identical(other.transactionCode, transactionCode) ||
                other.transactionCode == transactionCode) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        createdById,
        updatedAt,
        updateById,
        id,
        date,
        type,
        totalAmount,
        kuCost,
        stampCost,
        rounding,
        artCost,
        otherCost,
        rateGap,
        downPayment,
        rate,
        department,
        accountAmount,
        remark,
        chartOfAccountRepayment,
        chartOfAccount,
        tb,
        partnerId,
        partnerName,
        paidReceivableNo,
        transactionCode,
        accountName,
        accountNumber
      ]);

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      __$$PaymentImplCopyWithImpl<_$PaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentImplToJson(
      this,
    );
  }
}

abstract class _Payment extends Payment {
  factory _Payment(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime)
      required final DateTime date,
      @JsonKey(fromJson: PaymentType.fromString)
      required final PaymentType type,
      @JsonKey(name: 'total') required final double totalAmount,
      @JsonKey(name: 'ku_cost') required final double kuCost,
      @JsonKey(name: 'stamp_cost') required final double stampCost,
      required final double rounding,
      @JsonKey(name: 'art_cost') required final double artCost,
      @JsonKey(name: 'other_cost') required final double otherCost,
      @JsonKey(name: 'rate_gap') required final double rateGap,
      @JsonKey(name: 'down_payment') required final double downPayment,
      required final double rate,
      @JsonKey(fromJson: Department.fromJson)
      required final Department? department,
      @JsonKey(name: 'account_value') required final double accountAmount,
      required final String remark,
      @JsonKey(name: 'chart_of_account_repayment')
      final String? chartOfAccountRepayment,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      required final ChartOfAccountNumber chartOfAccount,
      final bool? tb,
      @JsonKey(name: 'partner_id') final String? partnerId,
      @JsonKey(name: 'partner_name') final String? partnerName,
      @JsonKey(name: 'paid_receivable_no') final String? paidReceivableNo,
      @JsonKey(name: 'transaction_code') final String? transactionCode,
      @JsonKey(name: 'account_name', defaultValue: '')
      required final String accountName,
      @JsonKey(name: 'account_number', defaultValue: '')
      required final String accountNumber}) = _$PaymentImpl;
  _Payment._() : super._();

  factory _Payment.fromJson(Map<String, dynamic> json) = _$PaymentImpl.fromJson;

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
  int get updateById;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(fromJson: PaymentType.fromString)
  PaymentType get type;
  @override
  @JsonKey(name: 'total')
  double get totalAmount;
  @override
  @JsonKey(name: 'ku_cost')
  double get kuCost;
  @override
  @JsonKey(name: 'stamp_cost')
  double get stampCost;
  @override
  double get rounding;
  @override
  @JsonKey(name: 'art_cost')
  double get artCost;
  @override
  @JsonKey(name: 'other_cost')
  double get otherCost;
  @override
  @JsonKey(name: 'rate_gap')
  double get rateGap;
  @override
  @JsonKey(name: 'down_payment')
  double get downPayment;
  @override
  double get rate;
  @override
  @JsonKey(fromJson: Department.fromJson)
  Department? get department;
  @override
  @JsonKey(name: 'account_value')
  double get accountAmount;
  @override
  String get remark;
  @override
  @JsonKey(name: 'chart_of_account_repayment')
  String? get chartOfAccountRepayment;
  @override
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get chartOfAccount;
  @override
  bool? get tb;
  @override
  @JsonKey(name: 'partner_id')
  String? get partnerId;
  @override
  @JsonKey(name: 'partner_name')
  String? get partnerName;
  @override
  @JsonKey(name: 'paid_receivable_no')
  String? get paidReceivableNo;
  @override
  @JsonKey(name: 'transaction_code')
  String? get transactionCode;
  @override
  @JsonKey(name: 'account_name', defaultValue: '')
  String get accountName;
  @override
  @JsonKey(name: 'account_number', defaultValue: '')
  String get accountNumber;

  /// Create a copy of Payment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentImplCopyWith<_$PaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
