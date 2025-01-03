// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_requests_unserved.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingRequestsUnserved _$PendingRequestsUnservedFromJson(
    Map<String, dynamic> json) {
  return _PendingRequestsUnserved.fromJson(json);
}

/// @nodoc
mixin _$PendingRequestsUnserved {
  @JsonKey(name: 'ProductRequestId')
  String get productRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
  DateTime get productRequestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_product_request_price')
  int get totalProductRequestPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_sales_order_id')
  String? get initialSalesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_sales_order_id')
  String? get finalSalesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_product')
  String get typeProduct => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  int get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_request_quantity')
  int get productRequestQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
  DateTime? get initialSalesOrderate => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
  DateTime? get finalSalesOrderDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingRequestsUnservedCopyWith<PendingRequestsUnserved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRequestsUnservedCopyWith<$Res> {
  factory $PendingRequestsUnservedCopyWith(PendingRequestsUnserved value,
          $Res Function(PendingRequestsUnserved) then) =
      _$PendingRequestsUnservedCopyWithImpl<$Res, PendingRequestsUnserved>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductRequestId') String productRequestId,
      @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
      DateTime productRequestDate,
      @JsonKey(name: 'department_id') String departmentId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'total_product_request_price')
      int totalProductRequestPrice,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'initial_sales_order_id') String? initialSalesOrderId,
      @JsonKey(name: 'final_sales_order_id') String? finalSalesOrderId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'type_product') String typeProduct,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'product_request_quantity') int productRequestQuantity,
      @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
      DateTime? initialSalesOrderate,
      @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
      DateTime? finalSalesOrderDate});
}

/// @nodoc
class _$PendingRequestsUnservedCopyWithImpl<$Res,
        $Val extends PendingRequestsUnserved>
    implements $PendingRequestsUnservedCopyWith<$Res> {
  _$PendingRequestsUnservedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequestId = null,
    Object? productRequestDate = null,
    Object? departmentId = null,
    Object? productId = null,
    Object? productName = null,
    Object? unitId = null,
    Object? totalProductRequestPrice = null,
    Object? quantityRemaining = null,
    Object? initialSalesOrderId = freezed,
    Object? finalSalesOrderId = freezed,
    Object? customerName = null,
    Object? customerId = null,
    Object? purchaseOrderDistributor = null,
    Object? typeProduct = null,
    Object? productPrice = null,
    Object? productRequestQuantity = null,
    Object? initialSalesOrderate = freezed,
    Object? finalSalesOrderDate = freezed,
  }) {
    return _then(_value.copyWith(
      productRequestId: null == productRequestId
          ? _value.productRequestId
          : productRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      productRequestDate: null == productRequestDate
          ? _value.productRequestDate
          : productRequestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      totalProductRequestPrice: null == totalProductRequestPrice
          ? _value.totalProductRequestPrice
          : totalProductRequestPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      initialSalesOrderId: freezed == initialSalesOrderId
          ? _value.initialSalesOrderId
          : initialSalesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      finalSalesOrderId: freezed == finalSalesOrderId
          ? _value.finalSalesOrderId
          : finalSalesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      typeProduct: null == typeProduct
          ? _value.typeProduct
          : typeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productRequestQuantity: null == productRequestQuantity
          ? _value.productRequestQuantity
          : productRequestQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      initialSalesOrderate: freezed == initialSalesOrderate
          ? _value.initialSalesOrderate
          : initialSalesOrderate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalSalesOrderDate: freezed == finalSalesOrderDate
          ? _value.finalSalesOrderDate
          : finalSalesOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingRequestsUnservedImplCopyWith<$Res>
    implements $PendingRequestsUnservedCopyWith<$Res> {
  factory _$$PendingRequestsUnservedImplCopyWith(
          _$PendingRequestsUnservedImpl value,
          $Res Function(_$PendingRequestsUnservedImpl) then) =
      __$$PendingRequestsUnservedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductRequestId') String productRequestId,
      @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
      DateTime productRequestDate,
      @JsonKey(name: 'department_id') String departmentId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'total_product_request_price')
      int totalProductRequestPrice,
      @JsonKey(name: 'quantity_remaining') int quantityRemaining,
      @JsonKey(name: 'initial_sales_order_id') String? initialSalesOrderId,
      @JsonKey(name: 'final_sales_order_id') String? finalSalesOrderId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'type_product') String typeProduct,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'product_request_quantity') int productRequestQuantity,
      @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
      DateTime? initialSalesOrderate,
      @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
      DateTime? finalSalesOrderDate});
}

/// @nodoc
class __$$PendingRequestsUnservedImplCopyWithImpl<$Res>
    extends _$PendingRequestsUnservedCopyWithImpl<$Res,
        _$PendingRequestsUnservedImpl>
    implements _$$PendingRequestsUnservedImplCopyWith<$Res> {
  __$$PendingRequestsUnservedImplCopyWithImpl(
      _$PendingRequestsUnservedImpl _value,
      $Res Function(_$PendingRequestsUnservedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequestId = null,
    Object? productRequestDate = null,
    Object? departmentId = null,
    Object? productId = null,
    Object? productName = null,
    Object? unitId = null,
    Object? totalProductRequestPrice = null,
    Object? quantityRemaining = null,
    Object? initialSalesOrderId = freezed,
    Object? finalSalesOrderId = freezed,
    Object? customerName = null,
    Object? customerId = null,
    Object? purchaseOrderDistributor = null,
    Object? typeProduct = null,
    Object? productPrice = null,
    Object? productRequestQuantity = null,
    Object? initialSalesOrderate = freezed,
    Object? finalSalesOrderDate = freezed,
  }) {
    return _then(_$PendingRequestsUnservedImpl(
      productRequestId: null == productRequestId
          ? _value.productRequestId
          : productRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      productRequestDate: null == productRequestDate
          ? _value.productRequestDate
          : productRequestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      totalProductRequestPrice: null == totalProductRequestPrice
          ? _value.totalProductRequestPrice
          : totalProductRequestPrice // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRemaining: null == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      initialSalesOrderId: freezed == initialSalesOrderId
          ? _value.initialSalesOrderId
          : initialSalesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      finalSalesOrderId: freezed == finalSalesOrderId
          ? _value.finalSalesOrderId
          : finalSalesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      typeProduct: null == typeProduct
          ? _value.typeProduct
          : typeProduct // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productRequestQuantity: null == productRequestQuantity
          ? _value.productRequestQuantity
          : productRequestQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      initialSalesOrderate: freezed == initialSalesOrderate
          ? _value.initialSalesOrderate
          : initialSalesOrderate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalSalesOrderDate: freezed == finalSalesOrderDate
          ? _value.finalSalesOrderDate
          : finalSalesOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingRequestsUnservedImpl extends _PendingRequestsUnserved {
  const _$PendingRequestsUnservedImpl(
      {@JsonKey(name: 'ProductRequestId') required this.productRequestId,
      @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
      required this.productRequestDate,
      @JsonKey(name: 'department_id') required this.departmentId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'total_product_request_price')
      required this.totalProductRequestPrice,
      @JsonKey(name: 'quantity_remaining') required this.quantityRemaining,
      @JsonKey(name: 'initial_sales_order_id') this.initialSalesOrderId,
      @JsonKey(name: 'final_sales_order_id') this.finalSalesOrderId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'purchase_order_distributor')
      required this.purchaseOrderDistributor,
      @JsonKey(name: 'type_product') required this.typeProduct,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'product_request_quantity')
      required this.productRequestQuantity,
      @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
      this.initialSalesOrderate,
      @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
      this.finalSalesOrderDate})
      : super._();

  factory _$PendingRequestsUnservedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingRequestsUnservedImplFromJson(json);

  @override
  @JsonKey(name: 'ProductRequestId')
  final String productRequestId;
  @override
  @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
  final DateTime productRequestDate;
  @override
  @JsonKey(name: 'department_id')
  final String departmentId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'total_product_request_price')
  final int totalProductRequestPrice;
  @override
  @JsonKey(name: 'quantity_remaining')
  final int quantityRemaining;
  @override
  @JsonKey(name: 'initial_sales_order_id')
  final String? initialSalesOrderId;
  @override
  @JsonKey(name: 'final_sales_order_id')
  final String? finalSalesOrderId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  final String purchaseOrderDistributor;
  @override
  @JsonKey(name: 'type_product')
  final String typeProduct;
  @override
  @JsonKey(name: 'product_price')
  final int productPrice;
  @override
  @JsonKey(name: 'product_request_quantity')
  final int productRequestQuantity;
  @override
  @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
  final DateTime? initialSalesOrderate;
  @override
  @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
  final DateTime? finalSalesOrderDate;

  @override
  String toString() {
    return 'PendingRequestsUnserved(productRequestId: $productRequestId, productRequestDate: $productRequestDate, departmentId: $departmentId, productId: $productId, productName: $productName, unitId: $unitId, totalProductRequestPrice: $totalProductRequestPrice, quantityRemaining: $quantityRemaining, initialSalesOrderId: $initialSalesOrderId, finalSalesOrderId: $finalSalesOrderId, customerName: $customerName, customerId: $customerId, purchaseOrderDistributor: $purchaseOrderDistributor, typeProduct: $typeProduct, productPrice: $productPrice, productRequestQuantity: $productRequestQuantity, initialSalesOrderate: $initialSalesOrderate, finalSalesOrderDate: $finalSalesOrderDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingRequestsUnservedImpl &&
            (identical(other.productRequestId, productRequestId) ||
                other.productRequestId == productRequestId) &&
            (identical(other.productRequestDate, productRequestDate) ||
                other.productRequestDate == productRequestDate) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(
                    other.totalProductRequestPrice, totalProductRequestPrice) ||
                other.totalProductRequestPrice == totalProductRequestPrice) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining) &&
            (identical(other.initialSalesOrderId, initialSalesOrderId) ||
                other.initialSalesOrderId == initialSalesOrderId) &&
            (identical(other.finalSalesOrderId, finalSalesOrderId) ||
                other.finalSalesOrderId == finalSalesOrderId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(
                    other.purchaseOrderDistributor, purchaseOrderDistributor) ||
                other.purchaseOrderDistributor == purchaseOrderDistributor) &&
            (identical(other.typeProduct, typeProduct) ||
                other.typeProduct == typeProduct) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productRequestQuantity, productRequestQuantity) ||
                other.productRequestQuantity == productRequestQuantity) &&
            (identical(other.initialSalesOrderate, initialSalesOrderate) ||
                other.initialSalesOrderate == initialSalesOrderate) &&
            (identical(other.finalSalesOrderDate, finalSalesOrderDate) ||
                other.finalSalesOrderDate == finalSalesOrderDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productRequestId,
      productRequestDate,
      departmentId,
      productId,
      productName,
      unitId,
      totalProductRequestPrice,
      quantityRemaining,
      initialSalesOrderId,
      finalSalesOrderId,
      customerName,
      customerId,
      purchaseOrderDistributor,
      typeProduct,
      productPrice,
      productRequestQuantity,
      initialSalesOrderate,
      finalSalesOrderDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingRequestsUnservedImplCopyWith<_$PendingRequestsUnservedImpl>
      get copyWith => __$$PendingRequestsUnservedImplCopyWithImpl<
          _$PendingRequestsUnservedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingRequestsUnservedImplToJson(
      this,
    );
  }
}

abstract class _PendingRequestsUnserved extends PendingRequestsUnserved {
  const factory _PendingRequestsUnserved(
      {@JsonKey(name: 'ProductRequestId')
      required final String productRequestId,
      @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
      required final DateTime productRequestDate,
      @JsonKey(name: 'department_id') required final String departmentId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'total_product_request_price')
      required final int totalProductRequestPrice,
      @JsonKey(name: 'quantity_remaining') required final int quantityRemaining,
      @JsonKey(name: 'initial_sales_order_id')
      final String? initialSalesOrderId,
      @JsonKey(name: 'final_sales_order_id') final String? finalSalesOrderId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'purchase_order_distributor')
      required final String purchaseOrderDistributor,
      @JsonKey(name: 'type_product') required final String typeProduct,
      @JsonKey(name: 'product_price') required final int productPrice,
      @JsonKey(name: 'product_request_quantity')
      required final int productRequestQuantity,
      @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
      final DateTime? initialSalesOrderate,
      @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
      final DateTime? finalSalesOrderDate}) = _$PendingRequestsUnservedImpl;
  const _PendingRequestsUnserved._() : super._();

  factory _PendingRequestsUnserved.fromJson(Map<String, dynamic> json) =
      _$PendingRequestsUnservedImpl.fromJson;

  @override
  @JsonKey(name: 'ProductRequestId')
  String get productRequestId;
  @override
  @JsonKey(name: 'product_request_date', fromJson: isoDateToDateTime)
  DateTime get productRequestDate;
  @override
  @JsonKey(name: 'department_id')
  String get departmentId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'total_product_request_price')
  int get totalProductRequestPrice;
  @override
  @JsonKey(name: 'quantity_remaining')
  int get quantityRemaining;
  @override
  @JsonKey(name: 'initial_sales_order_id')
  String? get initialSalesOrderId;
  @override
  @JsonKey(name: 'final_sales_order_id')
  String? get finalSalesOrderId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor;
  @override
  @JsonKey(name: 'type_product')
  String get typeProduct;
  @override
  @JsonKey(name: 'product_price')
  int get productPrice;
  @override
  @JsonKey(name: 'product_request_quantity')
  int get productRequestQuantity;
  @override
  @JsonKey(name: 'initial_sales_order_date', fromJson: dateTimeNullable)
  DateTime? get initialSalesOrderate;
  @override
  @JsonKey(name: 'final_sales_order_date', fromJson: dateTimeNullable)
  DateTime? get finalSalesOrderDate;
  @override
  @JsonKey(ignore: true)
  _$$PendingRequestsUnservedImplCopyWith<_$PendingRequestsUnservedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
