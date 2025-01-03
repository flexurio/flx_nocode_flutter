// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_detail_receivable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentDetailReceivable _$PaymentDetailReceivableFromJson(
    Map<String, dynamic> json) {
  return _PaymentDetailReceivable.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetailReceivable {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_id')
  String get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_id')
  String? get chartOfAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_name')
  String? get chartOfAccountName => throw _privateConstructorUsedError;
  bool get tb => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address_id')
  String get deliveryAddressId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address_name')
  String get deliveryAddressName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address_city')
  String get deliveryAddressCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_total')
  double get paymentTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_remark')
  String get paymentRemark => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_chart_of_account_repayment')
  String get paymentChartOfAccountRepayment =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentDetailReceivable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDetailReceivable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDetailReceivableCopyWith<PaymentDetailReceivable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailReceivableCopyWith<$Res> {
  factory $PaymentDetailReceivableCopyWith(PaymentDetailReceivable value,
          $Res Function(PaymentDetailReceivable) then) =
      _$PaymentDetailReceivableCopyWithImpl<$Res, PaymentDetailReceivable>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      int id,
      @JsonKey(name: 'payment_id') String paymentId,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'invoice_no') String? invoiceNo,
      @JsonKey(name: 'chart_of_account_id') String? chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String? chartOfAccountName,
      bool tb,
      String description,
      @JsonKey(name: 'delivery_address_id') String deliveryAddressId,
      @JsonKey(name: 'delivery_address_name') String deliveryAddressName,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      @JsonKey(name: 'delivery_address_city') String deliveryAddressCity,
      @JsonKey(name: 'value') double amount,
      @JsonKey(name: 'payment_total') double paymentTotal,
      @JsonKey(name: 'payment_remark') String paymentRemark,
      @JsonKey(name: 'payment_chart_of_account_repayment')
      String paymentChartOfAccountRepayment});
}

/// @nodoc
class _$PaymentDetailReceivableCopyWithImpl<$Res,
        $Val extends PaymentDetailReceivable>
    implements $PaymentDetailReceivableCopyWith<$Res> {
  _$PaymentDetailReceivableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDetailReceivable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? paymentId = null,
    Object? transactionId = null,
    Object? invoiceNo = freezed,
    Object? chartOfAccountId = freezed,
    Object? chartOfAccountName = freezed,
    Object? tb = null,
    Object? description = null,
    Object? deliveryAddressId = null,
    Object? deliveryAddressName = null,
    Object? deliveryAddress = null,
    Object? deliveryAddressCity = null,
    Object? amount = null,
    Object? paymentTotal = null,
    Object? paymentRemark = null,
    Object? paymentChartOfAccountRepayment = null,
  }) {
    return _then(_value.copyWith(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      chartOfAccountId: freezed == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      chartOfAccountName: freezed == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      tb: null == tb
          ? _value.tb
          : tb // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressId: null == deliveryAddressId
          ? _value.deliveryAddressId
          : deliveryAddressId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressName: null == deliveryAddressName
          ? _value.deliveryAddressName
          : deliveryAddressName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCity: null == deliveryAddressCity
          ? _value.deliveryAddressCity
          : deliveryAddressCity // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTotal: null == paymentTotal
          ? _value.paymentTotal
          : paymentTotal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentRemark: null == paymentRemark
          ? _value.paymentRemark
          : paymentRemark // ignore: cast_nullable_to_non_nullable
              as String,
      paymentChartOfAccountRepayment: null == paymentChartOfAccountRepayment
          ? _value.paymentChartOfAccountRepayment
          : paymentChartOfAccountRepayment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDetailReceivableImplCopyWith<$Res>
    implements $PaymentDetailReceivableCopyWith<$Res> {
  factory _$$PaymentDetailReceivableImplCopyWith(
          _$PaymentDetailReceivableImpl value,
          $Res Function(_$PaymentDetailReceivableImpl) then) =
      __$$PaymentDetailReceivableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      int id,
      @JsonKey(name: 'payment_id') String paymentId,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'invoice_no') String? invoiceNo,
      @JsonKey(name: 'chart_of_account_id') String? chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') String? chartOfAccountName,
      bool tb,
      String description,
      @JsonKey(name: 'delivery_address_id') String deliveryAddressId,
      @JsonKey(name: 'delivery_address_name') String deliveryAddressName,
      @JsonKey(name: 'delivery_address') String deliveryAddress,
      @JsonKey(name: 'delivery_address_city') String deliveryAddressCity,
      @JsonKey(name: 'value') double amount,
      @JsonKey(name: 'payment_total') double paymentTotal,
      @JsonKey(name: 'payment_remark') String paymentRemark,
      @JsonKey(name: 'payment_chart_of_account_repayment')
      String paymentChartOfAccountRepayment});
}

/// @nodoc
class __$$PaymentDetailReceivableImplCopyWithImpl<$Res>
    extends _$PaymentDetailReceivableCopyWithImpl<$Res,
        _$PaymentDetailReceivableImpl>
    implements _$$PaymentDetailReceivableImplCopyWith<$Res> {
  __$$PaymentDetailReceivableImplCopyWithImpl(
      _$PaymentDetailReceivableImpl _value,
      $Res Function(_$PaymentDetailReceivableImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDetailReceivable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? paymentId = null,
    Object? transactionId = null,
    Object? invoiceNo = freezed,
    Object? chartOfAccountId = freezed,
    Object? chartOfAccountName = freezed,
    Object? tb = null,
    Object? description = null,
    Object? deliveryAddressId = null,
    Object? deliveryAddressName = null,
    Object? deliveryAddress = null,
    Object? deliveryAddressCity = null,
    Object? amount = null,
    Object? paymentTotal = null,
    Object? paymentRemark = null,
    Object? paymentChartOfAccountRepayment = null,
  }) {
    return _then(_$PaymentDetailReceivableImpl(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      chartOfAccountId: freezed == chartOfAccountId
          ? _value.chartOfAccountId
          : chartOfAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      chartOfAccountName: freezed == chartOfAccountName
          ? _value.chartOfAccountName
          : chartOfAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      tb: null == tb
          ? _value.tb
          : tb // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressId: null == deliveryAddressId
          ? _value.deliveryAddressId
          : deliveryAddressId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressName: null == deliveryAddressName
          ? _value.deliveryAddressName
          : deliveryAddressName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddressCity: null == deliveryAddressCity
          ? _value.deliveryAddressCity
          : deliveryAddressCity // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTotal: null == paymentTotal
          ? _value.paymentTotal
          : paymentTotal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentRemark: null == paymentRemark
          ? _value.paymentRemark
          : paymentRemark // ignore: cast_nullable_to_non_nullable
              as String,
      paymentChartOfAccountRepayment: null == paymentChartOfAccountRepayment
          ? _value.paymentChartOfAccountRepayment
          : paymentChartOfAccountRepayment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDetailReceivableImpl extends _PaymentDetailReceivable {
  _$PaymentDetailReceivableImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      required this.id,
      @JsonKey(name: 'payment_id') required this.paymentId,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'invoice_no') required this.invoiceNo,
      @JsonKey(name: 'chart_of_account_id') required this.chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name') required this.chartOfAccountName,
      required this.tb,
      required this.description,
      @JsonKey(name: 'delivery_address_id') required this.deliveryAddressId,
      @JsonKey(name: 'delivery_address_name') required this.deliveryAddressName,
      @JsonKey(name: 'delivery_address') required this.deliveryAddress,
      @JsonKey(name: 'delivery_address_city') required this.deliveryAddressCity,
      @JsonKey(name: 'value') required this.amount,
      @JsonKey(name: 'payment_total') required this.paymentTotal,
      @JsonKey(name: 'payment_remark') required this.paymentRemark,
      @JsonKey(name: 'payment_chart_of_account_repayment')
      required this.paymentChartOfAccountRepayment})
      : super._();

  factory _$PaymentDetailReceivableImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDetailReceivableImplFromJson(json);

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
  final int id;
  @override
  @JsonKey(name: 'payment_id')
  final String paymentId;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'invoice_no')
  final String? invoiceNo;
  @override
  @JsonKey(name: 'chart_of_account_id')
  final String? chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  final String? chartOfAccountName;
  @override
  final bool tb;
  @override
  final String description;
  @override
  @JsonKey(name: 'delivery_address_id')
  final String deliveryAddressId;
  @override
  @JsonKey(name: 'delivery_address_name')
  final String deliveryAddressName;
  @override
  @JsonKey(name: 'delivery_address')
  final String deliveryAddress;
  @override
  @JsonKey(name: 'delivery_address_city')
  final String deliveryAddressCity;
  @override
  @JsonKey(name: 'value')
  final double amount;
  @override
  @JsonKey(name: 'payment_total')
  final double paymentTotal;
  @override
  @JsonKey(name: 'payment_remark')
  final String paymentRemark;
  @override
  @JsonKey(name: 'payment_chart_of_account_repayment')
  final String paymentChartOfAccountRepayment;

  @override
  String toString() {
    return 'PaymentDetailReceivable(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, paymentId: $paymentId, transactionId: $transactionId, invoiceNo: $invoiceNo, chartOfAccountId: $chartOfAccountId, chartOfAccountName: $chartOfAccountName, tb: $tb, description: $description, deliveryAddressId: $deliveryAddressId, deliveryAddressName: $deliveryAddressName, deliveryAddress: $deliveryAddress, deliveryAddressCity: $deliveryAddressCity, amount: $amount, paymentTotal: $paymentTotal, paymentRemark: $paymentRemark, paymentChartOfAccountRepayment: $paymentChartOfAccountRepayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDetailReceivableImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.chartOfAccountId, chartOfAccountId) ||
                other.chartOfAccountId == chartOfAccountId) &&
            (identical(other.chartOfAccountName, chartOfAccountName) ||
                other.chartOfAccountName == chartOfAccountName) &&
            (identical(other.tb, tb) || other.tb == tb) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deliveryAddressId, deliveryAddressId) ||
                other.deliveryAddressId == deliveryAddressId) &&
            (identical(other.deliveryAddressName, deliveryAddressName) ||
                other.deliveryAddressName == deliveryAddressName) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryAddressCity, deliveryAddressCity) ||
                other.deliveryAddressCity == deliveryAddressCity) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentTotal, paymentTotal) ||
                other.paymentTotal == paymentTotal) &&
            (identical(other.paymentRemark, paymentRemark) ||
                other.paymentRemark == paymentRemark) &&
            (identical(other.paymentChartOfAccountRepayment,
                    paymentChartOfAccountRepayment) ||
                other.paymentChartOfAccountRepayment ==
                    paymentChartOfAccountRepayment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        createdById,
        updatedAt,
        updateById,
        id,
        paymentId,
        transactionId,
        invoiceNo,
        chartOfAccountId,
        chartOfAccountName,
        tb,
        description,
        deliveryAddressId,
        deliveryAddressName,
        deliveryAddress,
        deliveryAddressCity,
        amount,
        paymentTotal,
        paymentRemark,
        paymentChartOfAccountRepayment
      ]);

  /// Create a copy of PaymentDetailReceivable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDetailReceivableImplCopyWith<_$PaymentDetailReceivableImpl>
      get copyWith => __$$PaymentDetailReceivableImplCopyWithImpl<
          _$PaymentDetailReceivableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDetailReceivableImplToJson(
      this,
    );
  }
}

abstract class _PaymentDetailReceivable extends PaymentDetailReceivable {
  factory _PaymentDetailReceivable(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      required final int id,
      @JsonKey(name: 'payment_id') required final String paymentId,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'invoice_no') required final String? invoiceNo,
      @JsonKey(name: 'chart_of_account_id')
      required final String? chartOfAccountId,
      @JsonKey(name: 'chart_of_account_name')
      required final String? chartOfAccountName,
      required final bool tb,
      required final String description,
      @JsonKey(name: 'delivery_address_id')
      required final String deliveryAddressId,
      @JsonKey(name: 'delivery_address_name')
      required final String deliveryAddressName,
      @JsonKey(name: 'delivery_address') required final String deliveryAddress,
      @JsonKey(name: 'delivery_address_city')
      required final String deliveryAddressCity,
      @JsonKey(name: 'value') required final double amount,
      @JsonKey(name: 'payment_total') required final double paymentTotal,
      @JsonKey(name: 'payment_remark') required final String paymentRemark,
      @JsonKey(name: 'payment_chart_of_account_repayment')
      required final String
          paymentChartOfAccountRepayment}) = _$PaymentDetailReceivableImpl;
  _PaymentDetailReceivable._() : super._();

  factory _PaymentDetailReceivable.fromJson(Map<String, dynamic> json) =
      _$PaymentDetailReceivableImpl.fromJson;

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
  int get id;
  @override
  @JsonKey(name: 'payment_id')
  String get paymentId;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo;
  @override
  @JsonKey(name: 'chart_of_account_id')
  String? get chartOfAccountId;
  @override
  @JsonKey(name: 'chart_of_account_name')
  String? get chartOfAccountName;
  @override
  bool get tb;
  @override
  String get description;
  @override
  @JsonKey(name: 'delivery_address_id')
  String get deliveryAddressId;
  @override
  @JsonKey(name: 'delivery_address_name')
  String get deliveryAddressName;
  @override
  @JsonKey(name: 'delivery_address')
  String get deliveryAddress;
  @override
  @JsonKey(name: 'delivery_address_city')
  String get deliveryAddressCity;
  @override
  @JsonKey(name: 'value')
  double get amount;
  @override
  @JsonKey(name: 'payment_total')
  double get paymentTotal;
  @override
  @JsonKey(name: 'payment_remark')
  String get paymentRemark;
  @override
  @JsonKey(name: 'payment_chart_of_account_repayment')
  String get paymentChartOfAccountRepayment;

  /// Create a copy of PaymentDetailReceivable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDetailReceivableImplCopyWith<_$PaymentDetailReceivableImpl>
      get copyWith => throw _privateConstructorUsedError;
}
