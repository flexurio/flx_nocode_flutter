// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_payment_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsReceivablePaymentDetail _$AccountsReceivablePaymentDetailFromJson(
    Map<String, dynamic> json) {
  return _AccountsReceivablePaymentDetail.fromJson(json);
}

/// @nodoc
mixin _$AccountsReceivablePaymentDetail {
  @JsonKey(name: 'partner_id')
  String get partnerId => throw _privateConstructorUsedError;
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'paid_receivable_no')
  String get paidReceivableNo => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value')
  int get accountValue => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  /// Serializes this AccountsReceivablePaymentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsReceivablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivablePaymentDetailCopyWith<AccountsReceivablePaymentDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivablePaymentDetailCopyWith<$Res> {
  factory $AccountsReceivablePaymentDetailCopyWith(
          AccountsReceivablePaymentDetail value,
          $Res Function(AccountsReceivablePaymentDetail) then) =
      _$AccountsReceivablePaymentDetailCopyWithImpl<$Res,
          AccountsReceivablePaymentDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'partner_id') String partnerId,
      String customer,
      @JsonKey(name: 'paid_receivable_no') String paidReceivableNo,
      String remark,
      String date,
      @JsonKey(name: 'account_value') int accountValue,
      int? total});
}

/// @nodoc
class _$AccountsReceivablePaymentDetailCopyWithImpl<$Res,
        $Val extends AccountsReceivablePaymentDetail>
    implements $AccountsReceivablePaymentDetailCopyWith<$Res> {
  _$AccountsReceivablePaymentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerId = null,
    Object? customer = null,
    Object? paidReceivableNo = null,
    Object? remark = null,
    Object? date = null,
    Object? accountValue = null,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      paidReceivableNo: null == paidReceivableNo
          ? _value.paidReceivableNo
          : paidReceivableNo // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as int,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsReceivablePaymentDetailImplCopyWith<$Res>
    implements $AccountsReceivablePaymentDetailCopyWith<$Res> {
  factory _$$AccountsReceivablePaymentDetailImplCopyWith(
          _$AccountsReceivablePaymentDetailImpl value,
          $Res Function(_$AccountsReceivablePaymentDetailImpl) then) =
      __$$AccountsReceivablePaymentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'partner_id') String partnerId,
      String customer,
      @JsonKey(name: 'paid_receivable_no') String paidReceivableNo,
      String remark,
      String date,
      @JsonKey(name: 'account_value') int accountValue,
      int? total});
}

/// @nodoc
class __$$AccountsReceivablePaymentDetailImplCopyWithImpl<$Res>
    extends _$AccountsReceivablePaymentDetailCopyWithImpl<$Res,
        _$AccountsReceivablePaymentDetailImpl>
    implements _$$AccountsReceivablePaymentDetailImplCopyWith<$Res> {
  __$$AccountsReceivablePaymentDetailImplCopyWithImpl(
      _$AccountsReceivablePaymentDetailImpl _value,
      $Res Function(_$AccountsReceivablePaymentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partnerId = null,
    Object? customer = null,
    Object? paidReceivableNo = null,
    Object? remark = null,
    Object? date = null,
    Object? accountValue = null,
    Object? total = freezed,
  }) {
    return _then(_$AccountsReceivablePaymentDetailImpl(
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      paidReceivableNo: null == paidReceivableNo
          ? _value.paidReceivableNo
          : paidReceivableNo // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as int,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsReceivablePaymentDetailImpl
    extends _AccountsReceivablePaymentDetail {
  const _$AccountsReceivablePaymentDetailImpl(
      {@JsonKey(name: 'partner_id') required this.partnerId,
      required this.customer,
      @JsonKey(name: 'paid_receivable_no') required this.paidReceivableNo,
      required this.remark,
      required this.date,
      @JsonKey(name: 'account_value') required this.accountValue,
      this.total})
      : super._();

  factory _$AccountsReceivablePaymentDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccountsReceivablePaymentDetailImplFromJson(json);

  @override
  @JsonKey(name: 'partner_id')
  final String partnerId;
  @override
  final String customer;
  @override
  @JsonKey(name: 'paid_receivable_no')
  final String paidReceivableNo;
  @override
  final String remark;
  @override
  final String date;
  @override
  @JsonKey(name: 'account_value')
  final int accountValue;
  @override
  final int? total;

  @override
  String toString() {
    return 'AccountsReceivablePaymentDetail(partnerId: $partnerId, customer: $customer, paidReceivableNo: $paidReceivableNo, remark: $remark, date: $date, accountValue: $accountValue, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReceivablePaymentDetailImpl &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.paidReceivableNo, paidReceivableNo) ||
                other.paidReceivableNo == paidReceivableNo) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.accountValue, accountValue) ||
                other.accountValue == accountValue) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, partnerId, customer,
      paidReceivableNo, remark, date, accountValue, total);

  /// Create a copy of AccountsReceivablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReceivablePaymentDetailImplCopyWith<
          _$AccountsReceivablePaymentDetailImpl>
      get copyWith => __$$AccountsReceivablePaymentDetailImplCopyWithImpl<
          _$AccountsReceivablePaymentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsReceivablePaymentDetailImplToJson(
      this,
    );
  }
}

abstract class _AccountsReceivablePaymentDetail
    extends AccountsReceivablePaymentDetail {
  const factory _AccountsReceivablePaymentDetail(
      {@JsonKey(name: 'partner_id') required final String partnerId,
      required final String customer,
      @JsonKey(name: 'paid_receivable_no')
      required final String paidReceivableNo,
      required final String remark,
      required final String date,
      @JsonKey(name: 'account_value') required final int accountValue,
      final int? total}) = _$AccountsReceivablePaymentDetailImpl;
  const _AccountsReceivablePaymentDetail._() : super._();

  factory _AccountsReceivablePaymentDetail.fromJson(Map<String, dynamic> json) =
      _$AccountsReceivablePaymentDetailImpl.fromJson;

  @override
  @JsonKey(name: 'partner_id')
  String get partnerId;
  @override
  String get customer;
  @override
  @JsonKey(name: 'paid_receivable_no')
  String get paidReceivableNo;
  @override
  String get remark;
  @override
  String get date;
  @override
  @JsonKey(name: 'account_value')
  int get accountValue;
  @override
  int? get total;

  /// Create a copy of AccountsReceivablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReceivablePaymentDetailImplCopyWith<
          _$AccountsReceivablePaymentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
