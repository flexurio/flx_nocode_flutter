// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_requests_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PendingRequestsDetail _$PendingRequestsDetailFromJson(
    Map<String, dynamic> json) {
  return _PendingRequestsDetail.fromJson(json);
}

/// @nodoc
mixin _$PendingRequestsDetail {
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
  @JsonKey(name: 'sales_order_id')
  String? get salesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PendingRequestsDetailCopyWith<PendingRequestsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingRequestsDetailCopyWith<$Res> {
  factory $PendingRequestsDetailCopyWith(PendingRequestsDetail value,
          $Res Function(PendingRequestsDetail) then) =
      _$PendingRequestsDetailCopyWithImpl<$Res, PendingRequestsDetail>;
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
      @JsonKey(name: 'sales_order_id') String? salesOrderId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId});
}

/// @nodoc
class _$PendingRequestsDetailCopyWithImpl<$Res,
        $Val extends PendingRequestsDetail>
    implements $PendingRequestsDetailCopyWith<$Res> {
  _$PendingRequestsDetailCopyWithImpl(this._value, this._then);

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
    Object? salesOrderId = freezed,
    Object? customerName = null,
    Object? customerId = null,
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
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PendingRequestsDetailImplCopyWith<$Res>
    implements $PendingRequestsDetailCopyWith<$Res> {
  factory _$$PendingRequestsDetailImplCopyWith(
          _$PendingRequestsDetailImpl value,
          $Res Function(_$PendingRequestsDetailImpl) then) =
      __$$PendingRequestsDetailImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'sales_order_id') String? salesOrderId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId});
}

/// @nodoc
class __$$PendingRequestsDetailImplCopyWithImpl<$Res>
    extends _$PendingRequestsDetailCopyWithImpl<$Res,
        _$PendingRequestsDetailImpl>
    implements _$$PendingRequestsDetailImplCopyWith<$Res> {
  __$$PendingRequestsDetailImplCopyWithImpl(_$PendingRequestsDetailImpl _value,
      $Res Function(_$PendingRequestsDetailImpl) _then)
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
    Object? salesOrderId = freezed,
    Object? customerName = null,
    Object? customerId = null,
  }) {
    return _then(_$PendingRequestsDetailImpl(
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
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PendingRequestsDetailImpl extends _PendingRequestsDetail {
  const _$PendingRequestsDetailImpl(
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
      @JsonKey(name: 'sales_order_id') this.salesOrderId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_id') required this.customerId})
      : super._();

  factory _$PendingRequestsDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingRequestsDetailImplFromJson(json);

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
  @JsonKey(name: 'sales_order_id')
  final String? salesOrderId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;

  @override
  String toString() {
    return 'PendingRequestsDetail(productRequestId: $productRequestId, productRequestDate: $productRequestDate, departmentId: $departmentId, productId: $productId, productName: $productName, unitId: $unitId, totalProductRequestPrice: $totalProductRequestPrice, quantityRemaining: $quantityRemaining, salesOrderId: $salesOrderId, customerName: $customerName, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingRequestsDetailImpl &&
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
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
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
      salesOrderId,
      customerName,
      customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingRequestsDetailImplCopyWith<_$PendingRequestsDetailImpl>
      get copyWith => __$$PendingRequestsDetailImplCopyWithImpl<
          _$PendingRequestsDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingRequestsDetailImplToJson(
      this,
    );
  }
}

abstract class _PendingRequestsDetail extends PendingRequestsDetail {
  const factory _PendingRequestsDetail(
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
      @JsonKey(name: 'sales_order_id') final String? salesOrderId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_id')
      required final String customerId}) = _$PendingRequestsDetailImpl;
  const _PendingRequestsDetail._() : super._();

  factory _PendingRequestsDetail.fromJson(Map<String, dynamic> json) =
      _$PendingRequestsDetailImpl.fromJson;

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
  @JsonKey(name: 'sales_order_id')
  String? get salesOrderId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(ignore: true)
  _$$PendingRequestsDetailImplCopyWith<_$PendingRequestsDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
