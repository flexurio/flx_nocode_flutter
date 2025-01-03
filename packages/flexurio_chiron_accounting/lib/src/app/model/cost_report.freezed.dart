// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CostReport _$CostReportFromJson(Map<String, dynamic> json) {
  return _CostReport.fromJson(json);
}

/// @nodoc
mixin _$CostReport {
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_name')
  String get chartOfAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'debit')
  double get debit => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit')
  double get credit => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;

  /// Serializes this CostReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CostReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CostReportCopyWith<CostReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostReportCopyWith<$Res> {
  factory $CostReportCopyWith(
          CostReport value, $Res Function(CostReport) then) =
      _$CostReportCopyWithImpl<$Res, CostReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'chart_of_account_id') String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String chartOfAccountName,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'department_id') String departmentId,
      @JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'debit') double debit,
      @JsonKey(name: 'credit') double credit,
      @JsonKey(name: 'description') String description});
}

/// @nodoc
class _$CostReportCopyWithImpl<$Res, $Val extends CostReport>
    implements $CostReportCopyWith<$Res> {
  _$CostReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CostReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartOfAccountId = null,
    Object? chartOfAccountName = null,
    Object? transactionNo = null,
    Object? departmentId = null,
    Object? departmentName = null,
    Object? debit = null,
    Object? credit = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountName: null == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CostReportImplCopyWith<$Res>
    implements $CostReportCopyWith<$Res> {
  factory _$$CostReportImplCopyWith(
          _$CostReportImpl value, $Res Function(_$CostReportImpl) then) =
      __$$CostReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'chart_of_account_id') String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String chartOfAccountName,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'department_id') String departmentId,
      @JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'debit') double debit,
      @JsonKey(name: 'credit') double credit,
      @JsonKey(name: 'description') String description});
}

/// @nodoc
class __$$CostReportImplCopyWithImpl<$Res>
    extends _$CostReportCopyWithImpl<$Res, _$CostReportImpl>
    implements _$$CostReportImplCopyWith<$Res> {
  __$$CostReportImplCopyWithImpl(
      _$CostReportImpl _value, $Res Function(_$CostReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of CostReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chartOfAccountId = null,
    Object? chartOfAccountName = null,
    Object? transactionNo = null,
    Object? departmentId = null,
    Object? departmentName = null,
    Object? debit = null,
    Object? credit = null,
    Object? description = null,
  }) {
    return _then(_$CostReportImpl(
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountName: null == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CostReportImpl extends _CostReport {
  const _$CostReportImpl(
      {@JsonKey(name: 'chart_of_account_id') required this.chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') required this.chartOfAccountName,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'department_id') required this.departmentId,
      @JsonKey(name: 'department_name') required this.departmentName,
      @JsonKey(name: 'debit') required this.debit,
      @JsonKey(name: 'credit') required this.credit,
      @JsonKey(name: 'description') required this.description})
      : super._();

  factory _$CostReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$CostReportImplFromJson(json);

  @override
  @JsonKey(name: 'chart_of_account_id')
  final String chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  final String chartOfAccountName;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'department_id')
  final String departmentId;
  @override
  @JsonKey(name: 'department_name')
  final String departmentName;
  @override
  @JsonKey(name: 'debit')
  final double debit;
  @override
  @JsonKey(name: 'credit')
  final double credit;
  @override
  @JsonKey(name: 'description')
  final String description;

  @override
  String toString() {
    return 'CostReport(chartOfAccountId: $chartOfAccountId, chartOfAccountName: $chartOfAccountName, transactionNo: $transactionNo, departmentId: $departmentId, departmentName: $departmentName, debit: $debit, credit: $credit, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CostReportImpl &&
            (identical(other.chartOfAccountId, chartOfAccountId) ||
                other.chartOfAccountId == chartOfAccountId) &&
            (identical(other.chartOfAccountName, chartOfAccountName) ||
                other.chartOfAccountName == chartOfAccountName) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chartOfAccountId,
      chartOfAccountName,
      transactionNo,
      departmentId,
      departmentName,
      debit,
      credit,
      description);

  /// Create a copy of CostReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CostReportImplCopyWith<_$CostReportImpl> get copyWith =>
      __$$CostReportImplCopyWithImpl<_$CostReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CostReportImplToJson(
      this,
    );
  }
}

abstract class _CostReport extends CostReport {
  const factory _CostReport(
      {@JsonKey(name: 'chart_of_account_id')
      required final String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name')
      required final String chartOfAccountName,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'department_id') required final String departmentId,
      @JsonKey(name: 'department_name') required final String departmentName,
      @JsonKey(name: 'debit') required final double debit,
      @JsonKey(name: 'credit') required final double credit,
      @JsonKey(name: 'description')
      required final String description}) = _$CostReportImpl;
  const _CostReport._() : super._();

  factory _CostReport.fromJson(Map<String, dynamic> json) =
      _$CostReportImpl.fromJson;

  @override
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  String get chartOfAccountName;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'department_id')
  String get departmentId;
  @override
  @JsonKey(name: 'department_name')
  String get departmentName;
  @override
  @JsonKey(name: 'debit')
  double get debit;
  @override
  @JsonKey(name: 'credit')
  double get credit;
  @override
  @JsonKey(name: 'description')
  String get description;

  /// Create a copy of CostReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CostReportImplCopyWith<_$CostReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
