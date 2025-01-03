// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debt_balance_global_invoice_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DebtBalanceGlobalInvoiceDate _$DebtBalanceGlobalInvoiceDateFromJson(
    Map<String, dynamic> json) {
  return _DebtBalanceGlobalInvoiceDate.fromJson(json);
}

/// @nodoc
mixin _$DebtBalanceGlobalInvoiceDate {
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value')
  int get accountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value_summary')
  double get accountValueSummary => throw _privateConstructorUsedError;

  /// Serializes this DebtBalanceGlobalInvoiceDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DebtBalanceGlobalInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtBalanceGlobalInvoiceDateCopyWith<DebtBalanceGlobalInvoiceDate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtBalanceGlobalInvoiceDateCopyWith<$Res> {
  factory $DebtBalanceGlobalInvoiceDateCopyWith(
          DebtBalanceGlobalInvoiceDate value,
          $Res Function(DebtBalanceGlobalInvoiceDate) then) =
      _$DebtBalanceGlobalInvoiceDateCopyWithImpl<$Res,
          DebtBalanceGlobalInvoiceDate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'account_value') int accountValue,
      @JsonKey(name: 'account_value_summary') double accountValueSummary});
}

/// @nodoc
class _$DebtBalanceGlobalInvoiceDateCopyWithImpl<$Res,
        $Val extends DebtBalanceGlobalInvoiceDate>
    implements $DebtBalanceGlobalInvoiceDateCopyWith<$Res> {
  _$DebtBalanceGlobalInvoiceDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebtBalanceGlobalInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierName = null,
    Object? accountValue = null,
    Object? accountValueSummary = null,
  }) {
    return _then(_value.copyWith(
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as int,
      accountValueSummary: null == accountValueSummary
          ? _value.accountValueSummary
          : accountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebtBalanceGlobalInvoiceDateImplCopyWith<$Res>
    implements $DebtBalanceGlobalInvoiceDateCopyWith<$Res> {
  factory _$$DebtBalanceGlobalInvoiceDateImplCopyWith(
          _$DebtBalanceGlobalInvoiceDateImpl value,
          $Res Function(_$DebtBalanceGlobalInvoiceDateImpl) then) =
      __$$DebtBalanceGlobalInvoiceDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'account_value') int accountValue,
      @JsonKey(name: 'account_value_summary') double accountValueSummary});
}

/// @nodoc
class __$$DebtBalanceGlobalInvoiceDateImplCopyWithImpl<$Res>
    extends _$DebtBalanceGlobalInvoiceDateCopyWithImpl<$Res,
        _$DebtBalanceGlobalInvoiceDateImpl>
    implements _$$DebtBalanceGlobalInvoiceDateImplCopyWith<$Res> {
  __$$DebtBalanceGlobalInvoiceDateImplCopyWithImpl(
      _$DebtBalanceGlobalInvoiceDateImpl _value,
      $Res Function(_$DebtBalanceGlobalInvoiceDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebtBalanceGlobalInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierName = null,
    Object? accountValue = null,
    Object? accountValueSummary = null,
  }) {
    return _then(_$DebtBalanceGlobalInvoiceDateImpl(
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as int,
      accountValueSummary: null == accountValueSummary
          ? _value.accountValueSummary
          : accountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebtBalanceGlobalInvoiceDateImpl extends _DebtBalanceGlobalInvoiceDate {
  const _$DebtBalanceGlobalInvoiceDateImpl(
      {@JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'account_value') required this.accountValue,
      @JsonKey(name: 'account_value_summary')
      required this.accountValueSummary})
      : super._();

  factory _$DebtBalanceGlobalInvoiceDateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DebtBalanceGlobalInvoiceDateImplFromJson(json);

  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'account_value')
  final int accountValue;
  @override
  @JsonKey(name: 'account_value_summary')
  final double accountValueSummary;

  @override
  String toString() {
    return 'DebtBalanceGlobalInvoiceDate(supplierName: $supplierName, accountValue: $accountValue, accountValueSummary: $accountValueSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtBalanceGlobalInvoiceDateImpl &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.accountValue, accountValue) ||
                other.accountValue == accountValue) &&
            (identical(other.accountValueSummary, accountValueSummary) ||
                other.accountValueSummary == accountValueSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, supplierName, accountValue, accountValueSummary);

  /// Create a copy of DebtBalanceGlobalInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtBalanceGlobalInvoiceDateImplCopyWith<
          _$DebtBalanceGlobalInvoiceDateImpl>
      get copyWith => __$$DebtBalanceGlobalInvoiceDateImplCopyWithImpl<
          _$DebtBalanceGlobalInvoiceDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebtBalanceGlobalInvoiceDateImplToJson(
      this,
    );
  }
}

abstract class _DebtBalanceGlobalInvoiceDate
    extends DebtBalanceGlobalInvoiceDate {
  const factory _DebtBalanceGlobalInvoiceDate(
          {@JsonKey(name: 'supplier_name') required final String supplierName,
          @JsonKey(name: 'account_value') required final int accountValue,
          @JsonKey(name: 'account_value_summary')
          required final double accountValueSummary}) =
      _$DebtBalanceGlobalInvoiceDateImpl;
  const _DebtBalanceGlobalInvoiceDate._() : super._();

  factory _DebtBalanceGlobalInvoiceDate.fromJson(Map<String, dynamic> json) =
      _$DebtBalanceGlobalInvoiceDateImpl.fromJson;

  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'account_value')
  int get accountValue;
  @override
  @JsonKey(name: 'account_value_summary')
  double get accountValueSummary;

  /// Create a copy of DebtBalanceGlobalInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtBalanceGlobalInvoiceDateImplCopyWith<
          _$DebtBalanceGlobalInvoiceDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
