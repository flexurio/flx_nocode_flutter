// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medical_treatment_expense_department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicalTreatmentExpenseDepartment _$MedicalTreatmentExpenseDepartmentFromJson(
    Map<String, dynamic> json) {
  return _MedicalTreatmentExpenseDepartment.fromJson(json);
}

/// @nodoc
mixin _$MedicalTreatmentExpenseDepartment {
  @JsonKey(name: 'department')
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  double get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this MedicalTreatmentExpenseDepartment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalTreatmentExpenseDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalTreatmentExpenseDepartmentCopyWith<MedicalTreatmentExpenseDepartment>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalTreatmentExpenseDepartmentCopyWith<$Res> {
  factory $MedicalTreatmentExpenseDepartmentCopyWith(
          MedicalTreatmentExpenseDepartment value,
          $Res Function(MedicalTreatmentExpenseDepartment) then) =
      _$MedicalTreatmentExpenseDepartmentCopyWithImpl<$Res,
          MedicalTreatmentExpenseDepartment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'department') String department,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'product_price') double productPrice,
      @JsonKey(name: 'amount') double amount});
}

/// @nodoc
class _$MedicalTreatmentExpenseDepartmentCopyWithImpl<$Res,
        $Val extends MedicalTreatmentExpenseDepartment>
    implements $MedicalTreatmentExpenseDepartmentCopyWith<$Res> {
  _$MedicalTreatmentExpenseDepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalTreatmentExpenseDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? productId = null,
    Object? productName = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? expiredDate = null,
    Object? batchNo = null,
    Object? unitId = null,
    Object? quantity = null,
    Object? productPrice = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicalTreatmentExpenseDepartmentImplCopyWith<$Res>
    implements $MedicalTreatmentExpenseDepartmentCopyWith<$Res> {
  factory _$$MedicalTreatmentExpenseDepartmentImplCopyWith(
          _$MedicalTreatmentExpenseDepartmentImpl value,
          $Res Function(_$MedicalTreatmentExpenseDepartmentImpl) then) =
      __$$MedicalTreatmentExpenseDepartmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'department') String department,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate,
      @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'product_price') double productPrice,
      @JsonKey(name: 'amount') double amount});
}

/// @nodoc
class __$$MedicalTreatmentExpenseDepartmentImplCopyWithImpl<$Res>
    extends _$MedicalTreatmentExpenseDepartmentCopyWithImpl<$Res,
        _$MedicalTreatmentExpenseDepartmentImpl>
    implements _$$MedicalTreatmentExpenseDepartmentImplCopyWith<$Res> {
  __$$MedicalTreatmentExpenseDepartmentImplCopyWithImpl(
      _$MedicalTreatmentExpenseDepartmentImpl _value,
      $Res Function(_$MedicalTreatmentExpenseDepartmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicalTreatmentExpenseDepartment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = null,
    Object? productId = null,
    Object? productName = null,
    Object? deliveryOrderId = null,
    Object? deliveryOrderDate = null,
    Object? expiredDate = null,
    Object? batchNo = null,
    Object? unitId = null,
    Object? quantity = null,
    Object? productPrice = null,
    Object? amount = null,
  }) {
    return _then(_$MedicalTreatmentExpenseDepartmentImpl(
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicalTreatmentExpenseDepartmentImpl
    extends _MedicalTreatmentExpenseDepartment {
  const _$MedicalTreatmentExpenseDepartmentImpl(
      {@JsonKey(name: 'department') required this.department,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate,
      @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'qty') required this.quantity,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'amount') required this.amount})
      : super._();

  factory _$MedicalTreatmentExpenseDepartmentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MedicalTreatmentExpenseDepartmentImplFromJson(json);

  @override
  @JsonKey(name: 'department')
  final String department;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;
  @override
  @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'qty')
  final int quantity;
  @override
  @JsonKey(name: 'product_price')
  final double productPrice;
  @override
  @JsonKey(name: 'amount')
  final double amount;

  @override
  String toString() {
    return 'MedicalTreatmentExpenseDepartment(department: $department, productId: $productId, productName: $productName, deliveryOrderId: $deliveryOrderId, deliveryOrderDate: $deliveryOrderDate, expiredDate: $expiredDate, batchNo: $batchNo, unitId: $unitId, quantity: $quantity, productPrice: $productPrice, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalTreatmentExpenseDepartmentImpl &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      department,
      productId,
      productName,
      deliveryOrderId,
      deliveryOrderDate,
      expiredDate,
      batchNo,
      unitId,
      quantity,
      productPrice,
      amount);

  /// Create a copy of MedicalTreatmentExpenseDepartment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalTreatmentExpenseDepartmentImplCopyWith<
          _$MedicalTreatmentExpenseDepartmentImpl>
      get copyWith => __$$MedicalTreatmentExpenseDepartmentImplCopyWithImpl<
          _$MedicalTreatmentExpenseDepartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalTreatmentExpenseDepartmentImplToJson(
      this,
    );
  }
}

abstract class _MedicalTreatmentExpenseDepartment
    extends MedicalTreatmentExpenseDepartment {
  const factory _MedicalTreatmentExpenseDepartment(
      {@JsonKey(name: 'department') required final String department,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryOrderDate,
      @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'qty') required final int quantity,
      @JsonKey(name: 'product_price') required final double productPrice,
      @JsonKey(name: 'amount')
      required final double amount}) = _$MedicalTreatmentExpenseDepartmentImpl;
  const _MedicalTreatmentExpenseDepartment._() : super._();

  factory _MedicalTreatmentExpenseDepartment.fromJson(
          Map<String, dynamic> json) =
      _$MedicalTreatmentExpenseDepartmentImpl.fromJson;

  @override
  @JsonKey(name: 'department')
  String get department;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;
  @override
  @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'qty')
  int get quantity;
  @override
  @JsonKey(name: 'product_price')
  double get productPrice;
  @override
  @JsonKey(name: 'amount')
  double get amount;

  /// Create a copy of MedicalTreatmentExpenseDepartment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalTreatmentExpenseDepartmentImplCopyWith<
          _$MedicalTreatmentExpenseDepartmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}
