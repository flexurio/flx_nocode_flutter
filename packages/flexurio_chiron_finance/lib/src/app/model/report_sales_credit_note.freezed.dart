// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_sales_credit_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportSalesCreditNote _$ReportSalesCreditNoteFromJson(
    Map<String, dynamic> json) {
  return _ReportSalesCreditNote.fromJson(json);
}

/// @nodoc
mixin _$ReportSalesCreditNote {
  @JsonKey(name: 'customer')
  String get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  int get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  int get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  int get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;

  /// Serializes this ReportSalesCreditNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportSalesCreditNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportSalesCreditNoteCopyWith<ReportSalesCreditNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportSalesCreditNoteCopyWith<$Res> {
  factory $ReportSalesCreditNoteCopyWith(ReportSalesCreditNote value,
          $Res Function(ReportSalesCreditNote) then) =
      _$ReportSalesCreditNoteCopyWithImpl<$Res, ReportSalesCreditNote>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'subtotal') int subTotal,
      @JsonKey(name: 'discount_value') int discountValue,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class _$ReportSalesCreditNoteCopyWithImpl<$Res,
        $Val extends ReportSalesCreditNote>
    implements $ReportSalesCreditNoteCopyWith<$Res> {
  _$ReportSalesCreditNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportSalesCreditNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? transactionNo = null,
    Object? date = null,
    Object? purchaseOrderId = null,
    Object? subTotal = null,
    Object? discountValue = null,
    Object? ppnValue = null,
    Object? total = null,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportSalesCreditNoteImplCopyWith<$Res>
    implements $ReportSalesCreditNoteCopyWith<$Res> {
  factory _$$ReportSalesCreditNoteImplCopyWith(
          _$ReportSalesCreditNoteImpl value,
          $Res Function(_$ReportSalesCreditNoteImpl) then) =
      __$$ReportSalesCreditNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer') String customer,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'subtotal') int subTotal,
      @JsonKey(name: 'discount_value') int discountValue,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class __$$ReportSalesCreditNoteImplCopyWithImpl<$Res>
    extends _$ReportSalesCreditNoteCopyWithImpl<$Res,
        _$ReportSalesCreditNoteImpl>
    implements _$$ReportSalesCreditNoteImplCopyWith<$Res> {
  __$$ReportSalesCreditNoteImplCopyWithImpl(_$ReportSalesCreditNoteImpl _value,
      $Res Function(_$ReportSalesCreditNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportSalesCreditNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? transactionNo = null,
    Object? date = null,
    Object? purchaseOrderId = null,
    Object? subTotal = null,
    Object? discountValue = null,
    Object? ppnValue = null,
    Object? total = null,
  }) {
    return _then(_$ReportSalesCreditNoteImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportSalesCreditNoteImpl extends _ReportSalesCreditNote {
  const _$ReportSalesCreditNoteImpl(
      {@JsonKey(name: 'customer') required this.customer,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) required this.date,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      @JsonKey(name: 'subtotal') required this.subTotal,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'total') required this.total})
      : super._();

  factory _$ReportSalesCreditNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportSalesCreditNoteImplFromJson(json);

  @override
  @JsonKey(name: 'customer')
  final String customer;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'subtotal')
  final int subTotal;
  @override
  @JsonKey(name: 'discount_value')
  final int discountValue;
  @override
  @JsonKey(name: 'ppn_value')
  final int ppnValue;
  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  String toString() {
    return 'ReportSalesCreditNote(customer: $customer, transactionNo: $transactionNo, date: $date, purchaseOrderId: $purchaseOrderId, subTotal: $subTotal, discountValue: $discountValue, ppnValue: $ppnValue, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportSalesCreditNoteImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, customer, transactionNo, date,
      purchaseOrderId, subTotal, discountValue, ppnValue, total);

  /// Create a copy of ReportSalesCreditNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportSalesCreditNoteImplCopyWith<_$ReportSalesCreditNoteImpl>
      get copyWith => __$$ReportSalesCreditNoteImplCopyWithImpl<
          _$ReportSalesCreditNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportSalesCreditNoteImplToJson(
      this,
    );
  }
}

abstract class _ReportSalesCreditNote extends ReportSalesCreditNote {
  const factory _ReportSalesCreditNote(
      {@JsonKey(name: 'customer') required final String customer,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime)
      required final DateTime date,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      @JsonKey(name: 'subtotal') required final int subTotal,
      @JsonKey(name: 'discount_value') required final int discountValue,
      @JsonKey(name: 'ppn_value') required final int ppnValue,
      @JsonKey(name: 'total')
      required final int total}) = _$ReportSalesCreditNoteImpl;
  const _ReportSalesCreditNote._() : super._();

  factory _ReportSalesCreditNote.fromJson(Map<String, dynamic> json) =
      _$ReportSalesCreditNoteImpl.fromJson;

  @override
  @JsonKey(name: 'customer')
  String get customer;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'subtotal')
  int get subTotal;
  @override
  @JsonKey(name: 'discount_value')
  int get discountValue;
  @override
  @JsonKey(name: 'ppn_value')
  int get ppnValue;
  @override
  @JsonKey(name: 'total')
  int get total;

  /// Create a copy of ReportSalesCreditNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportSalesCreditNoteImplCopyWith<_$ReportSalesCreditNoteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
