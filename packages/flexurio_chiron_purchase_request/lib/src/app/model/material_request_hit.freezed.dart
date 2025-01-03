// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_request_hit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialRequestHit _$MaterialRequestHitFromJson(Map<String, dynamic> json) {
  return _MaterialRequestHit.fromJson(json);
}

/// @nodoc
mixin _$MaterialRequestHit {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this MaterialRequestHit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialRequestHit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialRequestHitCopyWith<MaterialRequestHit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialRequestHitCopyWith<$Res> {
  factory $MaterialRequestHitCopyWith(
          MaterialRequestHit value, $Res Function(MaterialRequestHit) then) =
      _$MaterialRequestHitCopyWithImpl<$Res, MaterialRequestHit>;
  @useResult
  $Res call({String id, String description, String status});
}

/// @nodoc
class _$MaterialRequestHitCopyWithImpl<$Res, $Val extends MaterialRequestHit>
    implements $MaterialRequestHitCopyWith<$Res> {
  _$MaterialRequestHitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialRequestHit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialRequestHitImplCopyWith<$Res>
    implements $MaterialRequestHitCopyWith<$Res> {
  factory _$$MaterialRequestHitImplCopyWith(_$MaterialRequestHitImpl value,
          $Res Function(_$MaterialRequestHitImpl) then) =
      __$$MaterialRequestHitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String description, String status});
}

/// @nodoc
class __$$MaterialRequestHitImplCopyWithImpl<$Res>
    extends _$MaterialRequestHitCopyWithImpl<$Res, _$MaterialRequestHitImpl>
    implements _$$MaterialRequestHitImplCopyWith<$Res> {
  __$$MaterialRequestHitImplCopyWithImpl(_$MaterialRequestHitImpl _value,
      $Res Function(_$MaterialRequestHitImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestHit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? status = null,
  }) {
    return _then(_$MaterialRequestHitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialRequestHitImpl extends _MaterialRequestHit {
  _$MaterialRequestHitImpl(
      {required this.id, required this.description, required this.status})
      : super._();

  factory _$MaterialRequestHitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialRequestHitImplFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final String status;

  @override
  String toString() {
    return 'MaterialRequestHit(id: $id, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestHitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, status);

  /// Create a copy of MaterialRequestHit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRequestHitImplCopyWith<_$MaterialRequestHitImpl> get copyWith =>
      __$$MaterialRequestHitImplCopyWithImpl<_$MaterialRequestHitImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialRequestHitImplToJson(
      this,
    );
  }
}

abstract class _MaterialRequestHit extends MaterialRequestHit {
  factory _MaterialRequestHit(
      {required final String id,
      required final String description,
      required final String status}) = _$MaterialRequestHitImpl;
  _MaterialRequestHit._() : super._();

  factory _MaterialRequestHit.fromJson(Map<String, dynamic> json) =
      _$MaterialRequestHitImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  String get status;

  /// Create a copy of MaterialRequestHit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRequestHitImplCopyWith<_$MaterialRequestHitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
