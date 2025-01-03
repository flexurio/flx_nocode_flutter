// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_settlement_new.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentSettlementNew _$PaymentSettlementNewFromJson(Map<String, dynamic> json) {
  return _PaymentSettlementNew.fromJson(json);
}

/// @nodoc
mixin _$PaymentSettlementNew {
  @JsonKey(name: 'remark')
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  String get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_transaction')
  int get valueTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'ku_cost')
  int get kuCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'stamp_cost')
  int get stampCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'rounding')
  int get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'art_cost')
  int get artCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_cost')
  int get otherCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate_gap')
  int get rateGap => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PaymentSettlementNew to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentSettlementNew
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentSettlementNewCopyWith<PaymentSettlementNew> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSettlementNewCopyWith<$Res> {
  factory $PaymentSettlementNewCopyWith(PaymentSettlementNew value,
          $Res Function(PaymentSettlementNew) then) =
      _$PaymentSettlementNewCopyWithImpl<$Res, PaymentSettlementNew>;
  @useResult
  $Res call(
      {@JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'transaction_date') String transactionDate,
      @JsonKey(name: 'value') int value,
      @JsonKey(name: 'value_transaction') int valueTransaction,
      @JsonKey(name: 'ku_cost') int kuCost,
      @JsonKey(name: 'stamp_cost') int stampCost,
      @JsonKey(name: 'rounding') int rounding,
      @JsonKey(name: 'art_cost') int artCost,
      @JsonKey(name: 'other_cost') int otherCost,
      @JsonKey(name: 'rate_gap') int rateGap,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class _$PaymentSettlementNewCopyWithImpl<$Res,
        $Val extends PaymentSettlementNew>
    implements $PaymentSettlementNewCopyWith<$Res> {
  _$PaymentSettlementNewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentSettlementNew
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remark = null,
    Object? customerName = null,
    Object? description = freezed,
    Object? transactionDate = null,
    Object? value = null,
    Object? valueTransaction = null,
    Object? kuCost = null,
    Object? stampCost = null,
    Object? rounding = null,
    Object? artCost = null,
    Object? otherCost = null,
    Object? rateGap = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueTransaction: null == valueTransaction
          ? _value.valueTransaction
          : valueTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      kuCost: null == kuCost
          ? _value.kuCost
          : kuCost // ignore: cast_nullable_to_non_nullable
              as int,
      stampCost: null == stampCost
          ? _value.stampCost
          : stampCost // ignore: cast_nullable_to_non_nullable
              as int,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int,
      artCost: null == artCost
          ? _value.artCost
          : artCost // ignore: cast_nullable_to_non_nullable
              as int,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as int,
      rateGap: null == rateGap
          ? _value.rateGap
          : rateGap // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSettlementNewImplCopyWith<$Res>
    implements $PaymentSettlementNewCopyWith<$Res> {
  factory _$$PaymentSettlementNewImplCopyWith(_$PaymentSettlementNewImpl value,
          $Res Function(_$PaymentSettlementNewImpl) then) =
      __$$PaymentSettlementNewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'transaction_date') String transactionDate,
      @JsonKey(name: 'value') int value,
      @JsonKey(name: 'value_transaction') int valueTransaction,
      @JsonKey(name: 'ku_cost') int kuCost,
      @JsonKey(name: 'stamp_cost') int stampCost,
      @JsonKey(name: 'rounding') int rounding,
      @JsonKey(name: 'art_cost') int artCost,
      @JsonKey(name: 'other_cost') int otherCost,
      @JsonKey(name: 'rate_gap') int rateGap,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class __$$PaymentSettlementNewImplCopyWithImpl<$Res>
    extends _$PaymentSettlementNewCopyWithImpl<$Res, _$PaymentSettlementNewImpl>
    implements _$$PaymentSettlementNewImplCopyWith<$Res> {
  __$$PaymentSettlementNewImplCopyWithImpl(_$PaymentSettlementNewImpl _value,
      $Res Function(_$PaymentSettlementNewImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentSettlementNew
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remark = null,
    Object? customerName = null,
    Object? description = freezed,
    Object? transactionDate = null,
    Object? value = null,
    Object? valueTransaction = null,
    Object? kuCost = null,
    Object? stampCost = null,
    Object? rounding = null,
    Object? artCost = null,
    Object? otherCost = null,
    Object? rateGap = null,
    Object? total = null,
  }) {
    return _then(_$PaymentSettlementNewImpl(
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueTransaction: null == valueTransaction
          ? _value.valueTransaction
          : valueTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      kuCost: null == kuCost
          ? _value.kuCost
          : kuCost // ignore: cast_nullable_to_non_nullable
              as int,
      stampCost: null == stampCost
          ? _value.stampCost
          : stampCost // ignore: cast_nullable_to_non_nullable
              as int,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as int,
      artCost: null == artCost
          ? _value.artCost
          : artCost // ignore: cast_nullable_to_non_nullable
              as int,
      otherCost: null == otherCost
          ? _value.otherCost
          : otherCost // ignore: cast_nullable_to_non_nullable
              as int,
      rateGap: null == rateGap
          ? _value.rateGap
          : rateGap // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentSettlementNewImpl extends _PaymentSettlementNew {
  const _$PaymentSettlementNewImpl(
      {@JsonKey(name: 'remark') required this.remark,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'transaction_date') required this.transactionDate,
      @JsonKey(name: 'value') required this.value,
      @JsonKey(name: 'value_transaction') required this.valueTransaction,
      @JsonKey(name: 'ku_cost') required this.kuCost,
      @JsonKey(name: 'stamp_cost') required this.stampCost,
      @JsonKey(name: 'rounding') required this.rounding,
      @JsonKey(name: 'art_cost') required this.artCost,
      @JsonKey(name: 'other_cost') required this.otherCost,
      @JsonKey(name: 'rate_gap') required this.rateGap,
      @JsonKey(name: 'total') required this.total})
      : super._();

  factory _$PaymentSettlementNewImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentSettlementNewImplFromJson(json);

  @override
  @JsonKey(name: 'remark')
  final String remark;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'transaction_date')
  final String transactionDate;
  @override
  @JsonKey(name: 'value')
  final int value;
  @override
  @JsonKey(name: 'value_transaction')
  final int valueTransaction;
  @override
  @JsonKey(name: 'ku_cost')
  final int kuCost;
  @override
  @JsonKey(name: 'stamp_cost')
  final int stampCost;
  @override
  @JsonKey(name: 'rounding')
  final int rounding;
  @override
  @JsonKey(name: 'art_cost')
  final int artCost;
  @override
  @JsonKey(name: 'other_cost')
  final int otherCost;
  @override
  @JsonKey(name: 'rate_gap')
  final int rateGap;
  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  String toString() {
    return 'PaymentSettlementNew(remark: $remark, customerName: $customerName, description: $description, transactionDate: $transactionDate, value: $value, valueTransaction: $valueTransaction, kuCost: $kuCost, stampCost: $stampCost, rounding: $rounding, artCost: $artCost, otherCost: $otherCost, rateGap: $rateGap, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSettlementNewImpl &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueTransaction, valueTransaction) ||
                other.valueTransaction == valueTransaction) &&
            (identical(other.kuCost, kuCost) || other.kuCost == kuCost) &&
            (identical(other.stampCost, stampCost) ||
                other.stampCost == stampCost) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.artCost, artCost) || other.artCost == artCost) &&
            (identical(other.otherCost, otherCost) ||
                other.otherCost == otherCost) &&
            (identical(other.rateGap, rateGap) || other.rateGap == rateGap) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      remark,
      customerName,
      description,
      transactionDate,
      value,
      valueTransaction,
      kuCost,
      stampCost,
      rounding,
      artCost,
      otherCost,
      rateGap,
      total);

  /// Create a copy of PaymentSettlementNew
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSettlementNewImplCopyWith<_$PaymentSettlementNewImpl>
      get copyWith =>
          __$$PaymentSettlementNewImplCopyWithImpl<_$PaymentSettlementNewImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentSettlementNewImplToJson(
      this,
    );
  }
}

abstract class _PaymentSettlementNew extends PaymentSettlementNew {
  const factory _PaymentSettlementNew(
      {@JsonKey(name: 'remark') required final String remark,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'description') required final String? description,
      @JsonKey(name: 'transaction_date') required final String transactionDate,
      @JsonKey(name: 'value') required final int value,
      @JsonKey(name: 'value_transaction') required final int valueTransaction,
      @JsonKey(name: 'ku_cost') required final int kuCost,
      @JsonKey(name: 'stamp_cost') required final int stampCost,
      @JsonKey(name: 'rounding') required final int rounding,
      @JsonKey(name: 'art_cost') required final int artCost,
      @JsonKey(name: 'other_cost') required final int otherCost,
      @JsonKey(name: 'rate_gap') required final int rateGap,
      @JsonKey(name: 'total')
      required final int total}) = _$PaymentSettlementNewImpl;
  const _PaymentSettlementNew._() : super._();

  factory _PaymentSettlementNew.fromJson(Map<String, dynamic> json) =
      _$PaymentSettlementNewImpl.fromJson;

  @override
  @JsonKey(name: 'remark')
  String get remark;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'transaction_date')
  String get transactionDate;
  @override
  @JsonKey(name: 'value')
  int get value;
  @override
  @JsonKey(name: 'value_transaction')
  int get valueTransaction;
  @override
  @JsonKey(name: 'ku_cost')
  int get kuCost;
  @override
  @JsonKey(name: 'stamp_cost')
  int get stampCost;
  @override
  @JsonKey(name: 'rounding')
  int get rounding;
  @override
  @JsonKey(name: 'art_cost')
  int get artCost;
  @override
  @JsonKey(name: 'other_cost')
  int get otherCost;
  @override
  @JsonKey(name: 'rate_gap')
  int get rateGap;
  @override
  @JsonKey(name: 'total')
  int get total;

  /// Create a copy of PaymentSettlementNew
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentSettlementNewImplCopyWith<_$PaymentSettlementNewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
