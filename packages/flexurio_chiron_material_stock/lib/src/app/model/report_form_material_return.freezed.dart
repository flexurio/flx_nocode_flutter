// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_form_material_return.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportFormMaterialReturn _$ReportFormMaterialReturnFromJson(
    Map<String, dynamic> json) {
  return _ReportFormMaterialReturn.fromJson(json);
}

/// @nodoc
mixin _$ReportFormMaterialReturn {
  int get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code')
  String? get designCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  Warehouse get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
  MaterialReturn get materialReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportFormMaterialReturnCopyWith<ReportFormMaterialReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFormMaterialReturnCopyWith<$Res> {
  factory $ReportFormMaterialReturnCopyWith(ReportFormMaterialReturn value,
          $Res Function(ReportFormMaterialReturn) then) =
      _$ReportFormMaterialReturnCopyWithImpl<$Res, ReportFormMaterialReturn>;
  @useResult
  $Res call(
      {int id,
      double quantity,
      String na,
      @JsonKey(name: 'design_code') String? designCode,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      Warehouse warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      MaterialReturn materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit});

  $MaterialReturnCopyWith<$Res> get materialReturn;
  $MaterialCopyWith<$Res> get material;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class _$ReportFormMaterialReturnCopyWithImpl<$Res,
        $Val extends ReportFormMaterialReturn>
    implements $ReportFormMaterialReturnCopyWith<$Res> {
  _$ReportFormMaterialReturnCopyWithImpl(this._value, this._then);

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
    Object? designCode = freezed,
    Object? warehouse = null,
    Object? materialReturn = null,
    Object? material = null,
    Object? materialUnit = null,
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
      designCode: freezed == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ReportFormMaterialReturnImplCopyWith<$Res>
    implements $ReportFormMaterialReturnCopyWith<$Res> {
  factory _$$ReportFormMaterialReturnImplCopyWith(
          _$ReportFormMaterialReturnImpl value,
          $Res Function(_$ReportFormMaterialReturnImpl) then) =
      __$$ReportFormMaterialReturnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double quantity,
      String na,
      @JsonKey(name: 'design_code') String? designCode,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      Warehouse warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      MaterialReturn materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit});

  @override
  $MaterialReturnCopyWith<$Res> get materialReturn;
  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$ReportFormMaterialReturnImplCopyWithImpl<$Res>
    extends _$ReportFormMaterialReturnCopyWithImpl<$Res,
        _$ReportFormMaterialReturnImpl>
    implements _$$ReportFormMaterialReturnImplCopyWith<$Res> {
  __$$ReportFormMaterialReturnImplCopyWithImpl(
      _$ReportFormMaterialReturnImpl _value,
      $Res Function(_$ReportFormMaterialReturnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? na = null,
    Object? designCode = freezed,
    Object? warehouse = null,
    Object? materialReturn = null,
    Object? material = null,
    Object? materialUnit = null,
  }) {
    return _then(_$ReportFormMaterialReturnImpl(
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
      designCode: freezed == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportFormMaterialReturnImpl extends _ReportFormMaterialReturn {
  _$ReportFormMaterialReturnImpl(
      {required this.id,
      required this.quantity,
      required this.na,
      @JsonKey(name: 'design_code') this.designCode,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      required this.warehouse,
      @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
      required this.materialReturn,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required this.material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.materialUnit})
      : super._();

  factory _$ReportFormMaterialReturnImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportFormMaterialReturnImplFromJson(json);

  @override
  final int id;
  @override
  final double quantity;
  @override
  final String na;
  @override
  @JsonKey(name: 'design_code')
  final String? designCode;
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
  String toString() {
    return 'ReportFormMaterialReturn(id: $id, quantity: $quantity, na: $na, designCode: $designCode, warehouse: $warehouse, materialReturn: $materialReturn, material: $material, materialUnit: $materialUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportFormMaterialReturnImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.designCode, designCode) ||
                other.designCode == designCode) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.materialReturn, materialReturn) ||
                other.materialReturn == materialReturn) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, quantity, na, designCode,
      warehouse, materialReturn, material, materialUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportFormMaterialReturnImplCopyWith<_$ReportFormMaterialReturnImpl>
      get copyWith => __$$ReportFormMaterialReturnImplCopyWithImpl<
          _$ReportFormMaterialReturnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportFormMaterialReturnImplToJson(
      this,
    );
  }
}

abstract class _ReportFormMaterialReturn extends ReportFormMaterialReturn {
  factory _ReportFormMaterialReturn(
          {required final int id,
          required final double quantity,
          required final String na,
          @JsonKey(name: 'design_code') final String? designCode,
          @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
          required final Warehouse warehouse,
          @JsonKey(name: 'material_return', fromJson: MaterialReturn.fromJson)
          required final MaterialReturn materialReturn,
          @JsonKey(name: 'material', fromJson: Material.fromJson)
          required final Material material,
          @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
          required final MaterialUnit materialUnit}) =
      _$ReportFormMaterialReturnImpl;
  _ReportFormMaterialReturn._() : super._();

  factory _ReportFormMaterialReturn.fromJson(Map<String, dynamic> json) =
      _$ReportFormMaterialReturnImpl.fromJson;

  @override
  int get id;
  @override
  double get quantity;
  @override
  String get na;
  @override
  @JsonKey(name: 'design_code')
  String? get designCode;
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
  @JsonKey(ignore: true)
  _$$ReportFormMaterialReturnImplCopyWith<_$ReportFormMaterialReturnImpl>
      get copyWith => throw _privateConstructorUsedError;
}
