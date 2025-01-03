// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_receive_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnReceiveReport _$ProductReturnReceiveReportFromJson(
    Map<String, dynamic> json) {
  return _ProductReturnReceiveReport.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnReceiveReport {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  int get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_check')
  int get quantityCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_product_price')
  int get totalProductPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_qc_by_id')
  int get checkQcById => throw _privateConstructorUsedError;
  @JsonKey(name: 'repack_at', fromJson: dateTimeNullable)
  DateTime? get repackAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'repack_by_id')
  int get repackById => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_quality_assurance_check')
  int get quantityQualityAssuranceCheck => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_by_id')
  int get qualityAssuranceCheckById => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  DateTime get qualityAssuranceCheckDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_warehouse_return')
  int get quantityWarehouseReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_warehouse_remaining')
  int get quantityWarehouseRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out_return')
  int get quantityOutReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_out_remaining')
  int get quantityOutRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable)
  DateTime? get checkQcAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderDate => throw _privateConstructorUsedError;

  /// Serializes this ProductReturnReceiveReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReturnReceiveReportCopyWith<ProductReturnReceiveReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnReceiveReportCopyWith<$Res> {
  factory $ProductReturnReceiveReportCopyWith(ProductReturnReceiveReport value,
          $Res Function(ProductReturnReceiveReport) then) =
      _$ProductReturnReceiveReportCopyWithImpl<$Res,
          ProductReturnReceiveReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'batch_no') String batchNo,
      int quantity,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'quantity_check') int quantityCheck,
      @JsonKey(name: 'total_product_price') int totalProductPrice,
      @JsonKey(name: 'check_qc_by_id') int checkQcById,
      @JsonKey(name: 'repack_at', fromJson: dateTimeNullable)
      DateTime? repackAt,
      @JsonKey(name: 'repack_by_id') int repackById,
      String status,
      @JsonKey(name: 'quantity_quality_assurance_check')
      int quantityQualityAssuranceCheck,
      String description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      int qualityAssuranceCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return') int quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      int quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') int quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining') int quantityOutRemaining,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      Product productId,
      @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
      DateTime? expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable)
      DateTime? checkQcAt,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      DateTime? deliveryOrderDate});

  $ProductReturnCopyWith<$Res> get productReturn;
  $ProductCopyWith<$Res> get productId;
}

/// @nodoc
class _$ProductReturnReceiveReportCopyWithImpl<$Res,
        $Val extends ProductReturnReceiveReport>
    implements $ProductReturnReceiveReportCopyWith<$Res> {
  _$ProductReturnReceiveReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productPrice = null,
    Object? batchNo = null,
    Object? quantity = null,
    Object? quantityRemaining = null,
    Object? quantityCheck = null,
    Object? totalProductPrice = null,
    Object? checkQcById = null,
    Object? repackAt = freezed,
    Object? repackById = null,
    Object? status = null,
    Object? quantityQualityAssuranceCheck = null,
    Object? description = null,
    Object? qualityAssuranceCheckById = null,
    Object? qualityAssuranceCheckDate = null,
    Object? quantityWarehouseReturn = null,
    Object? quantityWarehouseRemaining = null,
    Object? quantityOutReturn = null,
    Object? quantityOutRemaining = null,
    Object? unitId = null,
    Object? deliveryOrderId = null,
    Object? productReturn = null,
    Object? productId = null,
    Object? expirationDate = freezed,
    Object? checkQcAt = freezed,
    Object? deliveryOrderDate = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCheck: null == quantityCheck
          ? _value.quantityCheck
          : quantityCheck // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      checkQcById: null == checkQcById
          ? _value.checkQcById
          : checkQcById // ignore: cast_nullable_to_non_nullable
              as int,
      repackAt: freezed == repackAt
          ? _value.repackAt
          : repackAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repackById: null == repackById
          ? _value.repackById
          : repackById // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      quantityQualityAssuranceCheck: null == quantityQualityAssuranceCheck
          ? _value.quantityQualityAssuranceCheck
          : quantityQualityAssuranceCheck // ignore: cast_nullable_to_non_nullable
              as int,
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
              as int,
      quantityWarehouseRemaining: null == quantityWarehouseRemaining
          ? _value.quantityWarehouseRemaining
          : quantityWarehouseRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityOutReturn: null == quantityOutReturn
          ? _value.quantityOutReturn
          : quantityOutReturn // ignore: cast_nullable_to_non_nullable
              as int,
      quantityOutRemaining: null == quantityOutRemaining
          ? _value.quantityOutRemaining
          : quantityOutRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as Product,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkQcAt: freezed == checkQcAt
          ? _value.checkQcAt
          : checkQcAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value) as $Val);
    });
  }

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get productId {
    return $ProductCopyWith<$Res>(_value.productId, (value) {
      return _then(_value.copyWith(productId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReturnReceiveReportImplCopyWith<$Res>
    implements $ProductReturnReceiveReportCopyWith<$Res> {
  factory _$$ProductReturnReceiveReportImplCopyWith(
          _$ProductReturnReceiveReportImpl value,
          $Res Function(_$ProductReturnReceiveReportImpl) then) =
      __$$ProductReturnReceiveReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'batch_no') String batchNo,
      int quantity,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'quantity_check') int quantityCheck,
      @JsonKey(name: 'total_product_price') int totalProductPrice,
      @JsonKey(name: 'check_qc_by_id') int checkQcById,
      @JsonKey(name: 'repack_at', fromJson: dateTimeNullable)
      DateTime? repackAt,
      @JsonKey(name: 'repack_by_id') int repackById,
      String status,
      @JsonKey(name: 'quantity_quality_assurance_check')
      int quantityQualityAssuranceCheck,
      String description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      int qualityAssuranceCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return') int quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      int quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') int quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining') int quantityOutRemaining,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      Product productId,
      @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
      DateTime? expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable)
      DateTime? checkQcAt,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      DateTime? deliveryOrderDate});

  @override
  $ProductReturnCopyWith<$Res> get productReturn;
  @override
  $ProductCopyWith<$Res> get productId;
}

/// @nodoc
class __$$ProductReturnReceiveReportImplCopyWithImpl<$Res>
    extends _$ProductReturnReceiveReportCopyWithImpl<$Res,
        _$ProductReturnReceiveReportImpl>
    implements _$$ProductReturnReceiveReportImplCopyWith<$Res> {
  __$$ProductReturnReceiveReportImplCopyWithImpl(
      _$ProductReturnReceiveReportImpl _value,
      $Res Function(_$ProductReturnReceiveReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? productPrice = null,
    Object? batchNo = null,
    Object? quantity = null,
    Object? quantityRemaining = null,
    Object? quantityCheck = null,
    Object? totalProductPrice = null,
    Object? checkQcById = null,
    Object? repackAt = freezed,
    Object? repackById = null,
    Object? status = null,
    Object? quantityQualityAssuranceCheck = null,
    Object? description = null,
    Object? qualityAssuranceCheckById = null,
    Object? qualityAssuranceCheckDate = null,
    Object? quantityWarehouseReturn = null,
    Object? quantityWarehouseRemaining = null,
    Object? quantityOutReturn = null,
    Object? quantityOutRemaining = null,
    Object? unitId = null,
    Object? deliveryOrderId = null,
    Object? productReturn = null,
    Object? productId = null,
    Object? expirationDate = freezed,
    Object? checkQcAt = freezed,
    Object? deliveryOrderDate = freezed,
  }) {
    return _then(_$ProductReturnReceiveReportImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityCheck: null == quantityCheck
          ? _value.quantityCheck
          : quantityCheck // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      checkQcById: null == checkQcById
          ? _value.checkQcById
          : checkQcById // ignore: cast_nullable_to_non_nullable
              as int,
      repackAt: freezed == repackAt
          ? _value.repackAt
          : repackAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      repackById: null == repackById
          ? _value.repackById
          : repackById // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      quantityQualityAssuranceCheck: null == quantityQualityAssuranceCheck
          ? _value.quantityQualityAssuranceCheck
          : quantityQualityAssuranceCheck // ignore: cast_nullable_to_non_nullable
              as int,
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
              as int,
      quantityWarehouseRemaining: null == quantityWarehouseRemaining
          ? _value.quantityWarehouseRemaining
          : quantityWarehouseRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      quantityOutReturn: null == quantityOutReturn
          ? _value.quantityOutReturn
          : quantityOutReturn // ignore: cast_nullable_to_non_nullable
              as int,
      quantityOutRemaining: null == quantityOutRemaining
          ? _value.quantityOutRemaining
          : quantityOutRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as Product,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkQcAt: freezed == checkQcAt
          ? _value.checkQcAt
          : checkQcAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnReceiveReportImpl extends _ProductReturnReceiveReport {
  _$ProductReturnReceiveReportImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'batch_no') required this.batchNo,
      required this.quantity,
      @JsonKey(name: 'quantity_remaining') required this.quantityRemaining,
      @JsonKey(name: 'quantity_check') required this.quantityCheck,
      @JsonKey(name: 'total_product_price') required this.totalProductPrice,
      @JsonKey(name: 'check_qc_by_id') required this.checkQcById,
      @JsonKey(name: 'repack_at', fromJson: dateTimeNullable) this.repackAt,
      @JsonKey(name: 'repack_by_id') required this.repackById,
      required this.status,
      @JsonKey(name: 'quantity_quality_assurance_check')
      required this.quantityQualityAssuranceCheck,
      required this.description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      required this.qualityAssuranceCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      required this.qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return')
      required this.quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      required this.quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return') required this.quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining')
      required this.quantityOutRemaining,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required this.productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.productId,
      @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
      this.expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable) this.checkQcAt,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      this.deliveryOrderDate})
      : super._();

  factory _$ProductReturnReceiveReportImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductReturnReceiveReportImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'product_price')
  final int productPrice;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'quantity_remaining')
  final int quantityRemaining;
  @override
  @JsonKey(name: 'quantity_check')
  final int quantityCheck;
  @override
  @JsonKey(name: 'total_product_price')
  final int totalProductPrice;
  @override
  @JsonKey(name: 'check_qc_by_id')
  final int checkQcById;
  @override
  @JsonKey(name: 'repack_at', fromJson: dateTimeNullable)
  final DateTime? repackAt;
  @override
  @JsonKey(name: 'repack_by_id')
  final int repackById;
  @override
  final String status;
  @override
  @JsonKey(name: 'quantity_quality_assurance_check')
  final int quantityQualityAssuranceCheck;
  @override
  final String description;
  @override
  @JsonKey(name: 'quality_assurance_check_by_id')
  final int qualityAssuranceCheckById;
  @override
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  final DateTime qualityAssuranceCheckDate;
  @override
  @JsonKey(name: 'quantity_warehouse_return')
  final int quantityWarehouseReturn;
  @override
  @JsonKey(name: 'quantity_warehouse_remaining')
  final int quantityWarehouseRemaining;
  @override
  @JsonKey(name: 'quantity_out_return')
  final int quantityOutReturn;
  @override
  @JsonKey(name: 'quantity_out_remaining')
  final int quantityOutRemaining;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  final ProductReturn productReturn;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product productId;
  @override
  @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
  final DateTime? expirationDate;
  @override
  @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable)
  final DateTime? checkQcAt;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
  final DateTime? deliveryOrderDate;

  @override
  String toString() {
    return 'ProductReturnReceiveReport(createdAt: $createdAt, updatedAt: $updatedAt, productPrice: $productPrice, batchNo: $batchNo, quantity: $quantity, quantityRemaining: $quantityRemaining, quantityCheck: $quantityCheck, totalProductPrice: $totalProductPrice, checkQcById: $checkQcById, repackAt: $repackAt, repackById: $repackById, status: $status, quantityQualityAssuranceCheck: $quantityQualityAssuranceCheck, description: $description, qualityAssuranceCheckById: $qualityAssuranceCheckById, qualityAssuranceCheckDate: $qualityAssuranceCheckDate, quantityWarehouseReturn: $quantityWarehouseReturn, quantityWarehouseRemaining: $quantityWarehouseRemaining, quantityOutReturn: $quantityOutReturn, quantityOutRemaining: $quantityOutRemaining, unitId: $unitId, deliveryOrderId: $deliveryOrderId, productReturn: $productReturn, productId: $productId, expirationDate: $expirationDate, checkQcAt: $checkQcAt, deliveryOrderDate: $deliveryOrderDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnReceiveReportImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining) &&
            (identical(other.quantityCheck, quantityCheck) ||
                other.quantityCheck == quantityCheck) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.checkQcById, checkQcById) ||
                other.checkQcById == checkQcById) &&
            (identical(other.repackAt, repackAt) ||
                other.repackAt == repackAt) &&
            (identical(other.repackById, repackById) ||
                other.repackById == repackById) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.quantityQualityAssuranceCheck,
                    quantityQualityAssuranceCheck) ||
                other.quantityQualityAssuranceCheck ==
                    quantityQualityAssuranceCheck) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.qualityAssuranceCheckById, qualityAssuranceCheckById) ||
                other.qualityAssuranceCheckById == qualityAssuranceCheckById) &&
            (identical(other.qualityAssuranceCheckDate, qualityAssuranceCheckDate) ||
                other.qualityAssuranceCheckDate == qualityAssuranceCheckDate) &&
            (identical(other.quantityWarehouseReturn, quantityWarehouseReturn) ||
                other.quantityWarehouseReturn == quantityWarehouseReturn) &&
            (identical(other.quantityWarehouseRemaining, quantityWarehouseRemaining) ||
                other.quantityWarehouseRemaining ==
                    quantityWarehouseRemaining) &&
            (identical(other.quantityOutReturn, quantityOutReturn) ||
                other.quantityOutReturn == quantityOutReturn) &&
            (identical(other.quantityOutRemaining, quantityOutRemaining) ||
                other.quantityOutRemaining == quantityOutRemaining) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.checkQcAt, checkQcAt) ||
                other.checkQcAt == checkQcAt) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        updatedAt,
        productPrice,
        batchNo,
        quantity,
        quantityRemaining,
        quantityCheck,
        totalProductPrice,
        checkQcById,
        repackAt,
        repackById,
        status,
        quantityQualityAssuranceCheck,
        description,
        qualityAssuranceCheckById,
        qualityAssuranceCheckDate,
        quantityWarehouseReturn,
        quantityWarehouseRemaining,
        quantityOutReturn,
        quantityOutRemaining,
        unitId,
        deliveryOrderId,
        productReturn,
        productId,
        expirationDate,
        checkQcAt,
        deliveryOrderDate
      ]);

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnReceiveReportImplCopyWith<_$ProductReturnReceiveReportImpl>
      get copyWith => __$$ProductReturnReceiveReportImplCopyWithImpl<
          _$ProductReturnReceiveReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnReceiveReportImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnReceiveReport extends ProductReturnReceiveReport {
  factory _ProductReturnReceiveReport(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'product_price') required final int productPrice,
      @JsonKey(name: 'batch_no') required final String batchNo,
      required final int quantity,
      @JsonKey(name: 'quantity_remaining') required final int quantityRemaining,
      @JsonKey(name: 'quantity_check') required final int quantityCheck,
      @JsonKey(name: 'total_product_price')
      required final int totalProductPrice,
      @JsonKey(name: 'check_qc_by_id') required final int checkQcById,
      @JsonKey(name: 'repack_at', fromJson: dateTimeNullable)
      final DateTime? repackAt,
      @JsonKey(name: 'repack_by_id') required final int repackById,
      required final String status,
      @JsonKey(name: 'quantity_quality_assurance_check')
      required final int quantityQualityAssuranceCheck,
      required final String description,
      @JsonKey(name: 'quality_assurance_check_by_id')
      required final int qualityAssuranceCheckById,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      required final DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'quantity_warehouse_return')
      required final int quantityWarehouseReturn,
      @JsonKey(name: 'quantity_warehouse_remaining')
      required final int quantityWarehouseRemaining,
      @JsonKey(name: 'quantity_out_return')
      required final int quantityOutReturn,
      @JsonKey(name: 'quantity_out_remaining')
      required final int quantityOutRemaining,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required final ProductReturn productReturn,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product productId,
      @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
      final DateTime? expirationDate,
      @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable)
      final DateTime? checkQcAt,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
      final DateTime? deliveryOrderDate}) = _$ProductReturnReceiveReportImpl;
  _ProductReturnReceiveReport._() : super._();

  factory _ProductReturnReceiveReport.fromJson(Map<String, dynamic> json) =
      _$ProductReturnReceiveReportImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'product_price')
  int get productPrice;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining;
  @override
  @JsonKey(name: 'quantity_check')
  int get quantityCheck;
  @override
  @JsonKey(name: 'total_product_price')
  int get totalProductPrice;
  @override
  @JsonKey(name: 'check_qc_by_id')
  int get checkQcById;
  @override
  @JsonKey(name: 'repack_at', fromJson: dateTimeNullable)
  DateTime? get repackAt;
  @override
  @JsonKey(name: 'repack_by_id')
  int get repackById;
  @override
  String get status;
  @override
  @JsonKey(name: 'quantity_quality_assurance_check')
  int get quantityQualityAssuranceCheck;
  @override
  String get description;
  @override
  @JsonKey(name: 'quality_assurance_check_by_id')
  int get qualityAssuranceCheckById;
  @override
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  DateTime get qualityAssuranceCheckDate;
  @override
  @JsonKey(name: 'quantity_warehouse_return')
  int get quantityWarehouseReturn;
  @override
  @JsonKey(name: 'quantity_warehouse_remaining')
  int get quantityWarehouseRemaining;
  @override
  @JsonKey(name: 'quantity_out_return')
  int get quantityOutReturn;
  @override
  @JsonKey(name: 'quantity_out_remaining')
  int get quantityOutRemaining;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get productId;
  @override
  @JsonKey(name: 'expiration_date', fromJson: dateTimeNullable)
  DateTime? get expirationDate;
  @override
  @JsonKey(name: 'check_qc_at', fromJson: dateTimeNullable)
  DateTime? get checkQcAt;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullable)
  DateTime? get deliveryOrderDate;

  /// Create a copy of ProductReturnReceiveReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReturnReceiveReportImplCopyWith<_$ProductReturnReceiveReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
