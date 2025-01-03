// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_completed_petty_cash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportCompletedPettyCash _$ReportCompletedPettyCashFromJson(
    Map<String, dynamic> json) {
  return _ReportCompletedPettyCash.fromJson(json);
}

/// @nodoc
mixin _$ReportCompletedPettyCash {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id')
  String? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  String? get supplierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'realization_no', defaultValue: '')
  String get realizationNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn')
  int get ppn => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph')
  int get pph => throw _privateConstructorUsedError;

  /// Serializes this ReportCompletedPettyCash to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportCompletedPettyCash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportCompletedPettyCashCopyWith<ReportCompletedPettyCash> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCompletedPettyCashCopyWith<$Res> {
  factory $ReportCompletedPettyCashCopyWith(ReportCompletedPettyCash value,
          $Res Function(ReportCompletedPettyCash) then) =
      _$ReportCompletedPettyCashCopyWithImpl<$Res, ReportCompletedPettyCash>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'department_id') String? departmentId,
      @JsonKey(name: 'supplier_id') String? supplierId,
      @JsonKey(name: 'realization_no', defaultValue: '') String realizationNo,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'ppn') int ppn,
      @JsonKey(name: 'pph') int pph});
}

/// @nodoc
class _$ReportCompletedPettyCashCopyWithImpl<$Res,
        $Val extends ReportCompletedPettyCash>
    implements $ReportCompletedPettyCashCopyWith<$Res> {
  _$ReportCompletedPettyCashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportCompletedPettyCash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? departmentId = freezed,
    Object? supplierId = freezed,
    Object? realizationNo = null,
    Object? purchaseOrderId = null,
    Object? description = null,
    Object? status = null,
    Object? amount = null,
    Object? price = null,
    Object? ppn = null,
    Object? pph = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String?,
      realizationNo: null == realizationNo
          ? _value.realizationNo
          : realizationNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int,
      pph: null == pph
          ? _value.pph
          : pph // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportCompletedPettyCashImplCopyWith<$Res>
    implements $ReportCompletedPettyCashCopyWith<$Res> {
  factory _$$ReportCompletedPettyCashImplCopyWith(
          _$ReportCompletedPettyCashImpl value,
          $Res Function(_$ReportCompletedPettyCashImpl) then) =
      __$$ReportCompletedPettyCashImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'department_id') String? departmentId,
      @JsonKey(name: 'supplier_id') String? supplierId,
      @JsonKey(name: 'realization_no', defaultValue: '') String realizationNo,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'amount') int amount,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'ppn') int ppn,
      @JsonKey(name: 'pph') int pph});
}

/// @nodoc
class __$$ReportCompletedPettyCashImplCopyWithImpl<$Res>
    extends _$ReportCompletedPettyCashCopyWithImpl<$Res,
        _$ReportCompletedPettyCashImpl>
    implements _$$ReportCompletedPettyCashImplCopyWith<$Res> {
  __$$ReportCompletedPettyCashImplCopyWithImpl(
      _$ReportCompletedPettyCashImpl _value,
      $Res Function(_$ReportCompletedPettyCashImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportCompletedPettyCash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? departmentId = freezed,
    Object? supplierId = freezed,
    Object? realizationNo = null,
    Object? purchaseOrderId = null,
    Object? description = null,
    Object? status = null,
    Object? amount = null,
    Object? price = null,
    Object? ppn = null,
    Object? pph = null,
  }) {
    return _then(_$ReportCompletedPettyCashImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String?,
      realizationNo: null == realizationNo
          ? _value.realizationNo
          : realizationNo // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as int,
      pph: null == pph
          ? _value.pph
          : pph // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportCompletedPettyCashImpl extends _ReportCompletedPettyCash {
  const _$ReportCompletedPettyCashImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'department_id') required this.departmentId,
      @JsonKey(name: 'supplier_id') required this.supplierId,
      @JsonKey(name: 'realization_no', defaultValue: '')
      required this.realizationNo,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'ppn') required this.ppn,
      @JsonKey(name: 'pph') required this.pph})
      : super._();

  factory _$ReportCompletedPettyCashImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportCompletedPettyCashImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'department_id')
  final String? departmentId;
  @override
  @JsonKey(name: 'supplier_id')
  final String? supplierId;
  @override
  @JsonKey(name: 'realization_no', defaultValue: '')
  final String realizationNo;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'amount')
  final int amount;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'ppn')
  final int ppn;
  @override
  @JsonKey(name: 'pph')
  final int pph;

  @override
  String toString() {
    return 'ReportCompletedPettyCash(id: $id, createdAt: $createdAt, departmentId: $departmentId, supplierId: $supplierId, realizationNo: $realizationNo, purchaseOrderId: $purchaseOrderId, description: $description, status: $status, amount: $amount, price: $price, ppn: $ppn, pph: $pph)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportCompletedPettyCashImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.realizationNo, realizationNo) ||
                other.realizationNo == realizationNo) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.pph, pph) || other.pph == pph));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      departmentId,
      supplierId,
      realizationNo,
      purchaseOrderId,
      description,
      status,
      amount,
      price,
      ppn,
      pph);

  /// Create a copy of ReportCompletedPettyCash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportCompletedPettyCashImplCopyWith<_$ReportCompletedPettyCashImpl>
      get copyWith => __$$ReportCompletedPettyCashImplCopyWithImpl<
          _$ReportCompletedPettyCashImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportCompletedPettyCashImplToJson(
      this,
    );
  }
}

abstract class _ReportCompletedPettyCash extends ReportCompletedPettyCash {
  const factory _ReportCompletedPettyCash(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'department_id') required final String? departmentId,
      @JsonKey(name: 'supplier_id') required final String? supplierId,
      @JsonKey(name: 'realization_no', defaultValue: '')
      required final String realizationNo,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'amount') required final int amount,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'ppn') required final int ppn,
      @JsonKey(name: 'pph')
      required final int pph}) = _$ReportCompletedPettyCashImpl;
  const _ReportCompletedPettyCash._() : super._();

  factory _ReportCompletedPettyCash.fromJson(Map<String, dynamic> json) =
      _$ReportCompletedPettyCashImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'department_id')
  String? get departmentId;
  @override
  @JsonKey(name: 'supplier_id')
  String? get supplierId;
  @override
  @JsonKey(name: 'realization_no', defaultValue: '')
  String get realizationNo;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'amount')
  int get amount;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'ppn')
  int get ppn;
  @override
  @JsonKey(name: 'pph')
  int get pph;

  /// Create a copy of ReportCompletedPettyCash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportCompletedPettyCashImplCopyWith<_$ReportCompletedPettyCashImpl>
      get copyWith => throw _privateConstructorUsedError;
}
