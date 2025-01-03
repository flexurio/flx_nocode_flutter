// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formulation_quantity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormulationQuantity _$FormulationQuantityFromJson(Map<String, dynamic> json) {
  return _Formulation.fromJson(json);
}

/// @nodoc
mixin _$FormulationQuantity {
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this FormulationQuantity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FormulationQuantity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormulationQuantityCopyWith<FormulationQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormulationQuantityCopyWith<$Res> {
  factory $FormulationQuantityCopyWith(
          FormulationQuantity value, $Res Function(FormulationQuantity) then) =
      _$FormulationQuantityCopyWithImpl<$Res, FormulationQuantity>;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class _$FormulationQuantityCopyWithImpl<$Res, $Val extends FormulationQuantity>
    implements $FormulationQuantityCopyWith<$Res> {
  _$FormulationQuantityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormulationQuantity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormulationImplCopyWith<$Res>
    implements $FormulationQuantityCopyWith<$Res> {
  factory _$$FormulationImplCopyWith(
          _$FormulationImpl value, $Res Function(_$FormulationImpl) then) =
      __$$FormulationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class __$$FormulationImplCopyWithImpl<$Res>
    extends _$FormulationQuantityCopyWithImpl<$Res, _$FormulationImpl>
    implements _$$FormulationImplCopyWith<$Res> {
  __$$FormulationImplCopyWithImpl(
      _$FormulationImpl _value, $Res Function(_$FormulationImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormulationQuantity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_$FormulationImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormulationImpl implements _Formulation {
  _$FormulationImpl({required this.quantity});

  factory _$FormulationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormulationImplFromJson(json);

  @override
  final int quantity;

  @override
  String toString() {
    return 'FormulationQuantity(quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormulationImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  /// Create a copy of FormulationQuantity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormulationImplCopyWith<_$FormulationImpl> get copyWith =>
      __$$FormulationImplCopyWithImpl<_$FormulationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormulationImplToJson(
      this,
    );
  }
}

abstract class _Formulation implements FormulationQuantity {
  factory _Formulation({required final int quantity}) = _$FormulationImpl;

  factory _Formulation.fromJson(Map<String, dynamic> json) =
      _$FormulationImpl.fromJson;

  @override
  int get quantity;

  /// Create a copy of FormulationQuantity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormulationImplCopyWith<_$FormulationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
