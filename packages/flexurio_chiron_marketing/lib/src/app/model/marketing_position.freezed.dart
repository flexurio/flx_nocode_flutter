// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketing_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarketingPosition _$MarketingPositionFromJson(Map<String, dynamic> json) {
  return _MarketingPosition.fromJson(json);
}

/// @nodoc
mixin _$MarketingPosition {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketingPositionCopyWith<MarketingPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingPositionCopyWith<$Res> {
  factory $MarketingPositionCopyWith(
          MarketingPosition value, $Res Function(MarketingPosition) then) =
      _$MarketingPositionCopyWithImpl<$Res, MarketingPosition>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MarketingPositionCopyWithImpl<$Res, $Val extends MarketingPosition>
    implements $MarketingPositionCopyWith<$Res> {
  _$MarketingPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketingPositionImplCopyWith<$Res>
    implements $MarketingPositionCopyWith<$Res> {
  factory _$$MarketingPositionImplCopyWith(_$MarketingPositionImpl value,
          $Res Function(_$MarketingPositionImpl) then) =
      __$$MarketingPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MarketingPositionImplCopyWithImpl<$Res>
    extends _$MarketingPositionCopyWithImpl<$Res, _$MarketingPositionImpl>
    implements _$$MarketingPositionImplCopyWith<$Res> {
  __$$MarketingPositionImplCopyWithImpl(_$MarketingPositionImpl _value,
      $Res Function(_$MarketingPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MarketingPositionImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketingPositionImpl extends _MarketingPosition {
  _$MarketingPositionImpl(this.id) : super._();

  factory _$MarketingPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketingPositionImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'MarketingPosition(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketingPositionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketingPositionImplCopyWith<_$MarketingPositionImpl> get copyWith =>
      __$$MarketingPositionImplCopyWithImpl<_$MarketingPositionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketingPositionImplToJson(
      this,
    );
  }
}

abstract class _MarketingPosition extends MarketingPosition {
  factory _MarketingPosition(final String id) = _$MarketingPositionImpl;
  _MarketingPosition._() : super._();

  factory _MarketingPosition.fromJson(Map<String, dynamic> json) =
      _$MarketingPositionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$MarketingPositionImplCopyWith<_$MarketingPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
