// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_recap_by_sales_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceRecapBySalesDetail _$InvoiceRecapBySalesDetailFromJson(
    Map<String, dynamic> json) {
  return _InvoiceRecapBySalesDetail.fromJson(json);
}

/// @nodoc
mixin _$InvoiceRecapBySalesDetail {
  @JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  double get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value')
  double get additionalDiscountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_customer')
  double get subtotalCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value_customer')
  double get discountValueCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value_customer')
  double get additionalDiscountValueCustomer =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value_customer')
  double get ppnValueCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_customer')
  double get totalCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_summary')
  double get subtotalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value_summary')
  double get discountValueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value_summary')
  double get additionalDiscountValueSummary =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value_summary')
  double get ppnValueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_summary')
  double get totalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice')
  String? get taxInvoice => throw _privateConstructorUsedError;

  /// Serializes this InvoiceRecapBySalesDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceRecapBySalesDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceRecapBySalesDetailCopyWith<InvoiceRecapBySalesDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceRecapBySalesDetailCopyWith<$Res> {
  factory $InvoiceRecapBySalesDetailCopyWith(InvoiceRecapBySalesDetail value,
          $Res Function(InvoiceRecapBySalesDetail) then) =
      _$InvoiceRecapBySalesDetailCopyWithImpl<$Res, InvoiceRecapBySalesDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
      String customer,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date') DateTime transactionDate,
      @JsonKey(name: 'subtotal') double subtotal,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'additional_discount_value')
      double additionalDiscountValue,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'subtotal_customer') double subtotalCustomer,
      @JsonKey(name: 'discount_value_customer') double discountValueCustomer,
      @JsonKey(name: 'additional_discount_value_customer')
      double additionalDiscountValueCustomer,
      @JsonKey(name: 'ppn_value_customer') double ppnValueCustomer,
      @JsonKey(name: 'total_customer') double totalCustomer,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary,
      @JsonKey(name: 'discount_value_summary') double discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      double additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') double ppnValueSummary,
      @JsonKey(name: 'total_summary') double totalSummary,
      @JsonKey(name: 'tax_invoice') String? taxInvoice});
}

/// @nodoc
class _$InvoiceRecapBySalesDetailCopyWithImpl<$Res,
        $Val extends InvoiceRecapBySalesDetail>
    implements $InvoiceRecapBySalesDetailCopyWith<$Res> {
  _$InvoiceRecapBySalesDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceRecapBySalesDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? subtotal = null,
    Object? discountValue = null,
    Object? additionalDiscountValue = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? subtotalCustomer = null,
    Object? discountValueCustomer = null,
    Object? additionalDiscountValueCustomer = null,
    Object? ppnValueCustomer = null,
    Object? totalCustomer = null,
    Object? subtotalSummary = null,
    Object? discountValueSummary = null,
    Object? additionalDiscountValueSummary = null,
    Object? ppnValueSummary = null,
    Object? totalSummary = null,
    Object? taxInvoice = freezed,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValue: null == additionalDiscountValue
          ? _value.additionalDiscountValue
          : additionalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalCustomer: null == subtotalCustomer
          ? _value.subtotalCustomer
          : subtotalCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      discountValueCustomer: null == discountValueCustomer
          ? _value.discountValueCustomer
          : discountValueCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValueCustomer: null == additionalDiscountValueCustomer
          ? _value.additionalDiscountValueCustomer
          : additionalDiscountValueCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValueCustomer: null == ppnValueCustomer
          ? _value.ppnValueCustomer
          : ppnValueCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      totalCustomer: null == totalCustomer
          ? _value.totalCustomer
          : totalCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      discountValueSummary: null == discountValueSummary
          ? _value.discountValueSummary
          : discountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValueSummary: null == additionalDiscountValueSummary
          ? _value.additionalDiscountValueSummary
          : additionalDiscountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValueSummary: null == ppnValueSummary
          ? _value.ppnValueSummary
          : ppnValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      taxInvoice: freezed == taxInvoice
          ? _value.taxInvoice
          : taxInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceRecapBySalesDetailImplCopyWith<$Res>
    implements $InvoiceRecapBySalesDetailCopyWith<$Res> {
  factory _$$InvoiceRecapBySalesDetailImplCopyWith(
          _$InvoiceRecapBySalesDetailImpl value,
          $Res Function(_$InvoiceRecapBySalesDetailImpl) then) =
      __$$InvoiceRecapBySalesDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
      String customer,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date') DateTime transactionDate,
      @JsonKey(name: 'subtotal') double subtotal,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'additional_discount_value')
      double additionalDiscountValue,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'subtotal_customer') double subtotalCustomer,
      @JsonKey(name: 'discount_value_customer') double discountValueCustomer,
      @JsonKey(name: 'additional_discount_value_customer')
      double additionalDiscountValueCustomer,
      @JsonKey(name: 'ppn_value_customer') double ppnValueCustomer,
      @JsonKey(name: 'total_customer') double totalCustomer,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary,
      @JsonKey(name: 'discount_value_summary') double discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      double additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') double ppnValueSummary,
      @JsonKey(name: 'total_summary') double totalSummary,
      @JsonKey(name: 'tax_invoice') String? taxInvoice});
}

/// @nodoc
class __$$InvoiceRecapBySalesDetailImplCopyWithImpl<$Res>
    extends _$InvoiceRecapBySalesDetailCopyWithImpl<$Res,
        _$InvoiceRecapBySalesDetailImpl>
    implements _$$InvoiceRecapBySalesDetailImplCopyWith<$Res> {
  __$$InvoiceRecapBySalesDetailImplCopyWithImpl(
      _$InvoiceRecapBySalesDetailImpl _value,
      $Res Function(_$InvoiceRecapBySalesDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? subtotal = null,
    Object? discountValue = null,
    Object? additionalDiscountValue = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? subtotalCustomer = null,
    Object? discountValueCustomer = null,
    Object? additionalDiscountValueCustomer = null,
    Object? ppnValueCustomer = null,
    Object? totalCustomer = null,
    Object? subtotalSummary = null,
    Object? discountValueSummary = null,
    Object? additionalDiscountValueSummary = null,
    Object? ppnValueSummary = null,
    Object? totalSummary = null,
    Object? taxInvoice = freezed,
  }) {
    return _then(_$InvoiceRecapBySalesDetailImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValue: null == additionalDiscountValue
          ? _value.additionalDiscountValue
          : additionalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalCustomer: null == subtotalCustomer
          ? _value.subtotalCustomer
          : subtotalCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      discountValueCustomer: null == discountValueCustomer
          ? _value.discountValueCustomer
          : discountValueCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValueCustomer: null == additionalDiscountValueCustomer
          ? _value.additionalDiscountValueCustomer
          : additionalDiscountValueCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValueCustomer: null == ppnValueCustomer
          ? _value.ppnValueCustomer
          : ppnValueCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      totalCustomer: null == totalCustomer
          ? _value.totalCustomer
          : totalCustomer // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      discountValueSummary: null == discountValueSummary
          ? _value.discountValueSummary
          : discountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValueSummary: null == additionalDiscountValueSummary
          ? _value.additionalDiscountValueSummary
          : additionalDiscountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValueSummary: null == ppnValueSummary
          ? _value.ppnValueSummary
          : ppnValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      taxInvoice: freezed == taxInvoice
          ? _value.taxInvoice
          : taxInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceRecapBySalesDetailImpl extends _InvoiceRecapBySalesDetail {
  const _$InvoiceRecapBySalesDetailImpl(
      {@JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
      required this.customer,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'transaction_date') required this.transactionDate,
      @JsonKey(name: 'subtotal') required this.subtotal,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'additional_discount_value')
      required this.additionalDiscountValue,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'total') required this.total,
      @JsonKey(name: 'subtotal_customer') required this.subtotalCustomer,
      @JsonKey(name: 'discount_value_customer')
      required this.discountValueCustomer,
      @JsonKey(name: 'additional_discount_value_customer')
      required this.additionalDiscountValueCustomer,
      @JsonKey(name: 'ppn_value_customer') required this.ppnValueCustomer,
      @JsonKey(name: 'total_customer') required this.totalCustomer,
      @JsonKey(name: 'subtotal_summary') required this.subtotalSummary,
      @JsonKey(name: 'discount_value_summary')
      required this.discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      required this.additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') required this.ppnValueSummary,
      @JsonKey(name: 'total_summary') required this.totalSummary,
      @JsonKey(name: 'tax_invoice') this.taxInvoice})
      : super._();

  factory _$InvoiceRecapBySalesDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceRecapBySalesDetailImplFromJson(json);

  @override
  @JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
  final String customer;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'transaction_date')
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'subtotal')
  final double subtotal;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey(name: 'additional_discount_value')
  final double additionalDiscountValue;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  @JsonKey(name: 'total')
  final double total;
  @override
  @JsonKey(name: 'subtotal_customer')
  final double subtotalCustomer;
  @override
  @JsonKey(name: 'discount_value_customer')
  final double discountValueCustomer;
  @override
  @JsonKey(name: 'additional_discount_value_customer')
  final double additionalDiscountValueCustomer;
  @override
  @JsonKey(name: 'ppn_value_customer')
  final double ppnValueCustomer;
  @override
  @JsonKey(name: 'total_customer')
  final double totalCustomer;
  @override
  @JsonKey(name: 'subtotal_summary')
  final double subtotalSummary;
  @override
  @JsonKey(name: 'discount_value_summary')
  final double discountValueSummary;
  @override
  @JsonKey(name: 'additional_discount_value_summary')
  final double additionalDiscountValueSummary;
  @override
  @JsonKey(name: 'ppn_value_summary')
  final double ppnValueSummary;
  @override
  @JsonKey(name: 'total_summary')
  final double totalSummary;
  @override
  @JsonKey(name: 'tax_invoice')
  final String? taxInvoice;

  @override
  String toString() {
    return 'InvoiceRecapBySalesDetail(customer: $customer, transactionNo: $transactionNo, transactionDate: $transactionDate, subtotal: $subtotal, discountValue: $discountValue, additionalDiscountValue: $additionalDiscountValue, ppnValue: $ppnValue, total: $total, subtotalCustomer: $subtotalCustomer, discountValueCustomer: $discountValueCustomer, additionalDiscountValueCustomer: $additionalDiscountValueCustomer, ppnValueCustomer: $ppnValueCustomer, totalCustomer: $totalCustomer, subtotalSummary: $subtotalSummary, discountValueSummary: $discountValueSummary, additionalDiscountValueSummary: $additionalDiscountValueSummary, ppnValueSummary: $ppnValueSummary, totalSummary: $totalSummary, taxInvoice: $taxInvoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceRecapBySalesDetailImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(
                    other.additionalDiscountValue, additionalDiscountValue) ||
                other.additionalDiscountValue == additionalDiscountValue) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subtotalCustomer, subtotalCustomer) ||
                other.subtotalCustomer == subtotalCustomer) &&
            (identical(other.discountValueCustomer, discountValueCustomer) ||
                other.discountValueCustomer == discountValueCustomer) &&
            (identical(other.additionalDiscountValueCustomer,
                    additionalDiscountValueCustomer) ||
                other.additionalDiscountValueCustomer ==
                    additionalDiscountValueCustomer) &&
            (identical(other.ppnValueCustomer, ppnValueCustomer) ||
                other.ppnValueCustomer == ppnValueCustomer) &&
            (identical(other.totalCustomer, totalCustomer) ||
                other.totalCustomer == totalCustomer) &&
            (identical(other.subtotalSummary, subtotalSummary) ||
                other.subtotalSummary == subtotalSummary) &&
            (identical(other.discountValueSummary, discountValueSummary) ||
                other.discountValueSummary == discountValueSummary) &&
            (identical(other.additionalDiscountValueSummary,
                    additionalDiscountValueSummary) ||
                other.additionalDiscountValueSummary ==
                    additionalDiscountValueSummary) &&
            (identical(other.ppnValueSummary, ppnValueSummary) ||
                other.ppnValueSummary == ppnValueSummary) &&
            (identical(other.totalSummary, totalSummary) ||
                other.totalSummary == totalSummary) &&
            (identical(other.taxInvoice, taxInvoice) ||
                other.taxInvoice == taxInvoice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customer,
        transactionNo,
        transactionDate,
        subtotal,
        discountValue,
        additionalDiscountValue,
        ppnValue,
        total,
        subtotalCustomer,
        discountValueCustomer,
        additionalDiscountValueCustomer,
        ppnValueCustomer,
        totalCustomer,
        subtotalSummary,
        discountValueSummary,
        additionalDiscountValueSummary,
        ppnValueSummary,
        totalSummary,
        taxInvoice
      ]);

  /// Create a copy of InvoiceRecapBySalesDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceRecapBySalesDetailImplCopyWith<_$InvoiceRecapBySalesDetailImpl>
      get copyWith => __$$InvoiceRecapBySalesDetailImplCopyWithImpl<
          _$InvoiceRecapBySalesDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceRecapBySalesDetailImplToJson(
      this,
    );
  }
}

abstract class _InvoiceRecapBySalesDetail extends InvoiceRecapBySalesDetail {
  const factory _InvoiceRecapBySalesDetail(
      {@JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
      required final String customer,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'transaction_date')
      required final DateTime transactionDate,
      @JsonKey(name: 'subtotal') required final double subtotal,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'additional_discount_value')
      required final double additionalDiscountValue,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      @JsonKey(name: 'total') required final double total,
      @JsonKey(name: 'subtotal_customer')
      required final double subtotalCustomer,
      @JsonKey(name: 'discount_value_customer')
      required final double discountValueCustomer,
      @JsonKey(name: 'additional_discount_value_customer')
      required final double additionalDiscountValueCustomer,
      @JsonKey(name: 'ppn_value_customer')
      required final double ppnValueCustomer,
      @JsonKey(name: 'total_customer') required final double totalCustomer,
      @JsonKey(name: 'subtotal_summary') required final double subtotalSummary,
      @JsonKey(name: 'discount_value_summary')
      required final double discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      required final double additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') required final double ppnValueSummary,
      @JsonKey(name: 'total_summary') required final double totalSummary,
      @JsonKey(name: 'tax_invoice')
      final String? taxInvoice}) = _$InvoiceRecapBySalesDetailImpl;
  const _InvoiceRecapBySalesDetail._() : super._();

  factory _InvoiceRecapBySalesDetail.fromJson(Map<String, dynamic> json) =
      _$InvoiceRecapBySalesDetailImpl.fromJson;

  @override
  @JsonKey(name: 'customer', defaultValue: '', includeIfNull: true)
  String get customer;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'transaction_date')
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'subtotal')
  double get subtotal;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  @JsonKey(name: 'additional_discount_value')
  double get additionalDiscountValue;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  @JsonKey(name: 'total')
  double get total;
  @override
  @JsonKey(name: 'subtotal_customer')
  double get subtotalCustomer;
  @override
  @JsonKey(name: 'discount_value_customer')
  double get discountValueCustomer;
  @override
  @JsonKey(name: 'additional_discount_value_customer')
  double get additionalDiscountValueCustomer;
  @override
  @JsonKey(name: 'ppn_value_customer')
  double get ppnValueCustomer;
  @override
  @JsonKey(name: 'total_customer')
  double get totalCustomer;
  @override
  @JsonKey(name: 'subtotal_summary')
  double get subtotalSummary;
  @override
  @JsonKey(name: 'discount_value_summary')
  double get discountValueSummary;
  @override
  @JsonKey(name: 'additional_discount_value_summary')
  double get additionalDiscountValueSummary;
  @override
  @JsonKey(name: 'ppn_value_summary')
  double get ppnValueSummary;
  @override
  @JsonKey(name: 'total_summary')
  double get totalSummary;
  @override
  @JsonKey(name: 'tax_invoice')
  String? get taxInvoice;

  /// Create a copy of InvoiceRecapBySalesDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceRecapBySalesDetailImplCopyWith<_$InvoiceRecapBySalesDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
