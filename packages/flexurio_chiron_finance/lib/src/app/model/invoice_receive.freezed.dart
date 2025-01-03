// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceReceive _$InvoiceReceiveFromJson(Map<String, dynamic> json) {
  return _InvoiceReceive.fromJson(json);
}

/// @nodoc
mixin _$InvoiceReceive {
  @JsonKey(name: 'invoice_no')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate')
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
  DateTime get taxInvoiceDate => throw _privateConstructorUsedError;
  int get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn', fromJson: Ppn.fromNum)
  Ppn get ppn => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph', fromJson: TaxType.fromPercent)
  TaxType get pph => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
  bool get isApproveHeadAccounting => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
  DateTime? get receiveByFinanceAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
  DateTime? get receiveByServiceAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
  DateTime? get approveHeadAccountingAt => throw _privateConstructorUsedError;

  /// Serializes this InvoiceReceive to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceReceiveCopyWith<InvoiceReceive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceReceiveCopyWith<$Res> {
  factory $InvoiceReceiveCopyWith(
          InvoiceReceive value, $Res Function(InvoiceReceive) then) =
      _$InvoiceReceiveCopyWithImpl<$Res, InvoiceReceive>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_no') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'rate') double rate,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      DateTime taxInvoiceDate,
      int subtotal,
      @JsonKey(name: 'ppn', fromJson: Ppn.fromNum) Ppn ppn,
      @JsonKey(name: 'pph', fromJson: TaxType.fromPercent) TaxType pph,
      double total,
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
      bool isApproveHeadAccounting,
      @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
      DateTime? receiveByFinanceAt,
      @JsonKey(
          name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
      DateTime? receiveByServiceAt,
      @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
      DateTime? approveHeadAccountingAt});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class _$InvoiceReceiveCopyWithImpl<$Res, $Val extends InvoiceReceive>
    implements $InvoiceReceiveCopyWith<$Res> {
  _$InvoiceReceiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? purchaseOrder = null,
    Object? transactionId = null,
    Object? supplier = null,
    Object? rate = null,
    Object? invoiceDate = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? taxInvoiceNo = null,
    Object? taxInvoiceDate = null,
    Object? subtotal = null,
    Object? ppn = null,
    Object? pph = null,
    Object? total = null,
    Object? termOfPayment = null,
    Object? dueDate = null,
    Object? isApproveHeadAccounting = null,
    Object? receiveByFinanceAt = freezed,
    Object? receiveByServiceAt = freezed,
    Object? approveHeadAccountingAt = freezed,
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
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceDate: null == taxInvoiceDate
          ? _value.taxInvoiceDate
          : taxInvoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      pph: null == pph
          ? _value.pph
          : pph // ignore: cast_nullable_to_non_nullable
              as TaxType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isApproveHeadAccounting: null == isApproveHeadAccounting
          ? _value.isApproveHeadAccounting
          : isApproveHeadAccounting // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveByFinanceAt: freezed == receiveByFinanceAt
          ? _value.receiveByFinanceAt
          : receiveByFinanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receiveByServiceAt: freezed == receiveByServiceAt
          ? _value.receiveByServiceAt
          : receiveByServiceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approveHeadAccountingAt: freezed == approveHeadAccountingAt
          ? _value.approveHeadAccountingAt
          : approveHeadAccountingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceReceiveImplCopyWith<$Res>
    implements $InvoiceReceiveCopyWith<$Res> {
  factory _$$InvoiceReceiveImplCopyWith(_$InvoiceReceiveImpl value,
          $Res Function(_$InvoiceReceiveImpl) then) =
      __$$InvoiceReceiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_no') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
      PurchaseOrder purchaseOrder,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'rate') double rate,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      DateTime taxInvoiceDate,
      int subtotal,
      @JsonKey(name: 'ppn', fromJson: Ppn.fromNum) Ppn ppn,
      @JsonKey(name: 'pph', fromJson: TaxType.fromPercent) TaxType pph,
      double total,
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
      bool isApproveHeadAccounting,
      @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
      DateTime? receiveByFinanceAt,
      @JsonKey(
          name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
      DateTime? receiveByServiceAt,
      @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
      DateTime? approveHeadAccountingAt});

  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
  @override
  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$InvoiceReceiveImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveCopyWithImpl<$Res, _$InvoiceReceiveImpl>
    implements _$$InvoiceReceiveImplCopyWith<$Res> {
  __$$InvoiceReceiveImplCopyWithImpl(
      _$InvoiceReceiveImpl _value, $Res Function(_$InvoiceReceiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? updatedById = null,
    Object? purchaseOrder = null,
    Object? transactionId = null,
    Object? supplier = null,
    Object? rate = null,
    Object? invoiceDate = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? taxInvoiceNo = null,
    Object? taxInvoiceDate = null,
    Object? subtotal = null,
    Object? ppn = null,
    Object? pph = null,
    Object? total = null,
    Object? termOfPayment = null,
    Object? dueDate = null,
    Object? isApproveHeadAccounting = null,
    Object? receiveByFinanceAt = freezed,
    Object? receiveByServiceAt = freezed,
    Object? approveHeadAccountingAt = freezed,
  }) {
    return _then(_$InvoiceReceiveImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceDate: null == taxInvoiceDate
          ? _value.taxInvoiceDate
          : taxInvoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      pph: null == pph
          ? _value.pph
          : pph // ignore: cast_nullable_to_non_nullable
              as TaxType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isApproveHeadAccounting: null == isApproveHeadAccounting
          ? _value.isApproveHeadAccounting
          : isApproveHeadAccounting // ignore: cast_nullable_to_non_nullable
              as bool,
      receiveByFinanceAt: freezed == receiveByFinanceAt
          ? _value.receiveByFinanceAt
          : receiveByFinanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receiveByServiceAt: freezed == receiveByServiceAt
          ? _value.receiveByServiceAt
          : receiveByServiceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approveHeadAccountingAt: freezed == approveHeadAccountingAt
          ? _value.approveHeadAccountingAt
          : approveHeadAccountingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceReceiveImpl extends _InvoiceReceive {
  _$InvoiceReceiveImpl(
      {@JsonKey(name: 'invoice_no') required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
      required this.purchaseOrder,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required this.supplier,
      @JsonKey(name: 'rate') required this.rate,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required this.invoiceDate,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate,
      @JsonKey(name: 'tax_invoice_no') required this.taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      required this.taxInvoiceDate,
      required this.subtotal,
      @JsonKey(name: 'ppn', fromJson: Ppn.fromNum) required this.ppn,
      @JsonKey(name: 'pph', fromJson: TaxType.fromPercent) required this.pph,
      required this.total,
      @JsonKey(name: 'term_of_payment') required this.termOfPayment,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
      required this.isApproveHeadAccounting,
      @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
      this.receiveByFinanceAt,
      @JsonKey(
          name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
      this.receiveByServiceAt,
      @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
      this.approveHeadAccountingAt})
      : super._();

  factory _$InvoiceReceiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceReceiveImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_no')
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
  final PurchaseOrder purchaseOrder;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  final Supplier supplier;
  @override
  @JsonKey(name: 'rate')
  final double rate;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  final DateTime invoiceDate;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  final String taxInvoiceNo;
  @override
  @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
  final DateTime taxInvoiceDate;
  @override
  final int subtotal;
  @override
  @JsonKey(name: 'ppn', fromJson: Ppn.fromNum)
  final Ppn ppn;
  @override
  @JsonKey(name: 'pph', fromJson: TaxType.fromPercent)
  final TaxType pph;
  @override
  final double total;
  @override
  @JsonKey(name: 'term_of_payment')
  final int termOfPayment;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
  final bool isApproveHeadAccounting;
  @override
  @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
  final DateTime? receiveByFinanceAt;
  @override
  @JsonKey(name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
  final DateTime? receiveByServiceAt;
  @override
  @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
  final DateTime? approveHeadAccountingAt;

  @override
  String toString() {
    return 'InvoiceReceive(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, createdById: $createdById, updatedById: $updatedById, purchaseOrder: $purchaseOrder, transactionId: $transactionId, supplier: $supplier, rate: $rate, invoiceDate: $invoiceDate, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, taxInvoiceNo: $taxInvoiceNo, taxInvoiceDate: $taxInvoiceDate, subtotal: $subtotal, ppn: $ppn, pph: $pph, total: $total, termOfPayment: $termOfPayment, dueDate: $dueDate, isApproveHeadAccounting: $isApproveHeadAccounting, receiveByFinanceAt: $receiveByFinanceAt, receiveByServiceAt: $receiveByServiceAt, approveHeadAccountingAt: $approveHeadAccountingAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceReceiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.taxInvoiceDate, taxInvoiceDate) ||
                other.taxInvoiceDate == taxInvoiceDate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.pph, pph) || other.pph == pph) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(
                    other.isApproveHeadAccounting, isApproveHeadAccounting) ||
                other.isApproveHeadAccounting == isApproveHeadAccounting) &&
            (identical(other.receiveByFinanceAt, receiveByFinanceAt) ||
                other.receiveByFinanceAt == receiveByFinanceAt) &&
            (identical(other.receiveByServiceAt, receiveByServiceAt) ||
                other.receiveByServiceAt == receiveByServiceAt) &&
            (identical(
                    other.approveHeadAccountingAt, approveHeadAccountingAt) ||
                other.approveHeadAccountingAt == approveHeadAccountingAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        createdById,
        updatedById,
        purchaseOrder,
        transactionId,
        supplier,
        rate,
        invoiceDate,
        deliveryOrderId,
        deliveryOrderDate,
        taxInvoiceNo,
        taxInvoiceDate,
        subtotal,
        ppn,
        pph,
        total,
        termOfPayment,
        dueDate,
        isApproveHeadAccounting,
        receiveByFinanceAt,
        receiveByServiceAt,
        approveHeadAccountingAt
      ]);

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceReceiveImplCopyWith<_$InvoiceReceiveImpl> get copyWith =>
      __$$InvoiceReceiveImplCopyWithImpl<_$InvoiceReceiveImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceReceiveImplToJson(
      this,
    );
  }
}

abstract class _InvoiceReceive extends InvoiceReceive {
  factory _InvoiceReceive(
      {@JsonKey(name: 'invoice_no') required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
      required final PurchaseOrder purchaseOrder,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required final Supplier supplier,
      @JsonKey(name: 'rate') required final double rate,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required final DateTime invoiceDate,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryOrderDate,
      @JsonKey(name: 'tax_invoice_no') required final String taxInvoiceNo,
      @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
      required final DateTime taxInvoiceDate,
      required final int subtotal,
      @JsonKey(name: 'ppn', fromJson: Ppn.fromNum) required final Ppn ppn,
      @JsonKey(name: 'pph', fromJson: TaxType.fromPercent)
      required final TaxType pph,
      required final double total,
      @JsonKey(name: 'term_of_payment') required final int termOfPayment,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
      required final bool isApproveHeadAccounting,
      @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
      final DateTime? receiveByFinanceAt,
      @JsonKey(
          name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
      final DateTime? receiveByServiceAt,
      @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
      final DateTime? approveHeadAccountingAt}) = _$InvoiceReceiveImpl;
  _InvoiceReceive._() : super._();

  factory _InvoiceReceive.fromJson(Map<String, dynamic> json) =
      _$InvoiceReceiveImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_no')
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'order', fromJson: PurchaseOrder.fromJson)
  PurchaseOrder get purchaseOrder;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier;
  @override
  @JsonKey(name: 'rate')
  double get rate;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo;
  @override
  @JsonKey(name: 'tax_invoice_date', fromJson: isoDateToDateTime)
  DateTime get taxInvoiceDate;
  @override
  int get subtotal;
  @override
  @JsonKey(name: 'ppn', fromJson: Ppn.fromNum)
  Ppn get ppn;
  @override
  @JsonKey(name: 'pph', fromJson: TaxType.fromPercent)
  TaxType get pph;
  @override
  double get total;
  @override
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'is_approve_head_accounting', defaultValue: false)
  bool get isApproveHeadAccounting;
  @override
  @JsonKey(name: 'received_by_finance_at', fromJson: dateTimeNullable)
  DateTime? get receiveByFinanceAt;
  @override
  @JsonKey(name: 'received_by_customer_service_at', fromJson: dateTimeNullable)
  DateTime? get receiveByServiceAt;
  @override
  @JsonKey(name: 'approve_head_accounting_at', fromJson: dateTimeNullable)
  DateTime? get approveHeadAccountingAt;

  /// Create a copy of InvoiceReceive
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceReceiveImplCopyWith<_$InvoiceReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
