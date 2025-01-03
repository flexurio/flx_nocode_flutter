// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialType _$MaterialTypeFromJson(Map<String, dynamic> json) {
  return _MaterialType.fromJson(json);
}

/// @nodoc
mixin _$MaterialType {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup? get materialGroup => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this MaterialType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialTypeCopyWith<MaterialType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialTypeCopyWith<$Res> {
  factory $MaterialTypeCopyWith(
          MaterialType value, $Res Function(MaterialType) then) =
      _$MaterialTypeCopyWithImpl<$Res, MaterialType>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup? materialGroup,
      String? type});

  $MaterialGroupCopyWith<$Res>? get materialGroup;
}

/// @nodoc
class _$MaterialTypeCopyWithImpl<$Res, $Val extends MaterialType>
    implements $MaterialTypeCopyWith<$Res> {
  _$MaterialTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? updatedAt = null,
    Object? materialGroup = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialGroup: freezed == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of MaterialType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res>? get materialGroup {
    if (_value.materialGroup == null) {
      return null;
    }

    return $MaterialGroupCopyWith<$Res>(_value.materialGroup!, (value) {
      return _then(_value.copyWith(materialGroup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialTypeImplCopyWith<$Res>
    implements $MaterialTypeCopyWith<$Res> {
  factory _$$MaterialTypeImplCopyWith(
          _$MaterialTypeImpl value, $Res Function(_$MaterialTypeImpl) then) =
      __$$MaterialTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup? materialGroup,
      String? type});

  @override
  $MaterialGroupCopyWith<$Res>? get materialGroup;
}

/// @nodoc
class __$$MaterialTypeImplCopyWithImpl<$Res>
    extends _$MaterialTypeCopyWithImpl<$Res, _$MaterialTypeImpl>
    implements _$$MaterialTypeImplCopyWith<$Res> {
  __$$MaterialTypeImplCopyWithImpl(
      _$MaterialTypeImpl _value, $Res Function(_$MaterialTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? updatedAt = null,
    Object? materialGroup = freezed,
    Object? type = freezed,
  }) {
    return _then(_$MaterialTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialGroup: freezed == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialTypeImpl extends _MaterialType {
  _$MaterialTypeImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required this.materialGroup,
      this.type})
      : super._();

  factory _$MaterialTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialTypeImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  final MaterialGroup? materialGroup;
  @override
  final String? type;

  @override
  String toString() {
    return 'MaterialType(id: $id, createAt: $createAt, updatedAt: $updatedAt, materialGroup: $materialGroup, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, createAt, updatedAt, materialGroup, type);

  /// Create a copy of MaterialType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialTypeImplCopyWith<_$MaterialTypeImpl> get copyWith =>
      __$$MaterialTypeImplCopyWithImpl<_$MaterialTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialTypeImplToJson(
      this,
    );
  }
}

abstract class _MaterialType extends MaterialType {
  factory _MaterialType(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required final MaterialGroup? materialGroup,
      final String? type}) = _$MaterialTypeImpl;
  _MaterialType._() : super._();

  factory _MaterialType.fromJson(Map<String, dynamic> json) =
      _$MaterialTypeImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup? get materialGroup;
  @override
  String? get type;

  /// Create a copy of MaterialType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialTypeImplCopyWith<_$MaterialTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
