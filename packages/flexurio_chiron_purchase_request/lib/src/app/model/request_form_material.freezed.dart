// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_form_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestFormMaterial _$RequestFormMaterialFromJson(Map<String, dynamic> json) {
  return _RequestFormMaterial.fromJson(json);
}

/// @nodoc
mixin _$RequestFormMaterial {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_material_type')
  bool get isMaterialType => throw _privateConstructorUsedError;

  /// Serializes this RequestFormMaterial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestFormMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestFormMaterialCopyWith<RequestFormMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFormMaterialCopyWith<$Res> {
  factory $RequestFormMaterialCopyWith(
          RequestFormMaterial value, $Res Function(RequestFormMaterial) then) =
      _$RequestFormMaterialCopyWithImpl<$Res, RequestFormMaterial>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'is_material_type') bool isMaterialType});
}

/// @nodoc
class _$RequestFormMaterialCopyWithImpl<$Res, $Val extends RequestFormMaterial>
    implements $RequestFormMaterialCopyWith<$Res> {
  _$RequestFormMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestFormMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isMaterialType = null,
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
      isMaterialType: null == isMaterialType
          ? _value.isMaterialType
          : isMaterialType // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestFormMaterialImplCopyWith<$Res>
    implements $RequestFormMaterialCopyWith<$Res> {
  factory _$$RequestFormMaterialImplCopyWith(_$RequestFormMaterialImpl value,
          $Res Function(_$RequestFormMaterialImpl) then) =
      __$$RequestFormMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'is_material_type') bool isMaterialType});
}

/// @nodoc
class __$$RequestFormMaterialImplCopyWithImpl<$Res>
    extends _$RequestFormMaterialCopyWithImpl<$Res, _$RequestFormMaterialImpl>
    implements _$$RequestFormMaterialImplCopyWith<$Res> {
  __$$RequestFormMaterialImplCopyWithImpl(_$RequestFormMaterialImpl _value,
      $Res Function(_$RequestFormMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestFormMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isMaterialType = null,
  }) {
    return _then(_$RequestFormMaterialImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isMaterialType: null == isMaterialType
          ? _value.isMaterialType
          : isMaterialType // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestFormMaterialImpl extends _RequestFormMaterial {
  const _$RequestFormMaterialImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'is_material_type') required this.isMaterialType})
      : super._();

  factory _$RequestFormMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestFormMaterialImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'is_material_type')
  final bool isMaterialType;

  @override
  String toString() {
    return 'RequestFormMaterial(id: $id, name: $name, isMaterialType: $isMaterialType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFormMaterialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isMaterialType, isMaterialType) ||
                other.isMaterialType == isMaterialType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isMaterialType);

  /// Create a copy of RequestFormMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestFormMaterialImplCopyWith<_$RequestFormMaterialImpl> get copyWith =>
      __$$RequestFormMaterialImplCopyWithImpl<_$RequestFormMaterialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestFormMaterialImplToJson(
      this,
    );
  }
}

abstract class _RequestFormMaterial extends RequestFormMaterial {
  const factory _RequestFormMaterial(
      {required final String id,
      required final String name,
      @JsonKey(name: 'is_material_type')
      required final bool isMaterialType}) = _$RequestFormMaterialImpl;
  const _RequestFormMaterial._() : super._();

  factory _RequestFormMaterial.fromJson(Map<String, dynamic> json) =
      _$RequestFormMaterialImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'is_material_type')
  bool get isMaterialType;

  /// Create a copy of RequestFormMaterial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestFormMaterialImplCopyWith<_$RequestFormMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
