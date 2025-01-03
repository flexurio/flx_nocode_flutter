// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_payable_payment_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsPayablePaymentDetail _$AccountsPayablePaymentDetailFromJson(
    Map<String, dynamic> json) {
  return _AccountsPayablePaymentDetail.fromJson(json);
}

/// @nodoc
mixin _$AccountsPayablePaymentDetail {
  @JsonKey(name: 'transaction_date')
  String get transactionDate => throw _privateConstructorUsedError;
  String get remark => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_summary')
  double get totalSummary => throw _privateConstructorUsedError;
  String? get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String? get transactionNo => throw _privateConstructorUsedError;

  /// Serializes this AccountsPayablePaymentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsPayablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsPayablePaymentDetailCopyWith<AccountsPayablePaymentDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsPayablePaymentDetailCopyWith<$Res> {
  factory $AccountsPayablePaymentDetailCopyWith(
          AccountsPayablePaymentDetail value,
          $Res Function(AccountsPayablePaymentDetail) then) =
      _$AccountsPayablePaymentDetailCopyWithImpl<$Res,
          AccountsPayablePaymentDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date') String transactionDate,
      String remark,
      double total,
      @JsonKey(name: 'total_summary') double totalSummary,
      String? supplier,
      @JsonKey(name: 'transaction_no') String? transactionNo});
}

/// @nodoc
class _$AccountsPayablePaymentDetailCopyWithImpl<$Res,
        $Val extends AccountsPayablePaymentDetail>
    implements $AccountsPayablePaymentDetailCopyWith<$Res> {
  _$AccountsPayablePaymentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsPayablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? remark = null,
    Object? total = null,
    Object? totalSummary = null,
    Object? supplier = freezed,
    Object? transactionNo = freezed,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsPayablePaymentDetailImplCopyWith<$Res>
    implements $AccountsPayablePaymentDetailCopyWith<$Res> {
  factory _$$AccountsPayablePaymentDetailImplCopyWith(
          _$AccountsPayablePaymentDetailImpl value,
          $Res Function(_$AccountsPayablePaymentDetailImpl) then) =
      __$$AccountsPayablePaymentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date') String transactionDate,
      String remark,
      double total,
      @JsonKey(name: 'total_summary') double totalSummary,
      String? supplier,
      @JsonKey(name: 'transaction_no') String? transactionNo});
}

/// @nodoc
class __$$AccountsPayablePaymentDetailImplCopyWithImpl<$Res>
    extends _$AccountsPayablePaymentDetailCopyWithImpl<$Res,
        _$AccountsPayablePaymentDetailImpl>
    implements _$$AccountsPayablePaymentDetailImplCopyWith<$Res> {
  __$$AccountsPayablePaymentDetailImplCopyWithImpl(
      _$AccountsPayablePaymentDetailImpl _value,
      $Res Function(_$AccountsPayablePaymentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsPayablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? remark = null,
    Object? total = null,
    Object? totalSummary = null,
    Object? supplier = freezed,
    Object? transactionNo = freezed,
  }) {
    return _then(_$AccountsPayablePaymentDetailImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsPayablePaymentDetailImpl extends _AccountsPayablePaymentDetail {
  const _$AccountsPayablePaymentDetailImpl(
      {@JsonKey(name: 'transaction_date') required this.transactionDate,
      required this.remark,
      required this.total,
      @JsonKey(name: 'total_summary') required this.totalSummary,
      this.supplier,
      @JsonKey(name: 'transaction_no') this.transactionNo})
      : super._();

  factory _$AccountsPayablePaymentDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccountsPayablePaymentDetailImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_date')
  final String transactionDate;
  @override
  final String remark;
  @override
  final double total;
  @override
  @JsonKey(name: 'total_summary')
  final double totalSummary;
  @override
  final String? supplier;
  @override
  @JsonKey(name: 'transaction_no')
  final String? transactionNo;

  @override
  String toString() {
    return 'AccountsPayablePaymentDetail(transactionDate: $transactionDate, remark: $remark, total: $total, totalSummary: $totalSummary, supplier: $supplier, transactionNo: $transactionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsPayablePaymentDetailImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalSummary, totalSummary) ||
                other.totalSummary == totalSummary) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionDate, remark, total,
      totalSummary, supplier, transactionNo);

  /// Create a copy of AccountsPayablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsPayablePaymentDetailImplCopyWith<
          _$AccountsPayablePaymentDetailImpl>
      get copyWith => __$$AccountsPayablePaymentDetailImplCopyWithImpl<
          _$AccountsPayablePaymentDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsPayablePaymentDetailImplToJson(
      this,
    );
  }
}

abstract class _AccountsPayablePaymentDetail
    extends AccountsPayablePaymentDetail {
  const factory _AccountsPayablePaymentDetail(
      {@JsonKey(name: 'transaction_date') required final String transactionDate,
      required final String remark,
      required final double total,
      @JsonKey(name: 'total_summary') required final double totalSummary,
      final String? supplier,
      @JsonKey(name: 'transaction_no')
      final String? transactionNo}) = _$AccountsPayablePaymentDetailImpl;
  const _AccountsPayablePaymentDetail._() : super._();

  factory _AccountsPayablePaymentDetail.fromJson(Map<String, dynamic> json) =
      _$AccountsPayablePaymentDetailImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_date')
  String get transactionDate;
  @override
  String get remark;
  @override
  double get total;
  @override
  @JsonKey(name: 'total_summary')
  double get totalSummary;
  @override
  String? get supplier;
  @override
  @JsonKey(name: 'transaction_no')
  String? get transactionNo;

  /// Create a copy of AccountsPayablePaymentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsPayablePaymentDetailImplCopyWith<
          _$AccountsPayablePaymentDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
