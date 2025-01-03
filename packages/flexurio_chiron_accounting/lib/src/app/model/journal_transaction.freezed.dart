// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalTransaction _$JournalTransactionFromJson(Map<String, dynamic> json) {
  return _JournalTransaction.fromJson(json);
}

/// @nodoc
mixin _$JournalTransaction {
  @JsonKey(name: 'date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_name')
  String get chartOfAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'debet')
  double get debet => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit')
  double get credit => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String get departmentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lpb')
  String get lpb => throw _privateConstructorUsedError;
  @JsonKey(name: 'period')
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'division')
  String? get division => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice')
  String? get invoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
  DateTime? get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_no')
  String? get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  String? get supplier => throw _privateConstructorUsedError;

  /// Serializes this JournalTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalTransactionCopyWith<JournalTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalTransactionCopyWith<$Res> {
  factory $JournalTransactionCopyWith(
          JournalTransaction value, $Res Function(JournalTransaction) then) =
      _$JournalTransactionCopyWithImpl<$Res, JournalTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String chartOfAccountName,
      @JsonKey(name: 'debet') double debet,
      @JsonKey(name: 'credit') double credit,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'lpb') String lpb,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'division') String? division,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'invoice') String? invoice,
      @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
      DateTime? invoiceDate,
      @JsonKey(name: 'tax_invoice_no') String? taxInvoiceNo,
      @JsonKey(name: 'supplier') String? supplier});
}

/// @nodoc
class _$JournalTransactionCopyWithImpl<$Res, $Val extends JournalTransaction>
    implements $JournalTransactionCopyWith<$Res> {
  _$JournalTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? transactionNo = null,
    Object? chartOfAccountId = null,
    Object? chartOfAccountName = null,
    Object? debet = null,
    Object? credit = null,
    Object? description = null,
    Object? departmentName = null,
    Object? lpb = null,
    Object? period = null,
    Object? division = freezed,
    Object? name = freezed,
    Object? invoice = freezed,
    Object? invoiceDate = freezed,
    Object? taxInvoiceNo = freezed,
    Object? supplier = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountName: null == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      debet: null == debet
          ? _value.debet
          : debet // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      lpb: null == lpb
          ? _value.lpb
          : lpb // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      division: freezed == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceDate: freezed == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taxInvoiceNo: freezed == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalTransactionImplCopyWith<$Res>
    implements $JournalTransactionCopyWith<$Res> {
  factory _$$JournalTransactionImplCopyWith(_$JournalTransactionImpl value,
          $Res Function(_$JournalTransactionImpl) then) =
      __$$JournalTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date') DateTime date,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String chartOfAccountName,
      @JsonKey(name: 'debet') double debet,
      @JsonKey(name: 'credit') double credit,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'department_name') String departmentName,
      @JsonKey(name: 'lpb') String lpb,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'division') String? division,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'invoice') String? invoice,
      @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
      DateTime? invoiceDate,
      @JsonKey(name: 'tax_invoice_no') String? taxInvoiceNo,
      @JsonKey(name: 'supplier') String? supplier});
}

/// @nodoc
class __$$JournalTransactionImplCopyWithImpl<$Res>
    extends _$JournalTransactionCopyWithImpl<$Res, _$JournalTransactionImpl>
    implements _$$JournalTransactionImplCopyWith<$Res> {
  __$$JournalTransactionImplCopyWithImpl(_$JournalTransactionImpl _value,
      $Res Function(_$JournalTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? transactionNo = null,
    Object? chartOfAccountId = null,
    Object? chartOfAccountName = null,
    Object? debet = null,
    Object? credit = null,
    Object? description = null,
    Object? departmentName = null,
    Object? lpb = null,
    Object? period = null,
    Object? division = freezed,
    Object? name = freezed,
    Object? invoice = freezed,
    Object? invoiceDate = freezed,
    Object? taxInvoiceNo = freezed,
    Object? supplier = freezed,
  }) {
    return _then(_$JournalTransactionImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountId: null == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountName: null == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      debet: null == debet
          ? _value.debet
          : debet // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      lpb: null == lpb
          ? _value.lpb
          : lpb // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      division: freezed == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice: freezed == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceDate: freezed == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      taxInvoiceNo: freezed == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalTransactionImpl extends _JournalTransaction {
  const _$JournalTransactionImpl(
      {@JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'chart_of_account_id') required this.chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') required this.chartOfAccountName,
      @JsonKey(name: 'debet') required this.debet,
      @JsonKey(name: 'credit') required this.credit,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'department_name') required this.departmentName,
      @JsonKey(name: 'lpb') required this.lpb,
      @JsonKey(name: 'period') required this.period,
      @JsonKey(name: 'division') this.division,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'invoice') this.invoice,
      @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
      this.invoiceDate,
      @JsonKey(name: 'tax_invoice_no') this.taxInvoiceNo,
      @JsonKey(name: 'supplier') this.supplier})
      : super._();

  factory _$JournalTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalTransactionImplFromJson(json);

  @override
  @JsonKey(name: 'date')
  final DateTime date;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'chart_of_account_id')
  final String chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  final String chartOfAccountName;
  @override
  @JsonKey(name: 'debet')
  final double debet;
  @override
  @JsonKey(name: 'credit')
  final double credit;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'department_name')
  final String departmentName;
  @override
  @JsonKey(name: 'lpb')
  final String lpb;
  @override
  @JsonKey(name: 'period')
  final String period;
  @override
  @JsonKey(name: 'division')
  final String? division;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'invoice')
  final String? invoice;
  @override
  @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
  final DateTime? invoiceDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  final String? taxInvoiceNo;
  @override
  @JsonKey(name: 'supplier')
  final String? supplier;

  @override
  String toString() {
    return 'JournalTransaction(date: $date, transactionNo: $transactionNo, chartOfAccountId: $chartOfAccountId, chartOfAccountName: $chartOfAccountName, debet: $debet, credit: $credit, description: $description, departmentName: $departmentName, lpb: $lpb, period: $period, division: $division, name: $name, invoice: $invoice, invoiceDate: $invoiceDate, taxInvoiceNo: $taxInvoiceNo, supplier: $supplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalTransactionImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.chartOfAccountId, chartOfAccountId) ||
                other.chartOfAccountId == chartOfAccountId) &&
            (identical(other.chartOfAccountName, chartOfAccountName) ||
                other.chartOfAccountName == chartOfAccountName) &&
            (identical(other.debet, debet) || other.debet == debet) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.lpb, lpb) || other.lpb == lpb) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.division, division) ||
                other.division == division) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      transactionNo,
      chartOfAccountId,
      chartOfAccountName,
      debet,
      credit,
      description,
      departmentName,
      lpb,
      period,
      division,
      name,
      invoice,
      invoiceDate,
      taxInvoiceNo,
      supplier);

  /// Create a copy of JournalTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalTransactionImplCopyWith<_$JournalTransactionImpl> get copyWith =>
      __$$JournalTransactionImplCopyWithImpl<_$JournalTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalTransactionImplToJson(
      this,
    );
  }
}

abstract class _JournalTransaction extends JournalTransaction {
  const factory _JournalTransaction(
      {@JsonKey(name: 'date') required final DateTime date,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'chart_of_account_id')
      required final String chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name')
      required final String chartOfAccountName,
      @JsonKey(name: 'debet') required final double debet,
      @JsonKey(name: 'credit') required final double credit,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'department_name') required final String departmentName,
      @JsonKey(name: 'lpb') required final String lpb,
      @JsonKey(name: 'period') required final String period,
      @JsonKey(name: 'division') final String? division,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'invoice') final String? invoice,
      @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
      final DateTime? invoiceDate,
      @JsonKey(name: 'tax_invoice_no') final String? taxInvoiceNo,
      @JsonKey(name: 'supplier')
      final String? supplier}) = _$JournalTransactionImpl;
  const _JournalTransaction._() : super._();

  factory _JournalTransaction.fromJson(Map<String, dynamic> json) =
      _$JournalTransactionImpl.fromJson;

  @override
  @JsonKey(name: 'date')
  DateTime get date;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  String get chartOfAccountName;
  @override
  @JsonKey(name: 'debet')
  double get debet;
  @override
  @JsonKey(name: 'credit')
  double get credit;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'department_name')
  String get departmentName;
  @override
  @JsonKey(name: 'lpb')
  String get lpb;
  @override
  @JsonKey(name: 'period')
  String get period;
  @override
  @JsonKey(name: 'division')
  String? get division;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'invoice')
  String? get invoice;
  @override
  @JsonKey(name: 'invoice_date', fromJson: dateTimeNullable)
  DateTime? get invoiceDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  String? get taxInvoiceNo;
  @override
  @JsonKey(name: 'supplier')
  String? get supplier;

  /// Create a copy of JournalTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalTransactionImplCopyWith<_$JournalTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
