// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_recap_by_sales_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceRecapBySalesGlobal _$InvoiceRecapBySalesGlobalFromJson(
    Map<String, dynamic> json) {
  return _InvoiceRecapBySalesGlobal.fromJson(json);
}

/// @nodoc
mixin _$InvoiceRecapBySalesGlobal {
  @JsonKey(name: 'transaction_name')
  String get transactionName => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'customer_delivery_address', defaultValue: '', includeIfNull: true)
  String get customerDeliveryAddress => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'subtotal_transaction_type')
  double get subtotalTransactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value_transaction_type')
  double get discountValueTransactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_value_transaction_type')
  double get additionalDiscountValueTransactionType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value_transaction_type')
  double get ppnValueTransactionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_transaction_type')
  double get totalTransactionType => throw _privateConstructorUsedError;
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

  /// Serializes this InvoiceRecapBySalesGlobal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceRecapBySalesGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceRecapBySalesGlobalCopyWith<InvoiceRecapBySalesGlobal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceRecapBySalesGlobalCopyWith<$Res> {
  factory $InvoiceRecapBySalesGlobalCopyWith(InvoiceRecapBySalesGlobal value,
          $Res Function(InvoiceRecapBySalesGlobal) then) =
      _$InvoiceRecapBySalesGlobalCopyWithImpl<$Res, InvoiceRecapBySalesGlobal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_name') String transactionName,
      @JsonKey(
          name: 'customer_delivery_address',
          defaultValue: '',
          includeIfNull: true)
      String customerDeliveryAddress,
      @JsonKey(name: 'subtotal') double subtotal,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'additional_discount_value')
      double additionalDiscountValue,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'subtotal_transaction_type')
      double subtotalTransactionType,
      @JsonKey(name: 'discount_value_transaction_type')
      double discountValueTransactionType,
      @JsonKey(name: 'additional_discount_value_transaction_type')
      double additionalDiscountValueTransactionType,
      @JsonKey(name: 'ppn_value_transaction_type')
      double ppnValueTransactionType,
      @JsonKey(name: 'total_transaction_type') double totalTransactionType,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary,
      @JsonKey(name: 'discount_value_summary') double discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      double additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') double ppnValueSummary,
      @JsonKey(name: 'total_summary') double totalSummary});
}

/// @nodoc
class _$InvoiceRecapBySalesGlobalCopyWithImpl<$Res,
        $Val extends InvoiceRecapBySalesGlobal>
    implements $InvoiceRecapBySalesGlobalCopyWith<$Res> {
  _$InvoiceRecapBySalesGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceRecapBySalesGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionName = null,
    Object? customerDeliveryAddress = null,
    Object? subtotal = null,
    Object? discountValue = null,
    Object? additionalDiscountValue = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? subtotalTransactionType = null,
    Object? discountValueTransactionType = null,
    Object? additionalDiscountValueTransactionType = null,
    Object? ppnValueTransactionType = null,
    Object? totalTransactionType = null,
    Object? subtotalSummary = null,
    Object? discountValueSummary = null,
    Object? additionalDiscountValueSummary = null,
    Object? ppnValueSummary = null,
    Object? totalSummary = null,
  }) {
    return _then(_value.copyWith(
      transactionName: null == transactionName
          ? _value.transactionName
          : transactionName // ignore: cast_nullable_to_non_nullable
              as String,
      customerDeliveryAddress: null == customerDeliveryAddress
          ? _value.customerDeliveryAddress
          : customerDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
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
      subtotalTransactionType: null == subtotalTransactionType
          ? _value.subtotalTransactionType
          : subtotalTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      discountValueTransactionType: null == discountValueTransactionType
          ? _value.discountValueTransactionType
          : discountValueTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValueTransactionType: null ==
              additionalDiscountValueTransactionType
          ? _value.additionalDiscountValueTransactionType
          : additionalDiscountValueTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValueTransactionType: null == ppnValueTransactionType
          ? _value.ppnValueTransactionType
          : ppnValueTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransactionType: null == totalTransactionType
          ? _value.totalTransactionType
          : totalTransactionType // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceRecapBySalesGlobalImplCopyWith<$Res>
    implements $InvoiceRecapBySalesGlobalCopyWith<$Res> {
  factory _$$InvoiceRecapBySalesGlobalImplCopyWith(
          _$InvoiceRecapBySalesGlobalImpl value,
          $Res Function(_$InvoiceRecapBySalesGlobalImpl) then) =
      __$$InvoiceRecapBySalesGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_name') String transactionName,
      @JsonKey(
          name: 'customer_delivery_address',
          defaultValue: '',
          includeIfNull: true)
      String customerDeliveryAddress,
      @JsonKey(name: 'subtotal') double subtotal,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'additional_discount_value')
      double additionalDiscountValue,
      @JsonKey(name: 'ppn_value') double ppnValue,
      @JsonKey(name: 'total') double total,
      @JsonKey(name: 'subtotal_transaction_type')
      double subtotalTransactionType,
      @JsonKey(name: 'discount_value_transaction_type')
      double discountValueTransactionType,
      @JsonKey(name: 'additional_discount_value_transaction_type')
      double additionalDiscountValueTransactionType,
      @JsonKey(name: 'ppn_value_transaction_type')
      double ppnValueTransactionType,
      @JsonKey(name: 'total_transaction_type') double totalTransactionType,
      @JsonKey(name: 'subtotal_summary') double subtotalSummary,
      @JsonKey(name: 'discount_value_summary') double discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      double additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') double ppnValueSummary,
      @JsonKey(name: 'total_summary') double totalSummary});
}

/// @nodoc
class __$$InvoiceRecapBySalesGlobalImplCopyWithImpl<$Res>
    extends _$InvoiceRecapBySalesGlobalCopyWithImpl<$Res,
        _$InvoiceRecapBySalesGlobalImpl>
    implements _$$InvoiceRecapBySalesGlobalImplCopyWith<$Res> {
  __$$InvoiceRecapBySalesGlobalImplCopyWithImpl(
      _$InvoiceRecapBySalesGlobalImpl _value,
      $Res Function(_$InvoiceRecapBySalesGlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionName = null,
    Object? customerDeliveryAddress = null,
    Object? subtotal = null,
    Object? discountValue = null,
    Object? additionalDiscountValue = null,
    Object? ppnValue = null,
    Object? total = null,
    Object? subtotalTransactionType = null,
    Object? discountValueTransactionType = null,
    Object? additionalDiscountValueTransactionType = null,
    Object? ppnValueTransactionType = null,
    Object? totalTransactionType = null,
    Object? subtotalSummary = null,
    Object? discountValueSummary = null,
    Object? additionalDiscountValueSummary = null,
    Object? ppnValueSummary = null,
    Object? totalSummary = null,
  }) {
    return _then(_$InvoiceRecapBySalesGlobalImpl(
      transactionName: null == transactionName
          ? _value.transactionName
          : transactionName // ignore: cast_nullable_to_non_nullable
              as String,
      customerDeliveryAddress: null == customerDeliveryAddress
          ? _value.customerDeliveryAddress
          : customerDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
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
      subtotalTransactionType: null == subtotalTransactionType
          ? _value.subtotalTransactionType
          : subtotalTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      discountValueTransactionType: null == discountValueTransactionType
          ? _value.discountValueTransactionType
          : discountValueTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      additionalDiscountValueTransactionType: null ==
              additionalDiscountValueTransactionType
          ? _value.additionalDiscountValueTransactionType
          : additionalDiscountValueTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValueTransactionType: null == ppnValueTransactionType
          ? _value.ppnValueTransactionType
          : ppnValueTransactionType // ignore: cast_nullable_to_non_nullable
              as double,
      totalTransactionType: null == totalTransactionType
          ? _value.totalTransactionType
          : totalTransactionType // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceRecapBySalesGlobalImpl extends _InvoiceRecapBySalesGlobal {
  const _$InvoiceRecapBySalesGlobalImpl(
      {@JsonKey(name: 'transaction_name') required this.transactionName,
      @JsonKey(
          name: 'customer_delivery_address',
          defaultValue: '',
          includeIfNull: true)
      required this.customerDeliveryAddress,
      @JsonKey(name: 'subtotal') required this.subtotal,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'additional_discount_value')
      required this.additionalDiscountValue,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'total') required this.total,
      @JsonKey(name: 'subtotal_transaction_type')
      required this.subtotalTransactionType,
      @JsonKey(name: 'discount_value_transaction_type')
      required this.discountValueTransactionType,
      @JsonKey(name: 'additional_discount_value_transaction_type')
      required this.additionalDiscountValueTransactionType,
      @JsonKey(name: 'ppn_value_transaction_type')
      required this.ppnValueTransactionType,
      @JsonKey(name: 'total_transaction_type')
      required this.totalTransactionType,
      @JsonKey(name: 'subtotal_summary') required this.subtotalSummary,
      @JsonKey(name: 'discount_value_summary')
      required this.discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      required this.additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') required this.ppnValueSummary,
      @JsonKey(name: 'total_summary') required this.totalSummary})
      : super._();

  factory _$InvoiceRecapBySalesGlobalImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceRecapBySalesGlobalImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_name')
  final String transactionName;
  @override
  @JsonKey(
      name: 'customer_delivery_address', defaultValue: '', includeIfNull: true)
  final String customerDeliveryAddress;
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
  @JsonKey(name: 'subtotal_transaction_type')
  final double subtotalTransactionType;
  @override
  @JsonKey(name: 'discount_value_transaction_type')
  final double discountValueTransactionType;
  @override
  @JsonKey(name: 'additional_discount_value_transaction_type')
  final double additionalDiscountValueTransactionType;
  @override
  @JsonKey(name: 'ppn_value_transaction_type')
  final double ppnValueTransactionType;
  @override
  @JsonKey(name: 'total_transaction_type')
  final double totalTransactionType;
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
  String toString() {
    return 'InvoiceRecapBySalesGlobal(transactionName: $transactionName, customerDeliveryAddress: $customerDeliveryAddress, subtotal: $subtotal, discountValue: $discountValue, additionalDiscountValue: $additionalDiscountValue, ppnValue: $ppnValue, total: $total, subtotalTransactionType: $subtotalTransactionType, discountValueTransactionType: $discountValueTransactionType, additionalDiscountValueTransactionType: $additionalDiscountValueTransactionType, ppnValueTransactionType: $ppnValueTransactionType, totalTransactionType: $totalTransactionType, subtotalSummary: $subtotalSummary, discountValueSummary: $discountValueSummary, additionalDiscountValueSummary: $additionalDiscountValueSummary, ppnValueSummary: $ppnValueSummary, totalSummary: $totalSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceRecapBySalesGlobalImpl &&
            (identical(other.transactionName, transactionName) ||
                other.transactionName == transactionName) &&
            (identical(other.customerDeliveryAddress, customerDeliveryAddress) ||
                other.customerDeliveryAddress == customerDeliveryAddress) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.additionalDiscountValue, additionalDiscountValue) ||
                other.additionalDiscountValue == additionalDiscountValue) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subtotalTransactionType, subtotalTransactionType) ||
                other.subtotalTransactionType == subtotalTransactionType) &&
            (identical(other.discountValueTransactionType, discountValueTransactionType) ||
                other.discountValueTransactionType ==
                    discountValueTransactionType) &&
            (identical(other.additionalDiscountValueTransactionType,
                    additionalDiscountValueTransactionType) ||
                other.additionalDiscountValueTransactionType ==
                    additionalDiscountValueTransactionType) &&
            (identical(other.ppnValueTransactionType, ppnValueTransactionType) ||
                other.ppnValueTransactionType == ppnValueTransactionType) &&
            (identical(other.totalTransactionType, totalTransactionType) ||
                other.totalTransactionType == totalTransactionType) &&
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
                other.totalSummary == totalSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionName,
      customerDeliveryAddress,
      subtotal,
      discountValue,
      additionalDiscountValue,
      ppnValue,
      total,
      subtotalTransactionType,
      discountValueTransactionType,
      additionalDiscountValueTransactionType,
      ppnValueTransactionType,
      totalTransactionType,
      subtotalSummary,
      discountValueSummary,
      additionalDiscountValueSummary,
      ppnValueSummary,
      totalSummary);

  /// Create a copy of InvoiceRecapBySalesGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceRecapBySalesGlobalImplCopyWith<_$InvoiceRecapBySalesGlobalImpl>
      get copyWith => __$$InvoiceRecapBySalesGlobalImplCopyWithImpl<
          _$InvoiceRecapBySalesGlobalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceRecapBySalesGlobalImplToJson(
      this,
    );
  }
}

abstract class _InvoiceRecapBySalesGlobal extends InvoiceRecapBySalesGlobal {
  const factory _InvoiceRecapBySalesGlobal(
      {@JsonKey(name: 'transaction_name') required final String transactionName,
      @JsonKey(
          name: 'customer_delivery_address',
          defaultValue: '',
          includeIfNull: true)
      required final String customerDeliveryAddress,
      @JsonKey(name: 'subtotal') required final double subtotal,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'additional_discount_value')
      required final double additionalDiscountValue,
      @JsonKey(name: 'ppn_value') required final double ppnValue,
      @JsonKey(name: 'total') required final double total,
      @JsonKey(name: 'subtotal_transaction_type')
      required final double subtotalTransactionType,
      @JsonKey(name: 'discount_value_transaction_type')
      required final double discountValueTransactionType,
      @JsonKey(name: 'additional_discount_value_transaction_type')
      required final double additionalDiscountValueTransactionType,
      @JsonKey(name: 'ppn_value_transaction_type')
      required final double ppnValueTransactionType,
      @JsonKey(name: 'total_transaction_type')
      required final double totalTransactionType,
      @JsonKey(name: 'subtotal_summary') required final double subtotalSummary,
      @JsonKey(name: 'discount_value_summary')
      required final double discountValueSummary,
      @JsonKey(name: 'additional_discount_value_summary')
      required final double additionalDiscountValueSummary,
      @JsonKey(name: 'ppn_value_summary') required final double ppnValueSummary,
      @JsonKey(name: 'total_summary')
      required final double totalSummary}) = _$InvoiceRecapBySalesGlobalImpl;
  const _InvoiceRecapBySalesGlobal._() : super._();

  factory _InvoiceRecapBySalesGlobal.fromJson(Map<String, dynamic> json) =
      _$InvoiceRecapBySalesGlobalImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_name')
  String get transactionName;
  @override
  @JsonKey(
      name: 'customer_delivery_address', defaultValue: '', includeIfNull: true)
  String get customerDeliveryAddress;
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
  @JsonKey(name: 'subtotal_transaction_type')
  double get subtotalTransactionType;
  @override
  @JsonKey(name: 'discount_value_transaction_type')
  double get discountValueTransactionType;
  @override
  @JsonKey(name: 'additional_discount_value_transaction_type')
  double get additionalDiscountValueTransactionType;
  @override
  @JsonKey(name: 'ppn_value_transaction_type')
  double get ppnValueTransactionType;
  @override
  @JsonKey(name: 'total_transaction_type')
  double get totalTransactionType;
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

  /// Create a copy of InvoiceRecapBySalesGlobal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceRecapBySalesGlobalImplCopyWith<_$InvoiceRecapBySalesGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
