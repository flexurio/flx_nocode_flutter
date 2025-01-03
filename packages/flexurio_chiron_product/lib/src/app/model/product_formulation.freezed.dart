// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_formulation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductFormulation _$ProductFormulationFromJson(Map<String, dynamic> json) {
  return _ProductFormulation.fromJson(json);
}

/// @nodoc
mixin _$ProductFormulation {
  int get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _typeFromString)
  ProductFormulationType get type => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _scaleFromString)
  ProductFormulationScale get scale => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_confirm', defaultValue: false)
  bool get isConfirm => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFormulationCopyWith<ProductFormulation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFormulationCopyWith<$Res> {
  factory $ProductFormulationCopyWith(
          ProductFormulation value, $Res Function(ProductFormulation) then) =
      _$ProductFormulationCopyWithImpl<$Res, ProductFormulation>;
  @useResult
  $Res call(
      {int id,
      String? description,
      String? name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(fromJson: _typeFromString) ProductFormulationType type,
      double quantity,
      @JsonKey(fromJson: _scaleFromString) ProductFormulationScale scale,
      @JsonKey(name: 'is_confirm', defaultValue: false) bool isConfirm,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
      Product product,
      String unit});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductFormulationCopyWithImpl<$Res, $Val extends ProductFormulation>
    implements $ProductFormulationCopyWith<$Res> {
  _$ProductFormulationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? name = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? type = null,
    Object? quantity = null,
    Object? scale = null,
    Object? isConfirm = null,
    Object? isActive = null,
    Object? product = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductFormulationType,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as ProductFormulationScale,
      isConfirm: null == isConfirm
          ? _value.isConfirm
          : isConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductFormulationImplCopyWith<$Res>
    implements $ProductFormulationCopyWith<$Res> {
  factory _$$ProductFormulationImplCopyWith(_$ProductFormulationImpl value,
          $Res Function(_$ProductFormulationImpl) then) =
      __$$ProductFormulationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? description,
      String? name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(fromJson: _typeFromString) ProductFormulationType type,
      double quantity,
      @JsonKey(fromJson: _scaleFromString) ProductFormulationScale scale,
      @JsonKey(name: 'is_confirm', defaultValue: false) bool isConfirm,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
      Product product,
      String unit});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductFormulationImplCopyWithImpl<$Res>
    extends _$ProductFormulationCopyWithImpl<$Res, _$ProductFormulationImpl>
    implements _$$ProductFormulationImplCopyWith<$Res> {
  __$$ProductFormulationImplCopyWithImpl(_$ProductFormulationImpl _value,
      $Res Function(_$ProductFormulationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = freezed,
    Object? name = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? type = null,
    Object? quantity = null,
    Object? scale = null,
    Object? isConfirm = null,
    Object? isActive = null,
    Object? product = null,
    Object? unit = null,
  }) {
    return _then(_$ProductFormulationImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProductFormulationType,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as ProductFormulationScale,
      null == isConfirm
          ? _value.isConfirm
          : isConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFormulationImpl extends _ProductFormulation {
  const _$ProductFormulationImpl(
      this.id,
      this.description,
      this.name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(fromJson: _typeFromString) this.type,
      this.quantity,
      @JsonKey(fromJson: _scaleFromString) this.scale,
      @JsonKey(name: 'is_confirm', defaultValue: false) this.isConfirm,
      @JsonKey(name: 'is_active', defaultValue: false) this.isActive,
      this.product,
      this.unit)
      : super._();

  factory _$ProductFormulationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFormulationImplFromJson(json);

  @override
  final int id;
  @override
  final String? description;
  @override
  final String? name;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(fromJson: _typeFromString)
  final ProductFormulationType type;
  @override
  final double quantity;
  @override
  @JsonKey(fromJson: _scaleFromString)
  final ProductFormulationScale scale;
  @override
  @JsonKey(name: 'is_confirm', defaultValue: false)
  final bool isConfirm;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;
  @override
  final Product product;
  @override
  final String unit;

  @override
  String toString() {
    return 'ProductFormulation(id: $id, description: $description, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, type: $type, quantity: $quantity, scale: $scale, isConfirm: $isConfirm, isActive: $isActive, product: $product, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFormulationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.isConfirm, isConfirm) ||
                other.isConfirm == isConfirm) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, name, createdAt,
      updatedAt, type, quantity, scale, isConfirm, isActive, product, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFormulationImplCopyWith<_$ProductFormulationImpl> get copyWith =>
      __$$ProductFormulationImplCopyWithImpl<_$ProductFormulationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFormulationImplToJson(
      this,
    );
  }
}

abstract class _ProductFormulation extends ProductFormulation {
  const factory _ProductFormulation(
      final int id,
      final String? description,
      final String? name,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(fromJson: _typeFromString) final ProductFormulationType type,
      final double quantity,
      @JsonKey(fromJson: _scaleFromString) final ProductFormulationScale scale,
      @JsonKey(name: 'is_confirm', defaultValue: false) final bool isConfirm,
      @JsonKey(name: 'is_active', defaultValue: false) final bool isActive,
      final Product product,
      final String unit) = _$ProductFormulationImpl;
  const _ProductFormulation._() : super._();

  factory _ProductFormulation.fromJson(Map<String, dynamic> json) =
      _$ProductFormulationImpl.fromJson;

  @override
  int get id;
  @override
  String? get description;
  @override
  String? get name;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(fromJson: _typeFromString)
  ProductFormulationType get type;
  @override
  double get quantity;
  @override
  @JsonKey(fromJson: _scaleFromString)
  ProductFormulationScale get scale;
  @override
  @JsonKey(name: 'is_confirm', defaultValue: false)
  bool get isConfirm;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;
  @override
  Product get product;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$ProductFormulationImplCopyWith<_$ProductFormulationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
