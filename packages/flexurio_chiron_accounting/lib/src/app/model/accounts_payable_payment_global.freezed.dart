// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_payable_payment_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsPayablePaymentGlobal _$AccountsPayablePaymentGlobalFromJson(
    Map<String, dynamic> json) {
  return _AccountsPayablePaymentGlobal.fromJson(json);
}

/// @nodoc
mixin _$AccountsPayablePaymentGlobal {
  @JsonKey(name: 'supplier_id')
  String get supplierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_summary')
  double get totalSummary => throw _privateConstructorUsedError;

  /// Serializes this AccountsPayablePaymentGlobal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsPayablePaymentGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsPayablePaymentGlobalCopyWith<AccountsPayablePaymentGlobal>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsPayablePaymentGlobalCopyWith<$Res> {
  factory $AccountsPayablePaymentGlobalCopyWith(
          AccountsPayablePaymentGlobal value,
          $Res Function(AccountsPayablePaymentGlobal) then) =
      _$AccountsPayablePaymentGlobalCopyWithImpl<$Res,
          AccountsPayablePaymentGlobal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_id') String supplierId,
      @JsonKey(name: 'supplier_name') String supplierName,
      double total,
      @JsonKey(name: 'total_summary') double totalSummary});
}

/// @nodoc
class _$AccountsPayablePaymentGlobalCopyWithImpl<$Res,
        $Val extends AccountsPayablePaymentGlobal>
    implements $AccountsPayablePaymentGlobalCopyWith<$Res> {
  _$AccountsPayablePaymentGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsPayablePaymentGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierId = null,
    Object? supplierName = null,
    Object? total = null,
    Object? totalSummary = null,
  }) {
    return _then(_value.copyWith(
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsPayablePaymentGlobalImplCopyWith<$Res>
    implements $AccountsPayablePaymentGlobalCopyWith<$Res> {
  factory _$$AccountsPayablePaymentGlobalImplCopyWith(
          _$AccountsPayablePaymentGlobalImpl value,
          $Res Function(_$AccountsPayablePaymentGlobalImpl) then) =
      __$$AccountsPayablePaymentGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_id') String supplierId,
      @JsonKey(name: 'supplier_name') String supplierName,
      double total,
      @JsonKey(name: 'total_summary') double totalSummary});
}

/// @nodoc
class __$$AccountsPayablePaymentGlobalImplCopyWithImpl<$Res>
    extends _$AccountsPayablePaymentGlobalCopyWithImpl<$Res,
        _$AccountsPayablePaymentGlobalImpl>
    implements _$$AccountsPayablePaymentGlobalImplCopyWith<$Res> {
  __$$AccountsPayablePaymentGlobalImplCopyWithImpl(
      _$AccountsPayablePaymentGlobalImpl _value,
      $Res Function(_$AccountsPayablePaymentGlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsPayablePaymentGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierId = null,
    Object? supplierName = null,
    Object? total = null,
    Object? totalSummary = null,
  }) {
    return _then(_$AccountsPayablePaymentGlobalImpl(
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsPayablePaymentGlobalImpl extends _AccountsPayablePaymentGlobal {
  const _$AccountsPayablePaymentGlobalImpl(
      {@JsonKey(name: 'supplier_id') required this.supplierId,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      required this.total,
      @JsonKey(name: 'total_summary') required this.totalSummary})
      : super._();

  factory _$AccountsPayablePaymentGlobalImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccountsPayablePaymentGlobalImplFromJson(json);

  @override
  @JsonKey(name: 'supplier_id')
  final String supplierId;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  final double total;
  @override
  @JsonKey(name: 'total_summary')
  final double totalSummary;

  @override
  String toString() {
    return 'AccountsPayablePaymentGlobal(supplierId: $supplierId, supplierName: $supplierName, total: $total, totalSummary: $totalSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsPayablePaymentGlobalImpl &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalSummary, totalSummary) ||
                other.totalSummary == totalSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, supplierId, supplierName, total, totalSummary);

  /// Create a copy of AccountsPayablePaymentGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsPayablePaymentGlobalImplCopyWith<
          _$AccountsPayablePaymentGlobalImpl>
      get copyWith => __$$AccountsPayablePaymentGlobalImplCopyWithImpl<
          _$AccountsPayablePaymentGlobalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsPayablePaymentGlobalImplToJson(
      this,
    );
  }
}

abstract class _AccountsPayablePaymentGlobal
    extends AccountsPayablePaymentGlobal {
  const factory _AccountsPayablePaymentGlobal(
          {@JsonKey(name: 'supplier_id') required final String supplierId,
          @JsonKey(name: 'supplier_name') required final String supplierName,
          required final double total,
          @JsonKey(name: 'total_summary') required final double totalSummary}) =
      _$AccountsPayablePaymentGlobalImpl;
  const _AccountsPayablePaymentGlobal._() : super._();

  factory _AccountsPayablePaymentGlobal.fromJson(Map<String, dynamic> json) =
      _$AccountsPayablePaymentGlobalImpl.fromJson;

  @override
  @JsonKey(name: 'supplier_id')
  String get supplierId;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  double get total;
  @override
  @JsonKey(name: 'total_summary')
  double get totalSummary;

  /// Create a copy of AccountsPayablePaymentGlobal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsPayablePaymentGlobalImplCopyWith<
          _$AccountsPayablePaymentGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
