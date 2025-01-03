// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductGroup _$ProductGroupFromJson(Map<String, dynamic> json) {
  return _ProductGroup.fromJson(json);
}

/// @nodoc
mixin _$ProductGroup {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductGroupCopyWith<ProductGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductGroupCopyWith<$Res> {
  factory $ProductGroupCopyWith(
          ProductGroup value, $Res Function(ProductGroup) then) =
      _$ProductGroupCopyWithImpl<$Res, ProductGroup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      String id});
}

/// @nodoc
class _$ProductGroupCopyWithImpl<$Res, $Val extends ProductGroup>
    implements $ProductGroupCopyWith<$Res> {
  _$ProductGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductGroupImplCopyWith<$Res>
    implements $ProductGroupCopyWith<$Res> {
  factory _$$ProductGroupImplCopyWith(
          _$ProductGroupImpl value, $Res Function(_$ProductGroupImpl) then) =
      __$$ProductGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      String id});
}

/// @nodoc
class __$$ProductGroupImplCopyWithImpl<$Res>
    extends _$ProductGroupCopyWithImpl<$Res, _$ProductGroupImpl>
    implements _$$ProductGroupImplCopyWith<$Res> {
  __$$ProductGroupImplCopyWithImpl(
      _$ProductGroupImpl _value, $Res Function(_$ProductGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? id = null,
  }) {
    return _then(_$ProductGroupImpl(
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductGroupImpl extends _ProductGroup {
  _$ProductGroupImpl(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_by_id') this.updatedById,
      this.id)
      : super._();

  factory _$ProductGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductGroupImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  final String id;

  @override
  String toString() {
    return 'ProductGroup(createdAt: $createdAt, updatedAt: $updatedAt, createdById: $createdById, updatedById: $updatedById, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductGroupImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdAt, updatedAt, createdById, updatedById, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductGroupImplCopyWith<_$ProductGroupImpl> get copyWith =>
      __$$ProductGroupImplCopyWithImpl<_$ProductGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductGroupImplToJson(
      this,
    );
  }
}

abstract class _ProductGroup extends ProductGroup {
  factory _ProductGroup(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_by_id') final int updatedById,
      final String id) = _$ProductGroupImpl;
  _ProductGroup._() : super._();

  factory _ProductGroup.fromJson(Map<String, dynamic> json) =
      _$ProductGroupImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ProductGroupImplCopyWith<_$ProductGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
