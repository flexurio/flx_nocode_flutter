// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_down_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderDownPayment _$PurchaseOrderDownPaymentFromJson(
    Map<String, dynamic> json) {
  return _PurchaseOrderDownPayment.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderDownPayment {
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_used')
  bool get isUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'dp_usage')
  int get dpUsage => throw _privateConstructorUsedError;
  @JsonKey(name: 'dp_remaining', defaultValue: 0)
  int get dpRemaining => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderDownPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderDownPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderDownPaymentCopyWith<PurchaseOrderDownPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDownPaymentCopyWith<$Res> {
  factory $PurchaseOrderDownPaymentCopyWith(PurchaseOrderDownPayment value,
          $Res Function(PurchaseOrderDownPayment) then) =
      _$PurchaseOrderDownPaymentCopyWithImpl<$Res, PurchaseOrderDownPayment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      double amount,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'is_used') bool isUsed,
      @JsonKey(name: 'dp_usage') int dpUsage,
      @JsonKey(name: 'dp_remaining', defaultValue: 0) int dpRemaining});
}

/// @nodoc
class _$PurchaseOrderDownPaymentCopyWithImpl<$Res,
        $Val extends PurchaseOrderDownPayment>
    implements $PurchaseOrderDownPaymentCopyWith<$Res> {
  _$PurchaseOrderDownPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDownPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? amount = null,
    Object? dueDate = null,
    Object? isUsed = null,
    Object? dpUsage = null,
    Object? dpRemaining = null,
  }) {
    return _then(_value.copyWith(
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      dpUsage: null == dpUsage
          ? _value.dpUsage
          : dpUsage // ignore: cast_nullable_to_non_nullable
              as int,
      dpRemaining: null == dpRemaining
          ? _value.dpRemaining
          : dpRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderDownPaymentImplCopyWith<$Res>
    implements $PurchaseOrderDownPaymentCopyWith<$Res> {
  factory _$$PurchaseOrderDownPaymentImplCopyWith(
          _$PurchaseOrderDownPaymentImpl value,
          $Res Function(_$PurchaseOrderDownPaymentImpl) then) =
      __$$PurchaseOrderDownPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      double amount,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'is_used') bool isUsed,
      @JsonKey(name: 'dp_usage') int dpUsage,
      @JsonKey(name: 'dp_remaining', defaultValue: 0) int dpRemaining});
}

/// @nodoc
class __$$PurchaseOrderDownPaymentImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDownPaymentCopyWithImpl<$Res,
        _$PurchaseOrderDownPaymentImpl>
    implements _$$PurchaseOrderDownPaymentImplCopyWith<$Res> {
  __$$PurchaseOrderDownPaymentImplCopyWithImpl(
      _$PurchaseOrderDownPaymentImpl _value,
      $Res Function(_$PurchaseOrderDownPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDownPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? purchaseOrderId = null,
    Object? amount = null,
    Object? dueDate = null,
    Object? isUsed = null,
    Object? dpUsage = null,
    Object? dpRemaining = null,
  }) {
    return _then(_$PurchaseOrderDownPaymentImpl(
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      dpUsage: null == dpUsage
          ? _value.dpUsage
          : dpUsage // ignore: cast_nullable_to_non_nullable
              as int,
      dpRemaining: null == dpRemaining
          ? _value.dpRemaining
          : dpRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderDownPaymentImpl extends _PurchaseOrderDownPayment {
  const _$PurchaseOrderDownPaymentImpl(
      {@JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      required this.amount,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'is_used') required this.isUsed,
      @JsonKey(name: 'dp_usage') required this.dpUsage,
      @JsonKey(name: 'dp_remaining', defaultValue: 0)
      required this.dpRemaining})
      : super._();

  factory _$PurchaseOrderDownPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderDownPaymentImplFromJson(json);

  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  final double amount;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'is_used')
  final bool isUsed;
  @override
  @JsonKey(name: 'dp_usage')
  final int dpUsage;
  @override
  @JsonKey(name: 'dp_remaining', defaultValue: 0)
  final int dpRemaining;

  @override
  String toString() {
    return 'PurchaseOrderDownPayment(createdById: $createdById, createdAt: $createdAt, updatedById: $updatedById, updatedAt: $updatedAt, id: $id, purchaseOrderId: $purchaseOrderId, amount: $amount, dueDate: $dueDate, isUsed: $isUsed, dpUsage: $dpUsage, dpRemaining: $dpRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderDownPaymentImpl &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed) &&
            (identical(other.dpUsage, dpUsage) || other.dpUsage == dpUsage) &&
            (identical(other.dpRemaining, dpRemaining) ||
                other.dpRemaining == dpRemaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdById,
      createdAt,
      updatedById,
      updatedAt,
      id,
      purchaseOrderId,
      amount,
      dueDate,
      isUsed,
      dpUsage,
      dpRemaining);

  /// Create a copy of PurchaseOrderDownPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderDownPaymentImplCopyWith<_$PurchaseOrderDownPaymentImpl>
      get copyWith => __$$PurchaseOrderDownPaymentImplCopyWithImpl<
          _$PurchaseOrderDownPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderDownPaymentImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderDownPayment extends PurchaseOrderDownPayment {
  const factory _PurchaseOrderDownPayment(
      {@JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      required final double amount,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'is_used') required final bool isUsed,
      @JsonKey(name: 'dp_usage') required final int dpUsage,
      @JsonKey(name: 'dp_remaining', defaultValue: 0)
      required final int dpRemaining}) = _$PurchaseOrderDownPaymentImpl;
  const _PurchaseOrderDownPayment._() : super._();

  factory _PurchaseOrderDownPayment.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderDownPaymentImpl.fromJson;

  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  double get amount;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'is_used')
  bool get isUsed;
  @override
  @JsonKey(name: 'dp_usage')
  int get dpUsage;
  @override
  @JsonKey(name: 'dp_remaining', defaultValue: 0)
  int get dpRemaining;

  /// Create a copy of PurchaseOrderDownPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderDownPaymentImplCopyWith<_$PurchaseOrderDownPaymentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
