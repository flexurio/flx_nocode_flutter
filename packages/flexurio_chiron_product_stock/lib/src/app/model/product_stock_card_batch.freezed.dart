// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock_card_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockCardBatch _$ProductStockCardBatchFromJson(
    Map<String, dynamic> json) {
  return _ProductStockCardBatch.fromJson(json);
}

/// @nodoc
mixin _$ProductStockCardBatch {
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit')
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'debit')
  int get debit => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit')
  int get credit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductStockCardBatchCopyWith<ProductStockCardBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockCardBatchCopyWith<$Res> {
  factory $ProductStockCardBatchCopyWith(ProductStockCardBatch value,
          $Res Function(ProductStockCardBatch) then) =
      _$ProductStockCardBatchCopyWithImpl<$Res, ProductStockCardBatch>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'unit') String unit,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'debit') int debit,
      @JsonKey(name: 'credit') int credit});
}

/// @nodoc
class _$ProductStockCardBatchCopyWithImpl<$Res,
        $Val extends ProductStockCardBatch>
    implements $ProductStockCardBatchCopyWith<$Res> {
  _$ProductStockCardBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? productId = null,
    Object? productName = null,
    Object? batchNo = null,
    Object? unit = null,
    Object? date = null,
    Object? description = null,
    Object? beginningBalance = null,
    Object? debit = null,
    Object? credit = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as int,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStockCardBatchImplCopyWith<$Res>
    implements $ProductStockCardBatchCopyWith<$Res> {
  factory _$$ProductStockCardBatchImplCopyWith(
          _$ProductStockCardBatchImpl value,
          $Res Function(_$ProductStockCardBatchImpl) then) =
      __$$ProductStockCardBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'unit') String unit,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'debit') int debit,
      @JsonKey(name: 'credit') int credit});
}

/// @nodoc
class __$$ProductStockCardBatchImplCopyWithImpl<$Res>
    extends _$ProductStockCardBatchCopyWithImpl<$Res,
        _$ProductStockCardBatchImpl>
    implements _$$ProductStockCardBatchImplCopyWith<$Res> {
  __$$ProductStockCardBatchImplCopyWithImpl(_$ProductStockCardBatchImpl _value,
      $Res Function(_$ProductStockCardBatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? productId = null,
    Object? productName = null,
    Object? batchNo = null,
    Object? unit = null,
    Object? date = null,
    Object? description = null,
    Object? beginningBalance = null,
    Object? debit = null,
    Object? credit = null,
  }) {
    return _then(_$ProductStockCardBatchImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      debit: null == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as int,
      credit: null == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockCardBatchImpl extends _ProductStockCardBatch {
  const _$ProductStockCardBatchImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'unit') required this.unit,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) required this.date,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'debit') required this.debit,
      @JsonKey(name: 'credit') required this.credit})
      : super._();

  factory _$ProductStockCardBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockCardBatchImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'unit')
  final String unit;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'debit')
  final int debit;
  @override
  @JsonKey(name: 'credit')
  final int credit;

  @override
  String toString() {
    return 'ProductStockCardBatch(transactionId: $transactionId, productId: $productId, productName: $productName, batchNo: $batchNo, unit: $unit, date: $date, description: $description, beginningBalance: $beginningBalance, debit: $debit, credit: $credit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockCardBatchImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      productId,
      productName,
      batchNo,
      unit,
      date,
      description,
      beginningBalance,
      debit,
      credit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockCardBatchImplCopyWith<_$ProductStockCardBatchImpl>
      get copyWith => __$$ProductStockCardBatchImplCopyWithImpl<
          _$ProductStockCardBatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockCardBatchImplToJson(
      this,
    );
  }
}

abstract class _ProductStockCardBatch extends ProductStockCardBatch {
  const factory _ProductStockCardBatch(
      {@JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'unit') required final String unit,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime)
      required final DateTime date,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'debit') required final int debit,
      @JsonKey(name: 'credit')
      required final int credit}) = _$ProductStockCardBatchImpl;
  const _ProductStockCardBatch._() : super._();

  factory _ProductStockCardBatch.fromJson(Map<String, dynamic> json) =
      _$ProductStockCardBatchImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'unit')
  String get unit;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'debit')
  int get debit;
  @override
  @JsonKey(name: 'credit')
  int get credit;
  @override
  @JsonKey(ignore: true)
  _$$ProductStockCardBatchImplCopyWith<_$ProductStockCardBatchImpl>
      get copyWith => throw _privateConstructorUsedError;
}
