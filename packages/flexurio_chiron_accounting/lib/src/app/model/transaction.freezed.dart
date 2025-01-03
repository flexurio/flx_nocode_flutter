// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type_id')
  String? get transactionTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_type_transaction')
  int? get isTypeTransaction => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String id,
      @JsonKey(name: 'order_id') String orderId,
      double total,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'transaction_type_id') String? transactionTypeId,
      @JsonKey(name: 'is_type_transaction') int? isTypeTransaction});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? orderId = null,
    Object? total = null,
    Object? date = null,
    Object? dueDate = null,
    Object? transactionTypeId = freezed,
    Object? isTypeTransaction = freezed,
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
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionTypeId: freezed == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      isTypeTransaction: freezed == isTypeTransaction
          ? _value.isTypeTransaction
          : isTypeTransaction // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String id,
      @JsonKey(name: 'order_id') String orderId,
      double total,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'transaction_type_id') String? transactionTypeId,
      @JsonKey(name: 'is_type_transaction') int? isTypeTransaction});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? orderId = null,
    Object? total = null,
    Object? date = null,
    Object? dueDate = null,
    Object? transactionTypeId = freezed,
    Object? isTypeTransaction = freezed,
  }) {
    return _then(_$TransactionImpl(
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
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionTypeId: freezed == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      isTypeTransaction: freezed == isTypeTransaction
          ? _value.isTypeTransaction
          : isTypeTransaction // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl extends _Transaction {
  _$TransactionImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      required this.id,
      @JsonKey(name: 'order_id') required this.orderId,
      required this.total,
      @JsonKey(name: 'date', fromJson: isoDateToDateTime) required this.date,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'transaction_type_id') this.transactionTypeId,
      @JsonKey(name: 'is_type_transaction') this.isTypeTransaction})
      : super._();

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

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
  final String id;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  final double total;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'transaction_type_id')
  final String? transactionTypeId;
  @override
  @JsonKey(name: 'is_type_transaction')
  final int? isTypeTransaction;

  @override
  String toString() {
    return 'Transaction(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, orderId: $orderId, total: $total, date: $date, dueDate: $dueDate, transactionTypeId: $transactionTypeId, isTypeTransaction: $isTypeTransaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.transactionTypeId, transactionTypeId) ||
                other.transactionTypeId == transactionTypeId) &&
            (identical(other.isTypeTransaction, isTypeTransaction) ||
                other.isTypeTransaction == isTypeTransaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdById,
      updatedAt,
      updateById,
      id,
      orderId,
      total,
      date,
      dueDate,
      transactionTypeId,
      isTypeTransaction);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  factory _Transaction(
          {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'updated_by_id') required final int updateById,
          required final String id,
          @JsonKey(name: 'order_id') required final String orderId,
          required final double total,
          @JsonKey(name: 'date', fromJson: isoDateToDateTime)
          required final DateTime date,
          @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
          required final DateTime dueDate,
          @JsonKey(name: 'transaction_type_id') final String? transactionTypeId,
          @JsonKey(name: 'is_type_transaction') final int? isTypeTransaction}) =
      _$TransactionImpl;
  _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

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
  String get id;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  double get total;
  @override
  @JsonKey(name: 'date', fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'transaction_type_id')
  String? get transactionTypeId;
  @override
  @JsonKey(name: 'is_type_transaction')
  int? get isTypeTransaction;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
