// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_distribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDistribution _$ProductDistributionFromJson(Map<String, dynamic> json) {
  return _ProductDistribution.fromJson(json);
}

/// @nodoc
mixin _$ProductDistribution {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  double get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'debit')
  double get debit => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit')
  double get credit => throw _privateConstructorUsedError;
  DateTime? get productIssueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDistributionCopyWith<ProductDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDistributionCopyWith<$Res> {
  factory $ProductDistributionCopyWith(
          ProductDistribution value, $Res Function(ProductDistribution) then) =
      _$ProductDistributionCopyWithImpl<$Res, ProductDistribution>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'beginning_balance') double beginningBalance,
      @JsonKey(name: 'debit') double debit,
      @JsonKey(name: 'credit') double credit,
      DateTime? productIssueDate});
}

/// @nodoc
class _$ProductDistributionCopyWithImpl<$Res, $Val extends ProductDistribution>
    implements $ProductDistributionCopyWith<$Res> {
  _$ProductDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? batchNoId = null,
    Object? beginningBalance = null,
    Object? debit = null,
    Object? credit = null,
    Object? productIssueDate = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      productIssueDate: freezed == productIssueDate
          ? _value.productIssueDate
          : productIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDistributionImplCopyWith<$Res>
    implements $ProductDistributionCopyWith<$Res> {
  factory _$$ProductDistributionImplCopyWith(_$ProductDistributionImpl value,
          $Res Function(_$ProductDistributionImpl) then) =
      __$$ProductDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'beginning_balance') double beginningBalance,
      @JsonKey(name: 'debit') double debit,
      @JsonKey(name: 'credit') double credit,
      DateTime? productIssueDate});
}

/// @nodoc
class __$$ProductDistributionImplCopyWithImpl<$Res>
    extends _$ProductDistributionCopyWithImpl<$Res, _$ProductDistributionImpl>
    implements _$$ProductDistributionImplCopyWith<$Res> {
  __$$ProductDistributionImplCopyWithImpl(_$ProductDistributionImpl _value,
      $Res Function(_$ProductDistributionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? batchNoId = null,
    Object? beginningBalance = null,
    Object? debit = null,
    Object? credit = null,
    Object? productIssueDate = freezed,
  }) {
    return _then(_$ProductDistributionImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      productIssueDate: freezed == productIssueDate
          ? _value.productIssueDate
          : productIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDistributionImpl extends _ProductDistribution {
  _$ProductDistributionImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'debit') required this.debit,
      @JsonKey(name: 'credit') required this.credit,
      required this.productIssueDate})
      : super._();

  factory _$ProductDistributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDistributionImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'beginning_balance')
  final double beginningBalance;
  @override
  @JsonKey(name: 'debit')
  final double debit;
  @override
  @JsonKey(name: 'credit')
  final double credit;
  @override
  final DateTime? productIssueDate;

  @override
  String toString() {
    return 'ProductDistribution(productId: $productId, productName: $productName, customerId: $customerId, customerName: $customerName, batchNoId: $batchNoId, beginningBalance: $beginningBalance, debit: $debit, credit: $credit, productIssueDate: $productIssueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDistributionImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.productIssueDate, productIssueDate) ||
                other.productIssueDate == productIssueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      customerId,
      customerName,
      batchNoId,
      beginningBalance,
      debit,
      credit,
      productIssueDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDistributionImplCopyWith<_$ProductDistributionImpl> get copyWith =>
      __$$ProductDistributionImplCopyWithImpl<_$ProductDistributionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDistributionImplToJson(
      this,
    );
  }
}

abstract class _ProductDistribution extends ProductDistribution {
  factory _ProductDistribution(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'beginning_balance')
      required final double beginningBalance,
      @JsonKey(name: 'debit') required final double debit,
      @JsonKey(name: 'credit') required final double credit,
      required final DateTime? productIssueDate}) = _$ProductDistributionImpl;
  _ProductDistribution._() : super._();

  factory _ProductDistribution.fromJson(Map<String, dynamic> json) =
      _$ProductDistributionImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'beginning_balance')
  double get beginningBalance;
  @override
  @JsonKey(name: 'debit')
  double get debit;
  @override
  @JsonKey(name: 'credit')
  double get credit;
  @override
  DateTime? get productIssueDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductDistributionImplCopyWith<_$ProductDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
