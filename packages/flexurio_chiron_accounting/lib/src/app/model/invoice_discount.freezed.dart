// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceDiscount _$InvoiceDiscountFromJson(Map<String, dynamic> json) {
  return _InvoiceDiscount.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDiscount {
  @JsonKey(name: 'transaction_id')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date')
  String? get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_number')
  String? get taxInvoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double? get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  double? get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value')
  double? get additionalDiscountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_summary')
  double? get subtotalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value_summary')
  double? get discountValueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value_summary')
  double? get ppnValueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_summary')
  double? get totalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value_summary')
  double? get additionalDiscountValueSummary =>
      throw _privateConstructorUsedError;

  /// Serializes this InvoiceDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceDiscountCopyWith<InvoiceDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDiscountCopyWith<$Res> {
  factory $InvoiceDiscountCopyWith(
          InvoiceDiscount value, $Res Function(InvoiceDiscount) then) =
      _$InvoiceDiscountCopyWithImpl<$Res, InvoiceDiscount>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'transaction_date') String? transactionDate,
      @JsonKey(name: 'tax_invoice_number') String? taxInvoiceNumber,
      @JsonKey(name: 'subtotal') double? subtotal,
      @JsonKey(name: 'discount_value') double? discountValue,
      @JsonKey(name: 'ppn_value') double? ppnValue,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'additional_discount_value')
      double? additionalDiscountValue,
      @JsonKey(name: 'subtotal_summary') double? subtotalSummary,
      @JsonKey(name: 'discount_value_summary') double? discountValueSummary,
      @JsonKey(name: 'ppn_value_summary') double? ppnValueSummary,
      @JsonKey(name: 'total_summary') double? totalSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      double? additionalDiscountValueSummary});
}

/// @nodoc
class _$InvoiceDiscountCopyWithImpl<$Res, $Val extends InvoiceDiscount>
    implements $InvoiceDiscountCopyWith<$Res> {
  _$InvoiceDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? transactionDate = freezed,
    Object? taxInvoiceNumber = freezed,
    Object? subtotal = freezed,
    Object? discountValue = freezed,
    Object? ppnValue = freezed,
    Object? total = freezed,
    Object? additionalDiscountValue = freezed,
    Object? subtotalSummary = freezed,
    Object? discountValueSummary = freezed,
    Object? ppnValueSummary = freezed,
    Object? totalSummary = freezed,
    Object? additionalDiscountValueSummary = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taxInvoiceNumber: freezed == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      ppnValue: freezed == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalDiscountValue: freezed == additionalDiscountValue
          ? _value.additionalDiscountValue
          : additionalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotalSummary: freezed == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValueSummary: freezed == discountValueSummary
          ? _value.discountValueSummary
          : discountValueSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      ppnValueSummary: freezed == ppnValueSummary
          ? _value.ppnValueSummary
          : ppnValueSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSummary: freezed == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalDiscountValueSummary: freezed == additionalDiscountValueSummary
          ? _value.additionalDiscountValueSummary
          : additionalDiscountValueSummary // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceDiscountImplCopyWith<$Res>
    implements $InvoiceDiscountCopyWith<$Res> {
  factory _$$InvoiceDiscountImplCopyWith(_$InvoiceDiscountImpl value,
          $Res Function(_$InvoiceDiscountImpl) then) =
      __$$InvoiceDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String? transactionId,
      @JsonKey(name: 'transaction_date') String? transactionDate,
      @JsonKey(name: 'tax_invoice_number') String? taxInvoiceNumber,
      @JsonKey(name: 'subtotal') double? subtotal,
      @JsonKey(name: 'discount_value') double? discountValue,
      @JsonKey(name: 'ppn_value') double? ppnValue,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'additional_discount_value')
      double? additionalDiscountValue,
      @JsonKey(name: 'subtotal_summary') double? subtotalSummary,
      @JsonKey(name: 'discount_value_summary') double? discountValueSummary,
      @JsonKey(name: 'ppn_value_summary') double? ppnValueSummary,
      @JsonKey(name: 'total_summary') double? totalSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      double? additionalDiscountValueSummary});
}

/// @nodoc
class __$$InvoiceDiscountImplCopyWithImpl<$Res>
    extends _$InvoiceDiscountCopyWithImpl<$Res, _$InvoiceDiscountImpl>
    implements _$$InvoiceDiscountImplCopyWith<$Res> {
  __$$InvoiceDiscountImplCopyWithImpl(
      _$InvoiceDiscountImpl _value, $Res Function(_$InvoiceDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? transactionDate = freezed,
    Object? taxInvoiceNumber = freezed,
    Object? subtotal = freezed,
    Object? discountValue = freezed,
    Object? ppnValue = freezed,
    Object? total = freezed,
    Object? additionalDiscountValue = freezed,
    Object? subtotalSummary = freezed,
    Object? discountValueSummary = freezed,
    Object? ppnValueSummary = freezed,
    Object? totalSummary = freezed,
    Object? additionalDiscountValueSummary = freezed,
  }) {
    return _then(_$InvoiceDiscountImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taxInvoiceNumber: freezed == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      ppnValue: freezed == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalDiscountValue: freezed == additionalDiscountValue
          ? _value.additionalDiscountValue
          : additionalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotalSummary: freezed == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValueSummary: freezed == discountValueSummary
          ? _value.discountValueSummary
          : discountValueSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      ppnValueSummary: freezed == ppnValueSummary
          ? _value.ppnValueSummary
          : ppnValueSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      totalSummary: freezed == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double?,
      additionalDiscountValueSummary: freezed == additionalDiscountValueSummary
          ? _value.additionalDiscountValueSummary
          : additionalDiscountValueSummary // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDiscountImpl extends _InvoiceDiscount {
  const _$InvoiceDiscountImpl(
      {@JsonKey(name: 'transaction_id') this.transactionId,
      @JsonKey(name: 'transaction_date') this.transactionDate,
      @JsonKey(name: 'tax_invoice_number') this.taxInvoiceNumber,
      @JsonKey(name: 'subtotal') this.subtotal,
      @JsonKey(name: 'discount_value') this.discountValue,
      @JsonKey(name: 'ppn_value') this.ppnValue,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'additional_discount_value') this.additionalDiscountValue,
      @JsonKey(name: 'subtotal_summary') this.subtotalSummary,
      @JsonKey(name: 'discount_value_summary') this.discountValueSummary,
      @JsonKey(name: 'ppn_value_summary') this.ppnValueSummary,
      @JsonKey(name: 'total_summary') this.totalSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      this.additionalDiscountValueSummary})
      : super._();

  factory _$InvoiceDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDiscountImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @override
  @JsonKey(name: 'transaction_date')
  final String? transactionDate;
  @override
  @JsonKey(name: 'tax_invoice_number')
  final String? taxInvoiceNumber;
  @override
  @JsonKey(name: 'subtotal')
  final double? subtotal;
  @override
  @JsonKey(name: 'discount_value')
  final double? discountValue;
  @override
  @JsonKey(name: 'ppn_value')
  final double? ppnValue;
  @override
  @JsonKey(name: 'total')
  final double? total;
  @override
  @JsonKey(name: 'additional_discount_value')
  final double? additionalDiscountValue;
  @override
  @JsonKey(name: 'subtotal_summary')
  final double? subtotalSummary;
  @override
  @JsonKey(name: 'discount_value_summary')
  final double? discountValueSummary;
  @override
  @JsonKey(name: 'ppn_value_summary')
  final double? ppnValueSummary;
  @override
  @JsonKey(name: 'total_summary')
  final double? totalSummary;
  @override
  @JsonKey(name: 'additional_discount_value_summary')
  final double? additionalDiscountValueSummary;

  @override
  String toString() {
    return 'InvoiceDiscount(transactionId: $transactionId, transactionDate: $transactionDate, taxInvoiceNumber: $taxInvoiceNumber, subtotal: $subtotal, discountValue: $discountValue, ppnValue: $ppnValue, total: $total, additionalDiscountValue: $additionalDiscountValue, subtotalSummary: $subtotalSummary, discountValueSummary: $discountValueSummary, ppnValueSummary: $ppnValueSummary, totalSummary: $totalSummary, additionalDiscountValueSummary: $additionalDiscountValueSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDiscountImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.taxInvoiceNumber, taxInvoiceNumber) ||
                other.taxInvoiceNumber == taxInvoiceNumber) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(
                    other.additionalDiscountValue, additionalDiscountValue) ||
                other.additionalDiscountValue == additionalDiscountValue) &&
            (identical(other.subtotalSummary, subtotalSummary) ||
                other.subtotalSummary == subtotalSummary) &&
            (identical(other.discountValueSummary, discountValueSummary) ||
                other.discountValueSummary == discountValueSummary) &&
            (identical(other.ppnValueSummary, ppnValueSummary) ||
                other.ppnValueSummary == ppnValueSummary) &&
            (identical(other.totalSummary, totalSummary) ||
                other.totalSummary == totalSummary) &&
            (identical(other.additionalDiscountValueSummary,
                    additionalDiscountValueSummary) ||
                other.additionalDiscountValueSummary ==
                    additionalDiscountValueSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      transactionDate,
      taxInvoiceNumber,
      subtotal,
      discountValue,
      ppnValue,
      total,
      additionalDiscountValue,
      subtotalSummary,
      discountValueSummary,
      ppnValueSummary,
      totalSummary,
      additionalDiscountValueSummary);

  /// Create a copy of InvoiceDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDiscountImplCopyWith<_$InvoiceDiscountImpl> get copyWith =>
      __$$InvoiceDiscountImplCopyWithImpl<_$InvoiceDiscountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDiscountImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDiscount extends InvoiceDiscount {
  const factory _InvoiceDiscount(
      {@JsonKey(name: 'transaction_id') final String? transactionId,
      @JsonKey(name: 'transaction_date') final String? transactionDate,
      @JsonKey(name: 'tax_invoice_number') final String? taxInvoiceNumber,
      @JsonKey(name: 'subtotal') final double? subtotal,
      @JsonKey(name: 'discount_value') final double? discountValue,
      @JsonKey(name: 'ppn_value') final double? ppnValue,
      @JsonKey(name: 'total') final double? total,
      @JsonKey(name: 'additional_discount_value')
      final double? additionalDiscountValue,
      @JsonKey(name: 'subtotal_summary') final double? subtotalSummary,
      @JsonKey(name: 'discount_value_summary')
      final double? discountValueSummary,
      @JsonKey(name: 'ppn_value_summary') final double? ppnValueSummary,
      @JsonKey(name: 'total_summary') final double? totalSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      final double? additionalDiscountValueSummary}) = _$InvoiceDiscountImpl;
  const _InvoiceDiscount._() : super._();

  factory _InvoiceDiscount.fromJson(Map<String, dynamic> json) =
      _$InvoiceDiscountImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String? get transactionId;
  @override
  @JsonKey(name: 'transaction_date')
  String? get transactionDate;
  @override
  @JsonKey(name: 'tax_invoice_number')
  String? get taxInvoiceNumber;
  @override
  @JsonKey(name: 'subtotal')
  double? get subtotal;
  @override
  @JsonKey(name: 'discount_value')
  double? get discountValue;
  @override
  @JsonKey(name: 'ppn_value')
  double? get ppnValue;
  @override
  @JsonKey(name: 'total')
  double? get total;
  @override
  @JsonKey(name: 'additional_discount_value')
  double? get additionalDiscountValue;
  @override
  @JsonKey(name: 'subtotal_summary')
  double? get subtotalSummary;
  @override
  @JsonKey(name: 'discount_value_summary')
  double? get discountValueSummary;
  @override
  @JsonKey(name: 'ppn_value_summary')
  double? get ppnValueSummary;
  @override
  @JsonKey(name: 'total_summary')
  double? get totalSummary;
  @override
  @JsonKey(name: 'additional_discount_value_summary')
  double? get additionalDiscountValueSummary;

  /// Create a copy of InvoiceDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceDiscountImplCopyWith<_$InvoiceDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
