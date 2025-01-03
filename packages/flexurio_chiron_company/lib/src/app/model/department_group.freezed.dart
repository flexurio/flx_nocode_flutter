// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepartmentGroup _$DepartmentGroupFromJson(Map<String, dynamic> json) {
  return _DepartmentGroup.fromJson(json);
}

/// @nodoc
mixin _$DepartmentGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DepartmentGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentGroupCopyWith<DepartmentGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentGroupCopyWith<$Res> {
  factory $DepartmentGroupCopyWith(
          DepartmentGroup value, $Res Function(DepartmentGroup) then) =
      _$DepartmentGroupCopyWithImpl<$Res, DepartmentGroup>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$DepartmentGroupCopyWithImpl<$Res, $Val extends DepartmentGroup>
    implements $DepartmentGroupCopyWith<$Res> {
  _$DepartmentGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepartmentGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartmentGroupImplCopyWith<$Res>
    implements $DepartmentGroupCopyWith<$Res> {
  factory _$$DepartmentGroupImplCopyWith(_$DepartmentGroupImpl value,
          $Res Function(_$DepartmentGroupImpl) then) =
      __$$DepartmentGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$DepartmentGroupImplCopyWithImpl<$Res>
    extends _$DepartmentGroupCopyWithImpl<$Res, _$DepartmentGroupImpl>
    implements _$$DepartmentGroupImplCopyWith<$Res> {
  __$$DepartmentGroupImplCopyWithImpl(
      _$DepartmentGroupImpl _value, $Res Function(_$DepartmentGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepartmentGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DepartmentGroupImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentGroupImpl implements _DepartmentGroup {
  _$DepartmentGroupImpl(
      this.id,
      this.name,
      this.email,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt);

  factory _$DepartmentGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DepartmentGroup(id: $id, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, createdAt, updatedAt);

  /// Create a copy of DepartmentGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentGroupImplCopyWith<_$DepartmentGroupImpl> get copyWith =>
      __$$DepartmentGroupImplCopyWithImpl<_$DepartmentGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentGroupImplToJson(
      this,
    );
  }
}

abstract class _DepartmentGroup implements DepartmentGroup {
  factory _DepartmentGroup(
      final String id,
      final String name,
      final String email,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$DepartmentGroupImpl;

  factory _DepartmentGroup.fromJson(Map<String, dynamic> json) =
      _$DepartmentGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;

  /// Create a copy of DepartmentGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentGroupImplCopyWith<_$DepartmentGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
