// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_non_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionNonOrder _$TransactionNonOrderFromJson(Map<String, dynamic> json) {
  return _TransactionNonOrder.fromJson(json);
}

/// @nodoc
mixin _$TransactionNonOrder {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountNo => throw _privateConstructorUsedError;
  String get unique => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
  TransactionNonOrderType get type => throw _privateConstructorUsedError;

  /// Serializes this TransactionNonOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionNonOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionNonOrderCopyWith<TransactionNonOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionNonOrderCopyWith<$Res> {
  factory $TransactionNonOrderCopyWith(
          TransactionNonOrder value, $Res Function(TransactionNonOrder) then) =
      _$TransactionNonOrderCopyWithImpl<$Res, TransactionNonOrder>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      String title,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountNo,
      String unique,
      double value,
      @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
      TransactionNonOrderType type});
}

/// @nodoc
class _$TransactionNonOrderCopyWithImpl<$Res, $Val extends TransactionNonOrder>
    implements $TransactionNonOrderCopyWith<$Res> {
  _$TransactionNonOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionNonOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? title = null,
    Object? chartOfAccountNo = null,
    Object? unique = null,
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountNo: null == chartOfAccountNo
          ? _value.chartOfAccountNo
          : chartOfAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionNonOrderType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionNonOrderImplCopyWith<$Res>
    implements $TransactionNonOrderCopyWith<$Res> {
  factory _$$TransactionNonOrderImplCopyWith(_$TransactionNonOrderImpl value,
          $Res Function(_$TransactionNonOrderImpl) then) =
      __$$TransactionNonOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      String title,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountNo,
      String unique,
      double value,
      @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
      TransactionNonOrderType type});
}

/// @nodoc
class __$$TransactionNonOrderImplCopyWithImpl<$Res>
    extends _$TransactionNonOrderCopyWithImpl<$Res, _$TransactionNonOrderImpl>
    implements _$$TransactionNonOrderImplCopyWith<$Res> {
  __$$TransactionNonOrderImplCopyWithImpl(_$TransactionNonOrderImpl _value,
      $Res Function(_$TransactionNonOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionNonOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? title = null,
    Object? chartOfAccountNo = null,
    Object? unique = null,
    Object? value = null,
    Object? type = null,
  }) {
    return _then(_$TransactionNonOrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountNo: null == chartOfAccountNo
          ? _value.chartOfAccountNo
          : chartOfAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionNonOrderType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionNonOrderImpl extends _TransactionNonOrder {
  _$TransactionNonOrderImpl(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      required this.title,
      @JsonKey(name: 'chart_of_account_id') required this.chartOfAccountNo,
      required this.unique,
      required this.value,
      @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
      required this.type})
      : super._();

  factory _$TransactionNonOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionNonOrderImplFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
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
  final int updatedById;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  final String title;
  @override
  @JsonKey(name: 'chart_of_account_id')
  final String chartOfAccountNo;
  @override
  final String unique;
  @override
  final double value;
  @override
  @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
  final TransactionNonOrderType type;

  @override
  String toString() {
    return 'TransactionNonOrder(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, transactionNo: $transactionNo, transactionDate: $transactionDate, title: $title, chartOfAccountNo: $chartOfAccountNo, unique: $unique, value: $value, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionNonOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.chartOfAccountNo, chartOfAccountNo) ||
                other.chartOfAccountNo == chartOfAccountNo) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      createdById,
      updatedAt,
      updatedById,
      transactionNo,
      transactionDate,
      title,
      chartOfAccountNo,
      unique,
      value,
      type);

  /// Create a copy of TransactionNonOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionNonOrderImplCopyWith<_$TransactionNonOrderImpl> get copyWith =>
      __$$TransactionNonOrderImplCopyWithImpl<_$TransactionNonOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionNonOrderImplToJson(
      this,
    );
  }
}

abstract class _TransactionNonOrder extends TransactionNonOrder {
  factory _TransactionNonOrder(
      {@JsonKey(name: 'ID') required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      required final String title,
      @JsonKey(name: 'chart_of_account_id')
      required final String chartOfAccountNo,
      required final String unique,
      required final double value,
      @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
      required final TransactionNonOrderType type}) = _$TransactionNonOrderImpl;
  _TransactionNonOrder._() : super._();

  factory _TransactionNonOrder.fromJson(Map<String, dynamic> json) =
      _$TransactionNonOrderImpl.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
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
  int get updatedById;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  String get title;
  @override
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountNo;
  @override
  String get unique;
  @override
  double get value;
  @override
  @JsonKey(name: 'type', fromJson: TransactionNonOrderType.fromString)
  TransactionNonOrderType get type;

  /// Create a copy of TransactionNonOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionNonOrderImplCopyWith<_$TransactionNonOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
