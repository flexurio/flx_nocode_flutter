// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_other_cost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentOtherCost _$PaymentOtherCostFromJson(Map<String, dynamic> json) {
  return _PaymentOtherCost.fromJson(json);
}

/// @nodoc
mixin _$PaymentOtherCost {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
  TypeCost get typeCost => throw _privateConstructorUsedError;

  /// Serializes this PaymentOtherCost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentOtherCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentOtherCostCopyWith<PaymentOtherCost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentOtherCostCopyWith<$Res> {
  factory $PaymentOtherCostCopyWith(
          PaymentOtherCost value, $Res Function(PaymentOtherCost) then) =
      _$PaymentOtherCostCopyWithImpl<$Res, PaymentOtherCost>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'value') double amount,
      @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
      TypeCost typeCost});

  $TypeCostCopyWith<$Res> get typeCost;
}

/// @nodoc
class _$PaymentOtherCostCopyWithImpl<$Res, $Val extends PaymentOtherCost>
    implements $PaymentOtherCostCopyWith<$Res> {
  _$PaymentOtherCostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentOtherCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? amount = null,
    Object? typeCost = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      typeCost: null == typeCost
          ? _value.typeCost
          : typeCost // ignore: cast_nullable_to_non_nullable
              as TypeCost,
    ) as $Val);
  }

  /// Create a copy of PaymentOtherCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TypeCostCopyWith<$Res> get typeCost {
    return $TypeCostCopyWith<$Res>(_value.typeCost, (value) {
      return _then(_value.copyWith(typeCost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentOtherCostImplCopyWith<$Res>
    implements $PaymentOtherCostCopyWith<$Res> {
  factory _$$PaymentOtherCostImplCopyWith(_$PaymentOtherCostImpl value,
          $Res Function(_$PaymentOtherCostImpl) then) =
      __$$PaymentOtherCostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'value') double amount,
      @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
      TypeCost typeCost});

  @override
  $TypeCostCopyWith<$Res> get typeCost;
}

/// @nodoc
class __$$PaymentOtherCostImplCopyWithImpl<$Res>
    extends _$PaymentOtherCostCopyWithImpl<$Res, _$PaymentOtherCostImpl>
    implements _$$PaymentOtherCostImplCopyWith<$Res> {
  __$$PaymentOtherCostImplCopyWithImpl(_$PaymentOtherCostImpl _value,
      $Res Function(_$PaymentOtherCostImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentOtherCost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? amount = null,
    Object? typeCost = null,
  }) {
    return _then(_$PaymentOtherCostImpl(
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      typeCost: null == typeCost
          ? _value.typeCost
          : typeCost // ignore: cast_nullable_to_non_nullable
              as TypeCost,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentOtherCostImpl extends _PaymentOtherCost {
  _$PaymentOtherCostImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'value') required this.amount,
      @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
      required this.typeCost})
      : super._();

  factory _$PaymentOtherCostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentOtherCostImplFromJson(json);

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
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'value')
  final double amount;
  @override
  @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
  final TypeCost typeCost;

  @override
  String toString() {
    return 'PaymentOtherCost(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, amount: $amount, typeCost: $typeCost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentOtherCostImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.typeCost, typeCost) ||
                other.typeCost == typeCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, createdById,
      updatedAt, updateById, id, amount, typeCost);

  /// Create a copy of PaymentOtherCost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentOtherCostImplCopyWith<_$PaymentOtherCostImpl> get copyWith =>
      __$$PaymentOtherCostImplCopyWithImpl<_$PaymentOtherCostImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentOtherCostImplToJson(
      this,
    );
  }
}

abstract class _PaymentOtherCost extends PaymentOtherCost {
  factory _PaymentOtherCost(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'value') required final double amount,
      @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
      required final TypeCost typeCost}) = _$PaymentOtherCostImpl;
  _PaymentOtherCost._() : super._();

  factory _PaymentOtherCost.fromJson(Map<String, dynamic> json) =
      _$PaymentOtherCostImpl.fromJson;

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
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'value')
  double get amount;
  @override
  @JsonKey(name: 'type_cost', fromJson: TypeCost.fromJson)
  TypeCost get typeCost;

  /// Create a copy of PaymentOtherCost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentOtherCostImplCopyWith<_$PaymentOtherCostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
