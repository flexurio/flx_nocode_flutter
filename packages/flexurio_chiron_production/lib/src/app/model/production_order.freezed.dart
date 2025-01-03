// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionOrder _$ProductionOrderFromJson(Map<String, dynamic> json) {
  return _ProductionOrder.fromJson(json);
}

/// @nodoc
mixin _$ProductionOrder {
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_process', defaultValue: true)
  bool get isProcess => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_size', defaultValue: 0)
  int get batchSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_cancel', defaultValue: false)
  bool get isCancel => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_confirm', defaultValue: false)
  bool get isConfirm => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_rework', defaultValue: true)
  bool get isRework => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_toll_in', defaultValue: false)
  bool get isTollIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bulk', defaultValue: true)
  bool get isRuahan => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'product_status',
      defaultValue: ProductionProductStatus.empty,
      fromJson: ProductionProductStatus.fromString)
  ProductionProductStatus get productStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: ProductionProductScale.fromString,
      defaultValue: ProductionProductScale.empty)
  ProductionProductScale get scale => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
  DateTime? get cancelReworkAt => throw _privateConstructorUsedError;
  String? get nie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionOrderCopyWith<ProductionOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionOrderCopyWith<$Res> {
  factory $ProductionOrderCopyWith(
          ProductionOrder value, $Res Function(ProductionOrder) then) =
      _$ProductionOrderCopyWithImpl<$Res, ProductionOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'is_process', defaultValue: true) bool isProcess,
      @JsonKey(name: 'batch_size', defaultValue: 0) int batchSize,
      @JsonKey(name: 'is_cancel', defaultValue: false) bool isCancel,
      @JsonKey(name: 'is_confirm', defaultValue: false) bool isConfirm,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(name: 'is_rework', defaultValue: true) bool isRework,
      @JsonKey(name: 'is_toll_in', defaultValue: false) bool isTollIn,
      @JsonKey(name: 'is_bulk', defaultValue: true) bool isRuahan,
      @JsonKey(
          name: 'product_status',
          defaultValue: ProductionProductStatus.empty,
          fromJson: ProductionProductStatus.fromString)
      ProductionProductStatus productStatus,
      @JsonKey(
          fromJson: ProductionProductScale.fromString,
          defaultValue: ProductionProductScale.empty)
      ProductionProductScale scale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      String id,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
      DateTime? cancelReworkAt,
      String? nie});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductionOrderCopyWithImpl<$Res, $Val extends ProductionOrder>
    implements $ProductionOrderCopyWith<$Res> {
  _$ProductionOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? isProcess = null,
    Object? batchSize = null,
    Object? isCancel = null,
    Object? isConfirm = null,
    Object? description = null,
    Object? isRework = null,
    Object? isTollIn = null,
    Object? isRuahan = null,
    Object? productStatus = null,
    Object? scale = null,
    Object? expirationDate = null,
    Object? id = null,
    Object? cancelReworkAt = freezed,
    Object? nie = freezed,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
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
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      isProcess: null == isProcess
          ? _value.isProcess
          : isProcess // ignore: cast_nullable_to_non_nullable
              as bool,
      batchSize: null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      isCancel: null == isCancel
          ? _value.isCancel
          : isCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirm: null == isConfirm
          ? _value.isConfirm
          : isConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isRework: null == isRework
          ? _value.isRework
          : isRework // ignore: cast_nullable_to_non_nullable
              as bool,
      isTollIn: null == isTollIn
          ? _value.isTollIn
          : isTollIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isRuahan: null == isRuahan
          ? _value.isRuahan
          : isRuahan // ignore: cast_nullable_to_non_nullable
              as bool,
      productStatus: null == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductionProductStatus,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as ProductionProductScale,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cancelReworkAt: freezed == cancelReworkAt
          ? _value.cancelReworkAt
          : cancelReworkAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nie: freezed == nie
          ? _value.nie
          : nie // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ProductionOrderImplCopyWith<$Res>
    implements $ProductionOrderCopyWith<$Res> {
  factory _$$ProductionOrderImplCopyWith(_$ProductionOrderImpl value,
          $Res Function(_$ProductionOrderImpl) then) =
      __$$ProductionOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'is_process', defaultValue: true) bool isProcess,
      @JsonKey(name: 'batch_size', defaultValue: 0) int batchSize,
      @JsonKey(name: 'is_cancel', defaultValue: false) bool isCancel,
      @JsonKey(name: 'is_confirm', defaultValue: false) bool isConfirm,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(name: 'is_rework', defaultValue: true) bool isRework,
      @JsonKey(name: 'is_toll_in', defaultValue: false) bool isTollIn,
      @JsonKey(name: 'is_bulk', defaultValue: true) bool isRuahan,
      @JsonKey(
          name: 'product_status',
          defaultValue: ProductionProductStatus.empty,
          fromJson: ProductionProductStatus.fromString)
      ProductionProductStatus productStatus,
      @JsonKey(
          fromJson: ProductionProductScale.fromString,
          defaultValue: ProductionProductScale.empty)
      ProductionProductScale scale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      String id,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
      DateTime? cancelReworkAt,
      String? nie});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductionOrderImplCopyWithImpl<$Res>
    extends _$ProductionOrderCopyWithImpl<$Res, _$ProductionOrderImpl>
    implements _$$ProductionOrderImplCopyWith<$Res> {
  __$$ProductionOrderImplCopyWithImpl(
      _$ProductionOrderImpl _value, $Res Function(_$ProductionOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? isProcess = null,
    Object? batchSize = null,
    Object? isCancel = null,
    Object? isConfirm = null,
    Object? description = null,
    Object? isRework = null,
    Object? isTollIn = null,
    Object? isRuahan = null,
    Object? productStatus = null,
    Object? scale = null,
    Object? expirationDate = null,
    Object? id = null,
    Object? cancelReworkAt = freezed,
    Object? nie = freezed,
  }) {
    return _then(_$ProductionOrderImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      null == isProcess
          ? _value.isProcess
          : isProcess // ignore: cast_nullable_to_non_nullable
              as bool,
      null == batchSize
          ? _value.batchSize
          : batchSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == isCancel
          ? _value.isCancel
          : isCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isConfirm
          ? _value.isConfirm
          : isConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == isRework
          ? _value.isRework
          : isRework // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isTollIn
          ? _value.isTollIn
          : isTollIn // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isRuahan
          ? _value.isRuahan
          : isRuahan // ignore: cast_nullable_to_non_nullable
              as bool,
      null == productStatus
          ? _value.productStatus
          : productStatus // ignore: cast_nullable_to_non_nullable
              as ProductionProductStatus,
      null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as ProductionProductScale,
      null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == cancelReworkAt
          ? _value.cancelReworkAt
          : cancelReworkAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      freezed == nie
          ? _value.nie
          : nie // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionOrderImpl extends _ProductionOrder {
  _$ProductionOrderImpl(
      @JsonKey(name: 'product', fromJson: Product.fromJson) this.product,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updatedById,
      @JsonKey(name: 'is_process', defaultValue: true) this.isProcess,
      @JsonKey(name: 'batch_size', defaultValue: 0) this.batchSize,
      @JsonKey(name: 'is_cancel', defaultValue: false) this.isCancel,
      @JsonKey(name: 'is_confirm', defaultValue: false) this.isConfirm,
      @JsonKey(defaultValue: '') this.description,
      @JsonKey(name: 'is_rework', defaultValue: true) this.isRework,
      @JsonKey(name: 'is_toll_in', defaultValue: false) this.isTollIn,
      @JsonKey(name: 'is_bulk', defaultValue: true) this.isRuahan,
      @JsonKey(
          name: 'product_status',
          defaultValue: ProductionProductStatus.empty,
          fromJson: ProductionProductStatus.fromString)
      this.productStatus,
      @JsonKey(
          fromJson: ProductionProductScale.fromString,
          defaultValue: ProductionProductScale.empty)
      this.scale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      this.expirationDate,
      this.id,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
      this.cancelReworkAt,
      this.nie)
      : super._();

  factory _$ProductionOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionOrderImplFromJson(json);

  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
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
  final int updatedById;
  @override
  @JsonKey(name: 'is_process', defaultValue: true)
  final bool isProcess;
  @override
  @JsonKey(name: 'batch_size', defaultValue: 0)
  final int batchSize;
  @override
  @JsonKey(name: 'is_cancel', defaultValue: false)
  final bool isCancel;
  @override
  @JsonKey(name: 'is_confirm', defaultValue: false)
  final bool isConfirm;
  @override
  @JsonKey(defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'is_rework', defaultValue: true)
  final bool isRework;
  @override
  @JsonKey(name: 'is_toll_in', defaultValue: false)
  final bool isTollIn;
  @override
  @JsonKey(name: 'is_bulk', defaultValue: true)
  final bool isRuahan;
  @override
  @JsonKey(
      name: 'product_status',
      defaultValue: ProductionProductStatus.empty,
      fromJson: ProductionProductStatus.fromString)
  final ProductionProductStatus productStatus;
  @override
  @JsonKey(
      fromJson: ProductionProductScale.fromString,
      defaultValue: ProductionProductScale.empty)
  final ProductionProductScale scale;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  final DateTime expirationDate;
  @override
  final String id;
  @override
  @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
  final DateTime? cancelReworkAt;
  @override
  final String? nie;

  @override
  String toString() {
    return 'ProductionOrder(product: $product, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, isProcess: $isProcess, batchSize: $batchSize, isCancel: $isCancel, isConfirm: $isConfirm, description: $description, isRework: $isRework, isTollIn: $isTollIn, isRuahan: $isRuahan, productStatus: $productStatus, scale: $scale, expirationDate: $expirationDate, id: $id, cancelReworkAt: $cancelReworkAt, nie: $nie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionOrderImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.isProcess, isProcess) ||
                other.isProcess == isProcess) &&
            (identical(other.batchSize, batchSize) ||
                other.batchSize == batchSize) &&
            (identical(other.isCancel, isCancel) ||
                other.isCancel == isCancel) &&
            (identical(other.isConfirm, isConfirm) ||
                other.isConfirm == isConfirm) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isRework, isRework) ||
                other.isRework == isRework) &&
            (identical(other.isTollIn, isTollIn) ||
                other.isTollIn == isTollIn) &&
            (identical(other.isRuahan, isRuahan) ||
                other.isRuahan == isRuahan) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cancelReworkAt, cancelReworkAt) ||
                other.cancelReworkAt == cancelReworkAt) &&
            (identical(other.nie, nie) || other.nie == nie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        product,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        isProcess,
        batchSize,
        isCancel,
        isConfirm,
        description,
        isRework,
        isTollIn,
        isRuahan,
        productStatus,
        scale,
        expirationDate,
        id,
        cancelReworkAt,
        nie
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionOrderImplCopyWith<_$ProductionOrderImpl> get copyWith =>
      __$$ProductionOrderImplCopyWithImpl<_$ProductionOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionOrderImplToJson(
      this,
    );
  }
}

abstract class _ProductionOrder extends ProductionOrder {
  factory _ProductionOrder(
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      final Product product,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') final int updatedById,
      @JsonKey(name: 'is_process', defaultValue: true) final bool isProcess,
      @JsonKey(name: 'batch_size', defaultValue: 0) final int batchSize,
      @JsonKey(name: 'is_cancel', defaultValue: false) final bool isCancel,
      @JsonKey(name: 'is_confirm', defaultValue: false) final bool isConfirm,
      @JsonKey(defaultValue: '') final String description,
      @JsonKey(name: 'is_rework', defaultValue: true) final bool isRework,
      @JsonKey(name: 'is_toll_in', defaultValue: false) final bool isTollIn,
      @JsonKey(name: 'is_bulk', defaultValue: true) final bool isRuahan,
      @JsonKey(
          name: 'product_status',
          defaultValue: ProductionProductStatus.empty,
          fromJson: ProductionProductStatus.fromString)
      final ProductionProductStatus productStatus,
      @JsonKey(
          fromJson: ProductionProductScale.fromString,
          defaultValue: ProductionProductScale.empty)
      final ProductionProductScale scale,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      final DateTime expirationDate,
      final String id,
      @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
      final DateTime? cancelReworkAt,
      final String? nie) = _$ProductionOrderImpl;
  _ProductionOrder._() : super._();

  factory _ProductionOrder.fromJson(Map<String, dynamic> json) =
      _$ProductionOrderImpl.fromJson;

  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
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
  int get updatedById;
  @override
  @JsonKey(name: 'is_process', defaultValue: true)
  bool get isProcess;
  @override
  @JsonKey(name: 'batch_size', defaultValue: 0)
  int get batchSize;
  @override
  @JsonKey(name: 'is_cancel', defaultValue: false)
  bool get isCancel;
  @override
  @JsonKey(name: 'is_confirm', defaultValue: false)
  bool get isConfirm;
  @override
  @JsonKey(defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'is_rework', defaultValue: true)
  bool get isRework;
  @override
  @JsonKey(name: 'is_toll_in', defaultValue: false)
  bool get isTollIn;
  @override
  @JsonKey(name: 'is_bulk', defaultValue: true)
  bool get isRuahan;
  @override
  @JsonKey(
      name: 'product_status',
      defaultValue: ProductionProductStatus.empty,
      fromJson: ProductionProductStatus.fromString)
  ProductionProductStatus get productStatus;
  @override
  @JsonKey(
      fromJson: ProductionProductScale.fromString,
      defaultValue: ProductionProductScale.empty)
  ProductionProductScale get scale;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate;
  @override
  String get id;
  @override
  @JsonKey(name: 'cancel_rework_at', fromJson: dateTimeNullableFromJson)
  DateTime? get cancelReworkAt;
  @override
  String? get nie;
  @override
  @JsonKey(ignore: true)
  _$$ProductionOrderImplCopyWith<_$ProductionOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
