// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_return_na.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReturnNa _$MaterialReturnNaFromJson(Map<String, dynamic> json) {
  return _MaterialReturnNa.fromJson(json);
}

/// @nodoc
mixin _$MaterialReturnNa {
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining')
  double get quantityRemaining => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReturnNaCopyWith<MaterialReturnNa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReturnNaCopyWith<$Res> {
  factory $MaterialReturnNaCopyWith(
          MaterialReturnNa value, $Res Function(MaterialReturnNa) then) =
      _$MaterialReturnNaCopyWithImpl<$Res, MaterialReturnNa>;
  @useResult
  $Res call(
      {String na,
      @JsonKey(name: 'quantity_remaining') double quantityRemaining});
}

/// @nodoc
class _$MaterialReturnNaCopyWithImpl<$Res, $Val extends MaterialReturnNa>
    implements $MaterialReturnNaCopyWith<$Res> {
  _$MaterialReturnNaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? na = null,
    Object? quantityRemaining = null,
  }) {
    return _then(_value.copyWith(
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialReturnNaImplCopyWith<$Res>
    implements $MaterialReturnNaCopyWith<$Res> {
  factory _$$MaterialReturnNaImplCopyWith(_$MaterialReturnNaImpl value,
          $Res Function(_$MaterialReturnNaImpl) then) =
      __$$MaterialReturnNaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String na,
      @JsonKey(name: 'quantity_remaining') double quantityRemaining});
}

/// @nodoc
class __$$MaterialReturnNaImplCopyWithImpl<$Res>
    extends _$MaterialReturnNaCopyWithImpl<$Res, _$MaterialReturnNaImpl>
    implements _$$MaterialReturnNaImplCopyWith<$Res> {
  __$$MaterialReturnNaImplCopyWithImpl(_$MaterialReturnNaImpl _value,
      $Res Function(_$MaterialReturnNaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? na = null,
    Object? quantityRemaining = null,
  }) {
    return _then(_$MaterialReturnNaImpl(
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReturnNaImpl extends _MaterialReturnNa {
  _$MaterialReturnNaImpl(
      {required this.na,
      @JsonKey(name: 'quantity_remaining') required this.quantityRemaining})
      : super._();

  factory _$MaterialReturnNaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReturnNaImplFromJson(json);

  @override
  final String na;
  @override
  @JsonKey(name: 'quantity_remaining')
  final double quantityRemaining;

  @override
  String toString() {
    return 'MaterialReturnNa(na: $na, quantityRemaining: $quantityRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReturnNaImpl &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, na, quantityRemaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReturnNaImplCopyWith<_$MaterialReturnNaImpl> get copyWith =>
      __$$MaterialReturnNaImplCopyWithImpl<_$MaterialReturnNaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReturnNaImplToJson(
      this,
    );
  }
}

abstract class _MaterialReturnNa extends MaterialReturnNa {
  factory _MaterialReturnNa(
      {required final String na,
      @JsonKey(name: 'quantity_remaining')
      required final double quantityRemaining}) = _$MaterialReturnNaImpl;
  _MaterialReturnNa._() : super._();

  factory _MaterialReturnNa.fromJson(Map<String, dynamic> json) =
      _$MaterialReturnNaImpl.fromJson;

  @override
  String get na;
  @override
  @JsonKey(name: 'quantity_remaining')
  double get quantityRemaining;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReturnNaImplCopyWith<_$MaterialReturnNaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
