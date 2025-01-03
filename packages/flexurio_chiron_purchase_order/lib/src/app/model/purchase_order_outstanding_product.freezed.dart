// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_outstanding_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderOutstandingProduct _$PurchaseOrderOutstandingProductFromJson(
    Map<String, dynamic> json) {
  return _PurchaseOrderOutstandingProduct.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderOutstandingProduct {
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
  DateTime get purchaseOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
  DateTime get materialRequestDueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_id')
  String get materialRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_po')
  int get quantityPo => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_material_request')
  String get periodMaterialRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_status_qc')
  String get productStatusQc => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get divisi => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderOutstandingProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderOutstandingProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderOutstandingProductCopyWith<PurchaseOrderOutstandingProduct>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderOutstandingProductCopyWith<$Res> {
  factory $PurchaseOrderOutstandingProductCopyWith(
          PurchaseOrderOutstandingProduct value,
          $Res Function(PurchaseOrderOutstandingProduct) then) =
      _$PurchaseOrderOutstandingProductCopyWithImpl<$Res,
          PurchaseOrderOutstandingProduct>;
  @useResult
  $Res call(
      {@JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      DateTime purchaseOrderDate,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      DateTime materialRequestDueDate,
      @JsonKey(name: 'material_request_id') String materialRequestId,
      @JsonKey(name: 'quantity_po') int quantityPo,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'period_material_request') String periodMaterialRequest,
      @JsonKey(name: 'product_status_qc') String productStatusQc,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      String divisi});
}

/// @nodoc
class _$PurchaseOrderOutstandingProductCopyWithImpl<$Res,
        $Val extends PurchaseOrderOutstandingProduct>
    implements $PurchaseOrderOutstandingProductCopyWith<$Res> {
  _$PurchaseOrderOutstandingProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderOutstandingProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderId = null,
    Object? supplierName = null,
    Object? productId = null,
    Object? productName = null,
    Object? batchNoId = null,
    Object? purchaseOrderDate = null,
    Object? dateOfNeed = null,
    Object? materialRequestDueDate = null,
    Object? materialRequestId = null,
    Object? quantityPo = null,
    Object? unitId = null,
    Object? periodMaterialRequest = null,
    Object? productStatusQc = null,
    Object? createdAt = null,
    Object? divisi = null,
  }) {
    return _then(_value.copyWith(
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDate: null == purchaseOrderDate
          ? _value.purchaseOrderDate
          : purchaseOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestDueDate: null == materialRequestDueDate
          ? _value.materialRequestDueDate
          : materialRequestDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestId: null == materialRequestId
          ? _value.materialRequestId
          : materialRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityPo: null == quantityPo
          ? _value.quantityPo
          : quantityPo // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      periodMaterialRequest: null == periodMaterialRequest
          ? _value.periodMaterialRequest
          : periodMaterialRequest // ignore: cast_nullable_to_non_nullable
              as String,
      productStatusQc: null == productStatusQc
          ? _value.productStatusQc
          : productStatusQc // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      divisi: null == divisi
          ? _value.divisi
          : divisi // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderOutstandingProductImplCopyWith<$Res>
    implements $PurchaseOrderOutstandingProductCopyWith<$Res> {
  factory _$$PurchaseOrderOutstandingProductImplCopyWith(
          _$PurchaseOrderOutstandingProductImpl value,
          $Res Function(_$PurchaseOrderOutstandingProductImpl) then) =
      __$$PurchaseOrderOutstandingProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      DateTime purchaseOrderDate,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      DateTime materialRequestDueDate,
      @JsonKey(name: 'material_request_id') String materialRequestId,
      @JsonKey(name: 'quantity_po') int quantityPo,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'period_material_request') String periodMaterialRequest,
      @JsonKey(name: 'product_status_qc') String productStatusQc,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      String divisi});
}

/// @nodoc
class __$$PurchaseOrderOutstandingProductImplCopyWithImpl<$Res>
    extends _$PurchaseOrderOutstandingProductCopyWithImpl<$Res,
        _$PurchaseOrderOutstandingProductImpl>
    implements _$$PurchaseOrderOutstandingProductImplCopyWith<$Res> {
  __$$PurchaseOrderOutstandingProductImplCopyWithImpl(
      _$PurchaseOrderOutstandingProductImpl _value,
      $Res Function(_$PurchaseOrderOutstandingProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderOutstandingProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderId = null,
    Object? supplierName = null,
    Object? productId = null,
    Object? productName = null,
    Object? batchNoId = null,
    Object? purchaseOrderDate = null,
    Object? dateOfNeed = null,
    Object? materialRequestDueDate = null,
    Object? materialRequestId = null,
    Object? quantityPo = null,
    Object? unitId = null,
    Object? periodMaterialRequest = null,
    Object? productStatusQc = null,
    Object? createdAt = null,
    Object? divisi = null,
  }) {
    return _then(_$PurchaseOrderOutstandingProductImpl(
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDate: null == purchaseOrderDate
          ? _value.purchaseOrderDate
          : purchaseOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestDueDate: null == materialRequestDueDate
          ? _value.materialRequestDueDate
          : materialRequestDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestId: null == materialRequestId
          ? _value.materialRequestId
          : materialRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      quantityPo: null == quantityPo
          ? _value.quantityPo
          : quantityPo // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      periodMaterialRequest: null == periodMaterialRequest
          ? _value.periodMaterialRequest
          : periodMaterialRequest // ignore: cast_nullable_to_non_nullable
              as String,
      productStatusQc: null == productStatusQc
          ? _value.productStatusQc
          : productStatusQc // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      divisi: null == divisi
          ? _value.divisi
          : divisi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderOutstandingProductImpl
    implements _PurchaseOrderOutstandingProduct {
  const _$PurchaseOrderOutstandingProductImpl(
      {@JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      required this.purchaseOrderDate,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required this.dateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      required this.materialRequestDueDate,
      @JsonKey(name: 'material_request_id') required this.materialRequestId,
      @JsonKey(name: 'quantity_po') required this.quantityPo,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'period_material_request')
      required this.periodMaterialRequest,
      @JsonKey(name: 'product_status_qc') required this.productStatusQc,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      required this.divisi});

  factory _$PurchaseOrderOutstandingProductImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PurchaseOrderOutstandingProductImplFromJson(json);

  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
  final DateTime purchaseOrderDate;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  final DateTime dateOfNeed;
  @override
  @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
  final DateTime materialRequestDueDate;
  @override
  @JsonKey(name: 'material_request_id')
  final String materialRequestId;
  @override
  @JsonKey(name: 'quantity_po')
  final int quantityPo;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'period_material_request')
  final String periodMaterialRequest;
  @override
  @JsonKey(name: 'product_status_qc')
  final String productStatusQc;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  final String divisi;

  @override
  String toString() {
    return 'PurchaseOrderOutstandingProduct(purchaseOrderId: $purchaseOrderId, supplierName: $supplierName, productId: $productId, productName: $productName, batchNoId: $batchNoId, purchaseOrderDate: $purchaseOrderDate, dateOfNeed: $dateOfNeed, materialRequestDueDate: $materialRequestDueDate, materialRequestId: $materialRequestId, quantityPo: $quantityPo, unitId: $unitId, periodMaterialRequest: $periodMaterialRequest, productStatusQc: $productStatusQc, createdAt: $createdAt, divisi: $divisi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderOutstandingProductImpl &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.purchaseOrderDate, purchaseOrderDate) ||
                other.purchaseOrderDate == purchaseOrderDate) &&
            (identical(other.dateOfNeed, dateOfNeed) ||
                other.dateOfNeed == dateOfNeed) &&
            (identical(other.materialRequestDueDate, materialRequestDueDate) ||
                other.materialRequestDueDate == materialRequestDueDate) &&
            (identical(other.materialRequestId, materialRequestId) ||
                other.materialRequestId == materialRequestId) &&
            (identical(other.quantityPo, quantityPo) ||
                other.quantityPo == quantityPo) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.periodMaterialRequest, periodMaterialRequest) ||
                other.periodMaterialRequest == periodMaterialRequest) &&
            (identical(other.productStatusQc, productStatusQc) ||
                other.productStatusQc == productStatusQc) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.divisi, divisi) || other.divisi == divisi));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseOrderId,
      supplierName,
      productId,
      productName,
      batchNoId,
      purchaseOrderDate,
      dateOfNeed,
      materialRequestDueDate,
      materialRequestId,
      quantityPo,
      unitId,
      periodMaterialRequest,
      productStatusQc,
      createdAt,
      divisi);

  /// Create a copy of PurchaseOrderOutstandingProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderOutstandingProductImplCopyWith<
          _$PurchaseOrderOutstandingProductImpl>
      get copyWith => __$$PurchaseOrderOutstandingProductImplCopyWithImpl<
          _$PurchaseOrderOutstandingProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderOutstandingProductImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderOutstandingProduct
    implements PurchaseOrderOutstandingProduct {
  const factory _PurchaseOrderOutstandingProduct(
      {@JsonKey(name: 'purchase_order_id')
      required final String purchaseOrderId,
      @JsonKey(name: 'supplier_name') required final String supplierName,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      required final DateTime purchaseOrderDate,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required final DateTime dateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      required final DateTime materialRequestDueDate,
      @JsonKey(name: 'material_request_id')
      required final String materialRequestId,
      @JsonKey(name: 'quantity_po') required final int quantityPo,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'period_material_request')
      required final String periodMaterialRequest,
      @JsonKey(name: 'product_status_qc') required final String productStatusQc,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      required final String divisi}) = _$PurchaseOrderOutstandingProductImpl;

  factory _PurchaseOrderOutstandingProduct.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderOutstandingProductImpl.fromJson;

  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
  DateTime get purchaseOrderDate;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed;
  @override
  @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
  DateTime get materialRequestDueDate;
  @override
  @JsonKey(name: 'material_request_id')
  String get materialRequestId;
  @override
  @JsonKey(name: 'quantity_po')
  int get quantityPo;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'period_material_request')
  String get periodMaterialRequest;
  @override
  @JsonKey(name: 'product_status_qc')
  String get productStatusQc;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  String get divisi;

  /// Create a copy of PurchaseOrderOutstandingProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderOutstandingProductImplCopyWith<
          _$PurchaseOrderOutstandingProductImpl>
      get copyWith => throw _privateConstructorUsedError;
}
