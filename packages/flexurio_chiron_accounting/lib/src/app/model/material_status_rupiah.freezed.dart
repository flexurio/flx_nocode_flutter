// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_status_rupiah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialStatusRupiah _$MaterialStatusRupiahFromJson(Map<String, dynamic> json) {
  return _MaterialStatusRupiah.fromJson(json);
}

/// @nodoc
mixin _$MaterialStatusRupiah {
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_total')
  int get vatTotal => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_release')
  double get quantityRelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_release')
  double get valueRelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_reject')
  int get quantityReject => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_reject')
  int get valueReject => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_release_summary')
  double get valueReleaseSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_reject_summary')
  int get valueRejectSummary => throw _privateConstructorUsedError;

  /// Serializes this MaterialStatusRupiah to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialStatusRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialStatusRupiahCopyWith<MaterialStatusRupiah> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStatusRupiahCopyWith<$Res> {
  factory $MaterialStatusRupiahCopyWith(MaterialStatusRupiah value,
          $Res Function(MaterialStatusRupiah) then) =
      _$MaterialStatusRupiahCopyWithImpl<$Res, MaterialStatusRupiah>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'material_name') String materialName,
      String na,
      @JsonKey(name: 'vat_total') int vatTotal,
      int price,
      @JsonKey(name: 'quantity_release') double quantityRelease,
      @JsonKey(name: 'value_release') double valueRelease,
      @JsonKey(name: 'quantity_reject') int quantityReject,
      @JsonKey(name: 'value_reject') int valueReject,
      @JsonKey(name: 'value_release_summary') double valueReleaseSummary,
      @JsonKey(name: 'value_reject_summary') int valueRejectSummary});
}

/// @nodoc
class _$MaterialStatusRupiahCopyWithImpl<$Res,
        $Val extends MaterialStatusRupiah>
    implements $MaterialStatusRupiahCopyWith<$Res> {
  _$MaterialStatusRupiahCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialStatusRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? supplierName = null,
    Object? materialName = null,
    Object? na = null,
    Object? vatTotal = null,
    Object? price = null,
    Object? quantityRelease = null,
    Object? valueRelease = null,
    Object? quantityReject = null,
    Object? valueReject = null,
    Object? valueReleaseSummary = null,
    Object? valueRejectSummary = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRelease: null == quantityRelease
          ? _value.quantityRelease
          : quantityRelease // ignore: cast_nullable_to_non_nullable
              as double,
      valueRelease: null == valueRelease
          ? _value.valueRelease
          : valueRelease // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReject: null == quantityReject
          ? _value.quantityReject
          : quantityReject // ignore: cast_nullable_to_non_nullable
              as int,
      valueReject: null == valueReject
          ? _value.valueReject
          : valueReject // ignore: cast_nullable_to_non_nullable
              as int,
      valueReleaseSummary: null == valueReleaseSummary
          ? _value.valueReleaseSummary
          : valueReleaseSummary // ignore: cast_nullable_to_non_nullable
              as double,
      valueRejectSummary: null == valueRejectSummary
          ? _value.valueRejectSummary
          : valueRejectSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialStatusRupiahImplCopyWith<$Res>
    implements $MaterialStatusRupiahCopyWith<$Res> {
  factory _$$MaterialStatusRupiahImplCopyWith(_$MaterialStatusRupiahImpl value,
          $Res Function(_$MaterialStatusRupiahImpl) then) =
      __$$MaterialStatusRupiahImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'material_name') String materialName,
      String na,
      @JsonKey(name: 'vat_total') int vatTotal,
      int price,
      @JsonKey(name: 'quantity_release') double quantityRelease,
      @JsonKey(name: 'value_release') double valueRelease,
      @JsonKey(name: 'quantity_reject') int quantityReject,
      @JsonKey(name: 'value_reject') int valueReject,
      @JsonKey(name: 'value_release_summary') double valueReleaseSummary,
      @JsonKey(name: 'value_reject_summary') int valueRejectSummary});
}

/// @nodoc
class __$$MaterialStatusRupiahImplCopyWithImpl<$Res>
    extends _$MaterialStatusRupiahCopyWithImpl<$Res, _$MaterialStatusRupiahImpl>
    implements _$$MaterialStatusRupiahImplCopyWith<$Res> {
  __$$MaterialStatusRupiahImplCopyWithImpl(_$MaterialStatusRupiahImpl _value,
      $Res Function(_$MaterialStatusRupiahImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialStatusRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? supplierName = null,
    Object? materialName = null,
    Object? na = null,
    Object? vatTotal = null,
    Object? price = null,
    Object? quantityRelease = null,
    Object? valueRelease = null,
    Object? quantityReject = null,
    Object? valueReject = null,
    Object? valueReleaseSummary = null,
    Object? valueRejectSummary = null,
  }) {
    return _then(_$MaterialStatusRupiahImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRelease: null == quantityRelease
          ? _value.quantityRelease
          : quantityRelease // ignore: cast_nullable_to_non_nullable
              as double,
      valueRelease: null == valueRelease
          ? _value.valueRelease
          : valueRelease // ignore: cast_nullable_to_non_nullable
              as double,
      quantityReject: null == quantityReject
          ? _value.quantityReject
          : quantityReject // ignore: cast_nullable_to_non_nullable
              as int,
      valueReject: null == valueReject
          ? _value.valueReject
          : valueReject // ignore: cast_nullable_to_non_nullable
              as int,
      valueReleaseSummary: null == valueReleaseSummary
          ? _value.valueReleaseSummary
          : valueReleaseSummary // ignore: cast_nullable_to_non_nullable
              as double,
      valueRejectSummary: null == valueRejectSummary
          ? _value.valueRejectSummary
          : valueRejectSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialStatusRupiahImpl extends _MaterialStatusRupiah {
  const _$MaterialStatusRupiahImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'material_name') required this.materialName,
      required this.na,
      @JsonKey(name: 'vat_total') required this.vatTotal,
      required this.price,
      @JsonKey(name: 'quantity_release') required this.quantityRelease,
      @JsonKey(name: 'value_release') required this.valueRelease,
      @JsonKey(name: 'quantity_reject') required this.quantityReject,
      @JsonKey(name: 'value_reject') required this.valueReject,
      @JsonKey(name: 'value_release_summary') required this.valueReleaseSummary,
      @JsonKey(name: 'value_reject_summary') required this.valueRejectSummary})
      : super._();

  factory _$MaterialStatusRupiahImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialStatusRupiahImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  final String na;
  @override
  @JsonKey(name: 'vat_total')
  final int vatTotal;
  @override
  final int price;
  @override
  @JsonKey(name: 'quantity_release')
  final double quantityRelease;
  @override
  @JsonKey(name: 'value_release')
  final double valueRelease;
  @override
  @JsonKey(name: 'quantity_reject')
  final int quantityReject;
  @override
  @JsonKey(name: 'value_reject')
  final int valueReject;
  @override
  @JsonKey(name: 'value_release_summary')
  final double valueReleaseSummary;
  @override
  @JsonKey(name: 'value_reject_summary')
  final int valueRejectSummary;

  @override
  String toString() {
    return 'MaterialStatusRupiah(transactionId: $transactionId, transactionDate: $transactionDate, supplierName: $supplierName, materialName: $materialName, na: $na, vatTotal: $vatTotal, price: $price, quantityRelease: $quantityRelease, valueRelease: $valueRelease, quantityReject: $quantityReject, valueReject: $valueReject, valueReleaseSummary: $valueReleaseSummary, valueRejectSummary: $valueRejectSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialStatusRupiahImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.vatTotal, vatTotal) ||
                other.vatTotal == vatTotal) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantityRelease, quantityRelease) ||
                other.quantityRelease == quantityRelease) &&
            (identical(other.valueRelease, valueRelease) ||
                other.valueRelease == valueRelease) &&
            (identical(other.quantityReject, quantityReject) ||
                other.quantityReject == quantityReject) &&
            (identical(other.valueReject, valueReject) ||
                other.valueReject == valueReject) &&
            (identical(other.valueReleaseSummary, valueReleaseSummary) ||
                other.valueReleaseSummary == valueReleaseSummary) &&
            (identical(other.valueRejectSummary, valueRejectSummary) ||
                other.valueRejectSummary == valueRejectSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      transactionDate,
      supplierName,
      materialName,
      na,
      vatTotal,
      price,
      quantityRelease,
      valueRelease,
      quantityReject,
      valueReject,
      valueReleaseSummary,
      valueRejectSummary);

  /// Create a copy of MaterialStatusRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialStatusRupiahImplCopyWith<_$MaterialStatusRupiahImpl>
      get copyWith =>
          __$$MaterialStatusRupiahImplCopyWithImpl<_$MaterialStatusRupiahImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialStatusRupiahImplToJson(
      this,
    );
  }
}

abstract class _MaterialStatusRupiah extends MaterialStatusRupiah {
  const factory _MaterialStatusRupiah(
      {@JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'supplier_name') required final String supplierName,
      @JsonKey(name: 'material_name') required final String materialName,
      required final String na,
      @JsonKey(name: 'vat_total') required final int vatTotal,
      required final int price,
      @JsonKey(name: 'quantity_release') required final double quantityRelease,
      @JsonKey(name: 'value_release') required final double valueRelease,
      @JsonKey(name: 'quantity_reject') required final int quantityReject,
      @JsonKey(name: 'value_reject') required final int valueReject,
      @JsonKey(name: 'value_release_summary')
      required final double valueReleaseSummary,
      @JsonKey(name: 'value_reject_summary')
      required final int valueRejectSummary}) = _$MaterialStatusRupiahImpl;
  const _MaterialStatusRupiah._() : super._();

  factory _MaterialStatusRupiah.fromJson(Map<String, dynamic> json) =
      _$MaterialStatusRupiahImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  String get na;
  @override
  @JsonKey(name: 'vat_total')
  int get vatTotal;
  @override
  int get price;
  @override
  @JsonKey(name: 'quantity_release')
  double get quantityRelease;
  @override
  @JsonKey(name: 'value_release')
  double get valueRelease;
  @override
  @JsonKey(name: 'quantity_reject')
  int get quantityReject;
  @override
  @JsonKey(name: 'value_reject')
  int get valueReject;
  @override
  @JsonKey(name: 'value_release_summary')
  double get valueReleaseSummary;
  @override
  @JsonKey(name: 'value_reject_summary')
  int get valueRejectSummary;

  /// Create a copy of MaterialStatusRupiah
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialStatusRupiahImplCopyWith<_$MaterialStatusRupiahImpl>
      get copyWith => throw _privateConstructorUsedError;
}
