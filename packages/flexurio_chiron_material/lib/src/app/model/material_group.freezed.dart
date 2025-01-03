// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialGroup _$MaterialGroupFromJson(Map<String, dynamic> json) {
  return _MaterialGroup.fromJson(json);
}

/// @nodoc
mixin _$MaterialGroup {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_category', fromJson: MaterialGroupCategory.fromString)
  MaterialGroupCategory get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_vendor', defaultValue: false)
  bool get hasVendor => throw _privateConstructorUsedError;

  /// Serializes this MaterialGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialGroupCopyWith<MaterialGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialGroupCopyWith<$Res> {
  factory $MaterialGroupCopyWith(
          MaterialGroup value, $Res Function(MaterialGroup) then) =
      _$MaterialGroupCopyWithImpl<$Res, MaterialGroup>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(
          name: 'group_category', fromJson: MaterialGroupCategory.fromString)
      MaterialGroupCategory category,
      @JsonKey(name: 'has_vendor', defaultValue: false) bool hasVendor});
}

/// @nodoc
class _$MaterialGroupCopyWithImpl<$Res, $Val extends MaterialGroup>
    implements $MaterialGroupCopyWith<$Res> {
  _$MaterialGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updateById = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? hasVendor = null,
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MaterialGroupCategory,
      hasVendor: null == hasVendor
          ? _value.hasVendor
          : hasVendor // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialGroupImplCopyWith<$Res>
    implements $MaterialGroupCopyWith<$Res> {
  factory _$$MaterialGroupImplCopyWith(
          _$MaterialGroupImpl value, $Res Function(_$MaterialGroupImpl) then) =
      __$$MaterialGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(
          name: 'group_category', fromJson: MaterialGroupCategory.fromString)
      MaterialGroupCategory category,
      @JsonKey(name: 'has_vendor', defaultValue: false) bool hasVendor});
}

/// @nodoc
class __$$MaterialGroupImplCopyWithImpl<$Res>
    extends _$MaterialGroupCopyWithImpl<$Res, _$MaterialGroupImpl>
    implements _$$MaterialGroupImplCopyWith<$Res> {
  __$$MaterialGroupImplCopyWithImpl(
      _$MaterialGroupImpl _value, $Res Function(_$MaterialGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updateById = null,
    Object? updatedAt = null,
    Object? category = null,
    Object? hasVendor = null,
  }) {
    return _then(_$MaterialGroupImpl(
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MaterialGroupCategory,
      hasVendor: null == hasVendor
          ? _value.hasVendor
          : hasVendor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialGroupImpl extends _MaterialGroup {
  const _$MaterialGroupImpl(
      {required this.id,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(
          name: 'group_category', fromJson: MaterialGroupCategory.fromString)
      required this.category,
      @JsonKey(name: 'has_vendor', defaultValue: false)
      required this.hasVendor})
      : super._();

  factory _$MaterialGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialGroupImplFromJson(json);

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
  final int updateById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'group_category', fromJson: MaterialGroupCategory.fromString)
  final MaterialGroupCategory category;
  @override
  @JsonKey(name: 'has_vendor', defaultValue: false)
  final bool hasVendor;

  @override
  String toString() {
    return 'MaterialGroup(id: $id, createdById: $createdById, createdAt: $createdAt, updateById: $updateById, updatedAt: $updatedAt, category: $category, hasVendor: $hasVendor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.hasVendor, hasVendor) ||
                other.hasVendor == hasVendor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdById, createdAt,
      updateById, updatedAt, category, hasVendor);

  /// Create a copy of MaterialGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialGroupImplCopyWith<_$MaterialGroupImpl> get copyWith =>
      __$$MaterialGroupImplCopyWithImpl<_$MaterialGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialGroupImplToJson(
      this,
    );
  }
}

abstract class _MaterialGroup extends MaterialGroup {
  const factory _MaterialGroup(
      {required final String id,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(
          name: 'group_category', fromJson: MaterialGroupCategory.fromString)
      required final MaterialGroupCategory category,
      @JsonKey(name: 'has_vendor', defaultValue: false)
      required final bool hasVendor}) = _$MaterialGroupImpl;
  const _MaterialGroup._() : super._();

  factory _MaterialGroup.fromJson(Map<String, dynamic> json) =
      _$MaterialGroupImpl.fromJson;

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
  int get updateById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'group_category', fromJson: MaterialGroupCategory.fromString)
  MaterialGroupCategory get category;
  @override
  @JsonKey(name: 'has_vendor', defaultValue: false)
  bool get hasVendor;

  /// Create a copy of MaterialGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialGroupImplCopyWith<_$MaterialGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
