// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_mutation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsReceivableMutation _$AccountsReceivableMutationFromJson(
    Map<String, dynamic> json) {
  return _AccountsReceivableMutation.fromJson(json);
}

/// @nodoc
mixin _$AccountsReceivableMutation {
  @JsonKey(name: 'customer')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'debit')
  int get debit => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit')
  int get credit => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;

  /// Serializes this AccountsReceivableMutation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsReceivableMutation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivableMutationCopyWith<AccountsReceivableMutation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableMutationCopyWith<$Res> {
  factory $AccountsReceivableMutationCopyWith(AccountsReceivableMutation value,
          $Res Function(AccountsReceivableMutation) then) =
      _$AccountsReceivableMutationCopyWithImpl<$Res,
          AccountsReceivableMutation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'debit') int debit,
      @JsonKey(name: 'credit') int credit,
      @JsonKey(name: 'ending_balance') int endingBalance});
}

/// @nodoc
class _$AccountsReceivableMutationCopyWithImpl<$Res,
        $Val extends AccountsReceivableMutation>
    implements $AccountsReceivableMutationCopyWith<$Res> {
  _$AccountsReceivableMutationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableMutation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? beginningBalance = null,
    Object? debit = null,
    Object? credit = null,
    Object? endingBalance = null,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as int,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsReceivableMutationImplCopyWith<$Res>
    implements $AccountsReceivableMutationCopyWith<$Res> {
  factory _$$AccountsReceivableMutationImplCopyWith(
          _$AccountsReceivableMutationImpl value,
          $Res Function(_$AccountsReceivableMutationImpl) then) =
      __$$AccountsReceivableMutationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'debit') int debit,
      @JsonKey(name: 'credit') int credit,
      @JsonKey(name: 'ending_balance') int endingBalance});
}

/// @nodoc
class __$$AccountsReceivableMutationImplCopyWithImpl<$Res>
    extends _$AccountsReceivableMutationCopyWithImpl<$Res,
        _$AccountsReceivableMutationImpl>
    implements _$$AccountsReceivableMutationImplCopyWith<$Res> {
  __$$AccountsReceivableMutationImplCopyWithImpl(
      _$AccountsReceivableMutationImpl _value,
      $Res Function(_$AccountsReceivableMutationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableMutation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? beginningBalance = null,
    Object? debit = null,
    Object? credit = null,
    Object? endingBalance = null,
  }) {
    return _then(_$AccountsReceivableMutationImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as int,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsReceivableMutationImpl extends _AccountsReceivableMutation {
  _$AccountsReceivableMutationImpl(
      {@JsonKey(name: 'customer') required this.customer,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'debit') required this.debit,
      @JsonKey(name: 'credit') required this.credit,
      @JsonKey(name: 'ending_balance') required this.endingBalance})
      : super._();

  factory _$AccountsReceivableMutationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccountsReceivableMutationImplFromJson(json);

  @override
  @JsonKey(name: 'customer')
  final String customer;
  @override
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'debit')
  final int debit;
  @override
  @JsonKey(name: 'credit')
  final int credit;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;

  @override
  String toString() {
    return 'AccountsReceivableMutation(customer: $customer, beginningBalance: $beginningBalance, debit: $debit, credit: $credit, endingBalance: $endingBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReceivableMutationImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, customer, beginningBalance, debit, credit, endingBalance);

  /// Create a copy of AccountsReceivableMutation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReceivableMutationImplCopyWith<_$AccountsReceivableMutationImpl>
      get copyWith => __$$AccountsReceivableMutationImplCopyWithImpl<
          _$AccountsReceivableMutationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsReceivableMutationImplToJson(
      this,
    );
  }
}

abstract class _AccountsReceivableMutation extends AccountsReceivableMutation {
  factory _AccountsReceivableMutation(
      {@JsonKey(name: 'customer') required final String customer,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'debit') required final int debit,
      @JsonKey(name: 'credit') required final int credit,
      @JsonKey(name: 'ending_balance')
      required final int endingBalance}) = _$AccountsReceivableMutationImpl;
  _AccountsReceivableMutation._() : super._();

  factory _AccountsReceivableMutation.fromJson(Map<String, dynamic> json) =
      _$AccountsReceivableMutationImpl.fromJson;

  @override
  @JsonKey(name: 'customer')
  String get customer;
  @override
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'debit')
  int get debit;
  @override
  @JsonKey(name: 'credit')
  int get credit;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;

  /// Create a copy of AccountsReceivableMutation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReceivableMutationImplCopyWith<_$AccountsReceivableMutationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
