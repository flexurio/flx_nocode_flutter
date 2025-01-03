// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_formulation_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductFormulationDetail _$ProductFormulationDetailFromJson(
    Map<String, dynamic> json) {
  return _ProductFormulationDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductFormulationDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
  ProductFormulation get formulation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFormulationDetailCopyWith<ProductFormulationDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormulationDetailCopyWith<$Res> {
  factory $ProductFormulationDetailCopyWith(ProductFormulationDetail value,
          $Res Function(ProductFormulationDetail) then) =
      _$ProductFormulationDetailCopyWithImpl<$Res, ProductFormulationDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      double quantity,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      ProductFormulation formulation});

  $MaterialCopyWith<$Res> get material;
  $ProductFormulationCopyWith<$Res> get formulation;
}

/// @nodoc
class _$ProductFormulationDetailCopyWithImpl<$Res,
        $Val extends ProductFormulationDetail>
    implements $ProductFormulationDetailCopyWith<$Res> {
  _$ProductFormulationDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? quantity = null,
    Object? material = null,
    Object? formulation = null,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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

  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductFormulationCopyWith<$Res> get formulation {
    return $ProductFormulationCopyWith<$Res>(_value.formulation, (value) {
      return _then(_value.copyWith(formulation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductFormulationDetailImplCopyWith<$Res>
    implements $ProductFormulationDetailCopyWith<$Res> {
  factory _$$ProductFormulationDetailImplCopyWith(
          _$ProductFormulationDetailImpl value,
          $Res Function(_$ProductFormulationDetailImpl) then) =
      __$$ProductFormulationDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      double quantity,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      ProductFormulation formulation});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $ProductFormulationCopyWith<$Res> get formulation;
}

/// @nodoc
class __$$ProductFormulationDetailImplCopyWithImpl<$Res>
    extends _$ProductFormulationDetailCopyWithImpl<$Res,
        _$ProductFormulationDetailImpl>
    implements _$$ProductFormulationDetailImplCopyWith<$Res> {
  __$$ProductFormulationDetailImplCopyWithImpl(
      _$ProductFormulationDetailImpl _value,
      $Res Function(_$ProductFormulationDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? quantity = null,
    Object? material = null,
    Object? formulation = null,
  }) {
    return _then(_$ProductFormulationDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$ProductFormulationDetailImpl extends _ProductFormulationDetail {
  const _$ProductFormulationDetailImpl(
      this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      this.quantity,
      @JsonKey(name: 'material', fromJson: Material.fromJson) this.material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      this.formulation)
      : super._();

  factory _$ProductFormulationDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFormulationDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  final Material material;
  @override
  @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
  final ProductFormulation formulation;

  @override
  String toString() {
    return 'ProductFormulationDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, quantity: $quantity, material: $material, formulation: $formulation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFormulationDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.formulation, formulation) ||
                other.formulation == formulation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, quantity, material, formulation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFormulationDetailImplCopyWith<_$ProductFormulationDetailImpl>
      get copyWith => __$$ProductFormulationDetailImplCopyWithImpl<
          _$ProductFormulationDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFormulationDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductFormulationDetail extends ProductFormulationDetail {
  const factory _ProductFormulationDetail(
      final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      final double quantity,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      final Material material,
      @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
      final ProductFormulation formulation) = _$ProductFormulationDetailImpl;
  const _ProductFormulationDetail._() : super._();

  factory _ProductFormulationDetail.fromJson(Map<String, dynamic> json) =
      _$ProductFormulationDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material;
  @override
  @JsonKey(name: 'formulation', fromJson: ProductFormulation.fromJson)
  ProductFormulation get formulation;
  @override
  @JsonKey(ignore: true)
  _$$ProductFormulationDetailImplCopyWith<_$ProductFormulationDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
