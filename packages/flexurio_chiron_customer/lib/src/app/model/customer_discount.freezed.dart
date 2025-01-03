// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerDiscount _$CustomerDiscountFromJson(Map<String, dynamic> json) {
  return _CustomerDiscount.fromJson(json);
}

/// @nodoc
mixin _$CustomerDiscount {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Customer.fromJson)
  Customer get customer => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;

  /// Serializes this CustomerDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerDiscountCopyWith<CustomerDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDiscountCopyWith<$Res> {
  factory $CustomerDiscountCopyWith(
          CustomerDiscount value, $Res Function(CustomerDiscount) then) =
      _$CustomerDiscountCopyWithImpl<$Res, CustomerDiscount>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable) DateTime? endDate,
      @JsonKey(fromJson: Customer.fromJson) Customer customer,
      double discount});

  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$CustomerDiscountCopyWithImpl<$Res, $Val extends CustomerDiscount>
    implements $CustomerDiscountCopyWith<$Res> {
  _$CustomerDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? customer = null,
    Object? discount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of CustomerDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerDiscountImplCopyWith<$Res>
    implements $CustomerDiscountCopyWith<$Res> {
  factory _$$CustomerDiscountImplCopyWith(_$CustomerDiscountImpl value,
          $Res Function(_$CustomerDiscountImpl) then) =
      __$$CustomerDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable) DateTime? endDate,
      @JsonKey(fromJson: Customer.fromJson) Customer customer,
      double discount});

  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$CustomerDiscountImplCopyWithImpl<$Res>
    extends _$CustomerDiscountCopyWithImpl<$Res, _$CustomerDiscountImpl>
    implements _$$CustomerDiscountImplCopyWith<$Res> {
  __$$CustomerDiscountImplCopyWithImpl(_$CustomerDiscountImpl _value,
      $Res Function(_$CustomerDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdById = null,
    Object? createdAt = null,
    Object? updatedById = null,
    Object? updatedAt = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? customer = null,
    Object? discount = null,
  }) {
    return _then(_$CustomerDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerDiscountImpl extends _CustomerDiscount {
  _$CustomerDiscountImpl(
      {required this.id,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      required this.startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
      required this.endDate,
      @JsonKey(fromJson: Customer.fromJson) required this.customer,
      required this.discount})
      : super._();

  factory _$CustomerDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerDiscountImplFromJson(json);

  @override
  final int id;
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
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
  final DateTime? endDate;
  @override
  @JsonKey(fromJson: Customer.fromJson)
  final Customer customer;
  @override
  final double discount;

  @override
  String toString() {
    return 'CustomerDiscount(id: $id, createdById: $createdById, createdAt: $createdAt, updatedById: $updatedById, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate, customer: $customer, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdById, createdAt,
      updatedById, updatedAt, startDate, endDate, customer, discount);

  /// Create a copy of CustomerDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerDiscountImplCopyWith<_$CustomerDiscountImpl> get copyWith =>
      __$$CustomerDiscountImplCopyWithImpl<_$CustomerDiscountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerDiscountImplToJson(
      this,
    );
  }
}

abstract class _CustomerDiscount extends CustomerDiscount {
  factory _CustomerDiscount(
      {required final int id,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      required final DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
      required final DateTime? endDate,
      @JsonKey(fromJson: Customer.fromJson) required final Customer customer,
      required final double discount}) = _$CustomerDiscountImpl;
  _CustomerDiscount._() : super._();

  factory _CustomerDiscount.fromJson(Map<String, dynamic> json) =
      _$CustomerDiscountImpl.fromJson;

  @override
  int get id;
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
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
  DateTime? get endDate;
  @override
  @JsonKey(fromJson: Customer.fromJson)
  Customer get customer;
  @override
  double get discount;

  /// Create a copy of CustomerDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerDiscountImplCopyWith<_$CustomerDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
