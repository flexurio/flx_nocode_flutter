// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsReceivableGroup _$AccountsReceivableGroupFromJson(
    Map<String, dynamic> json) {
  return _AccountsReceivableGroup.fromJson(json);
}

/// @nodoc
mixin _$AccountsReceivableGroup {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_delivery_address')
  String get nameDeliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_delivery_address')
  String? get cityDeliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_amount')
  int? get paymentAmount => throw _privateConstructorUsedError;

  /// Serializes this AccountsReceivableGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsReceivableGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivableGroupCopyWith<AccountsReceivableGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableGroupCopyWith<$Res> {
  factory $AccountsReceivableGroupCopyWith(AccountsReceivableGroup value,
          $Res Function(AccountsReceivableGroup) then) =
      _$AccountsReceivableGroupCopyWithImpl<$Res, AccountsReceivableGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name_delivery_address') String nameDeliveryAddress,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'city_delivery_address') String? cityDeliveryAddress,
      @JsonKey(name: 'payment_amount') int? paymentAmount});
}

/// @nodoc
class _$AccountsReceivableGroupCopyWithImpl<$Res,
        $Val extends AccountsReceivableGroup>
    implements $AccountsReceivableGroupCopyWith<$Res> {
  _$AccountsReceivableGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameDeliveryAddress = null,
    Object? date = null,
    Object? dueDate = null,
    Object? cityDeliveryAddress = freezed,
    Object? paymentAmount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameDeliveryAddress: null == nameDeliveryAddress
          ? _value.nameDeliveryAddress
          : nameDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cityDeliveryAddress: freezed == cityDeliveryAddress
          ? _value.cityDeliveryAddress
          : cityDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAmount: freezed == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsReceivableGroupImplCopyWith<$Res>
    implements $AccountsReceivableGroupCopyWith<$Res> {
  factory _$$AccountsReceivableGroupImplCopyWith(
          _$AccountsReceivableGroupImpl value,
          $Res Function(_$AccountsReceivableGroupImpl) then) =
      __$$AccountsReceivableGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name_delivery_address') String nameDeliveryAddress,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'city_delivery_address') String? cityDeliveryAddress,
      @JsonKey(name: 'payment_amount') int? paymentAmount});
}

/// @nodoc
class __$$AccountsReceivableGroupImplCopyWithImpl<$Res>
    extends _$AccountsReceivableGroupCopyWithImpl<$Res,
        _$AccountsReceivableGroupImpl>
    implements _$$AccountsReceivableGroupImplCopyWith<$Res> {
  __$$AccountsReceivableGroupImplCopyWithImpl(
      _$AccountsReceivableGroupImpl _value,
      $Res Function(_$AccountsReceivableGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nameDeliveryAddress = null,
    Object? date = null,
    Object? dueDate = null,
    Object? cityDeliveryAddress = freezed,
    Object? paymentAmount = freezed,
  }) {
    return _then(_$AccountsReceivableGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nameDeliveryAddress: null == nameDeliveryAddress
          ? _value.nameDeliveryAddress
          : nameDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cityDeliveryAddress: freezed == cityDeliveryAddress
          ? _value.cityDeliveryAddress
          : cityDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAmount: freezed == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsReceivableGroupImpl extends _AccountsReceivableGroup {
  _$AccountsReceivableGroupImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name_delivery_address') required this.nameDeliveryAddress,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) required this.date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'city_delivery_address') this.cityDeliveryAddress,
      @JsonKey(name: 'payment_amount') this.paymentAmount})
      : super._();

  factory _$AccountsReceivableGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountsReceivableGroupImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name_delivery_address')
  final String nameDeliveryAddress;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'city_delivery_address')
  final String? cityDeliveryAddress;
  @override
  @JsonKey(name: 'payment_amount')
  final int? paymentAmount;

  @override
  String toString() {
    return 'AccountsReceivableGroup(id: $id, nameDeliveryAddress: $nameDeliveryAddress, date: $date, dueDate: $dueDate, cityDeliveryAddress: $cityDeliveryAddress, paymentAmount: $paymentAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReceivableGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nameDeliveryAddress, nameDeliveryAddress) ||
                other.nameDeliveryAddress == nameDeliveryAddress) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.cityDeliveryAddress, cityDeliveryAddress) ||
                other.cityDeliveryAddress == cityDeliveryAddress) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nameDeliveryAddress, date,
      dueDate, cityDeliveryAddress, paymentAmount);

  /// Create a copy of AccountsReceivableGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReceivableGroupImplCopyWith<_$AccountsReceivableGroupImpl>
      get copyWith => __$$AccountsReceivableGroupImplCopyWithImpl<
          _$AccountsReceivableGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsReceivableGroupImplToJson(
      this,
    );
  }
}

abstract class _AccountsReceivableGroup extends AccountsReceivableGroup {
  factory _AccountsReceivableGroup(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'name_delivery_address')
      required final String nameDeliveryAddress,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime)
      required final DateTime date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'city_delivery_address') final String? cityDeliveryAddress,
      @JsonKey(name: 'payment_amount')
      final int? paymentAmount}) = _$AccountsReceivableGroupImpl;
  _AccountsReceivableGroup._() : super._();

  factory _AccountsReceivableGroup.fromJson(Map<String, dynamic> json) =
      _$AccountsReceivableGroupImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name_delivery_address')
  String get nameDeliveryAddress;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'city_delivery_address')
  String? get cityDeliveryAddress;
  @override
  @JsonKey(name: 'payment_amount')
  int? get paymentAmount;

  /// Create a copy of AccountsReceivableGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReceivableGroupImplCopyWith<_$AccountsReceivableGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
