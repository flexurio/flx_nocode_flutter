// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petty_cash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PettyCash _$PettyCashFromJson(Map<String, dynamic> json) {
  return _PettyCash.fromJson(json);
}

/// @nodoc
mixin _$PettyCash {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'purchase_order_down_payment',
      fromJson: PurchaseOrderDownPayment.fromJson)
  PurchaseOrderDownPayment get purchaseOrderDownPayment =>
      throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: PettyCashStatus.fromString)
  PettyCashStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_reason')
  String get rejectReason => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  @JsonKey(name: 'realization_amount')
  double get realizationAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_amount')
  double? get returnAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost')
  double get shippingCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount')
  double get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph')
  double get pphAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn')
  double get ppnAmount => throw _privateConstructorUsedError;
  double get rounding => throw _privateConstructorUsedError;
  @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
  DateTime get approveFinanceAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
  PettyCashType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'realization_no')
  String? get realizationNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_receive_by')
  int? get documentReceiveBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_receive_at')
  DateTime? get documentReceiveAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier? get supplier => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
  VehicleRent get vehicleRent => throw _privateConstructorUsedError;

  /// Serializes this PettyCash to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PettyCashCopyWith<PettyCash> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PettyCashCopyWith<$Res> {
  factory $PettyCashCopyWith(PettyCash value, $Res Function(PettyCash) then) =
      _$PettyCashCopyWithImpl<$Res, PettyCash>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(
          name: 'purchase_order_down_payment',
          fromJson: PurchaseOrderDownPayment.fromJson)
      PurchaseOrderDownPayment purchaseOrderDownPayment,
      double amount,
      @JsonKey(fromJson: PettyCashStatus.fromString) PettyCashStatus status,
      @JsonKey(name: 'reject_reason') String rejectReason,
      String recipient,
      @JsonKey(name: 'realization_amount') double realizationAmount,
      @JsonKey(name: 'return_amount') double? returnAmount,
      @JsonKey(name: 'shipping_cost') double shippingCost,
      @JsonKey(name: 'discount') double discountAmount,
      @JsonKey(name: 'pph') double pphAmount,
      @JsonKey(name: 'ppn') double ppnAmount,
      double rounding,
      @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
      DateTime approveFinanceAt,
      @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
      PettyCashType type,
      @JsonKey(name: 'realization_no') String? realizationNo,
      @JsonKey(name: 'document_receive_by') int? documentReceiveBy,
      @JsonKey(name: 'document_receive_at') DateTime? documentReceiveAt,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      Supplier? supplier,
      String? description,
      @JsonKey(fromJson: Department.fromJson) Department department,
      @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
      VehicleRent vehicleRent});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  $PurchaseOrderDownPaymentCopyWith<$Res> get purchaseOrderDownPayment;
  $SupplierCopyWith<$Res>? get supplier;
  $DepartmentCopyWith<$Res> get department;
  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class _$PettyCashCopyWithImpl<$Res, $Val extends PettyCash>
    implements $PettyCashCopyWith<$Res> {
  _$PettyCashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? purchaseOrder = null,
    Object? purchaseOrderDownPayment = null,
    Object? amount = null,
    Object? status = null,
    Object? rejectReason = null,
    Object? recipient = null,
    Object? realizationAmount = null,
    Object? returnAmount = freezed,
    Object? shippingCost = null,
    Object? discountAmount = null,
    Object? pphAmount = null,
    Object? ppnAmount = null,
    Object? rounding = null,
    Object? approveFinanceAt = null,
    Object? type = null,
    Object? realizationNo = freezed,
    Object? documentReceiveBy = freezed,
    Object? documentReceiveAt = freezed,
    Object? supplier = freezed,
    Object? description = freezed,
    Object? department = null,
    Object? vehicleRent = null,
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      purchaseOrderDownPayment: null == purchaseOrderDownPayment
          ? _value.purchaseOrderDownPayment
          : purchaseOrderDownPayment // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderDownPayment,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PettyCashStatus,
      rejectReason: null == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      realizationAmount: null == realizationAmount
          ? _value.realizationAmount
          : realizationAmount // ignore: cast_nullable_to_non_nullable
              as double,
      returnAmount: freezed == returnAmount
          ? _value.returnAmount
          : returnAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pphAmount: null == pphAmount
          ? _value.pphAmount
          : pphAmount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnAmount: null == ppnAmount
          ? _value.ppnAmount
          : ppnAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double,
      approveFinanceAt: null == approveFinanceAt
          ? _value.approveFinanceAt
          : approveFinanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PettyCashType,
      realizationNo: freezed == realizationNo
          ? _value.realizationNo
          : realizationNo // ignore: cast_nullable_to_non_nullable
              as String?,
      documentReceiveBy: freezed == documentReceiveBy
          ? _value.documentReceiveBy
          : documentReceiveBy // ignore: cast_nullable_to_non_nullable
              as int?,
      documentReceiveAt: freezed == documentReceiveAt
          ? _value.documentReceiveAt
          : documentReceiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
    ) as $Val);
  }

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderDownPaymentCopyWith<$Res> get purchaseOrderDownPayment {
    return $PurchaseOrderDownPaymentCopyWith<$Res>(
        _value.purchaseOrderDownPayment, (value) {
      return _then(_value.copyWith(purchaseOrderDownPayment: value) as $Val);
    });
  }

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PettyCashImplCopyWith<$Res>
    implements $PettyCashCopyWith<$Res> {
  factory _$$PettyCashImplCopyWith(
          _$PettyCashImpl value, $Res Function(_$PettyCashImpl) then) =
      __$$PettyCashImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(
          name: 'purchase_order_down_payment',
          fromJson: PurchaseOrderDownPayment.fromJson)
      PurchaseOrderDownPayment purchaseOrderDownPayment,
      double amount,
      @JsonKey(fromJson: PettyCashStatus.fromString) PettyCashStatus status,
      @JsonKey(name: 'reject_reason') String rejectReason,
      String recipient,
      @JsonKey(name: 'realization_amount') double realizationAmount,
      @JsonKey(name: 'return_amount') double? returnAmount,
      @JsonKey(name: 'shipping_cost') double shippingCost,
      @JsonKey(name: 'discount') double discountAmount,
      @JsonKey(name: 'pph') double pphAmount,
      @JsonKey(name: 'ppn') double ppnAmount,
      double rounding,
      @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
      DateTime approveFinanceAt,
      @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
      PettyCashType type,
      @JsonKey(name: 'realization_no') String? realizationNo,
      @JsonKey(name: 'document_receive_by') int? documentReceiveBy,
      @JsonKey(name: 'document_receive_at') DateTime? documentReceiveAt,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      Supplier? supplier,
      String? description,
      @JsonKey(fromJson: Department.fromJson) Department department,
      @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
      VehicleRent vehicleRent});

  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  @override
  $PurchaseOrderDownPaymentCopyWith<$Res> get purchaseOrderDownPayment;
  @override
  $SupplierCopyWith<$Res>? get supplier;
  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$PettyCashImplCopyWithImpl<$Res>
    extends _$PettyCashCopyWithImpl<$Res, _$PettyCashImpl>
    implements _$$PettyCashImplCopyWith<$Res> {
  __$$PettyCashImplCopyWithImpl(
      _$PettyCashImpl _value, $Res Function(_$PettyCashImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? purchaseOrder = null,
    Object? purchaseOrderDownPayment = null,
    Object? amount = null,
    Object? status = null,
    Object? rejectReason = null,
    Object? recipient = null,
    Object? realizationAmount = null,
    Object? returnAmount = freezed,
    Object? shippingCost = null,
    Object? discountAmount = null,
    Object? pphAmount = null,
    Object? ppnAmount = null,
    Object? rounding = null,
    Object? approveFinanceAt = null,
    Object? type = null,
    Object? realizationNo = freezed,
    Object? documentReceiveBy = freezed,
    Object? documentReceiveAt = freezed,
    Object? supplier = freezed,
    Object? description = freezed,
    Object? department = null,
    Object? vehicleRent = null,
  }) {
    return _then(_$PettyCashImpl(
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      purchaseOrderDownPayment: null == purchaseOrderDownPayment
          ? _value.purchaseOrderDownPayment
          : purchaseOrderDownPayment // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderDownPayment,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PettyCashStatus,
      rejectReason: null == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      realizationAmount: null == realizationAmount
          ? _value.realizationAmount
          : realizationAmount // ignore: cast_nullable_to_non_nullable
              as double,
      returnAmount: freezed == returnAmount
          ? _value.returnAmount
          : returnAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      pphAmount: null == pphAmount
          ? _value.pphAmount
          : pphAmount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnAmount: null == ppnAmount
          ? _value.ppnAmount
          : ppnAmount // ignore: cast_nullable_to_non_nullable
              as double,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double,
      approveFinanceAt: null == approveFinanceAt
          ? _value.approveFinanceAt
          : approveFinanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PettyCashType,
      realizationNo: freezed == realizationNo
          ? _value.realizationNo
          : realizationNo // ignore: cast_nullable_to_non_nullable
              as String?,
      documentReceiveBy: freezed == documentReceiveBy
          ? _value.documentReceiveBy
          : documentReceiveBy // ignore: cast_nullable_to_non_nullable
              as int?,
      documentReceiveAt: freezed == documentReceiveAt
          ? _value.documentReceiveAt
          : documentReceiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PettyCashImpl extends _PettyCash {
  const _$PettyCashImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required this.purchaseOrder,
      @JsonKey(
          name: 'purchase_order_down_payment',
          fromJson: PurchaseOrderDownPayment.fromJson)
      required this.purchaseOrderDownPayment,
      required this.amount,
      @JsonKey(fromJson: PettyCashStatus.fromString) required this.status,
      @JsonKey(name: 'reject_reason') required this.rejectReason,
      required this.recipient,
      @JsonKey(name: 'realization_amount') required this.realizationAmount,
      @JsonKey(name: 'return_amount') this.returnAmount,
      @JsonKey(name: 'shipping_cost') required this.shippingCost,
      @JsonKey(name: 'discount') required this.discountAmount,
      @JsonKey(name: 'pph') required this.pphAmount,
      @JsonKey(name: 'ppn') required this.ppnAmount,
      required this.rounding,
      @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
      required this.approveFinanceAt,
      @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
      required this.type,
      @JsonKey(name: 'realization_no') this.realizationNo,
      @JsonKey(name: 'document_receive_by') this.documentReceiveBy,
      @JsonKey(name: 'document_receive_at') this.documentReceiveAt,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) this.supplier,
      this.description,
      @JsonKey(fromJson: Department.fromJson) required this.department,
      @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
      required this.vehicleRent})
      : super._();

  factory _$PettyCashImpl.fromJson(Map<String, dynamic> json) =>
      _$$PettyCashImplFromJson(json);

  @override
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
  final int updateById;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  final PurchaseOrder purchaseOrder;
  @override
  @JsonKey(
      name: 'purchase_order_down_payment',
      fromJson: PurchaseOrderDownPayment.fromJson)
  final PurchaseOrderDownPayment purchaseOrderDownPayment;
  @override
  final double amount;
  @override
  @JsonKey(fromJson: PettyCashStatus.fromString)
  final PettyCashStatus status;
  @override
  @JsonKey(name: 'reject_reason')
  final String rejectReason;
  @override
  final String recipient;
  @override
  @JsonKey(name: 'realization_amount')
  final double realizationAmount;
  @override
  @JsonKey(name: 'return_amount')
  final double? returnAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  final double shippingCost;
  @override
  @JsonKey(name: 'discount')
  final double discountAmount;
  @override
  @JsonKey(name: 'pph')
  final double pphAmount;
  @override
  @JsonKey(name: 'ppn')
  final double ppnAmount;
  @override
  final double rounding;
  @override
  @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
  final DateTime approveFinanceAt;
  @override
  @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
  final PettyCashType type;
  @override
  @JsonKey(name: 'realization_no')
  final String? realizationNo;
  @override
  @JsonKey(name: 'document_receive_by')
  final int? documentReceiveBy;
  @override
  @JsonKey(name: 'document_receive_at')
  final DateTime? documentReceiveAt;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  final Supplier? supplier;
  @override
  final String? description;
  @override
  @JsonKey(fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
  final VehicleRent vehicleRent;

  @override
  String toString() {
    return 'PettyCash(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, purchaseOrder: $purchaseOrder, purchaseOrderDownPayment: $purchaseOrderDownPayment, amount: $amount, status: $status, rejectReason: $rejectReason, recipient: $recipient, realizationAmount: $realizationAmount, returnAmount: $returnAmount, shippingCost: $shippingCost, discountAmount: $discountAmount, pphAmount: $pphAmount, ppnAmount: $ppnAmount, rounding: $rounding, approveFinanceAt: $approveFinanceAt, type: $type, realizationNo: $realizationNo, documentReceiveBy: $documentReceiveBy, documentReceiveAt: $documentReceiveAt, supplier: $supplier, description: $description, department: $department, vehicleRent: $vehicleRent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PettyCashImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(
                    other.purchaseOrderDownPayment, purchaseOrderDownPayment) ||
                other.purchaseOrderDownPayment == purchaseOrderDownPayment) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.realizationAmount, realizationAmount) ||
                other.realizationAmount == realizationAmount) &&
            (identical(other.returnAmount, returnAmount) ||
                other.returnAmount == returnAmount) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.pphAmount, pphAmount) ||
                other.pphAmount == pphAmount) &&
            (identical(other.ppnAmount, ppnAmount) ||
                other.ppnAmount == ppnAmount) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.approveFinanceAt, approveFinanceAt) ||
                other.approveFinanceAt == approveFinanceAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.realizationNo, realizationNo) ||
                other.realizationNo == realizationNo) &&
            (identical(other.documentReceiveBy, documentReceiveBy) ||
                other.documentReceiveBy == documentReceiveBy) &&
            (identical(other.documentReceiveAt, documentReceiveAt) ||
                other.documentReceiveAt == documentReceiveAt) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        createdById,
        updatedAt,
        updateById,
        purchaseOrder,
        purchaseOrderDownPayment,
        amount,
        status,
        rejectReason,
        recipient,
        realizationAmount,
        returnAmount,
        shippingCost,
        discountAmount,
        pphAmount,
        ppnAmount,
        rounding,
        approveFinanceAt,
        type,
        realizationNo,
        documentReceiveBy,
        documentReceiveAt,
        supplier,
        description,
        department,
        vehicleRent
      ]);

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PettyCashImplCopyWith<_$PettyCashImpl> get copyWith =>
      __$$PettyCashImplCopyWithImpl<_$PettyCashImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PettyCashImplToJson(
      this,
    );
  }
}

abstract class _PettyCash extends PettyCash {
  const factory _PettyCash(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
      required final PurchaseOrder purchaseOrder,
      @JsonKey(
          name: 'purchase_order_down_payment',
          fromJson: PurchaseOrderDownPayment.fromJson)
      required final PurchaseOrderDownPayment purchaseOrderDownPayment,
      required final double amount,
      @JsonKey(fromJson: PettyCashStatus.fromString)
      required final PettyCashStatus status,
      @JsonKey(name: 'reject_reason') required final String rejectReason,
      required final String recipient,
      @JsonKey(name: 'realization_amount')
      required final double realizationAmount,
      @JsonKey(name: 'return_amount') final double? returnAmount,
      @JsonKey(name: 'shipping_cost') required final double shippingCost,
      @JsonKey(name: 'discount') required final double discountAmount,
      @JsonKey(name: 'pph') required final double pphAmount,
      @JsonKey(name: 'ppn') required final double ppnAmount,
      required final double rounding,
      @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
      required final DateTime approveFinanceAt,
      @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
      required final PettyCashType type,
      @JsonKey(name: 'realization_no') final String? realizationNo,
      @JsonKey(name: 'document_receive_by') final int? documentReceiveBy,
      @JsonKey(name: 'document_receive_at') final DateTime? documentReceiveAt,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      final Supplier? supplier,
      final String? description,
      @JsonKey(fromJson: Department.fromJson)
      required final Department department,
      @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
      required final VehicleRent vehicleRent}) = _$PettyCashImpl;
  const _PettyCash._() : super._();

  factory _PettyCash.fromJson(Map<String, dynamic> json) =
      _$PettyCashImpl.fromJson;

  @override
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
  int get updateById;
  @override
  @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(
      name: 'purchase_order_down_payment',
      fromJson: PurchaseOrderDownPayment.fromJson)
  PurchaseOrderDownPayment get purchaseOrderDownPayment;
  @override
  double get amount;
  @override
  @JsonKey(fromJson: PettyCashStatus.fromString)
  PettyCashStatus get status;
  @override
  @JsonKey(name: 'reject_reason')
  String get rejectReason;
  @override
  String get recipient;
  @override
  @JsonKey(name: 'realization_amount')
  double get realizationAmount;
  @override
  @JsonKey(name: 'return_amount')
  double? get returnAmount;
  @override
  @JsonKey(name: 'shipping_cost')
  double get shippingCost;
  @override
  @JsonKey(name: 'discount')
  double get discountAmount;
  @override
  @JsonKey(name: 'pph')
  double get pphAmount;
  @override
  @JsonKey(name: 'ppn')
  double get ppnAmount;
  @override
  double get rounding;
  @override
  @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
  DateTime get approveFinanceAt;
  @override
  @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
  PettyCashType get type;
  @override
  @JsonKey(name: 'realization_no')
  String? get realizationNo;
  @override
  @JsonKey(name: 'document_receive_by')
  int? get documentReceiveBy;
  @override
  @JsonKey(name: 'document_receive_at')
  DateTime? get documentReceiveAt;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier? get supplier;
  @override
  String? get description;
  @override
  @JsonKey(fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
  VehicleRent get vehicleRent;

  /// Create a copy of PettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PettyCashImplCopyWith<_$PettyCashImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
