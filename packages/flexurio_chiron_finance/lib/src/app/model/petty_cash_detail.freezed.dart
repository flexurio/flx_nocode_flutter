// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petty_cash_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PettyCashDetail _$PettyCashDetailFromJson(Map<String, dynamic> json) {
  return _PettyCashDetail.fromJson(json);
}

/// @nodoc
mixin _$PettyCashDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'realization_price')
  double get realizationPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
  PettyCash get pettyCash => throw _privateConstructorUsedError;

  /// Serializes this PettyCashDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PettyCashDetailCopyWith<PettyCashDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PettyCashDetailCopyWith<$Res> {
  factory $PettyCashDetailCopyWith(
          PettyCashDetail value, $Res Function(PettyCashDetail) then) =
      _$PettyCashDetailCopyWithImpl<$Res, PettyCashDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit,
      @JsonKey(fromJson: Material.fromJson) Material material,
      double quantity,
      double price,
      @JsonKey(name: 'realization_price') double realizationPrice,
      @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
      PettyCash pettyCash});

  $MaterialUnitCopyWith<$Res> get unit;
  $MaterialCopyWith<$Res> get material;
  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class _$PettyCashDetailCopyWithImpl<$Res, $Val extends PettyCashDetail>
    implements $PettyCashDetailCopyWith<$Res> {
  _$PettyCashDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? unit = null,
    Object? material = null,
    Object? quantity = null,
    Object? price = null,
    Object? realizationPrice = null,
    Object? pettyCash = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      realizationPrice: null == realizationPrice
          ? _value.realizationPrice
          : realizationPrice // ignore: cast_nullable_to_non_nullable
              as double,
      pettyCash: null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
    ) as $Val);
  }

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PettyCashDetailImplCopyWith<$Res>
    implements $PettyCashDetailCopyWith<$Res> {
  factory _$$PettyCashDetailImplCopyWith(_$PettyCashDetailImpl value,
          $Res Function(_$PettyCashDetailImpl) then) =
      __$$PettyCashDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit,
      @JsonKey(fromJson: Material.fromJson) Material material,
      double quantity,
      double price,
      @JsonKey(name: 'realization_price') double realizationPrice,
      @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
      PettyCash pettyCash});

  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$PettyCashDetailImplCopyWithImpl<$Res>
    extends _$PettyCashDetailCopyWithImpl<$Res, _$PettyCashDetailImpl>
    implements _$$PettyCashDetailImplCopyWith<$Res> {
  __$$PettyCashDetailImplCopyWithImpl(
      _$PettyCashDetailImpl _value, $Res Function(_$PettyCashDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? unit = null,
    Object? material = null,
    Object? quantity = null,
    Object? price = null,
    Object? realizationPrice = null,
    Object? pettyCash = null,
  }) {
    return _then(_$PettyCashDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      realizationPrice: null == realizationPrice
          ? _value.realizationPrice
          : realizationPrice // ignore: cast_nullable_to_non_nullable
              as double,
      pettyCash: null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PettyCashDetailImpl extends _PettyCashDetail {
  const _$PettyCashDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(fromJson: Material.fromJson) required this.material,
      required this.quantity,
      required this.price,
      @JsonKey(name: 'realization_price') required this.realizationPrice,
      @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
      required this.pettyCash})
      : super._();

  factory _$PettyCashDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PettyCashDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(fromJson: Material.fromJson)
  final Material material;
  @override
  final double quantity;
  @override
  final double price;
  @override
  @JsonKey(name: 'realization_price')
  final double realizationPrice;
  @override
  @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
  final PettyCash pettyCash;

  @override
  String toString() {
    return 'PettyCashDetail(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, unit: $unit, material: $material, quantity: $quantity, price: $price, realizationPrice: $realizationPrice, pettyCash: $pettyCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PettyCashDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.realizationPrice, realizationPrice) ||
                other.realizationPrice == realizationPrice) &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      createdById,
      updatedAt,
      updateById,
      unit,
      material,
      quantity,
      price,
      realizationPrice,
      pettyCash);

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PettyCashDetailImplCopyWith<_$PettyCashDetailImpl> get copyWith =>
      __$$PettyCashDetailImplCopyWithImpl<_$PettyCashDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PettyCashDetailImplToJson(
      this,
    );
  }
}

abstract class _PettyCashDetail extends PettyCashDetail {
  const factory _PettyCashDetail(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unit,
      @JsonKey(fromJson: Material.fromJson) required final Material material,
      required final double quantity,
      required final double price,
      @JsonKey(name: 'realization_price')
      required final double realizationPrice,
      @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
      required final PettyCash pettyCash}) = _$PettyCashDetailImpl;
  const _PettyCashDetail._() : super._();

  factory _PettyCashDetail.fromJson(Map<String, dynamic> json) =
      _$PettyCashDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(fromJson: Material.fromJson)
  Material get material;
  @override
  double get quantity;
  @override
  double get price;
  @override
  @JsonKey(name: 'realization_price')
  double get realizationPrice;
  @override
  @JsonKey(name: 'petty_cash', fromJson: PettyCash.fromJson)
  PettyCash get pettyCash;

  /// Create a copy of PettyCashDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PettyCashDetailImplCopyWith<_$PettyCashDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
