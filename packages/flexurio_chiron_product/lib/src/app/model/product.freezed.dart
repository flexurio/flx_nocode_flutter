// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: _productTypeFromString)
  ProductType get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
  DateTime get nieExpiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_no')
  String get productNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_pack')
  int get quantityPack => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_batch')
  int get quantityBatch => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_strip')
  int get quantityStrip => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_tablet')
  int get quantityTablet => throw _privateConstructorUsedError;
  @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
  DivisionType get division => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_period')
  int get expiryPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitPacking => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  ProductGroup get productGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitSmallest => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitSecondary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_phased_out', defaultValue: false)
  bool get isPhasedOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_toll_out', defaultValue: false)
  bool get tollOut => throw _privateConstructorUsedError;
  String? get nie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String company,
      @JsonKey(name: 'type', fromJson: _productTypeFromString)
      ProductType productType,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
      DateTime nieExpiredDate,
      @JsonKey(name: 'updated_by_id') int updateById,
      String name,
      @JsonKey(name: 'product_no') String productNo,
      @JsonKey(name: 'quantity_pack') int quantityPack,
      @JsonKey(name: 'quantity_batch') int quantityBatch,
      @JsonKey(name: 'quantity_strip') int quantityStrip,
      @JsonKey(name: 'quantity_tablet') int quantityTablet,
      @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
      DivisionType division,
      @JsonKey(name: 'expiry_period') int expiryPeriod,
      @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitPacking,
      @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitOrder,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      ProductGroup productGroup,
      @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitSmallest,
      @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitSecondary,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_phased_out', defaultValue: false) bool isPhasedOut,
      @JsonKey(name: 'is_toll_out', defaultValue: false) bool tollOut,
      String? nie});

  $MaterialUnitCopyWith<$Res> get unitPacking;
  $MaterialUnitCopyWith<$Res> get unitOrder;
  $ProductGroupCopyWith<$Res> get productGroup;
  $MaterialUnitCopyWith<$Res> get unitSmallest;
  $MaterialUnitCopyWith<$Res> get unitSecondary;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? productType = null,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? nieExpiredDate = null,
    Object? updateById = null,
    Object? name = null,
    Object? productNo = null,
    Object? quantityPack = null,
    Object? quantityBatch = null,
    Object? quantityStrip = null,
    Object? quantityTablet = null,
    Object? division = null,
    Object? expiryPeriod = null,
    Object? unitPacking = null,
    Object? unitOrder = null,
    Object? productGroup = null,
    Object? unitSmallest = null,
    Object? unitSecondary = null,
    Object? isActive = null,
    Object? isPhasedOut = null,
    Object? tollOut = null,
    Object? nie = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType,
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
      nieExpiredDate: null == nieExpiredDate
          ? _value.nieExpiredDate
          : nieExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productNo: null == productNo
          ? _value.productNo
          : productNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantityPack: null == quantityPack
          ? _value.quantityPack
          : quantityPack // ignore: cast_nullable_to_non_nullable
              as int,
      quantityBatch: null == quantityBatch
          ? _value.quantityBatch
          : quantityBatch // ignore: cast_nullable_to_non_nullable
              as int,
      quantityStrip: null == quantityStrip
          ? _value.quantityStrip
          : quantityStrip // ignore: cast_nullable_to_non_nullable
              as int,
      quantityTablet: null == quantityTablet
          ? _value.quantityTablet
          : quantityTablet // ignore: cast_nullable_to_non_nullable
              as int,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as DivisionType,
      expiryPeriod: null == expiryPeriod
          ? _value.expiryPeriod
          : expiryPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      unitPacking: null == unitPacking
          ? _value.unitPacking
          : unitPacking // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitOrder: null == unitOrder
          ? _value.unitOrder
          : unitOrder // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      unitSmallest: null == unitSmallest
          ? _value.unitSmallest
          : unitSmallest // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitSecondary: null == unitSecondary
          ? _value.unitSecondary
          : unitSecondary // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhasedOut: null == isPhasedOut
          ? _value.isPhasedOut
          : isPhasedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      tollOut: null == tollOut
          ? _value.tollOut
          : tollOut // ignore: cast_nullable_to_non_nullable
              as bool,
      nie: freezed == nie
          ? _value.nie
          : nie // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitPacking {
    return $MaterialUnitCopyWith<$Res>(_value.unitPacking, (value) {
      return _then(_value.copyWith(unitPacking: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitOrder {
    return $MaterialUnitCopyWith<$Res>(_value.unitOrder, (value) {
      return _then(_value.copyWith(unitOrder: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductGroupCopyWith<$Res> get productGroup {
    return $ProductGroupCopyWith<$Res>(_value.productGroup, (value) {
      return _then(_value.copyWith(productGroup: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitSmallest {
    return $MaterialUnitCopyWith<$Res>(_value.unitSmallest, (value) {
      return _then(_value.copyWith(unitSmallest: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitSecondary {
    return $MaterialUnitCopyWith<$Res>(_value.unitSecondary, (value) {
      return _then(_value.copyWith(unitSecondary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(defaultValue: '') String company,
      @JsonKey(name: 'type', fromJson: _productTypeFromString)
      ProductType productType,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
      DateTime nieExpiredDate,
      @JsonKey(name: 'updated_by_id') int updateById,
      String name,
      @JsonKey(name: 'product_no') String productNo,
      @JsonKey(name: 'quantity_pack') int quantityPack,
      @JsonKey(name: 'quantity_batch') int quantityBatch,
      @JsonKey(name: 'quantity_strip') int quantityStrip,
      @JsonKey(name: 'quantity_tablet') int quantityTablet,
      @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
      DivisionType division,
      @JsonKey(name: 'expiry_period') int expiryPeriod,
      @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitPacking,
      @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitOrder,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      ProductGroup productGroup,
      @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitSmallest,
      @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
      MaterialUnit unitSecondary,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_phased_out', defaultValue: false) bool isPhasedOut,
      @JsonKey(name: 'is_toll_out', defaultValue: false) bool tollOut,
      String? nie});

  @override
  $MaterialUnitCopyWith<$Res> get unitPacking;
  @override
  $MaterialUnitCopyWith<$Res> get unitOrder;
  @override
  $ProductGroupCopyWith<$Res> get productGroup;
  @override
  $MaterialUnitCopyWith<$Res> get unitSmallest;
  @override
  $MaterialUnitCopyWith<$Res> get unitSecondary;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? company = null,
    Object? productType = null,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? nieExpiredDate = null,
    Object? updateById = null,
    Object? name = null,
    Object? productNo = null,
    Object? quantityPack = null,
    Object? quantityBatch = null,
    Object? quantityStrip = null,
    Object? quantityTablet = null,
    Object? division = null,
    Object? expiryPeriod = null,
    Object? unitPacking = null,
    Object? unitOrder = null,
    Object? productGroup = null,
    Object? unitSmallest = null,
    Object? unitSecondary = null,
    Object? isActive = null,
    Object? isPhasedOut = null,
    Object? tollOut = null,
    Object? nie = freezed,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType,
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
      nieExpiredDate: null == nieExpiredDate
          ? _value.nieExpiredDate
          : nieExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productNo: null == productNo
          ? _value.productNo
          : productNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantityPack: null == quantityPack
          ? _value.quantityPack
          : quantityPack // ignore: cast_nullable_to_non_nullable
              as int,
      quantityBatch: null == quantityBatch
          ? _value.quantityBatch
          : quantityBatch // ignore: cast_nullable_to_non_nullable
              as int,
      quantityStrip: null == quantityStrip
          ? _value.quantityStrip
          : quantityStrip // ignore: cast_nullable_to_non_nullable
              as int,
      quantityTablet: null == quantityTablet
          ? _value.quantityTablet
          : quantityTablet // ignore: cast_nullable_to_non_nullable
              as int,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as DivisionType,
      expiryPeriod: null == expiryPeriod
          ? _value.expiryPeriod
          : expiryPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      unitPacking: null == unitPacking
          ? _value.unitPacking
          : unitPacking // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitOrder: null == unitOrder
          ? _value.unitOrder
          : unitOrder // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      unitSmallest: null == unitSmallest
          ? _value.unitSmallest
          : unitSmallest // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitSecondary: null == unitSecondary
          ? _value.unitSecondary
          : unitSecondary // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPhasedOut: null == isPhasedOut
          ? _value.isPhasedOut
          : isPhasedOut // ignore: cast_nullable_to_non_nullable
              as bool,
      tollOut: null == tollOut
          ? _value.tollOut
          : tollOut // ignore: cast_nullable_to_non_nullable
              as bool,
      nie: freezed == nie
          ? _value.nie
          : nie // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {required this.id,
      @JsonKey(defaultValue: '') required this.company,
      @JsonKey(name: 'type', fromJson: _productTypeFromString)
      required this.productType,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
      required this.nieExpiredDate,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      required this.name,
      @JsonKey(name: 'product_no') required this.productNo,
      @JsonKey(name: 'quantity_pack') required this.quantityPack,
      @JsonKey(name: 'quantity_batch') required this.quantityBatch,
      @JsonKey(name: 'quantity_strip') required this.quantityStrip,
      @JsonKey(name: 'quantity_tablet') required this.quantityTablet,
      @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
      required this.division,
      @JsonKey(name: 'expiry_period') required this.expiryPeriod,
      @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
      required this.unitPacking,
      @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
      required this.unitOrder,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      required this.productGroup,
      @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
      required this.unitSmallest,
      @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
      required this.unitSecondary,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_phased_out', defaultValue: false)
      required this.isPhasedOut,
      @JsonKey(name: 'is_toll_out', defaultValue: false) this.tollOut = false,
      this.nie})
      : super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String company;
  @override
  @JsonKey(name: 'type', fromJson: _productTypeFromString)
  final ProductType productType;
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
  @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
  final DateTime nieExpiredDate;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;
  @override
  final String name;
  @override
  @JsonKey(name: 'product_no')
  final String productNo;
  @override
  @JsonKey(name: 'quantity_pack')
  final int quantityPack;
  @override
  @JsonKey(name: 'quantity_batch')
  final int quantityBatch;
  @override
  @JsonKey(name: 'quantity_strip')
  final int quantityStrip;
  @override
  @JsonKey(name: 'quantity_tablet')
  final int quantityTablet;
  @override
  @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
  final DivisionType division;
  @override
  @JsonKey(name: 'expiry_period')
  final int expiryPeriod;
  @override
  @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unitPacking;
  @override
  @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unitOrder;
  @override
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  final ProductGroup productGroup;
  @override
  @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unitSmallest;
  @override
  @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unitSecondary;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_phased_out', defaultValue: false)
  final bool isPhasedOut;
  @override
  @JsonKey(name: 'is_toll_out', defaultValue: false)
  final bool tollOut;
  @override
  final String? nie;

  @override
  String toString() {
    return 'Product(id: $id, company: $company, productType: $productType, createAt: $createAt, createdById: $createdById, updatedAt: $updatedAt, nieExpiredDate: $nieExpiredDate, updateById: $updateById, name: $name, productNo: $productNo, quantityPack: $quantityPack, quantityBatch: $quantityBatch, quantityStrip: $quantityStrip, quantityTablet: $quantityTablet, division: $division, expiryPeriod: $expiryPeriod, unitPacking: $unitPacking, unitOrder: $unitOrder, productGroup: $productGroup, unitSmallest: $unitSmallest, unitSecondary: $unitSecondary, isActive: $isActive, isPhasedOut: $isPhasedOut, tollOut: $tollOut, nie: $nie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.nieExpiredDate, nieExpiredDate) ||
                other.nieExpiredDate == nieExpiredDate) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.productNo, productNo) ||
                other.productNo == productNo) &&
            (identical(other.quantityPack, quantityPack) ||
                other.quantityPack == quantityPack) &&
            (identical(other.quantityBatch, quantityBatch) ||
                other.quantityBatch == quantityBatch) &&
            (identical(other.quantityStrip, quantityStrip) ||
                other.quantityStrip == quantityStrip) &&
            (identical(other.quantityTablet, quantityTablet) ||
                other.quantityTablet == quantityTablet) &&
            (identical(other.division, division) ||
                other.division == division) &&
            (identical(other.expiryPeriod, expiryPeriod) ||
                other.expiryPeriod == expiryPeriod) &&
            (identical(other.unitPacking, unitPacking) ||
                other.unitPacking == unitPacking) &&
            (identical(other.unitOrder, unitOrder) ||
                other.unitOrder == unitOrder) &&
            (identical(other.productGroup, productGroup) ||
                other.productGroup == productGroup) &&
            (identical(other.unitSmallest, unitSmallest) ||
                other.unitSmallest == unitSmallest) &&
            (identical(other.unitSecondary, unitSecondary) ||
                other.unitSecondary == unitSecondary) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isPhasedOut, isPhasedOut) ||
                other.isPhasedOut == isPhasedOut) &&
            (identical(other.tollOut, tollOut) || other.tollOut == tollOut) &&
            (identical(other.nie, nie) || other.nie == nie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        company,
        productType,
        createAt,
        createdById,
        updatedAt,
        nieExpiredDate,
        updateById,
        name,
        productNo,
        quantityPack,
        quantityBatch,
        quantityStrip,
        quantityTablet,
        division,
        expiryPeriod,
        unitPacking,
        unitOrder,
        productGroup,
        unitSmallest,
        unitSecondary,
        isActive,
        isPhasedOut,
        tollOut,
        nie
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {required final String id,
      @JsonKey(defaultValue: '') required final String company,
      @JsonKey(name: 'type', fromJson: _productTypeFromString)
      required final ProductType productType,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
      required final DateTime nieExpiredDate,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      required final String name,
      @JsonKey(name: 'product_no') required final String productNo,
      @JsonKey(name: 'quantity_pack') required final int quantityPack,
      @JsonKey(name: 'quantity_batch') required final int quantityBatch,
      @JsonKey(name: 'quantity_strip') required final int quantityStrip,
      @JsonKey(name: 'quantity_tablet') required final int quantityTablet,
      @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
      required final DivisionType division,
      @JsonKey(name: 'expiry_period') required final int expiryPeriod,
      @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unitPacking,
      @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unitOrder,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      required final ProductGroup productGroup,
      @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unitSmallest,
      @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unitSecondary,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'is_phased_out', defaultValue: false)
      required final bool isPhasedOut,
      @JsonKey(name: 'is_toll_out', defaultValue: false) final bool tollOut,
      final String? nie}) = _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get company;
  @override
  @JsonKey(name: 'type', fromJson: _productTypeFromString)
  ProductType get productType;
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
  @JsonKey(name: 'nie_expired_date', fromJson: isoDateToDateTime)
  DateTime get nieExpiredDate;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;
  @override
  String get name;
  @override
  @JsonKey(name: 'product_no')
  String get productNo;
  @override
  @JsonKey(name: 'quantity_pack')
  int get quantityPack;
  @override
  @JsonKey(name: 'quantity_batch')
  int get quantityBatch;
  @override
  @JsonKey(name: 'quantity_strip')
  int get quantityStrip;
  @override
  @JsonKey(name: 'quantity_tablet')
  int get quantityTablet;
  @override
  @JsonKey(name: 'division', fromJson: _divisionTypeFromString)
  DivisionType get division;
  @override
  @JsonKey(name: 'expiry_period')
  int get expiryPeriod;
  @override
  @JsonKey(name: 'unit_packing', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitPacking;
  @override
  @JsonKey(name: 'unit_order', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitOrder;
  @override
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  ProductGroup get productGroup;
  @override
  @JsonKey(name: 'unit_smallest', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitSmallest;
  @override
  @JsonKey(name: 'unit_secondary', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unitSecondary;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_phased_out', defaultValue: false)
  bool get isPhasedOut;
  @override
  @JsonKey(name: 'is_toll_out', defaultValue: false)
  bool get tollOut;
  @override
  String? get nie;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
