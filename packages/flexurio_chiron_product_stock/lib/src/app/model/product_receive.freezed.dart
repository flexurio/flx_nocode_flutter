// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReceive _$ProductReceiveFromJson(Map<String, dynamic> json) {
  return _ProductReceive.fromJson(json);
}

/// @nodoc
mixin _$ProductReceive {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String? get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
  ProductReceiveStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReceiveCopyWith<ProductReceive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReceiveCopyWith<$Res> {
  factory $ProductReceiveCopyWith(
          ProductReceive value, $Res Function(ProductReceive) then) =
      _$ProductReceiveCopyWithImpl<$Res, ProductReceive>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(name: 'delivery_order_id') String? deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryOrderDate,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
      ProductReceiveStatus status,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder});

  $SupplierCopyWith<$Res> get supplier;
  $TransactionTypeCopyWith<$Res> get transactionType;
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class _$ProductReceiveCopyWithImpl<$Res, $Val extends ProductReceive>
    implements $ProductReceiveCopyWith<$Res> {
  _$ProductReceiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? description = null,
    Object? deliveryOrderId = freezed,
    Object? deliveryOrderDate = freezed,
    Object? supplier = null,
    Object? status = null,
    Object? transactionType = null,
    Object? purchaseOrder = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: freezed == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReceiveStatus,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get transactionType {
    return $TransactionTypeCopyWith<$Res>(_value.transactionType, (value) {
      return _then(_value.copyWith(transactionType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReceiveImplCopyWith<$Res>
    implements $ProductReceiveCopyWith<$Res> {
  factory _$$ProductReceiveImplCopyWith(_$ProductReceiveImpl value,
          $Res Function(_$ProductReceiveImpl) then) =
      __$$ProductReceiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(defaultValue: '') String description,
      @JsonKey(name: 'delivery_order_id') String? deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryOrderDate,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
      ProductReceiveStatus status,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      TransactionType transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder});

  @override
  $SupplierCopyWith<$Res> get supplier;
  @override
  $TransactionTypeCopyWith<$Res> get transactionType;
  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$ProductReceiveImplCopyWithImpl<$Res>
    extends _$ProductReceiveCopyWithImpl<$Res, _$ProductReceiveImpl>
    implements _$$ProductReceiveImplCopyWith<$Res> {
  __$$ProductReceiveImplCopyWithImpl(
      _$ProductReceiveImpl _value, $Res Function(_$ProductReceiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? description = null,
    Object? deliveryOrderId = freezed,
    Object? deliveryOrderDate = freezed,
    Object? supplier = null,
    Object? status = null,
    Object? transactionType = null,
    Object? purchaseOrder = null,
  }) {
    return _then(_$ProductReceiveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: freezed == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReceiveStatus,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReceiveImpl extends _ProductReceive {
  _$ProductReceiveImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(defaultValue: '') required this.description,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      required this.deliveryOrderDate,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required this.supplier,
      @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
      required this.status,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      required this.transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required this.purchaseOrder})
      : super._();

  factory _$ProductReceiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReceiveImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
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
  @JsonKey(defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String? deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  final DateTime? deliveryOrderDate;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  final Supplier supplier;
  @override
  @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
  final ProductReceiveStatus status;
  @override
  @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
  final TransactionType transactionType;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'ProductReceive(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, description: $description, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, supplier: $supplier, status: $status, transactionType: $transactionType, purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReceiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      createdById,
      updatedAt,
      updatedById,
      description,
      deliveryOrderId,
      deliveryOrderDate,
      supplier,
      status,
      transactionType,
      purchaseOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReceiveImplCopyWith<_$ProductReceiveImpl> get copyWith =>
      __$$ProductReceiveImplCopyWithImpl<_$ProductReceiveImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReceiveImplToJson(
      this,
    );
  }
}

abstract class _ProductReceive extends ProductReceive {
  factory _ProductReceive(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(defaultValue: '') required final String description,
      @JsonKey(name: 'delivery_order_id')
      required final String? deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      required final DateTime? deliveryOrderDate,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required final Supplier supplier,
      @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
      required final ProductReceiveStatus status,
      @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
      required final TransactionType transactionType,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required final PurchaseOrder purchaseOrder}) = _$ProductReceiveImpl;
  _ProductReceive._() : super._();

  factory _ProductReceive.fromJson(Map<String, dynamic> json) =
      _$ProductReceiveImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
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
  @JsonKey(defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'delivery_order_id')
  String? get deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryOrderDate;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier;
  @override
  @JsonKey(name: 'status', fromJson: ProductReceiveStatus.fromString)
  ProductReceiveStatus get status;
  @override
  @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
  TransactionType get transactionType;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(ignore: true)
  _$$ProductReceiveImplCopyWith<_$ProductReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
