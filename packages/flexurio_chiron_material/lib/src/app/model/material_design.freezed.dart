// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_design.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialDesign _$MaterialDesignFromJson(Map<String, dynamic> json) {
  return _MaterialDesign.fromJson(json);
}

/// @nodoc
mixin _$MaterialDesign {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code')
  String get designCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_lock', defaultValue: false)
  bool get isLock => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
  ProductFormulation get formulation => throw _privateConstructorUsedError;

  /// Serializes this MaterialDesign to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialDesignCopyWith<MaterialDesign> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDesignCopyWith<$Res> {
  factory $MaterialDesignCopyWith(
          MaterialDesign value, $Res Function(MaterialDesign) then) =
      _$MaterialDesignCopyWithImpl<$Res, MaterialDesign>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String description,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'design_code') String designCode,
      @JsonKey(name: 'is_lock', defaultValue: false) bool isLock,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      ProductFormulation formulation});

  $MaterialCopyWith<$Res> get material;
  $ProductFormulationCopyWith<$Res> get formulation;
}

/// @nodoc
class _$MaterialDesignCopyWithImpl<$Res, $Val extends MaterialDesign>
    implements $MaterialDesignCopyWith<$Res> {
  _$MaterialDesignCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? description = null,
    Object? updateById = null,
    Object? designCode = null,
    Object? isLock = null,
    Object? material = null,
    Object? formulation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      designCode: null == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String,
      isLock: null == isLock
          ? _value.isLock
          : isLock // ignore: cast_nullable_to_non_nullable
              as bool,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      formulation: null == formulation
          ? _value.formulation
          : formulation // ignore: cast_nullable_to_non_nullable
              as ProductFormulation,
    ) as $Val);
  }

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductFormulationCopyWith<$Res> get formulation {
    return $ProductFormulationCopyWith<$Res>(_value.formulation, (value) {
      return _then(_value.copyWith(formulation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialDesignImplCopyWith<$Res>
    implements $MaterialDesignCopyWith<$Res> {
  factory _$$MaterialDesignImplCopyWith(_$MaterialDesignImpl value,
          $Res Function(_$MaterialDesignImpl) then) =
      __$$MaterialDesignImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String description,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'design_code') String designCode,
      @JsonKey(name: 'is_lock', defaultValue: false) bool isLock,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      ProductFormulation formulation});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $ProductFormulationCopyWith<$Res> get formulation;
}

/// @nodoc
class __$$MaterialDesignImplCopyWithImpl<$Res>
    extends _$MaterialDesignCopyWithImpl<$Res, _$MaterialDesignImpl>
    implements _$$MaterialDesignImplCopyWith<$Res> {
  __$$MaterialDesignImplCopyWithImpl(
      _$MaterialDesignImpl _value, $Res Function(_$MaterialDesignImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? description = null,
    Object? updateById = null,
    Object? designCode = null,
    Object? isLock = null,
    Object? material = null,
    Object? formulation = null,
  }) {
    return _then(_$MaterialDesignImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      null == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == isLock
          ? _value.isLock
          : isLock // ignore: cast_nullable_to_non_nullable
              as bool,
      null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      null == formulation
          ? _value.formulation
          : formulation // ignore: cast_nullable_to_non_nullable
              as ProductFormulation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialDesignImpl implements _MaterialDesign {
  _$MaterialDesignImpl(
      this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      this.description,
      @JsonKey(name: 'updated_by_id') this.updateById,
      @JsonKey(name: 'design_code') this.designCode,
      @JsonKey(name: 'is_lock', defaultValue: false) this.isLock,
      @JsonKey(name: 'material', fromJson: Material.fromJson) this.material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      this.formulation);

  factory _$MaterialDesignImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialDesignImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final String description;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;
  @override
  @JsonKey(name: 'design_code')
  final String designCode;
  @override
  @JsonKey(name: 'is_lock', defaultValue: false)
  final bool isLock;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  final Material material;
  @override
  @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
  final ProductFormulation formulation;

  @override
  String toString() {
    return 'MaterialDesign(id: $id, createAt: $createAt, createdById: $createdById, updatedAt: $updatedAt, description: $description, updateById: $updateById, designCode: $designCode, isLock: $isLock, material: $material, formulation: $formulation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialDesignImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.designCode, designCode) ||
                other.designCode == designCode) &&
            (identical(other.isLock, isLock) || other.isLock == isLock) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.formulation, formulation) ||
                other.formulation == formulation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createAt,
      createdById,
      updatedAt,
      description,
      updateById,
      designCode,
      isLock,
      material,
      formulation);

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialDesignImplCopyWith<_$MaterialDesignImpl> get copyWith =>
      __$$MaterialDesignImplCopyWithImpl<_$MaterialDesignImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialDesignImplToJson(
      this,
    );
  }
}

abstract class _MaterialDesign implements MaterialDesign {
  factory _MaterialDesign(
      final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      final String description,
      @JsonKey(name: 'updated_by_id') final int updateById,
      @JsonKey(name: 'design_code') final String designCode,
      @JsonKey(name: 'is_lock', defaultValue: false) final bool isLock,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      final Material material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      final ProductFormulation formulation) = _$MaterialDesignImpl;

  factory _MaterialDesign.fromJson(Map<String, dynamic> json) =
      _$MaterialDesignImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  String get description;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;
  @override
  @JsonKey(name: 'design_code')
  String get designCode;
  @override
  @JsonKey(name: 'is_lock', defaultValue: false)
  bool get isLock;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material;
  @override
  @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
  ProductFormulation get formulation;

  /// Create a copy of MaterialDesign
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialDesignImplCopyWith<_$MaterialDesignImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
