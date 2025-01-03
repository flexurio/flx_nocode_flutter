// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_note_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnNoteDetail _$ProductReturnNoteDetailFromJson(
    Map<String, dynamic> json) {
  return _ProductReturnNoteDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnNoteDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
  ProductReturnNote get productReturnNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Serializes this ProductReturnNoteDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReturnNoteDetailCopyWith<ProductReturnNoteDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnNoteDetailCopyWith<$Res> {
  factory $ProductReturnNoteDetailCopyWith(ProductReturnNoteDetail value,
          $Res Function(ProductReturnNoteDetail) then) =
      _$ProductReturnNoteDetailCopyWithImpl<$Res, ProductReturnNoteDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(
          name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
      ProductReturnNote productReturnNote,
      @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'unit_id') String unitId,
      int quantity,
      double price,
      double total});

  $ProductReturnNoteCopyWith<$Res> get productReturnNote;
  $ProductReturnCopyWith<$Res> get productReturn;
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductReturnNoteDetailCopyWithImpl<$Res,
        $Val extends ProductReturnNoteDetail>
    implements $ProductReturnNoteDetailCopyWith<$Res> {
  _$ProductReturnNoteDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productReturnNote = null,
    Object? productReturn = null,
    Object? product = null,
    Object? productId = null,
    Object? batchNo = null,
    Object? deliveryOrderId = null,
    Object? unitId = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
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
      productReturnNote: null == productReturnNote
          ? _value.productReturnNote
          : productReturnNote // ignore: cast_nullable_to_non_nullable
              as ProductReturnNote,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnNoteCopyWith<$Res> get productReturnNote {
    return $ProductReturnNoteCopyWith<$Res>(_value.productReturnNote, (value) {
      return _then(_value.copyWith(productReturnNote: value) as $Val);
    });
  }

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value) as $Val);
    });
  }

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnNoteDetailImplCopyWith<$Res>
    implements $ProductReturnNoteDetailCopyWith<$Res> {
  factory _$$ProductReturnNoteDetailImplCopyWith(
          _$ProductReturnNoteDetailImpl value,
          $Res Function(_$ProductReturnNoteDetailImpl) then) =
      __$$ProductReturnNoteDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(
          name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
      ProductReturnNote productReturnNote,
      @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'unit_id') String unitId,
      int quantity,
      double price,
      double total});

  @override
  $ProductReturnNoteCopyWith<$Res> get productReturnNote;
  @override
  $ProductReturnCopyWith<$Res> get productReturn;
  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductReturnNoteDetailImplCopyWithImpl<$Res>
    extends _$ProductReturnNoteDetailCopyWithImpl<$Res,
        _$ProductReturnNoteDetailImpl>
    implements _$$ProductReturnNoteDetailImplCopyWith<$Res> {
  __$$ProductReturnNoteDetailImplCopyWithImpl(
      _$ProductReturnNoteDetailImpl _value,
      $Res Function(_$ProductReturnNoteDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productReturnNote = null,
    Object? productReturn = null,
    Object? product = null,
    Object? productId = null,
    Object? batchNo = null,
    Object? deliveryOrderId = null,
    Object? unitId = null,
    Object? quantity = null,
    Object? price = null,
    Object? total = null,
  }) {
    return _then(_$ProductReturnNoteDetailImpl(
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
      productReturnNote: null == productReturnNote
          ? _value.productReturnNote
          : productReturnNote // ignore: cast_nullable_to_non_nullable
              as ProductReturnNote,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnNoteDetailImpl extends _ProductReturnNoteDetail {
  _$ProductReturnNoteDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(
          name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
      required this.productReturnNote,
      @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
      required this.productReturn,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'unit_id') required this.unitId,
      required this.quantity,
      required this.price,
      required this.total})
      : super._();

  factory _$ProductReturnNoteDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReturnNoteDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
  final ProductReturnNote productReturnNote;
  @override
  @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
  final ProductReturn productReturn;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final double total;

  @override
  String toString() {
    return 'ProductReturnNoteDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, productReturnNote: $productReturnNote, productReturn: $productReturn, product: $product, productId: $productId, batchNo: $batchNo, deliveryOrderId: $deliveryOrderId, unitId: $unitId, quantity: $quantity, price: $price, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnNoteDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.productReturnNote, productReturnNote) ||
                other.productReturnNote == productReturnNote) &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      productReturnNote,
      productReturn,
      product,
      productId,
      batchNo,
      deliveryOrderId,
      unitId,
      quantity,
      price,
      total);

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnNoteDetailImplCopyWith<_$ProductReturnNoteDetailImpl>
      get copyWith => __$$ProductReturnNoteDetailImplCopyWithImpl<
          _$ProductReturnNoteDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnNoteDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnNoteDetail extends ProductReturnNoteDetail {
  factory _ProductReturnNoteDetail(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(
          name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
      required final ProductReturnNote productReturnNote,
      @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
      required final ProductReturn productReturn,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'unit_id') required final String unitId,
      required final int quantity,
      required final double price,
      required final double total}) = _$ProductReturnNoteDetailImpl;
  _ProductReturnNoteDetail._() : super._();

  factory _ProductReturnNoteDetail.fromJson(Map<String, dynamic> json) =
      _$ProductReturnNoteDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'product_return_note', fromJson: ProductReturnNote.fromJson)
  ProductReturnNote get productReturnNote;
  @override
  @JsonKey(name: 'product_return', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  int get quantity;
  @override
  double get price;
  @override
  double get total;

  /// Create a copy of ProductReturnNoteDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReturnNoteDetailImplCopyWith<_$ProductReturnNoteDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
