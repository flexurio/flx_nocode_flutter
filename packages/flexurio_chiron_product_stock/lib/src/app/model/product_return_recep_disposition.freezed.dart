// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_recep_disposition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnRecapDisposition _$ProductReturnRecapDispositionFromJson(
    Map<String, dynamic> json) {
  return _ProductReturnRecapDisposition.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnRecapDisposition {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_by_id')
  int get qualityAssuranceCheckById => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_date')
  DateTime get qualityAssuranceCheckDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_warehouse_return')
  double get quantityWarehouseReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_warehouse_remaining')
  double get quantityWarehouseRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out_return')
  double get quantityOutReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out_remaining')
  double get quantityOutRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmPpicAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
  DateTime? get productIssueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnRecapDispositionCopyWith<ProductReturnRecapDisposition>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnRecapDispositionCopyWith<$Res> {
  factory $ProductReturnRecapDispositionCopyWith(
          ProductReturnRecapDisposition value,
          $Res Function(ProductReturnRecapDisposition) then) =
      _$ProductReturnRecapDispositionCopyWithImpl<$Res,
          ProductReturnRecapDisposition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'quantity') double quantity,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      int qualityAssuranceCheckById,
      @JsonKey(name: 'quality_assurance_check_date')
      DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return')
      double quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      double quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') double quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining') double quantityOutRemaining,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryOrderDate,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
      DateTime? confirmPpicAt,
      @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
      DateTime? productIssueDate});

  $ProductCopyWith<$Res> get product;
  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class _$ProductReturnRecapDispositionCopyWithImpl<$Res,
        $Val extends ProductReturnRecapDisposition>
    implements $ProductReturnRecapDispositionCopyWith<$Res> {
  _$ProductReturnRecapDispositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? batchNo = null,
    Object? status = null,
    Object? quantity = null,
    Object? description = null,
    Object? qualityAssuranceCheckById = null,
    Object? qualityAssuranceCheckDate = null,
    Object? quantityWarehouseReturn = null,
    Object? quantityWarehouseRemaining = null,
    Object? quantityOutReturn = null,
    Object? quantityOutRemaining = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = freezed,
    Object? unitId = null,
    Object? product = null,
    Object? productReturn = null,
    Object? confirmPpicAt = freezed,
    Object? productIssueDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      qualityAssuranceCheckById: null == qualityAssuranceCheckById
          ? _value.qualityAssuranceCheckById
          : qualityAssuranceCheckById // ignore: cast_nullable_to_non_nullable
              as int,
      qualityAssuranceCheckDate: null == qualityAssuranceCheckDate
          ? _value.qualityAssuranceCheckDate
          : qualityAssuranceCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantityWarehouseReturn: null == quantityWarehouseReturn
          ? _value.quantityWarehouseReturn
          : quantityWarehouseReturn // ignore: cast_nullable_to_non_nullable
              as double,
      quantityWarehouseRemaining: null == quantityWarehouseRemaining
          ? _value.quantityWarehouseRemaining
          : quantityWarehouseRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      quantityOutReturn: null == quantityOutReturn
          ? _value.quantityOutReturn
          : quantityOutReturn // ignore: cast_nullable_to_non_nullable
              as double,
      quantityOutRemaining: null == quantityOutRemaining
          ? _value.quantityOutRemaining
          : quantityOutRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      confirmPpicAt: freezed == confirmPpicAt
          ? _value.confirmPpicAt
          : confirmPpicAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productIssueDate: freezed == productIssueDate
          ? _value.productIssueDate
          : productIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnRecapDispositionImplCopyWith<$Res>
    implements $ProductReturnRecapDispositionCopyWith<$Res> {
  factory _$$ProductReturnRecapDispositionImplCopyWith(
          _$ProductReturnRecapDispositionImpl value,
          $Res Function(_$ProductReturnRecapDispositionImpl) then) =
      __$$ProductReturnRecapDispositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'quantity') double quantity,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      int qualityAssuranceCheckById,
      @JsonKey(name: 'quality_assurance_check_date')
      DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return')
      double quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      double quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') double quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining') double quantityOutRemaining,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryOrderDate,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
      DateTime? confirmPpicAt,
      @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
      DateTime? productIssueDate});

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$ProductReturnRecapDispositionImplCopyWithImpl<$Res>
    extends _$ProductReturnRecapDispositionCopyWithImpl<$Res,
        _$ProductReturnRecapDispositionImpl>
    implements _$$ProductReturnRecapDispositionImplCopyWith<$Res> {
  __$$ProductReturnRecapDispositionImplCopyWithImpl(
      _$ProductReturnRecapDispositionImpl _value,
      $Res Function(_$ProductReturnRecapDispositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? batchNo = null,
    Object? status = null,
    Object? quantity = null,
    Object? description = null,
    Object? qualityAssuranceCheckById = null,
    Object? qualityAssuranceCheckDate = null,
    Object? quantityWarehouseReturn = null,
    Object? quantityWarehouseRemaining = null,
    Object? quantityOutReturn = null,
    Object? quantityOutRemaining = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = freezed,
    Object? unitId = null,
    Object? product = null,
    Object? productReturn = null,
    Object? confirmPpicAt = freezed,
    Object? productIssueDate = freezed,
  }) {
    return _then(_$ProductReturnRecapDispositionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      qualityAssuranceCheckById: null == qualityAssuranceCheckById
          ? _value.qualityAssuranceCheckById
          : qualityAssuranceCheckById // ignore: cast_nullable_to_non_nullable
              as int,
      qualityAssuranceCheckDate: null == qualityAssuranceCheckDate
          ? _value.qualityAssuranceCheckDate
          : qualityAssuranceCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantityWarehouseReturn: null == quantityWarehouseReturn
          ? _value.quantityWarehouseReturn
          : quantityWarehouseReturn // ignore: cast_nullable_to_non_nullable
              as double,
      quantityWarehouseRemaining: null == quantityWarehouseRemaining
          ? _value.quantityWarehouseRemaining
          : quantityWarehouseRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      quantityOutReturn: null == quantityOutReturn
          ? _value.quantityOutReturn
          : quantityOutReturn // ignore: cast_nullable_to_non_nullable
              as double,
      quantityOutRemaining: null == quantityOutRemaining
          ? _value.quantityOutRemaining
          : quantityOutRemaining // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      confirmPpicAt: freezed == confirmPpicAt
          ? _value.confirmPpicAt
          : confirmPpicAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productIssueDate: freezed == productIssueDate
          ? _value.productIssueDate
          : productIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnRecapDispositionImpl
    extends _ProductReturnRecapDisposition {
  _$ProductReturnRecapDispositionImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      required this.qualityAssuranceCheckById,
      @JsonKey(name: 'quality_assurance_check_date')
      required this.qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return')
      required this.quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      required this.quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') required this.quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining')
      required this.quantityOutRemaining,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      required this.deliveryOrderDate,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required this.productReturn,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
      required this.confirmPpicAt,
      @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
      required this.productIssueDate})
      : super._();

  factory _$ProductReturnRecapDispositionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductReturnRecapDispositionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'quantity')
  final double quantity;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'quality_assurance_check_by_id')
  final int qualityAssuranceCheckById;
  @override
  @JsonKey(name: 'quality_assurance_check_date')
  final DateTime qualityAssuranceCheckDate;
  @override
  @JsonKey(name: 'quantity_warehouse_return')
  final double quantityWarehouseReturn;
  @override
  @JsonKey(name: 'quantity_warehouse_remaining')
  final double quantityWarehouseRemaining;
  @override
  @JsonKey(name: 'quantity_out_return')
  final double quantityOutReturn;
  @override
  @JsonKey(name: 'quantity_out_remaining')
  final double quantityOutRemaining;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  final DateTime? deliveryOrderDate;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  final ProductReturn productReturn;
  @override
  @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
  final DateTime? confirmPpicAt;
  @override
  @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
  final DateTime? productIssueDate;

  @override
  String toString() {
    return 'ProductReturnRecapDisposition(id: $id, createdById: $createdById, updatedById: $updatedById, createdAt: $createdAt, updatedAt: $updatedAt, batchNo: $batchNo, status: $status, quantity: $quantity, description: $description, qualityAssuranceCheckById: $qualityAssuranceCheckById, qualityAssuranceCheckDate: $qualityAssuranceCheckDate, quantityWarehouseReturn: $quantityWarehouseReturn, quantityWarehouseRemaining: $quantityWarehouseRemaining, quantityOutReturn: $quantityOutReturn, quantityOutRemaining: $quantityOutRemaining, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, unitId: $unitId, product: $product, productReturn: $productReturn, confirmPpicAt: $confirmPpicAt, productIssueDate: $productIssueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnRecapDispositionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.qualityAssuranceCheckById,
                    qualityAssuranceCheckById) ||
                other.qualityAssuranceCheckById == qualityAssuranceCheckById) &&
            (identical(other.qualityAssuranceCheckDate,
                    qualityAssuranceCheckDate) ||
                other.qualityAssuranceCheckDate == qualityAssuranceCheckDate) &&
            (identical(other.quantityWarehouseReturn, quantityWarehouseReturn) ||
                other.quantityWarehouseReturn == quantityWarehouseReturn) &&
            (identical(other.quantityWarehouseRemaining,
                    quantityWarehouseRemaining) ||
                other.quantityWarehouseRemaining ==
                    quantityWarehouseRemaining) &&
            (identical(other.quantityOutReturn, quantityOutReturn) ||
                other.quantityOutReturn == quantityOutReturn) &&
            (identical(other.quantityOutRemaining, quantityOutRemaining) ||
                other.quantityOutRemaining == quantityOutRemaining) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn) &&
            (identical(other.confirmPpicAt, confirmPpicAt) ||
                other.confirmPpicAt == confirmPpicAt) &&
            (identical(other.productIssueDate, productIssueDate) ||
                other.productIssueDate == productIssueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdById,
        updatedById,
        createdAt,
        updatedAt,
        batchNo,
        status,
        quantity,
        description,
        qualityAssuranceCheckById,
        qualityAssuranceCheckDate,
        quantityWarehouseReturn,
        quantityWarehouseRemaining,
        quantityOutReturn,
        quantityOutRemaining,
        deliveryOrderId,
        deliveryOrderDate,
        unitId,
        product,
        productReturn,
        confirmPpicAt,
        productIssueDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnRecapDispositionImplCopyWith<
          _$ProductReturnRecapDispositionImpl>
      get copyWith => __$$ProductReturnRecapDispositionImplCopyWithImpl<
          _$ProductReturnRecapDispositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnRecapDispositionImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnRecapDisposition
    extends ProductReturnRecapDisposition {
  factory _ProductReturnRecapDisposition(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime? updatedAt,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'quantity') required final double quantity,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      required final int qualityAssuranceCheckById,
      @JsonKey(name: 'quality_assurance_check_date')
      required final DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return')
      required final double quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      required final double quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return')
      required final double quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining')
      required final double quantityOutRemaining,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      required final DateTime? deliveryOrderDate,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required final ProductReturn productReturn,
      @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
      required final DateTime? confirmPpicAt,
      @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
      required final DateTime?
          productIssueDate}) = _$ProductReturnRecapDispositionImpl;
  _ProductReturnRecapDisposition._() : super._();

  factory _ProductReturnRecapDisposition.fromJson(Map<String, dynamic> json) =
      _$ProductReturnRecapDispositionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'quantity')
  double get quantity;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'quality_assurance_check_by_id')
  int get qualityAssuranceCheckById;
  @override
  @JsonKey(name: 'quality_assurance_check_date')
  DateTime get qualityAssuranceCheckDate;
  @override
  @JsonKey(name: 'quantity_warehouse_return')
  double get quantityWarehouseReturn;
  @override
  @JsonKey(name: 'quantity_warehouse_remaining')
  double get quantityWarehouseRemaining;
  @override
  @JsonKey(name: 'quantity_out_return')
  double get quantityOutReturn;
  @override
  @JsonKey(name: 'quantity_out_remaining')
  double get quantityOutRemaining;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryOrderDate;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn;
  @override
  @JsonKey(name: 'confirm_ppic_at', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmPpicAt;
  @override
  @JsonKey(name: 'product_issue_date', fromJson: dateTimeNullableFromJson)
  DateTime? get productIssueDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnRecapDispositionImplCopyWith<
          _$ProductReturnRecapDispositionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
