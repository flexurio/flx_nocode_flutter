// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderHistory _$PurchaseOrderHistoryFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderHistory.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderHistory {
  @JsonKey(name: 'purchase_order_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
  MaterialRequest get materialRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', fromJson: Currency.fromJson)
  Currency get currency => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'quotation_no')
  String get quotationNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_pay')
  double get subtotalPay => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_disc')
  double get subtotalAfterDisc => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
  TaxType get taxType => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_percent')
  double get taxPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_value')
  double get taxValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_after_tax')
  double get subAfterTax => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
  Ppn get ppn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'dp_percent')
  double get dpPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'dp_value')
  double get dpValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_payment')
  double get remainingPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value')
  double get accountValue => throw _privateConstructorUsedError;
  @JsonKey(fromJson: PurchaseOrderStatus.fromString)
  PurchaseOrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_po_by_id')
  int? get confirmPoById => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmPoDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_accounting_by')
  int? get confirmAccountingBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmAccountingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'description_confirm_accounting')
  String? get descriptionConfirmAccounting =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'status_next_shipping_by_id')
  int? get statusNextShippingById => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
  DateTime? get statusNextShippingAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_close_by_id')
  int? get statusCloseById => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
  DateTime? get statusCloseAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_transaction_by_id')
  int? get closeTransactionById => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
  DateTime? get closeTransactionAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph_22_percent')
  double get pph22Percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph_22_value')
  double get pph22Value => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_date')
  DateTime? get receivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
  bool get confirmDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'edit_description')
  String? get editDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stock')
  bool get isStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
  PurchaseOrderPaymentType get paymentType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'revision_no')
  int get revisionNo => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderHistoryCopyWith<PurchaseOrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderHistoryCopyWith<$Res> {
  factory $PurchaseOrderHistoryCopyWith(PurchaseOrderHistory value,
          $Res Function(PurchaseOrderHistory) then) =
      _$PurchaseOrderHistoryCopyWithImpl<$Res, PurchaseOrderHistory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'purchase_order_id') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      MaterialRequest materialRequest,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson) Currency currency,
      double rate,
      double subtotal,
      @JsonKey(name: 'quotation_no') String quotationNo,
      @JsonKey(name: 'subtotal_pay') double subtotalPay,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'subtotal_after_disc') double subtotalAfterDisc,
      @JsonKey(name: 'tax_type', fromJson: TaxType.fromString) TaxType taxType,
      @JsonKey(name: 'tax_percent') double taxPercent,
      @JsonKey(name: 'tax_value') double taxValue,
      @JsonKey(name: 'sub_after_tax') double subAfterTax,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) Ppn ppn,
      @JsonKey(name: 'ppn_value') double ppnValue,
      double total,
      @JsonKey(name: 'dp_percent') double dpPercent,
      @JsonKey(name: 'dp_value') double dpValue,
      @JsonKey(name: 'remaining_payment') double remainingPayment,
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      String description,
      @JsonKey(name: 'account_value') double accountValue,
      @JsonKey(fromJson: PurchaseOrderStatus.fromString)
      PurchaseOrderStatus status,
      @JsonKey(name: 'confirm_po_by_id') int? confirmPoById,
      @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
      DateTime? confirmPoDate,
      @JsonKey(name: 'confirm_accounting_by') int? confirmAccountingBy,
      @JsonKey(
          name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
      DateTime? confirmAccountingDate,
      @JsonKey(name: 'description_confirm_accounting')
      String? descriptionConfirmAccounting,
      @JsonKey(name: 'status_next_shipping_by_id') int? statusNextShippingById,
      @JsonKey(
          name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
      DateTime? statusNextShippingAt,
      @JsonKey(name: 'status_close_by_id') int? statusCloseById,
      @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
      DateTime? statusCloseAt,
      @JsonKey(name: 'close_transaction_by_id') int? closeTransactionById,
      @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
      DateTime? closeTransactionAt,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime deliveryDate,
      @JsonKey(name: 'pph_22_percent') double pph22Percent,
      @JsonKey(name: 'pph_22_value') double pph22Value,
      @JsonKey(name: 'received_date') DateTime? receivedDate,
      @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
      bool confirmDeliveryDate,
      @JsonKey(name: 'edit_description') String? editDescription,
      @JsonKey(name: 'is_stock') bool isStock,
      @JsonKey(
          name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
      PurchaseOrderPaymentType paymentType,
      @JsonKey(name: 'revision_no') int revisionNo,
      @JsonKey(fromJson: Department.fromJson) Department department});

  $MaterialRequestCopyWith<$Res> get materialRequest;
  $SupplierCopyWith<$Res> get supplier;
  $CurrencyCopyWith<$Res> get currency;
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class _$PurchaseOrderHistoryCopyWithImpl<$Res,
        $Val extends PurchaseOrderHistory>
    implements $PurchaseOrderHistoryCopyWith<$Res> {
  _$PurchaseOrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? materialRequest = null,
    Object? supplier = null,
    Object? currency = null,
    Object? rate = null,
    Object? subtotal = null,
    Object? quotationNo = null,
    Object? subtotalPay = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? subtotalAfterDisc = null,
    Object? taxType = null,
    Object? taxPercent = null,
    Object? taxValue = null,
    Object? subAfterTax = null,
    Object? ppn = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? dpPercent = null,
    Object? dpValue = null,
    Object? remainingPayment = null,
    Object? termOfPayment = null,
    Object? description = null,
    Object? accountValue = null,
    Object? status = null,
    Object? confirmPoById = freezed,
    Object? confirmPoDate = freezed,
    Object? confirmAccountingBy = freezed,
    Object? confirmAccountingDate = freezed,
    Object? descriptionConfirmAccounting = freezed,
    Object? statusNextShippingById = freezed,
    Object? statusNextShippingAt = freezed,
    Object? statusCloseById = freezed,
    Object? statusCloseAt = freezed,
    Object? closeTransactionById = freezed,
    Object? closeTransactionAt = freezed,
    Object? deliveryDate = null,
    Object? pph22Percent = null,
    Object? pph22Value = null,
    Object? receivedDate = freezed,
    Object? confirmDeliveryDate = null,
    Object? editDescription = freezed,
    Object? isStock = null,
    Object? paymentType = null,
    Object? revisionNo = null,
    Object? department = null,
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
      materialRequest: null == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      quotationNo: null == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      subtotalPay: null == subtotalPay
          ? _value.subtotalPay
          : subtotalPay // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalAfterDisc: null == subtotalAfterDisc
          ? _value.subtotalAfterDisc
          : subtotalAfterDisc // ignore: cast_nullable_to_non_nullable
              as double,
      taxType: null == taxType
          ? _value.taxType
          : taxType // ignore: cast_nullable_to_non_nullable
              as TaxType,
      taxPercent: null == taxPercent
          ? _value.taxPercent
          : taxPercent // ignore: cast_nullable_to_non_nullable
              as double,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
      subAfterTax: null == subAfterTax
          ? _value.subAfterTax
          : subAfterTax // ignore: cast_nullable_to_non_nullable
              as double,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      dpPercent: null == dpPercent
          ? _value.dpPercent
          : dpPercent // ignore: cast_nullable_to_non_nullable
              as double,
      dpValue: null == dpValue
          ? _value.dpValue
          : dpValue // ignore: cast_nullable_to_non_nullable
              as double,
      remainingPayment: null == remainingPayment
          ? _value.remainingPayment
          : remainingPayment // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderStatus,
      confirmPoById: freezed == confirmPoById
          ? _value.confirmPoById
          : confirmPoById // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmPoDate: freezed == confirmPoDate
          ? _value.confirmPoDate
          : confirmPoDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmAccountingBy: freezed == confirmAccountingBy
          ? _value.confirmAccountingBy
          : confirmAccountingBy // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmAccountingDate: freezed == confirmAccountingDate
          ? _value.confirmAccountingDate
          : confirmAccountingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      descriptionConfirmAccounting: freezed == descriptionConfirmAccounting
          ? _value.descriptionConfirmAccounting
          : descriptionConfirmAccounting // ignore: cast_nullable_to_non_nullable
              as String?,
      statusNextShippingById: freezed == statusNextShippingById
          ? _value.statusNextShippingById
          : statusNextShippingById // ignore: cast_nullable_to_non_nullable
              as int?,
      statusNextShippingAt: freezed == statusNextShippingAt
          ? _value.statusNextShippingAt
          : statusNextShippingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusCloseById: freezed == statusCloseById
          ? _value.statusCloseById
          : statusCloseById // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCloseAt: freezed == statusCloseAt
          ? _value.statusCloseAt
          : statusCloseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeTransactionById: freezed == closeTransactionById
          ? _value.closeTransactionById
          : closeTransactionById // ignore: cast_nullable_to_non_nullable
              as int?,
      closeTransactionAt: freezed == closeTransactionAt
          ? _value.closeTransactionAt
          : closeTransactionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pph22Percent: null == pph22Percent
          ? _value.pph22Percent
          : pph22Percent // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as double,
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmDeliveryDate: null == confirmDeliveryDate
          ? _value.confirmDeliveryDate
          : confirmDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      editDescription: freezed == editDescription
          ? _value.editDescription
          : editDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isStock: null == isStock
          ? _value.isStock
          : isStock // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderPaymentType,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
    ) as $Val);
  }

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialRequestCopyWith<$Res> get materialRequest {
    return $MaterialRequestCopyWith<$Res>(_value.materialRequest, (value) {
      return _then(_value.copyWith(materialRequest: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseOrderHistoryImplCopyWith<$Res>
    implements $PurchaseOrderHistoryCopyWith<$Res> {
  factory _$$PurchaseOrderHistoryImplCopyWith(_$PurchaseOrderHistoryImpl value,
          $Res Function(_$PurchaseOrderHistoryImpl) then) =
      __$$PurchaseOrderHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'purchase_order_id') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      MaterialRequest materialRequest,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier supplier,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson) Currency currency,
      double rate,
      double subtotal,
      @JsonKey(name: 'quotation_no') String quotationNo,
      @JsonKey(name: 'subtotal_pay') double subtotalPay,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'subtotal_after_disc') double subtotalAfterDisc,
      @JsonKey(name: 'tax_type', fromJson: TaxType.fromString) TaxType taxType,
      @JsonKey(name: 'tax_percent') double taxPercent,
      @JsonKey(name: 'tax_value') double taxValue,
      @JsonKey(name: 'sub_after_tax') double subAfterTax,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) Ppn ppn,
      @JsonKey(name: 'ppn_value') double ppnValue,
      double total,
      @JsonKey(name: 'dp_percent') double dpPercent,
      @JsonKey(name: 'dp_value') double dpValue,
      @JsonKey(name: 'remaining_payment') double remainingPayment,
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      String description,
      @JsonKey(name: 'account_value') double accountValue,
      @JsonKey(fromJson: PurchaseOrderStatus.fromString)
      PurchaseOrderStatus status,
      @JsonKey(name: 'confirm_po_by_id') int? confirmPoById,
      @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
      DateTime? confirmPoDate,
      @JsonKey(name: 'confirm_accounting_by') int? confirmAccountingBy,
      @JsonKey(
          name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
      DateTime? confirmAccountingDate,
      @JsonKey(name: 'description_confirm_accounting')
      String? descriptionConfirmAccounting,
      @JsonKey(name: 'status_next_shipping_by_id') int? statusNextShippingById,
      @JsonKey(
          name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
      DateTime? statusNextShippingAt,
      @JsonKey(name: 'status_close_by_id') int? statusCloseById,
      @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
      DateTime? statusCloseAt,
      @JsonKey(name: 'close_transaction_by_id') int? closeTransactionById,
      @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
      DateTime? closeTransactionAt,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime deliveryDate,
      @JsonKey(name: 'pph_22_percent') double pph22Percent,
      @JsonKey(name: 'pph_22_value') double pph22Value,
      @JsonKey(name: 'received_date') DateTime? receivedDate,
      @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
      bool confirmDeliveryDate,
      @JsonKey(name: 'edit_description') String? editDescription,
      @JsonKey(name: 'is_stock') bool isStock,
      @JsonKey(
          name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
      PurchaseOrderPaymentType paymentType,
      @JsonKey(name: 'revision_no') int revisionNo,
      @JsonKey(fromJson: Department.fromJson) Department department});

  @override
  $MaterialRequestCopyWith<$Res> get materialRequest;
  @override
  $SupplierCopyWith<$Res> get supplier;
  @override
  $CurrencyCopyWith<$Res> get currency;
  @override
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$PurchaseOrderHistoryImplCopyWithImpl<$Res>
    extends _$PurchaseOrderHistoryCopyWithImpl<$Res, _$PurchaseOrderHistoryImpl>
    implements _$$PurchaseOrderHistoryImplCopyWith<$Res> {
  __$$PurchaseOrderHistoryImplCopyWithImpl(_$PurchaseOrderHistoryImpl _value,
      $Res Function(_$PurchaseOrderHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? materialRequest = null,
    Object? supplier = null,
    Object? currency = null,
    Object? rate = null,
    Object? subtotal = null,
    Object? quotationNo = null,
    Object? subtotalPay = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? subtotalAfterDisc = null,
    Object? taxType = null,
    Object? taxPercent = null,
    Object? taxValue = null,
    Object? subAfterTax = null,
    Object? ppn = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? dpPercent = null,
    Object? dpValue = null,
    Object? remainingPayment = null,
    Object? termOfPayment = null,
    Object? description = null,
    Object? accountValue = null,
    Object? status = null,
    Object? confirmPoById = freezed,
    Object? confirmPoDate = freezed,
    Object? confirmAccountingBy = freezed,
    Object? confirmAccountingDate = freezed,
    Object? descriptionConfirmAccounting = freezed,
    Object? statusNextShippingById = freezed,
    Object? statusNextShippingAt = freezed,
    Object? statusCloseById = freezed,
    Object? statusCloseAt = freezed,
    Object? closeTransactionById = freezed,
    Object? closeTransactionAt = freezed,
    Object? deliveryDate = null,
    Object? pph22Percent = null,
    Object? pph22Value = null,
    Object? receivedDate = freezed,
    Object? confirmDeliveryDate = null,
    Object? editDescription = freezed,
    Object? isStock = null,
    Object? paymentType = null,
    Object? revisionNo = null,
    Object? department = null,
  }) {
    return _then(_$PurchaseOrderHistoryImpl(
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
      materialRequest: null == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      quotationNo: null == quotationNo
          ? _value.quotationNo
          : quotationNo // ignore: cast_nullable_to_non_nullable
              as String,
      subtotalPay: null == subtotalPay
          ? _value.subtotalPay
          : subtotalPay // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalAfterDisc: null == subtotalAfterDisc
          ? _value.subtotalAfterDisc
          : subtotalAfterDisc // ignore: cast_nullable_to_non_nullable
              as double,
      taxType: null == taxType
          ? _value.taxType
          : taxType // ignore: cast_nullable_to_non_nullable
              as TaxType,
      taxPercent: null == taxPercent
          ? _value.taxPercent
          : taxPercent // ignore: cast_nullable_to_non_nullable
              as double,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
      subAfterTax: null == subAfterTax
          ? _value.subAfterTax
          : subAfterTax // ignore: cast_nullable_to_non_nullable
              as double,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      dpPercent: null == dpPercent
          ? _value.dpPercent
          : dpPercent // ignore: cast_nullable_to_non_nullable
              as double,
      dpValue: null == dpValue
          ? _value.dpValue
          : dpValue // ignore: cast_nullable_to_non_nullable
              as double,
      remainingPayment: null == remainingPayment
          ? _value.remainingPayment
          : remainingPayment // ignore: cast_nullable_to_non_nullable
              as double,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderStatus,
      confirmPoById: freezed == confirmPoById
          ? _value.confirmPoById
          : confirmPoById // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmPoDate: freezed == confirmPoDate
          ? _value.confirmPoDate
          : confirmPoDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmAccountingBy: freezed == confirmAccountingBy
          ? _value.confirmAccountingBy
          : confirmAccountingBy // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmAccountingDate: freezed == confirmAccountingDate
          ? _value.confirmAccountingDate
          : confirmAccountingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      descriptionConfirmAccounting: freezed == descriptionConfirmAccounting
          ? _value.descriptionConfirmAccounting
          : descriptionConfirmAccounting // ignore: cast_nullable_to_non_nullable
              as String?,
      statusNextShippingById: freezed == statusNextShippingById
          ? _value.statusNextShippingById
          : statusNextShippingById // ignore: cast_nullable_to_non_nullable
              as int?,
      statusNextShippingAt: freezed == statusNextShippingAt
          ? _value.statusNextShippingAt
          : statusNextShippingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      statusCloseById: freezed == statusCloseById
          ? _value.statusCloseById
          : statusCloseById // ignore: cast_nullable_to_non_nullable
              as int?,
      statusCloseAt: freezed == statusCloseAt
          ? _value.statusCloseAt
          : statusCloseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeTransactionById: freezed == closeTransactionById
          ? _value.closeTransactionById
          : closeTransactionById // ignore: cast_nullable_to_non_nullable
              as int?,
      closeTransactionAt: freezed == closeTransactionAt
          ? _value.closeTransactionAt
          : closeTransactionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pph22Percent: null == pph22Percent
          ? _value.pph22Percent
          : pph22Percent // ignore: cast_nullable_to_non_nullable
              as double,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as double,
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmDeliveryDate: null == confirmDeliveryDate
          ? _value.confirmDeliveryDate
          : confirmDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      editDescription: freezed == editDescription
          ? _value.editDescription
          : editDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isStock: null == isStock
          ? _value.isStock
          : isStock // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderPaymentType,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as int,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderHistoryImpl extends _PurchaseOrderHistory {
  const _$PurchaseOrderHistoryImpl(
      {@JsonKey(name: 'purchase_order_id') required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      required this.materialRequest,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required this.supplier,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson)
      required this.currency,
      required this.rate,
      required this.subtotal,
      @JsonKey(name: 'quotation_no') required this.quotationNo,
      @JsonKey(name: 'subtotal_pay') required this.subtotalPay,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'subtotal_after_disc') required this.subtotalAfterDisc,
      @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
      required this.taxType,
      @JsonKey(name: 'tax_percent') required this.taxPercent,
      @JsonKey(name: 'tax_value') required this.taxValue,
      @JsonKey(name: 'sub_after_tax') required this.subAfterTax,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum) required this.ppn,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      required this.total,
      @JsonKey(name: 'dp_percent') required this.dpPercent,
      @JsonKey(name: 'dp_value') required this.dpValue,
      @JsonKey(name: 'remaining_payment') required this.remainingPayment,
      @JsonKey(name: 'term_of_payment') required this.termOfPayment,
      required this.description,
      @JsonKey(name: 'account_value') required this.accountValue,
      @JsonKey(fromJson: PurchaseOrderStatus.fromString) required this.status,
      @JsonKey(name: 'confirm_po_by_id') required this.confirmPoById,
      @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
      required this.confirmPoDate,
      @JsonKey(name: 'confirm_accounting_by') required this.confirmAccountingBy,
      @JsonKey(
          name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
      required this.confirmAccountingDate,
      @JsonKey(name: 'description_confirm_accounting')
      required this.descriptionConfirmAccounting,
      @JsonKey(name: 'status_next_shipping_by_id')
      required this.statusNextShippingById,
      @JsonKey(
          name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
      required this.statusNextShippingAt,
      @JsonKey(name: 'status_close_by_id') required this.statusCloseById,
      @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
      required this.statusCloseAt,
      @JsonKey(name: 'close_transaction_by_id')
      required this.closeTransactionById,
      @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
      required this.closeTransactionAt,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      required this.deliveryDate,
      @JsonKey(name: 'pph_22_percent') required this.pph22Percent,
      @JsonKey(name: 'pph_22_value') required this.pph22Value,
      @JsonKey(name: 'received_date') required this.receivedDate,
      @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
      required this.confirmDeliveryDate,
      @JsonKey(name: 'edit_description') required this.editDescription,
      @JsonKey(name: 'is_stock') required this.isStock,
      @JsonKey(
          name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
      required this.paymentType,
      @JsonKey(name: 'revision_no') required this.revisionNo,
      @JsonKey(fromJson: Department.fromJson) required this.department})
      : super._();

  factory _$PurchaseOrderHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderHistoryImplFromJson(json);

  @override
  @JsonKey(name: 'purchase_order_id')
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
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
  final MaterialRequest materialRequest;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  final Supplier supplier;
  @override
  @JsonKey(name: 'currency', fromJson: Currency.fromJson)
  final Currency currency;
  @override
  final double rate;
  @override
  final double subtotal;
  @override
  @JsonKey(name: 'quotation_no')
  final String quotationNo;
  @override
  @JsonKey(name: 'subtotal_pay')
  final double subtotalPay;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey(name: 'subtotal_after_disc')
  final double subtotalAfterDisc;
  @override
  @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
  final TaxType taxType;
  @override
  @JsonKey(name: 'tax_percent')
  final double taxPercent;
  @override
  @JsonKey(name: 'tax_value')
  final double taxValue;
  @override
  @JsonKey(name: 'sub_after_tax')
  final double subAfterTax;
  @override
  @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
  final Ppn ppn;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  final double total;
  @override
  @JsonKey(name: 'dp_percent')
  final double dpPercent;
  @override
  @JsonKey(name: 'dp_value')
  final double dpValue;
  @override
  @JsonKey(name: 'remaining_payment')
  final double remainingPayment;
  @override
  @JsonKey(name: 'term_of_payment')
  final int termOfPayment;
  @override
  final String description;
  @override
  @JsonKey(name: 'account_value')
  final double accountValue;
  @override
  @JsonKey(fromJson: PurchaseOrderStatus.fromString)
  final PurchaseOrderStatus status;
  @override
  @JsonKey(name: 'confirm_po_by_id')
  final int? confirmPoById;
  @override
  @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
  final DateTime? confirmPoDate;
  @override
  @JsonKey(name: 'confirm_accounting_by')
  final int? confirmAccountingBy;
  @override
  @JsonKey(name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
  final DateTime? confirmAccountingDate;
  @override
  @JsonKey(name: 'description_confirm_accounting')
  final String? descriptionConfirmAccounting;
  @override
  @JsonKey(name: 'status_next_shipping_by_id')
  final int? statusNextShippingById;
  @override
  @JsonKey(name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
  final DateTime? statusNextShippingAt;
  @override
  @JsonKey(name: 'status_close_by_id')
  final int? statusCloseById;
  @override
  @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
  final DateTime? statusCloseAt;
  @override
  @JsonKey(name: 'close_transaction_by_id')
  final int? closeTransactionById;
  @override
  @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
  final DateTime? closeTransactionAt;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  final DateTime deliveryDate;
  @override
  @JsonKey(name: 'pph_22_percent')
  final double pph22Percent;
  @override
  @JsonKey(name: 'pph_22_value')
  final double pph22Value;
  @override
  @JsonKey(name: 'received_date')
  final DateTime? receivedDate;
  @override
  @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
  final bool confirmDeliveryDate;
  @override
  @JsonKey(name: 'edit_description')
  final String? editDescription;
  @override
  @JsonKey(name: 'is_stock')
  final bool isStock;
  @override
  @JsonKey(name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
  final PurchaseOrderPaymentType paymentType;
  @override
  @JsonKey(name: 'revision_no')
  final int revisionNo;
  @override
  @JsonKey(fromJson: Department.fromJson)
  final Department department;

  @override
  String toString() {
    return 'PurchaseOrderHistory(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, materialRequest: $materialRequest, supplier: $supplier, currency: $currency, rate: $rate, subtotal: $subtotal, quotationNo: $quotationNo, subtotalPay: $subtotalPay, discountPercent: $discountPercent, discountValue: $discountValue, subtotalAfterDisc: $subtotalAfterDisc, taxType: $taxType, taxPercent: $taxPercent, taxValue: $taxValue, subAfterTax: $subAfterTax, ppn: $ppn, ppnValue: $ppnValue, total: $total, dpPercent: $dpPercent, dpValue: $dpValue, remainingPayment: $remainingPayment, termOfPayment: $termOfPayment, description: $description, accountValue: $accountValue, status: $status, confirmPoById: $confirmPoById, confirmPoDate: $confirmPoDate, confirmAccountingBy: $confirmAccountingBy, confirmAccountingDate: $confirmAccountingDate, descriptionConfirmAccounting: $descriptionConfirmAccounting, statusNextShippingById: $statusNextShippingById, statusNextShippingAt: $statusNextShippingAt, statusCloseById: $statusCloseById, statusCloseAt: $statusCloseAt, closeTransactionById: $closeTransactionById, closeTransactionAt: $closeTransactionAt, deliveryDate: $deliveryDate, pph22Percent: $pph22Percent, pph22Value: $pph22Value, receivedDate: $receivedDate, confirmDeliveryDate: $confirmDeliveryDate, editDescription: $editDescription, isStock: $isStock, paymentType: $paymentType, revisionNo: $revisionNo, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.materialRequest, materialRequest) ||
                other.materialRequest == materialRequest) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.quotationNo, quotationNo) ||
                other.quotationNo == quotationNo) &&
            (identical(other.subtotalPay, subtotalPay) ||
                other.subtotalPay == subtotalPay) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.subtotalAfterDisc, subtotalAfterDisc) ||
                other.subtotalAfterDisc == subtotalAfterDisc) &&
            (identical(other.taxType, taxType) || other.taxType == taxType) &&
            (identical(other.taxPercent, taxPercent) ||
                other.taxPercent == taxPercent) &&
            (identical(other.taxValue, taxValue) ||
                other.taxValue == taxValue) &&
            (identical(other.subAfterTax, subAfterTax) ||
                other.subAfterTax == subAfterTax) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.dpPercent, dpPercent) ||
                other.dpPercent == dpPercent) &&
            (identical(other.dpValue, dpValue) || other.dpValue == dpValue) &&
            (identical(other.remainingPayment, remainingPayment) ||
                other.remainingPayment == remainingPayment) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.accountValue, accountValue) ||
                other.accountValue == accountValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.confirmPoById, confirmPoById) ||
                other.confirmPoById == confirmPoById) &&
            (identical(other.confirmPoDate, confirmPoDate) ||
                other.confirmPoDate == confirmPoDate) &&
            (identical(other.confirmAccountingBy, confirmAccountingBy) ||
                other.confirmAccountingBy == confirmAccountingBy) &&
            (identical(other.confirmAccountingDate, confirmAccountingDate) ||
                other.confirmAccountingDate == confirmAccountingDate) &&
            (identical(other.descriptionConfirmAccounting, descriptionConfirmAccounting) ||
                other.descriptionConfirmAccounting ==
                    descriptionConfirmAccounting) &&
            (identical(other.statusNextShippingById, statusNextShippingById) ||
                other.statusNextShippingById == statusNextShippingById) &&
            (identical(other.statusNextShippingAt, statusNextShippingAt) ||
                other.statusNextShippingAt == statusNextShippingAt) &&
            (identical(other.statusCloseById, statusCloseById) ||
                other.statusCloseById == statusCloseById) &&
            (identical(other.statusCloseAt, statusCloseAt) ||
                other.statusCloseAt == statusCloseAt) &&
            (identical(other.closeTransactionById, closeTransactionById) ||
                other.closeTransactionById == closeTransactionById) &&
            (identical(other.closeTransactionAt, closeTransactionAt) ||
                other.closeTransactionAt == closeTransactionAt) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.pph22Percent, pph22Percent) ||
                other.pph22Percent == pph22Percent) &&
            (identical(other.pph22Value, pph22Value) ||
                other.pph22Value == pph22Value) &&
            (identical(other.receivedDate, receivedDate) ||
                other.receivedDate == receivedDate) &&
            (identical(other.confirmDeliveryDate, confirmDeliveryDate) ||
                other.confirmDeliveryDate == confirmDeliveryDate) &&
            (identical(other.editDescription, editDescription) ||
                other.editDescription == editDescription) &&
            (identical(other.isStock, isStock) || other.isStock == isStock) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.revisionNo, revisionNo) ||
                other.revisionNo == revisionNo) &&
            (identical(other.department, department) || other.department == department));
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
        materialRequest,
        supplier,
        currency,
        rate,
        subtotal,
        quotationNo,
        subtotalPay,
        discountPercent,
        discountValue,
        subtotalAfterDisc,
        taxType,
        taxPercent,
        taxValue,
        subAfterTax,
        ppn,
        ppnValue,
        total,
        dpPercent,
        dpValue,
        remainingPayment,
        termOfPayment,
        description,
        accountValue,
        status,
        confirmPoById,
        confirmPoDate,
        confirmAccountingBy,
        confirmAccountingDate,
        descriptionConfirmAccounting,
        statusNextShippingById,
        statusNextShippingAt,
        statusCloseById,
        statusCloseAt,
        closeTransactionById,
        closeTransactionAt,
        deliveryDate,
        pph22Percent,
        pph22Value,
        receivedDate,
        confirmDeliveryDate,
        editDescription,
        isStock,
        paymentType,
        revisionNo,
        department
      ]);

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderHistoryImplCopyWith<_$PurchaseOrderHistoryImpl>
      get copyWith =>
          __$$PurchaseOrderHistoryImplCopyWithImpl<_$PurchaseOrderHistoryImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderHistoryImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderHistory extends PurchaseOrderHistory {
  const factory _PurchaseOrderHistory(
      {@JsonKey(name: 'purchase_order_id') required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      required final MaterialRequest materialRequest,
      @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
      required final Supplier supplier,
      @JsonKey(name: 'currency', fromJson: Currency.fromJson)
      required final Currency currency,
      required final double rate,
      required final double subtotal,
      @JsonKey(name: 'quotation_no') required final String quotationNo,
      @JsonKey(name: 'subtotal_pay') required final double subtotalPay,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'subtotal_after_disc')
      required final double subtotalAfterDisc,
      @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
      required final TaxType taxType,
      @JsonKey(name: 'tax_percent') required final double taxPercent,
      @JsonKey(name: 'tax_value') required final double taxValue,
      @JsonKey(name: 'sub_after_tax') required final double subAfterTax,
      @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
      required final Ppn ppn,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      required final double total,
      @JsonKey(name: 'dp_percent') required final double dpPercent,
      @JsonKey(name: 'dp_value') required final double dpValue,
      @JsonKey(name: 'remaining_payment')
      required final double remainingPayment,
      @JsonKey(name: 'term_of_payment') required final int termOfPayment,
      required final String description,
      @JsonKey(name: 'account_value') required final double accountValue,
      @JsonKey(fromJson: PurchaseOrderStatus.fromString)
      required final PurchaseOrderStatus status,
      @JsonKey(name: 'confirm_po_by_id') required final int? confirmPoById,
      @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
      required final DateTime? confirmPoDate,
      @JsonKey(name: 'confirm_accounting_by')
      required final int? confirmAccountingBy,
      @JsonKey(
          name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
      required final DateTime? confirmAccountingDate,
      @JsonKey(name: 'description_confirm_accounting')
      required final String? descriptionConfirmAccounting,
      @JsonKey(name: 'status_next_shipping_by_id')
      required final int? statusNextShippingById,
      @JsonKey(
          name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
      required final DateTime? statusNextShippingAt,
      @JsonKey(name: 'status_close_by_id') required final int? statusCloseById,
      @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
      required final DateTime? statusCloseAt,
      @JsonKey(name: 'close_transaction_by_id')
      required final int? closeTransactionById,
      @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
      required final DateTime? closeTransactionAt,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryDate,
      @JsonKey(name: 'pph_22_percent') required final double pph22Percent,
      @JsonKey(name: 'pph_22_value') required final double pph22Value,
      @JsonKey(name: 'received_date') required final DateTime? receivedDate,
      @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
      required final bool confirmDeliveryDate,
      @JsonKey(name: 'edit_description') required final String? editDescription,
      @JsonKey(name: 'is_stock') required final bool isStock,
      @JsonKey(
          name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
      required final PurchaseOrderPaymentType paymentType,
      @JsonKey(name: 'revision_no') required final int revisionNo,
      @JsonKey(fromJson: Department.fromJson)
      required final Department department}) = _$PurchaseOrderHistoryImpl;
  const _PurchaseOrderHistory._() : super._();

  factory _PurchaseOrderHistory.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderHistoryImpl.fromJson;

  @override
  @JsonKey(name: 'purchase_order_id')
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
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
  MaterialRequest get materialRequest;
  @override
  @JsonKey(name: 'supplier', fromJson: Supplier.fromJson)
  Supplier get supplier;
  @override
  @JsonKey(name: 'currency', fromJson: Currency.fromJson)
  Currency get currency;
  @override
  double get rate;
  @override
  double get subtotal;
  @override
  @JsonKey(name: 'quotation_no')
  String get quotationNo;
  @override
  @JsonKey(name: 'subtotal_pay')
  double get subtotalPay;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  @JsonKey(name: 'subtotal_after_disc')
  double get subtotalAfterDisc;
  @override
  @JsonKey(name: 'tax_type', fromJson: TaxType.fromString)
  TaxType get taxType;
  @override
  @JsonKey(name: 'tax_percent')
  double get taxPercent;
  @override
  @JsonKey(name: 'tax_value')
  double get taxValue;
  @override
  @JsonKey(name: 'sub_after_tax')
  double get subAfterTax;
  @override
  @JsonKey(name: 'ppn_percent', fromJson: Ppn.fromNum)
  Ppn get ppn;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  double get total;
  @override
  @JsonKey(name: 'dp_percent')
  double get dpPercent;
  @override
  @JsonKey(name: 'dp_value')
  double get dpValue;
  @override
  @JsonKey(name: 'remaining_payment')
  double get remainingPayment;
  @override
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment;
  @override
  String get description;
  @override
  @JsonKey(name: 'account_value')
  double get accountValue;
  @override
  @JsonKey(fromJson: PurchaseOrderStatus.fromString)
  PurchaseOrderStatus get status;
  @override
  @JsonKey(name: 'confirm_po_by_id')
  int? get confirmPoById;
  @override
  @JsonKey(name: 'confirm_po_date', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmPoDate;
  @override
  @JsonKey(name: 'confirm_accounting_by')
  int? get confirmAccountingBy;
  @override
  @JsonKey(name: 'confirm_accounting_date', fromJson: dateTimeNullableFromJson)
  DateTime? get confirmAccountingDate;
  @override
  @JsonKey(name: 'description_confirm_accounting')
  String? get descriptionConfirmAccounting;
  @override
  @JsonKey(name: 'status_next_shipping_by_id')
  int? get statusNextShippingById;
  @override
  @JsonKey(name: 'status_next_shipping_at', fromJson: dateTimeNullableFromJson)
  DateTime? get statusNextShippingAt;
  @override
  @JsonKey(name: 'status_close_by_id')
  int? get statusCloseById;
  @override
  @JsonKey(name: 'status_close_at', fromJson: dateTimeNullableFromJson)
  DateTime? get statusCloseAt;
  @override
  @JsonKey(name: 'close_transaction_by_id')
  int? get closeTransactionById;
  @override
  @JsonKey(name: 'close_transaction_at', fromJson: dateTimeNullableFromJson)
  DateTime? get closeTransactionAt;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime get deliveryDate;
  @override
  @JsonKey(name: 'pph_22_percent')
  double get pph22Percent;
  @override
  @JsonKey(name: 'pph_22_value')
  double get pph22Value;
  @override
  @JsonKey(name: 'received_date')
  DateTime? get receivedDate;
  @override
  @JsonKey(name: 'confirm_delivery_date', defaultValue: false)
  bool get confirmDeliveryDate;
  @override
  @JsonKey(name: 'edit_description')
  String? get editDescription;
  @override
  @JsonKey(name: 'is_stock')
  bool get isStock;
  @override
  @JsonKey(name: 'payment_type', fromJson: PurchaseOrderPaymentType.fromString)
  PurchaseOrderPaymentType get paymentType;
  @override
  @JsonKey(name: 'revision_no')
  int get revisionNo;
  @override
  @JsonKey(fromJson: Department.fromJson)
  Department get department;

  /// Create a copy of PurchaseOrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderHistoryImplCopyWith<_$PurchaseOrderHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
