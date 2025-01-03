// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_payable_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsPayablePayment _$AccountsPayablePaymentFromJson(
    Map<String, dynamic> json) {
  return _AccountsPayablePayment.fromJson(json);
}

/// @nodoc
mixin _$AccountsPayablePayment {
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
  DateTime get invoiceReceivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String? get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_value')
  double get taxValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_value')
  double get subtotalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_value')
  double get totalValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String? get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_supplier')
  double? get totalSupplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_summary')
  double get totalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String? get transactionNo => throw _privateConstructorUsedError;

  /// Serializes this AccountsPayablePayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsPayablePayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsPayablePaymentCopyWith<AccountsPayablePayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsPayablePaymentCopyWith<$Res> {
  factory $AccountsPayablePaymentCopyWith(AccountsPayablePayment value,
          $Res Function(AccountsPayablePayment) then) =
      _$AccountsPayablePaymentCopyWithImpl<$Res, AccountsPayablePayment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
      DateTime invoiceReceivedDate,
      @JsonKey(name: 'remark') String? remark,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'tax_value') double taxValue,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'subtotal_value') double subtotalValue,
      @JsonKey(name: 'total_value') double totalValue,
      @JsonKey(name: 'supplier_name') String? supplierName,
      @JsonKey(name: 'total_supplier') double? totalSupplier,
      @JsonKey(name: 'total_summary') double totalSummary,
      @JsonKey(name: 'transaction_no') String? transactionNo});
}

/// @nodoc
class _$AccountsPayablePaymentCopyWithImpl<$Res,
        $Val extends AccountsPayablePayment>
    implements $AccountsPayablePaymentCopyWith<$Res> {
  _$AccountsPayablePaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsPayablePayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? invoiceReceivedDate = null,
    Object? remark = freezed,
    Object? invoiceNo = null,
    Object? taxValue = null,
    Object? ppnValue = null,
    Object? subtotalValue = null,
    Object? totalValue = null,
    Object? supplierName = freezed,
    Object? totalSupplier = freezed,
    Object? totalSummary = null,
    Object? transactionNo = freezed,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceReceivedDate: null == invoiceReceivedDate
          ? _value.invoiceReceivedDate
          : invoiceReceivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalValue: null == subtotalValue
          ? _value.subtotalValue
          : subtotalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSupplier: freezed == totalSupplier
          ? _value.totalSupplier
          : totalSupplier // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsPayablePaymentImplCopyWith<$Res>
    implements $AccountsPayablePaymentCopyWith<$Res> {
  factory _$$AccountsPayablePaymentImplCopyWith(
          _$AccountsPayablePaymentImpl value,
          $Res Function(_$AccountsPayablePaymentImpl) then) =
      __$$AccountsPayablePaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
      DateTime invoiceReceivedDate,
      @JsonKey(name: 'remark') String? remark,
      @JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'tax_value') double taxValue,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'subtotal_value') double subtotalValue,
      @JsonKey(name: 'total_value') double totalValue,
      @JsonKey(name: 'supplier_name') String? supplierName,
      @JsonKey(name: 'total_supplier') double? totalSupplier,
      @JsonKey(name: 'total_summary') double totalSummary,
      @JsonKey(name: 'transaction_no') String? transactionNo});
}

/// @nodoc
class __$$AccountsPayablePaymentImplCopyWithImpl<$Res>
    extends _$AccountsPayablePaymentCopyWithImpl<$Res,
        _$AccountsPayablePaymentImpl>
    implements _$$AccountsPayablePaymentImplCopyWith<$Res> {
  __$$AccountsPayablePaymentImplCopyWithImpl(
      _$AccountsPayablePaymentImpl _value,
      $Res Function(_$AccountsPayablePaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsPayablePayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? invoiceReceivedDate = null,
    Object? remark = freezed,
    Object? invoiceNo = null,
    Object? taxValue = null,
    Object? ppnValue = null,
    Object? subtotalValue = null,
    Object? totalValue = null,
    Object? supplierName = freezed,
    Object? totalSupplier = freezed,
    Object? totalSummary = null,
    Object? transactionNo = freezed,
  }) {
    return _then(_$AccountsPayablePaymentImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceReceivedDate: null == invoiceReceivedDate
          ? _value.invoiceReceivedDate
          : invoiceReceivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remark: freezed == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      taxValue: null == taxValue
          ? _value.taxValue
          : taxValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      subtotalValue: null == subtotalValue
          ? _value.subtotalValue
          : subtotalValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSupplier: freezed == totalSupplier
          ? _value.totalSupplier
          : totalSupplier // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsPayablePaymentImpl extends _AccountsPayablePayment {
  const _$AccountsPayablePaymentImpl(
      {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
      required this.invoiceReceivedDate,
      @JsonKey(name: 'remark') required this.remark,
      @JsonKey(name: 'invoice_no') required this.invoiceNo,
      @JsonKey(name: 'tax_value') required this.taxValue,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'subtotal_value') required this.subtotalValue,
      @JsonKey(name: 'total_value') required this.totalValue,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'total_supplier') required this.totalSupplier,
      @JsonKey(name: 'total_summary') required this.totalSummary,
      @JsonKey(name: 'transaction_no') this.transactionNo})
      : super._();

  factory _$AccountsPayablePaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountsPayablePaymentImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
  final DateTime invoiceReceivedDate;
  @override
  @JsonKey(name: 'remark')
  final String? remark;
  @override
  @JsonKey(name: 'invoice_no')
  final String invoiceNo;
  @override
  @JsonKey(name: 'tax_value')
  final double taxValue;
  @override
  @JsonKey(name: 'ppn_value')
  final double ppnValue;
  @override
  @JsonKey(name: 'subtotal_value')
  final double subtotalValue;
  @override
  @JsonKey(name: 'total_value')
  final double totalValue;
  @override
  @JsonKey(name: 'supplier_name')
  final String? supplierName;
  @override
  @JsonKey(name: 'total_supplier')
  final double? totalSupplier;
  @override
  @JsonKey(name: 'total_summary')
  final double totalSummary;
  @override
  @JsonKey(name: 'transaction_no')
  final String? transactionNo;

  @override
  String toString() {
    return 'AccountsPayablePayment(transactionDate: $transactionDate, invoiceReceivedDate: $invoiceReceivedDate, remark: $remark, invoiceNo: $invoiceNo, taxValue: $taxValue, ppnValue: $ppnValue, subtotalValue: $subtotalValue, totalValue: $totalValue, supplierName: $supplierName, totalSupplier: $totalSupplier, totalSummary: $totalSummary, transactionNo: $transactionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsPayablePaymentImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.invoiceReceivedDate, invoiceReceivedDate) ||
                other.invoiceReceivedDate == invoiceReceivedDate) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.taxValue, taxValue) ||
                other.taxValue == taxValue) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.subtotalValue, subtotalValue) ||
                other.subtotalValue == subtotalValue) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.totalSupplier, totalSupplier) ||
                other.totalSupplier == totalSupplier) &&
            (identical(other.totalSummary, totalSummary) ||
                other.totalSummary == totalSummary) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDate,
      invoiceReceivedDate,
      remark,
      invoiceNo,
      taxValue,
      ppnValue,
      subtotalValue,
      totalValue,
      supplierName,
      totalSupplier,
      totalSummary,
      transactionNo);

  /// Create a copy of AccountsPayablePayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsPayablePaymentImplCopyWith<_$AccountsPayablePaymentImpl>
      get copyWith => __$$AccountsPayablePaymentImplCopyWithImpl<
          _$AccountsPayablePaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsPayablePaymentImplToJson(
      this,
    );
  }
}

abstract class _AccountsPayablePayment extends AccountsPayablePayment {
  const factory _AccountsPayablePayment(
          {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
          required final DateTime invoiceReceivedDate,
          @JsonKey(name: 'remark') required final String? remark,
          @JsonKey(name: 'invoice_no') required final String invoiceNo,
          @JsonKey(name: 'tax_value') required final double taxValue,
          @JsonKey(name: 'ppn_value') required final double ppnValue,
          @JsonKey(name: 'subtotal_value') required final double subtotalValue,
          @JsonKey(name: 'total_value') required final double totalValue,
          @JsonKey(name: 'supplier_name') required final String? supplierName,
          @JsonKey(name: 'total_supplier') required final double? totalSupplier,
          @JsonKey(name: 'total_summary') required final double totalSummary,
          @JsonKey(name: 'transaction_no') final String? transactionNo}) =
      _$AccountsPayablePaymentImpl;
  const _AccountsPayablePayment._() : super._();

  factory _AccountsPayablePayment.fromJson(Map<String, dynamic> json) =
      _$AccountsPayablePaymentImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'invoice_received_date', fromJson: isoDateToDateTime)
  DateTime get invoiceReceivedDate;
  @override
  @JsonKey(name: 'remark')
  String? get remark;
  @override
  @JsonKey(name: 'invoice_no')
  String get invoiceNo;
  @override
  @JsonKey(name: 'tax_value')
  double get taxValue;
  @override
  @JsonKey(name: 'ppn_value')
  double get ppnValue;
  @override
  @JsonKey(name: 'subtotal_value')
  double get subtotalValue;
  @override
  @JsonKey(name: 'total_value')
  double get totalValue;
  @override
  @JsonKey(name: 'supplier_name')
  String? get supplierName;
  @override
  @JsonKey(name: 'total_supplier')
  double? get totalSupplier;
  @override
  @JsonKey(name: 'total_summary')
  double get totalSummary;
  @override
  @JsonKey(name: 'transaction_no')
  String? get transactionNo;

  /// Create a copy of AccountsPayablePayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsPayablePaymentImplCopyWith<_$AccountsPayablePaymentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
