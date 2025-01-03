// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petty_cash_detail_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PettyCashDetailCreate _$PettyCashDetailCreateFromJson(
    Map<String, dynamic> json) {
  return _PettyCashDetailCreate.fromJson(json);
}

/// @nodoc
mixin _$PettyCashDetailCreate {
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this PettyCashDetailCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PettyCashDetailCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PettyCashDetailCreateCopyWith<PettyCashDetailCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PettyCashDetailCreateCopyWith<$Res> {
  factory $PettyCashDetailCreateCopyWith(PettyCashDetailCreate value,
          $Res Function(PettyCashDetailCreate) then) =
      _$PettyCashDetailCreateCopyWithImpl<$Res, PettyCashDetailCreate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      double quantity,
      double price});
}

/// @nodoc
class _$PettyCashDetailCreateCopyWithImpl<$Res,
        $Val extends PettyCashDetailCreate>
    implements $PettyCashDetailCreateCopyWith<$Res> {
  _$PettyCashDetailCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCashDetailCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialUnitId = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PettyCashDetailCreateImplCopyWith<$Res>
    implements $PettyCashDetailCreateCopyWith<$Res> {
  factory _$$PettyCashDetailCreateImplCopyWith(
          _$PettyCashDetailCreateImpl value,
          $Res Function(_$PettyCashDetailCreateImpl) then) =
      __$$PettyCashDetailCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      double quantity,
      double price});
}

/// @nodoc
class __$$PettyCashDetailCreateImplCopyWithImpl<$Res>
    extends _$PettyCashDetailCreateCopyWithImpl<$Res,
        _$PettyCashDetailCreateImpl>
    implements _$$PettyCashDetailCreateImplCopyWith<$Res> {
  __$$PettyCashDetailCreateImplCopyWithImpl(_$PettyCashDetailCreateImpl _value,
      $Res Function(_$PettyCashDetailCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialUnitId = null,
    Object? quantity = null,
    Object? price = null,
  }) {
    return _then(_$PettyCashDetailCreateImpl(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PettyCashDetailCreateImpl extends _PettyCashDetailCreate {
  const _$PettyCashDetailCreateImpl(
      {@JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId,
      required this.quantity,
      required this.price})
      : super._();

  factory _$PettyCashDetailCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PettyCashDetailCreateImplFromJson(json);

  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;
  @override
  final double quantity;
  @override
  final double price;

  @override
  String toString() {
    return 'PettyCashDetailCreate(materialId: $materialId, materialUnitId: $materialUnitId, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PettyCashDetailCreateImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, materialId, materialUnitId, quantity, price);

  /// Create a copy of PettyCashDetailCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PettyCashDetailCreateImplCopyWith<_$PettyCashDetailCreateImpl>
      get copyWith => __$$PettyCashDetailCreateImplCopyWithImpl<
          _$PettyCashDetailCreateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PettyCashDetailCreateImplToJson(
      this,
    );
  }
}

abstract class _PettyCashDetailCreate extends PettyCashDetailCreate {
  const factory _PettyCashDetailCreate(
      {@JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_unit_id') required final String materialUnitId,
      required final double quantity,
      required final double price}) = _$PettyCashDetailCreateImpl;
  const _PettyCashDetailCreate._() : super._();

  factory _PettyCashDetailCreate.fromJson(Map<String, dynamic> json) =
      _$PettyCashDetailCreateImpl.fromJson;

  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;
  @override
  double get quantity;
  @override
  double get price;

  /// Create a copy of PettyCashDetailCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PettyCashDetailCreateImplCopyWith<_$PettyCashDetailCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
