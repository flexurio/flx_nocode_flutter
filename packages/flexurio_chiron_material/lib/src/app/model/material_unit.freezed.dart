// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialUnit _$MaterialUnitFromJson(Map<String, dynamic> json) {
  return _MaterialUnit.fromJson(json);
}

/// @nodoc
mixin _$MaterialUnit {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _materialUnitTypeFromString)
  MaterialUnitType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;

  /// Serializes this MaterialUnit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialUnit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialUnitCopyWith<MaterialUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialUnitCopyWith<$Res> {
  factory $MaterialUnitCopyWith(
          MaterialUnit value, $Res Function(MaterialUnit) then) =
      _$MaterialUnitCopyWithImpl<$Res, MaterialUnit>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(fromJson: _materialUnitTypeFromString) MaterialUnitType type,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById});
}

/// @nodoc
class _$MaterialUnitCopyWithImpl<$Res, $Val extends MaterialUnit>
    implements $MaterialUnitCopyWith<$Res> {
  _$MaterialUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialUnit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? updateById = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialUnitType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialUnitImplCopyWith<$Res>
    implements $MaterialUnitCopyWith<$Res> {
  factory _$$MaterialUnitImplCopyWith(
          _$MaterialUnitImpl value, $Res Function(_$MaterialUnitImpl) then) =
      __$$MaterialUnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(fromJson: _materialUnitTypeFromString) MaterialUnitType type,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById});
}

/// @nodoc
class __$$MaterialUnitImplCopyWithImpl<$Res>
    extends _$MaterialUnitCopyWithImpl<$Res, _$MaterialUnitImpl>
    implements _$$MaterialUnitImplCopyWith<$Res> {
  __$$MaterialUnitImplCopyWithImpl(
      _$MaterialUnitImpl _value, $Res Function(_$MaterialUnitImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialUnit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? updateById = null,
  }) {
    return _then(_$MaterialUnitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialUnitType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialUnitImpl extends _MaterialUnit {
  _$MaterialUnitImpl(
      {required this.id,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(fromJson: _materialUnitTypeFromString) required this.type,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById})
      : super._();

  factory _$MaterialUnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialUnitImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(fromJson: _materialUnitTypeFromString)
  final MaterialUnitType type;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;

  @override
  String toString() {
    return 'MaterialUnit(id: $id, createdById: $createdById, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, updateById: $updateById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialUnitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdById, type, createdAt, updatedAt, updateById);

  /// Create a copy of MaterialUnit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialUnitImplCopyWith<_$MaterialUnitImpl> get copyWith =>
      __$$MaterialUnitImplCopyWithImpl<_$MaterialUnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialUnitImplToJson(
      this,
    );
  }
}

abstract class _MaterialUnit extends MaterialUnit {
  factory _MaterialUnit(
          {required final String id,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(fromJson: _materialUnitTypeFromString)
          required final MaterialUnitType type,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'updated_by_id') required final int updateById}) =
      _$MaterialUnitImpl;
  _MaterialUnit._() : super._();

  factory _MaterialUnit.fromJson(Map<String, dynamic> json) =
      _$MaterialUnitImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(fromJson: _materialUnitTypeFromString)
  MaterialUnitType get type;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;

  /// Create a copy of MaterialUnit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialUnitImplCopyWith<_$MaterialUnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
