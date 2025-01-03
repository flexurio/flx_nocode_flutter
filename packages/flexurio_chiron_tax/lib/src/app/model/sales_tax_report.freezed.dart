// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_tax_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesTaxReport _$SalesTaxReportFromJson(Map<String, dynamic> json) {
  return _SalesTaxReport.fromJson(json);
}

/// @nodoc
mixin _$SalesTaxReport {
  @JsonKey(name: 'product_id')
  String get productID => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_number')
  String get taxInvoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'period')
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  double get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_discount')
  double get valueDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_npwp_number')
  String get customerNpwpNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_additional_discount')
  double get subTotalAfterAdditionalDiscount =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_address')
  String get customerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total')
  double get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_discount')
  double get subTotalAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesTaxReportCopyWith<SalesTaxReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesTaxReportCopyWith<$Res> {
  factory $SalesTaxReportCopyWith(
          SalesTaxReport value, $Res Function(SalesTaxReport) then) =
      _$SalesTaxReportCopyWithImpl<$Res, SalesTaxReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productID,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'tax_invoice_number') String taxInvoiceNumber,
      @JsonKey(name: 'price') double price,
      @JsonKey(name: 'quantity') double quantity,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'subtotal') double subTotal,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'value_discount') double valueDiscount,
      @JsonKey(name: 'customer_npwp_number') String customerNpwpNumber,
      @JsonKey(name: 'subtotal_after_additional_discount')
      double subTotalAfterAdditionalDiscount,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_address') String customerAddress,
      @JsonKey(name: 'grand_total') double grandTotal,
      @JsonKey(name: 'subtotal_after_discount') double subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'transaction_no') String transactionNo});
}

/// @nodoc
class _$SalesTaxReportCopyWithImpl<$Res, $Val extends SalesTaxReport>
    implements $SalesTaxReportCopyWith<$Res> {
  _$SalesTaxReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? productName = null,
    Object? taxInvoiceNumber = null,
    Object? price = null,
    Object? quantity = null,
    Object? period = null,
    Object? subTotal = null,
    Object? transactionDate = null,
    Object? valueDiscount = null,
    Object? customerNpwpNumber = null,
    Object? subTotalAfterAdditionalDiscount = null,
    Object? customerName = null,
    Object? customerAddress = null,
    Object? grandTotal = null,
    Object? subTotalAfterDiscount = null,
    Object? ppnValue = null,
    Object? transactionNo = null,
  }) {
    return _then(_value.copyWith(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceNumber: null == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valueDiscount: null == valueDiscount
          ? _value.valueDiscount
          : valueDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      customerNpwpNumber: null == customerNpwpNumber
          ? _value.customerNpwpNumber
          : customerNpwpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subTotalAfterAdditionalDiscount: null == subTotalAfterAdditionalDiscount
          ? _value.subTotalAfterAdditionalDiscount
          : subTotalAfterAdditionalDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerAddress: null == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotalAfterDiscount: null == subTotalAfterDiscount
          ? _value.subTotalAfterDiscount
          : subTotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesTaxReportImplCopyWith<$Res>
    implements $SalesTaxReportCopyWith<$Res> {
  factory _$$SalesTaxReportImplCopyWith(_$SalesTaxReportImpl value,
          $Res Function(_$SalesTaxReportImpl) then) =
      __$$SalesTaxReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productID,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'tax_invoice_number') String taxInvoiceNumber,
      @JsonKey(name: 'price') double price,
      @JsonKey(name: 'quantity') double quantity,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'subtotal') double subTotal,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'value_discount') double valueDiscount,
      @JsonKey(name: 'customer_npwp_number') String customerNpwpNumber,
      @JsonKey(name: 'subtotal_after_additional_discount')
      double subTotalAfterAdditionalDiscount,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_address') String customerAddress,
      @JsonKey(name: 'grand_total') double grandTotal,
      @JsonKey(name: 'subtotal_after_discount') double subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'transaction_no') String transactionNo});
}

/// @nodoc
class __$$SalesTaxReportImplCopyWithImpl<$Res>
    extends _$SalesTaxReportCopyWithImpl<$Res, _$SalesTaxReportImpl>
    implements _$$SalesTaxReportImplCopyWith<$Res> {
  __$$SalesTaxReportImplCopyWithImpl(
      _$SalesTaxReportImpl _value, $Res Function(_$SalesTaxReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? productName = null,
    Object? taxInvoiceNumber = null,
    Object? price = null,
    Object? quantity = null,
    Object? period = null,
    Object? subTotal = null,
    Object? transactionDate = null,
    Object? valueDiscount = null,
    Object? customerNpwpNumber = null,
    Object? subTotalAfterAdditionalDiscount = null,
    Object? customerName = null,
    Object? customerAddress = null,
    Object? grandTotal = null,
    Object? subTotalAfterDiscount = null,
    Object? ppnValue = null,
    Object? transactionNo = null,
  }) {
    return _then(_$SalesTaxReportImpl(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceNumber: null == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      valueDiscount: null == valueDiscount
          ? _value.valueDiscount
          : valueDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      customerNpwpNumber: null == customerNpwpNumber
          ? _value.customerNpwpNumber
          : customerNpwpNumber // ignore: cast_nullable_to_non_nullable
              as String,
      subTotalAfterAdditionalDiscount: null == subTotalAfterAdditionalDiscount
          ? _value.subTotalAfterAdditionalDiscount
          : subTotalAfterAdditionalDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerAddress: null == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotalAfterDiscount: null == subTotalAfterDiscount
          ? _value.subTotalAfterDiscount
          : subTotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesTaxReportImpl extends _SalesTaxReport {
  const _$SalesTaxReportImpl(
      {@JsonKey(name: 'product_id') required this.productID,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'tax_invoice_number') required this.taxInvoiceNumber,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'period') required this.period,
      @JsonKey(name: 'subtotal') required this.subTotal,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'value_discount') required this.valueDiscount,
      @JsonKey(name: 'customer_npwp_number') required this.customerNpwpNumber,
      @JsonKey(name: 'subtotal_after_additional_discount')
      required this.subTotalAfterAdditionalDiscount,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_address') required this.customerAddress,
      @JsonKey(name: 'grand_total') required this.grandTotal,
      @JsonKey(name: 'subtotal_after_discount')
      required this.subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'transaction_no') required this.transactionNo})
      : super._();

  factory _$SalesTaxReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesTaxReportImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productID;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'tax_invoice_number')
  final String taxInvoiceNumber;
  @override
  @JsonKey(name: 'price')
  final double price;
  @override
  @JsonKey(name: 'quantity')
  final double quantity;
  @override
  @JsonKey(name: 'period')
  final String period;
  @override
  @JsonKey(name: 'subtotal')
  final double subTotal;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'value_discount')
  final double valueDiscount;
  @override
  @JsonKey(name: 'customer_npwp_number')
  final String customerNpwpNumber;
  @override
  @JsonKey(name: 'subtotal_after_additional_discount')
  final double subTotalAfterAdditionalDiscount;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_address')
  final String customerAddress;
  @override
  @JsonKey(name: 'grand_total')
  final double grandTotal;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  final double subTotalAfterDiscount;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;

  @override
  String toString() {
    return 'SalesTaxReport(productID: $productID, productName: $productName, taxInvoiceNumber: $taxInvoiceNumber, price: $price, quantity: $quantity, period: $period, subTotal: $subTotal, transactionDate: $transactionDate, valueDiscount: $valueDiscount, customerNpwpNumber: $customerNpwpNumber, subTotalAfterAdditionalDiscount: $subTotalAfterAdditionalDiscount, customerName: $customerName, customerAddress: $customerAddress, grandTotal: $grandTotal, subTotalAfterDiscount: $subTotalAfterDiscount, ppnValue: $ppnValue, transactionNo: $transactionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesTaxReportImpl &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.taxInvoiceNumber, taxInvoiceNumber) ||
                other.taxInvoiceNumber == taxInvoiceNumber) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.valueDiscount, valueDiscount) ||
                other.valueDiscount == valueDiscount) &&
            (identical(other.customerNpwpNumber, customerNpwpNumber) ||
                other.customerNpwpNumber == customerNpwpNumber) &&
            (identical(other.subTotalAfterAdditionalDiscount,
                    subTotalAfterAdditionalDiscount) ||
                other.subTotalAfterAdditionalDiscount ==
                    subTotalAfterAdditionalDiscount) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.subTotalAfterDiscount, subTotalAfterDiscount) ||
                other.subTotalAfterDiscount == subTotalAfterDiscount) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productID,
      productName,
      taxInvoiceNumber,
      price,
      quantity,
      period,
      subTotal,
      transactionDate,
      valueDiscount,
      customerNpwpNumber,
      subTotalAfterAdditionalDiscount,
      customerName,
      customerAddress,
      grandTotal,
      subTotalAfterDiscount,
      ppnValue,
      transactionNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesTaxReportImplCopyWith<_$SalesTaxReportImpl> get copyWith =>
      __$$SalesTaxReportImplCopyWithImpl<_$SalesTaxReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesTaxReportImplToJson(
      this,
    );
  }
}

abstract class _SalesTaxReport extends SalesTaxReport {
  const factory _SalesTaxReport(
      {@JsonKey(name: 'product_id') required final String productID,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'tax_invoice_number')
      required final String taxInvoiceNumber,
      @JsonKey(name: 'price') required final double price,
      @JsonKey(name: 'quantity') required final double quantity,
      @JsonKey(name: 'period') required final String period,
      @JsonKey(name: 'subtotal') required final double subTotal,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'value_discount') required final double valueDiscount,
      @JsonKey(name: 'customer_npwp_number')
      required final String customerNpwpNumber,
      @JsonKey(name: 'subtotal_after_additional_discount')
      required final double subTotalAfterAdditionalDiscount,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_address') required final String customerAddress,
      @JsonKey(name: 'grand_total') required final double grandTotal,
      @JsonKey(name: 'subtotal_after_discount')
      required final double subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      @JsonKey(name: 'transaction_no')
      required final String transactionNo}) = _$SalesTaxReportImpl;
  const _SalesTaxReport._() : super._();

  factory _SalesTaxReport.fromJson(Map<String, dynamic> json) =
      _$SalesTaxReportImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productID;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'tax_invoice_number')
  String get taxInvoiceNumber;
  @override
  @JsonKey(name: 'price')
  double get price;
  @override
  @JsonKey(name: 'quantity')
  double get quantity;
  @override
  @JsonKey(name: 'period')
  String get period;
  @override
  @JsonKey(name: 'subtotal')
  double get subTotal;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'value_discount')
  double get valueDiscount;
  @override
  @JsonKey(name: 'customer_npwp_number')
  String get customerNpwpNumber;
  @override
  @JsonKey(name: 'subtotal_after_additional_discount')
  double get subTotalAfterAdditionalDiscount;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_address')
  String get customerAddress;
  @override
  @JsonKey(name: 'grand_total')
  double get grandTotal;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  double get subTotalAfterDiscount;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(ignore: true)
  _$$SalesTaxReportImplCopyWith<_$SalesTaxReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
