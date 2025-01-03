// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesDiscount _$SalesDiscountFromJson(Map<String, dynamic> json) {
  return _SalesDiscount.fromJson(json);
}

/// @nodoc
mixin _$SalesDiscount {
  int get id => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;

  /// Serializes this SalesDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesDiscountCopyWith<SalesDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDiscountCopyWith<$Res> {
  factory $SalesDiscountCopyWith(
          SalesDiscount value, $Res Function(SalesDiscount) then) =
      _$SalesDiscountCopyWithImpl<$Res, SalesDiscount>;
  @useResult
  $Res call({int id, double discount});
}

/// @nodoc
class _$SalesDiscountCopyWithImpl<$Res, $Val extends SalesDiscount>
    implements $SalesDiscountCopyWith<$Res> {
  _$SalesDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesDiscountImplCopyWith<$Res>
    implements $SalesDiscountCopyWith<$Res> {
  factory _$$SalesDiscountImplCopyWith(
          _$SalesDiscountImpl value, $Res Function(_$SalesDiscountImpl) then) =
      __$$SalesDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, double discount});
}

/// @nodoc
class __$$SalesDiscountImplCopyWithImpl<$Res>
    extends _$SalesDiscountCopyWithImpl<$Res, _$SalesDiscountImpl>
    implements _$$SalesDiscountImplCopyWith<$Res> {
  __$$SalesDiscountImplCopyWithImpl(
      _$SalesDiscountImpl _value, $Res Function(_$SalesDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discount = null,
  }) {
    return _then(_$SalesDiscountImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesDiscountImpl extends _SalesDiscount {
  const _$SalesDiscountImpl(this.id, this.discount) : super._();

  factory _$SalesDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesDiscountImplFromJson(json);

  @override
  final int id;
  @override
  final double discount;

  @override
  String toString() {
    return 'SalesDiscount(id: $id, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, discount);

  /// Create a copy of SalesDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesDiscountImplCopyWith<_$SalesDiscountImpl> get copyWith =>
      __$$SalesDiscountImplCopyWithImpl<_$SalesDiscountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesDiscountImplToJson(
      this,
    );
  }
}

abstract class _SalesDiscount extends SalesDiscount {
  const factory _SalesDiscount(final int id, final double discount) =
      _$SalesDiscountImpl;
  const _SalesDiscount._() : super._();

  factory _SalesDiscount.fromJson(Map<String, dynamic> json) =
      _$SalesDiscountImpl.fromJson;

  @override
  int get id;
  @override
  double get discount;

  /// Create a copy of SalesDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesDiscountImplCopyWith<_$SalesDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
