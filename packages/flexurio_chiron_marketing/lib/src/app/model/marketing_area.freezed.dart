// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketing_area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarketingArea _$MarketingAreaFromJson(Map<String, dynamic> json) {
  return _MarketingArea.fromJson(json);
}

/// @nodoc
mixin _$MarketingArea {
  @JsonKey(name: 'area_kode')
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketingAreaCopyWith<MarketingArea> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingAreaCopyWith<$Res> {
  factory $MarketingAreaCopyWith(
          MarketingArea value, $Res Function(MarketingArea) then) =
      _$MarketingAreaCopyWithImpl<$Res, MarketingArea>;
  @useResult
  $Res call({@JsonKey(name: 'area_kode') String code});
}

/// @nodoc
class _$MarketingAreaCopyWithImpl<$Res, $Val extends MarketingArea>
    implements $MarketingAreaCopyWith<$Res> {
  _$MarketingAreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketingAreaImplCopyWith<$Res>
    implements $MarketingAreaCopyWith<$Res> {
  factory _$$MarketingAreaImplCopyWith(
          _$MarketingAreaImpl value, $Res Function(_$MarketingAreaImpl) then) =
      __$$MarketingAreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'area_kode') String code});
}

/// @nodoc
class __$$MarketingAreaImplCopyWithImpl<$Res>
    extends _$MarketingAreaCopyWithImpl<$Res, _$MarketingAreaImpl>
    implements _$$MarketingAreaImplCopyWith<$Res> {
  __$$MarketingAreaImplCopyWithImpl(
      _$MarketingAreaImpl _value, $Res Function(_$MarketingAreaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$MarketingAreaImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketingAreaImpl extends _MarketingArea {
  _$MarketingAreaImpl({@JsonKey(name: 'area_kode') required this.code})
      : super._();

  factory _$MarketingAreaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketingAreaImplFromJson(json);

  @override
  @JsonKey(name: 'area_kode')
  final String code;

  @override
  String toString() {
    return 'MarketingArea(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketingAreaImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketingAreaImplCopyWith<_$MarketingAreaImpl> get copyWith =>
      __$$MarketingAreaImplCopyWithImpl<_$MarketingAreaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketingAreaImplToJson(
      this,
    );
  }
}

abstract class _MarketingArea extends MarketingArea {
  factory _MarketingArea(
          {@JsonKey(name: 'area_kode') required final String code}) =
      _$MarketingAreaImpl;
  _MarketingArea._() : super._();

  factory _MarketingArea.fromJson(Map<String, dynamic> json) =
      _$MarketingAreaImpl.fromJson;

  @override
  @JsonKey(name: 'area_kode')
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$MarketingAreaImplCopyWith<_$MarketingAreaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
