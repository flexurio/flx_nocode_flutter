// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentDetail _$PaymentDetailFromJson(Map<String, dynamic> json) {
  return _PaymentDetail.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetail {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get chartOfAccount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo => throw _privateConstructorUsedError;

  /// Serializes this PaymentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDetailCopyWith<PaymentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailCopyWith<$Res> {
  factory $PaymentDetailCopyWith(
          PaymentDetail value, $Res Function(PaymentDetail) then) =
      _$PaymentDetailCopyWithImpl<$Res, PaymentDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      int id,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'value') double amount,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber chartOfAccount,
      String description,
      @JsonKey(name: 'invoice_no') String? invoiceNo});

  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccount;
}

/// @nodoc
class _$PaymentDetailCopyWithImpl<$Res, $Val extends PaymentDetail>
    implements $PaymentDetailCopyWith<$Res> {
  _$PaymentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? transactionId = null,
    Object? amount = null,
    Object? chartOfAccount = null,
    Object? description = null,
    Object? invoiceNo = freezed,
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
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      chartOfAccount: null == chartOfAccount
          ? _value.chartOfAccount
          : chartOfAccount // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PaymentDetail
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
abstract class _$$PaymentDetailImplCopyWith<$Res>
    implements $PaymentDetailCopyWith<$Res> {
  factory _$$PaymentDetailImplCopyWith(
          _$PaymentDetailImpl value, $Res Function(_$PaymentDetailImpl) then) =
      __$$PaymentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      int id,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'value') double amount,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber chartOfAccount,
      String description,
      @JsonKey(name: 'invoice_no') String? invoiceNo});

  @override
  $ChartOfAccountNumberCopyWith<$Res> get chartOfAccount;
}

/// @nodoc
class __$$PaymentDetailImplCopyWithImpl<$Res>
    extends _$PaymentDetailCopyWithImpl<$Res, _$PaymentDetailImpl>
    implements _$$PaymentDetailImplCopyWith<$Res> {
  __$$PaymentDetailImplCopyWithImpl(
      _$PaymentDetailImpl _value, $Res Function(_$PaymentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? transactionId = null,
    Object? amount = null,
    Object? chartOfAccount = null,
    Object? description = null,
    Object? invoiceNo = freezed,
  }) {
    return _then(_$PaymentDetailImpl(
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
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      chartOfAccount: null == chartOfAccount
          ? _value.chartOfAccount
          : chartOfAccount // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDetailImpl extends _PaymentDetail {
  _$PaymentDetailImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      required this.id,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'value') required this.amount,
      @JsonKey(
          name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
      required this.chartOfAccount,
      required this.description,
      @JsonKey(name: 'invoice_no') required this.invoiceNo})
      : super._();

  factory _$PaymentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDetailImplFromJson(json);

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
  final int id;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'value')
  final double amount;
  @override
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  final ChartOfAccountNumber chartOfAccount;
  @override
  final String description;
  @override
  @JsonKey(name: 'invoice_no')
  final String? invoiceNo;

  @override
  String toString() {
    return 'PaymentDetail(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, transactionId: $transactionId, amount: $amount, chartOfAccount: $chartOfAccount, description: $description, invoiceNo: $invoiceNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDetailImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.chartOfAccount, chartOfAccount) ||
                other.chartOfAccount == chartOfAccount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdById,
      updatedAt,
      updateById,
      id,
      transactionId,
      amount,
      chartOfAccount,
      description,
      invoiceNo);

  /// Create a copy of PaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDetailImplCopyWith<_$PaymentDetailImpl> get copyWith =>
      __$$PaymentDetailImplCopyWithImpl<_$PaymentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDetailImplToJson(
      this,
    );
  }
}

abstract class _PaymentDetail extends PaymentDetail {
  factory _PaymentDetail(
          {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'updated_by_id') required final int updateById,
          required final int id,
          @JsonKey(name: 'transaction_id') required final String transactionId,
          @JsonKey(name: 'value') required final double amount,
          @JsonKey(
              name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
          required final ChartOfAccountNumber chartOfAccount,
          required final String description,
          @JsonKey(name: 'invoice_no') required final String? invoiceNo}) =
      _$PaymentDetailImpl;
  _PaymentDetail._() : super._();

  factory _PaymentDetail.fromJson(Map<String, dynamic> json) =
      _$PaymentDetailImpl.fromJson;

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
  int get id;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'value')
  double get amount;
  @override
  @JsonKey(name: 'chart_of_account', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get chartOfAccount;
  @override
  String get description;
  @override
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo;

  /// Create a copy of PaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDetailImplCopyWith<_$PaymentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
