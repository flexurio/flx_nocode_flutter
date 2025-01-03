// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsReceivableGlobal _$AccountsReceivableGlobalFromJson(
    Map<String, dynamic> json) {
  return _AccountsReceivableGlobal.fromJson(json);
}

/// @nodoc
mixin _$AccountsReceivableGlobal {
  @JsonKey(name: 'customer')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_customer')
  String get addressCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_customer')
  int get totalCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_customer')
  String? get cityCustomer => throw _privateConstructorUsedError;

  /// Serializes this AccountsReceivableGlobal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsReceivableGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivableGlobalCopyWith<AccountsReceivableGlobal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableGlobalCopyWith<$Res> {
  factory $AccountsReceivableGlobalCopyWith(AccountsReceivableGlobal value,
          $Res Function(AccountsReceivableGlobal) then) =
      _$AccountsReceivableGlobalCopyWithImpl<$Res, AccountsReceivableGlobal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'address_customer') String addressCustomer,
      @JsonKey(name: 'total_customer') int totalCustomer,
      @JsonKey(name: 'city_customer') String? cityCustomer});
}

/// @nodoc
class _$AccountsReceivableGlobalCopyWithImpl<$Res,
        $Val extends AccountsReceivableGlobal>
    implements $AccountsReceivableGlobalCopyWith<$Res> {
  _$AccountsReceivableGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? addressCustomer = null,
    Object? totalCustomer = null,
    Object? cityCustomer = freezed,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      addressCustomer: null == addressCustomer
          ? _value.addressCustomer
          : addressCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      totalCustomer: null == totalCustomer
          ? _value.totalCustomer
          : totalCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      cityCustomer: freezed == cityCustomer
          ? _value.cityCustomer
          : cityCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsReceivableGlobalImplCopyWith<$Res>
    implements $AccountsReceivableGlobalCopyWith<$Res> {
  factory _$$AccountsReceivableGlobalImplCopyWith(
          _$AccountsReceivableGlobalImpl value,
          $Res Function(_$AccountsReceivableGlobalImpl) then) =
      __$$AccountsReceivableGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'address_customer') String addressCustomer,
      @JsonKey(name: 'total_customer') int totalCustomer,
      @JsonKey(name: 'city_customer') String? cityCustomer});
}

/// @nodoc
class __$$AccountsReceivableGlobalImplCopyWithImpl<$Res>
    extends _$AccountsReceivableGlobalCopyWithImpl<$Res,
        _$AccountsReceivableGlobalImpl>
    implements _$$AccountsReceivableGlobalImplCopyWith<$Res> {
  __$$AccountsReceivableGlobalImplCopyWithImpl(
      _$AccountsReceivableGlobalImpl _value,
      $Res Function(_$AccountsReceivableGlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? addressCustomer = null,
    Object? totalCustomer = null,
    Object? cityCustomer = freezed,
  }) {
    return _then(_$AccountsReceivableGlobalImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      addressCustomer: null == addressCustomer
          ? _value.addressCustomer
          : addressCustomer // ignore: cast_nullable_to_non_nullable
              as String,
      totalCustomer: null == totalCustomer
          ? _value.totalCustomer
          : totalCustomer // ignore: cast_nullable_to_non_nullable
              as int,
      cityCustomer: freezed == cityCustomer
          ? _value.cityCustomer
          : cityCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsReceivableGlobalImpl extends _AccountsReceivableGlobal {
  _$AccountsReceivableGlobalImpl(
      {@JsonKey(name: 'customer') required this.customer,
      @JsonKey(name: 'address_customer') required this.addressCustomer,
      @JsonKey(name: 'total_customer') required this.totalCustomer,
      @JsonKey(name: 'city_customer') this.cityCustomer})
      : super._();

  factory _$AccountsReceivableGlobalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountsReceivableGlobalImplFromJson(json);

  @override
  @JsonKey(name: 'customer')
  final String customer;
  @override
  @JsonKey(name: 'address_customer')
  final String addressCustomer;
  @override
  @JsonKey(name: 'total_customer')
  final int totalCustomer;
  @override
  @JsonKey(name: 'city_customer')
  final String? cityCustomer;

  @override
  String toString() {
    return 'AccountsReceivableGlobal(customer: $customer, addressCustomer: $addressCustomer, totalCustomer: $totalCustomer, cityCustomer: $cityCustomer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReceivableGlobalImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.addressCustomer, addressCustomer) ||
                other.addressCustomer == addressCustomer) &&
            (identical(other.totalCustomer, totalCustomer) ||
                other.totalCustomer == totalCustomer) &&
            (identical(other.cityCustomer, cityCustomer) ||
                other.cityCustomer == cityCustomer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, customer, addressCustomer, totalCustomer, cityCustomer);

  /// Create a copy of AccountsReceivableGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReceivableGlobalImplCopyWith<_$AccountsReceivableGlobalImpl>
      get copyWith => __$$AccountsReceivableGlobalImplCopyWithImpl<
          _$AccountsReceivableGlobalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsReceivableGlobalImplToJson(
      this,
    );
  }
}

abstract class _AccountsReceivableGlobal extends AccountsReceivableGlobal {
  factory _AccountsReceivableGlobal(
      {@JsonKey(name: 'customer') required final String customer,
      @JsonKey(name: 'address_customer') required final String addressCustomer,
      @JsonKey(name: 'total_customer') required final int totalCustomer,
      @JsonKey(name: 'city_customer')
      final String? cityCustomer}) = _$AccountsReceivableGlobalImpl;
  _AccountsReceivableGlobal._() : super._();

  factory _AccountsReceivableGlobal.fromJson(Map<String, dynamic> json) =
      _$AccountsReceivableGlobalImpl.fromJson;

  @override
  @JsonKey(name: 'customer')
  String get customer;
  @override
  @JsonKey(name: 'address_customer')
  String get addressCustomer;
  @override
  @JsonKey(name: 'total_customer')
  int get totalCustomer;
  @override
  @JsonKey(name: 'city_customer')
  String? get cityCustomer;

  /// Create a copy of AccountsReceivableGlobal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReceivableGlobalImplCopyWith<_$AccountsReceivableGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
