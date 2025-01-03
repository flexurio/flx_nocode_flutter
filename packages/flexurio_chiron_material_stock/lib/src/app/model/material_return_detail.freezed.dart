// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_return_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReturnDetail _$MaterialReturnDetailFromJson(Map<String, dynamic> json) {
  return _MaterialReturnDetail.fromJson(json);
}

/// @nodoc
mixin _$MaterialReturnDetail {
  int get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  Warehouse get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
  MaterialReturn get materialReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReturnDetailCopyWith<MaterialReturnDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReturnDetailCopyWith<$Res> {
  factory $MaterialReturnDetailCopyWith(MaterialReturnDetail value,
          $Res Function(MaterialReturnDetail) then) =
      _$MaterialReturnDetailCopyWithImpl<$Res, MaterialReturnDetail>;
  @useResult
  $Res call(
      {int id,
      double quantity,
      String na,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      Warehouse warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      MaterialReturn materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt});

  $MaterialReturnCopyWith<$Res> get materialReturn;
  $MaterialCopyWith<$Res> get material;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class _$MaterialReturnDetailCopyWithImpl<$Res,
        $Val extends MaterialReturnDetail>
    implements $MaterialReturnDetailCopyWith<$Res> {
  _$MaterialReturnDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? na = null,
    Object? warehouse = null,
    Object? materialReturn = null,
    Object? material = null,
    Object? materialUnit = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
      materialReturn: null == materialReturn
          ? _value.materialReturn
          : materialReturn // ignore: cast_nullable_to_non_nullable
              as MaterialReturn,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReturnCopyWith<$Res> get materialReturn {
    return $MaterialReturnCopyWith<$Res>(_value.materialReturn, (value) {
      return _then(_value.copyWith(materialReturn: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialReturnDetailImplCopyWith<$Res>
    implements $MaterialReturnDetailCopyWith<$Res> {
  factory _$$MaterialReturnDetailImplCopyWith(_$MaterialReturnDetailImpl value,
          $Res Function(_$MaterialReturnDetailImpl) then) =
      __$$MaterialReturnDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double quantity,
      String na,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      Warehouse warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      MaterialReturn materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt});

  @override
  $MaterialReturnCopyWith<$Res> get materialReturn;
  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$MaterialReturnDetailImplCopyWithImpl<$Res>
    extends _$MaterialReturnDetailCopyWithImpl<$Res, _$MaterialReturnDetailImpl>
    implements _$$MaterialReturnDetailImplCopyWith<$Res> {
  __$$MaterialReturnDetailImplCopyWithImpl(_$MaterialReturnDetailImpl _value,
      $Res Function(_$MaterialReturnDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? na = null,
    Object? warehouse = null,
    Object? materialReturn = null,
    Object? material = null,
    Object? materialUnit = null,
    Object? createdAt = null,
  }) {
    return _then(_$MaterialReturnDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
      materialReturn: null == materialReturn
          ? _value.materialReturn
          : materialReturn // ignore: cast_nullable_to_non_nullable
              as MaterialReturn,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReturnDetailImpl extends _MaterialReturnDetail {
  _$MaterialReturnDetailImpl(
      {required this.id,
      required this.quantity,
      required this.na,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      required this.warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      required this.materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required this.material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt})
      : super._();

  factory _$MaterialReturnDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReturnDetailImplFromJson(json);

  @override
  final int id;
  @override
  final double quantity;
  @override
  final String na;
  @override
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  final Warehouse warehouse;
  @override
  @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
  final MaterialReturn materialReturn;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  final Material material;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit materialUnit;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;

  @override
  String toString() {
    return 'MaterialReturnDetail(id: $id, quantity: $quantity, na: $na, warehouse: $warehouse, materialReturn: $materialReturn, material: $material, materialUnit: $materialUnit, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReturnDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.materialReturn, materialReturn) ||
                other.materialReturn == materialReturn) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, na, warehouse,
      materialReturn, material, materialUnit, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReturnDetailImplCopyWith<_$MaterialReturnDetailImpl>
      get copyWith =>
          __$$MaterialReturnDetailImplCopyWithImpl<_$MaterialReturnDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReturnDetailImplToJson(
      this,
    );
  }
}

abstract class _MaterialReturnDetail extends MaterialReturnDetail {
  factory _MaterialReturnDetail(
      {required final int id,
      required final double quantity,
      required final String na,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      required final Warehouse warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      required final MaterialReturn materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required final Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit materialUnit,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt}) = _$MaterialReturnDetailImpl;
  _MaterialReturnDetail._() : super._();

  factory _MaterialReturnDetail.fromJson(Map<String, dynamic> json) =
      _$MaterialReturnDetailImpl.fromJson;

  @override
  int get id;
  @override
  double get quantity;
  @override
  String get na;
  @override
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  Warehouse get warehouse;
  @override
  @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
  MaterialReturn get materialReturn;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReturnDetailImplCopyWith<_$MaterialReturnDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
