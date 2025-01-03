// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_return_replacement_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesReturnReplacementReport _$SalesReturnReplacementReportFromJson(
    Map<String, dynamic> json) {
  return _SalesReturnReplacementReport.fromJson(json);
}

/// @nodoc
mixin _$SalesReturnReplacementReport {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
  DateTime get productIssueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  int get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_product_price')
  int get totalProductPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issue_quantity')
  int get productIssueQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issue_product_price')
  int get productIssueProductPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issue_total_product_price')
  int get productIssueTotalProductPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesReturnReplacementReportCopyWith<SalesReturnReplacementReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesReturnReplacementReportCopyWith<$Res> {
  factory $SalesReturnReplacementReportCopyWith(
          SalesReturnReplacementReport value,
          $Res Function(SalesReturnReplacementReport) then) =
      _$SalesReturnReplacementReportCopyWithImpl<$Res,
          SalesReturnReplacementReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'quantity') int quantity,
      String description,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
      DateTime productIssueDate,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'total_product_price') int totalProductPrice,
      @JsonKey(name: 'product_issue_quantity') int productIssueQuantity,
      @JsonKey(name: 'product_issue_product_price')
      int productIssueProductPrice,
      @JsonKey(name: 'product_issue_total_product_price')
      int productIssueTotalProductPrice,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn});

  $ProductCopyWith<$Res> get product;
  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class _$SalesReturnReplacementReportCopyWithImpl<$Res,
        $Val extends SalesReturnReplacementReport>
    implements $SalesReturnReplacementReportCopyWith<$Res> {
  _$SalesReturnReplacementReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? batchNo = null,
    Object? quantity = null,
    Object? description = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? productIssueDate = null,
    Object? unitId = null,
    Object? productPrice = null,
    Object? totalProductPrice = null,
    Object? productIssueQuantity = null,
    Object? productIssueProductPrice = null,
    Object? productIssueTotalProductPrice = null,
    Object? product = null,
    Object? productReturn = null,
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
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productIssueDate: null == productIssueDate
          ? _value.productIssueDate
          : productIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productIssueQuantity: null == productIssueQuantity
          ? _value.productIssueQuantity
          : productIssueQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      productIssueProductPrice: null == productIssueProductPrice
          ? _value.productIssueProductPrice
          : productIssueProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productIssueTotalProductPrice: null == productIssueTotalProductPrice
          ? _value.productIssueTotalProductPrice
          : productIssueTotalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
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
abstract class _$$SalesReturnReplacementReportImplCopyWith<$Res>
    implements $SalesReturnReplacementReportCopyWith<$Res> {
  factory _$$SalesReturnReplacementReportImplCopyWith(
          _$SalesReturnReplacementReportImpl value,
          $Res Function(_$SalesReturnReplacementReportImpl) then) =
      __$$SalesReturnReplacementReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'quantity') int quantity,
      String description,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
      DateTime productIssueDate,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'total_product_price') int totalProductPrice,
      @JsonKey(name: 'product_issue_quantity') int productIssueQuantity,
      @JsonKey(name: 'product_issue_product_price')
      int productIssueProductPrice,
      @JsonKey(name: 'product_issue_total_product_price')
      int productIssueTotalProductPrice,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      ProductReturn productReturn});

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$SalesReturnReplacementReportImplCopyWithImpl<$Res>
    extends _$SalesReturnReplacementReportCopyWithImpl<$Res,
        _$SalesReturnReplacementReportImpl>
    implements _$$SalesReturnReplacementReportImplCopyWith<$Res> {
  __$$SalesReturnReplacementReportImplCopyWithImpl(
      _$SalesReturnReplacementReportImpl _value,
      $Res Function(_$SalesReturnReplacementReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? batchNo = null,
    Object? quantity = null,
    Object? description = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? productIssueDate = null,
    Object? unitId = null,
    Object? productPrice = null,
    Object? totalProductPrice = null,
    Object? productIssueQuantity = null,
    Object? productIssueProductPrice = null,
    Object? productIssueTotalProductPrice = null,
    Object? product = null,
    Object? productReturn = null,
  }) {
    return _then(_$SalesReturnReplacementReportImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productIssueDate: null == productIssueDate
          ? _value.productIssueDate
          : productIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productIssueQuantity: null == productIssueQuantity
          ? _value.productIssueQuantity
          : productIssueQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      productIssueProductPrice: null == productIssueProductPrice
          ? _value.productIssueProductPrice
          : productIssueProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      productIssueTotalProductPrice: null == productIssueTotalProductPrice
          ? _value.productIssueTotalProductPrice
          : productIssueTotalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesReturnReplacementReportImpl extends _SalesReturnReplacementReport {
  _$SalesReturnReplacementReportImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'quantity') required this.quantity,
      required this.description,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate,
      @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
      required this.productIssueDate,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'total_product_price') required this.totalProductPrice,
      @JsonKey(name: 'product_issue_quantity')
      required this.productIssueQuantity,
      @JsonKey(name: 'product_issue_product_price')
      required this.productIssueProductPrice,
      @JsonKey(name: 'product_issue_total_product_price')
      required this.productIssueTotalProductPrice,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required this.productReturn})
      : super._();

  factory _$SalesReturnReplacementReportImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SalesReturnReplacementReportImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;
  @override
  final String description;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;
  @override
  @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
  final DateTime productIssueDate;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'product_price')
  final int productPrice;
  @override
  @JsonKey(name: 'total_product_price')
  final int totalProductPrice;
  @override
  @JsonKey(name: 'product_issue_quantity')
  final int productIssueQuantity;
  @override
  @JsonKey(name: 'product_issue_product_price')
  final int productIssueProductPrice;
  @override
  @JsonKey(name: 'product_issue_total_product_price')
  final int productIssueTotalProductPrice;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'SalesReturnReplacementReport(createdAt: $createdAt, updatedAt: $updatedAt, batchNo: $batchNo, quantity: $quantity, description: $description, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, productIssueDate: $productIssueDate, unitId: $unitId, productPrice: $productPrice, totalProductPrice: $totalProductPrice, productIssueQuantity: $productIssueQuantity, productIssueProductPrice: $productIssueProductPrice, productIssueTotalProductPrice: $productIssueTotalProductPrice, product: $product, productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesReturnReplacementReportImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.productIssueDate, productIssueDate) ||
                other.productIssueDate == productIssueDate) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.productIssueQuantity, productIssueQuantity) ||
                other.productIssueQuantity == productIssueQuantity) &&
            (identical(
                    other.productIssueProductPrice, productIssueProductPrice) ||
                other.productIssueProductPrice == productIssueProductPrice) &&
            (identical(other.productIssueTotalProductPrice,
                    productIssueTotalProductPrice) ||
                other.productIssueTotalProductPrice ==
                    productIssueTotalProductPrice) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      batchNo,
      quantity,
      description,
      deliveryOrderId,
      deliveryOrderDate,
      productIssueDate,
      unitId,
      productPrice,
      totalProductPrice,
      productIssueQuantity,
      productIssueProductPrice,
      productIssueTotalProductPrice,
      product,
      productReturn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesReturnReplacementReportImplCopyWith<
          _$SalesReturnReplacementReportImpl>
      get copyWith => __$$SalesReturnReplacementReportImplCopyWithImpl<
          _$SalesReturnReplacementReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesReturnReplacementReportImplToJson(
      this,
    );
  }
}

abstract class _SalesReturnReplacementReport
    extends SalesReturnReplacementReport {
  factory _SalesReturnReplacementReport(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'quantity') required final int quantity,
      required final String description,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryOrderDate,
      @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
      required final DateTime productIssueDate,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'product_price') required final int productPrice,
      @JsonKey(name: 'total_product_price')
      required final int totalProductPrice,
      @JsonKey(name: 'product_issue_quantity')
      required final int productIssueQuantity,
      @JsonKey(name: 'product_issue_product_price')
      required final int productIssueProductPrice,
      @JsonKey(name: 'product_issue_total_product_price')
      required final int productIssueTotalProductPrice,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
      required final ProductReturn
          productReturn}) = _$SalesReturnReplacementReportImpl;
  _SalesReturnReplacementReport._() : super._();

  factory _SalesReturnReplacementReport.fromJson(Map<String, dynamic> json) =
      _$SalesReturnReplacementReportImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  String get description;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;
  @override
  @JsonKey(name: 'product_issue_date', fromJson: isoDateToDateTime)
  DateTime get productIssueDate;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'product_price')
  int get productPrice;
  @override
  @JsonKey(name: 'total_product_price')
  int get totalProductPrice;
  @override
  @JsonKey(name: 'product_issue_quantity')
  int get productIssueQuantity;
  @override
  @JsonKey(name: 'product_issue_product_price')
  int get productIssueProductPrice;
  @override
  @JsonKey(name: 'product_issue_total_product_price')
  int get productIssueTotalProductPrice;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'product_return_id', fromJson: ProductReturn.fromJson)
  ProductReturn get productReturn;
  @override
  @JsonKey(ignore: true)
  _$$SalesReturnReplacementReportImplCopyWith<
          _$SalesReturnReplacementReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
