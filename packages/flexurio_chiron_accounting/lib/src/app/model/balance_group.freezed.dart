// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BalanceGroup _$BalanceGroupFromJson(Map<String, dynamic> json) {
  return _BalanceGroup.fromJson(json);
}

/// @nodoc
mixin _$BalanceGroup {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
  BalanceGroupType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
  BalanceGroupCategory get profitAndLossBalance =>
      throw _privateConstructorUsedError;

  /// Serializes this BalanceGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BalanceGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceGroupCopyWith<BalanceGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceGroupCopyWith<$Res> {
  factory $BalanceGroupCopyWith(
          BalanceGroup value, $Res Function(BalanceGroup) then) =
      _$BalanceGroupCopyWithImpl<$Res, BalanceGroup>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
      BalanceGroupType type,
      @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
      BalanceGroupCategory profitAndLossBalance});
}

/// @nodoc
class _$BalanceGroupCopyWithImpl<$Res, $Val extends BalanceGroup>
    implements $BalanceGroupCopyWith<$Res> {
  _$BalanceGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BalanceGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? type = null,
    Object? profitAndLossBalance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BalanceGroupType,
      profitAndLossBalance: null == profitAndLossBalance
          ? _value.profitAndLossBalance
          : profitAndLossBalance // ignore: cast_nullable_to_non_nullable
              as BalanceGroupCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceGroupImplCopyWith<$Res>
    implements $BalanceGroupCopyWith<$Res> {
  factory _$$BalanceGroupImplCopyWith(
          _$BalanceGroupImpl value, $Res Function(_$BalanceGroupImpl) then) =
      __$$BalanceGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
      BalanceGroupType type,
      @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
      BalanceGroupCategory profitAndLossBalance});
}

/// @nodoc
class __$$BalanceGroupImplCopyWithImpl<$Res>
    extends _$BalanceGroupCopyWithImpl<$Res, _$BalanceGroupImpl>
    implements _$$BalanceGroupImplCopyWith<$Res> {
  __$$BalanceGroupImplCopyWithImpl(
      _$BalanceGroupImpl _value, $Res Function(_$BalanceGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of BalanceGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? type = null,
    Object? profitAndLossBalance = null,
  }) {
    return _then(_$BalanceGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BalanceGroupType,
      profitAndLossBalance: null == profitAndLossBalance
          ? _value.profitAndLossBalance
          : profitAndLossBalance // ignore: cast_nullable_to_non_nullable
              as BalanceGroupCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceGroupImpl extends _BalanceGroup {
  const _$BalanceGroupImpl(
      {required this.id,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
      required this.type,
      @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
      required this.profitAndLossBalance})
      : super._();

  factory _$BalanceGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceGroupImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
  final BalanceGroupType type;
  @override
  @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
  final BalanceGroupCategory profitAndLossBalance;

  @override
  String toString() {
    return 'BalanceGroup(id: $id, createdById: $createdById, createdAt: $createdAt, updatedById: $updatedById, updatedAt: $updatedAt, name: $name, type: $type, profitAndLossBalance: $profitAndLossBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.profitAndLossBalance, profitAndLossBalance) ||
                other.profitAndLossBalance == profitAndLossBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdById, createdAt,
      updatedById, updatedAt, name, type, profitAndLossBalance);

  /// Create a copy of BalanceGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceGroupImplCopyWith<_$BalanceGroupImpl> get copyWith =>
      __$$BalanceGroupImplCopyWithImpl<_$BalanceGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceGroupImplToJson(
      this,
    );
  }
}

abstract class _BalanceGroup extends BalanceGroup {
  const factory _BalanceGroup(
          {required final String id,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'updated_by_id') required final int updatedById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
          required final BalanceGroupType type,
          @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
          required final BalanceGroupCategory profitAndLossBalance}) =
      _$BalanceGroupImpl;
  const _BalanceGroup._() : super._();

  factory _BalanceGroup.fromJson(Map<String, dynamic> json) =
      _$BalanceGroupImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type', fromJson: _balanceGroupTypeFromString)
  BalanceGroupType get type;
  @override
  @JsonKey(name: 'category', fromJson: _balanceGroupCategoryFromString)
  BalanceGroupCategory get profitAndLossBalance;

  /// Create a copy of BalanceGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceGroupImplCopyWith<_$BalanceGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
