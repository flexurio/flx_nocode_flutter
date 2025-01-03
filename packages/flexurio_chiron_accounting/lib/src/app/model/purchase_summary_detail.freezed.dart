// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_summary_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseSummaryDetail _$PurchaseSummaryDetailFromJson(
    Map<String, dynamic> json) {
  return _PurchaseSummaryDetail.fromJson(json);
}

/// @nodoc
mixin _$PurchaseSummaryDetail {
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  String get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  int get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  int get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph22_value')
  int get pph22Value => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'description_total')
  String get descriptionTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_summary')
  int get subtotalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value_summary')
  int get ppnValueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'pph22_value_summary')
  int get pph22ValueSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_summary')
  double get totalSummary => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String? get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this PurchaseSummaryDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseSummaryDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseSummaryDetailCopyWith<PurchaseSummaryDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseSummaryDetailCopyWith<$Res> {
  factory $PurchaseSummaryDetailCopyWith(PurchaseSummaryDetail value,
          $Res Function(PurchaseSummaryDetail) then) =
      _$PurchaseSummaryDetailCopyWithImpl<$Res, PurchaseSummaryDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'supplier') String supplier,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'subtotal') int subtotal,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'pph22_value') int pph22Value,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'description_total') String descriptionTotal,
      @JsonKey(name: 'subtotal_summary') int subtotalSummary,
      @JsonKey(name: 'ppn_value_summary') int ppnValueSummary,
      @JsonKey(name: 'pph22_value_summary') int pph22ValueSummary,
      @JsonKey(name: 'total_summary') double totalSummary,
      @JsonKey(name: 'unit_id') String? unitId,
      @JsonKey(name: 'quantity') int? quantity});
}

/// @nodoc
class _$PurchaseSummaryDetailCopyWithImpl<$Res,
        $Val extends PurchaseSummaryDetail>
    implements $PurchaseSummaryDetailCopyWith<$Res> {
  _$PurchaseSummaryDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseSummaryDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? supplier = null,
    Object? transactionDate = null,
    Object? description = null,
    Object? materialName = null,
    Object? price = null,
    Object? subtotal = null,
    Object? ppnValue = null,
    Object? pph22Value = null,
    Object? total = null,
    Object? descriptionTotal = null,
    Object? subtotalSummary = null,
    Object? ppnValueSummary = null,
    Object? pph22ValueSummary = null,
    Object? totalSummary = null,
    Object? unitId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      descriptionTotal: null == descriptionTotal
          ? _value.descriptionTotal
          : descriptionTotal // ignore: cast_nullable_to_non_nullable
              as String,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValueSummary: null == ppnValueSummary
          ? _value.ppnValueSummary
          : ppnValueSummary // ignore: cast_nullable_to_non_nullable
              as int,
      pph22ValueSummary: null == pph22ValueSummary
          ? _value.pph22ValueSummary
          : pph22ValueSummary // ignore: cast_nullable_to_non_nullable
              as int,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseSummaryDetailImplCopyWith<$Res>
    implements $PurchaseSummaryDetailCopyWith<$Res> {
  factory _$$PurchaseSummaryDetailImplCopyWith(
          _$PurchaseSummaryDetailImpl value,
          $Res Function(_$PurchaseSummaryDetailImpl) then) =
      __$$PurchaseSummaryDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'supplier') String supplier,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'subtotal') int subtotal,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'pph22_value') int pph22Value,
      @JsonKey(name: 'total') int total,
      @JsonKey(name: 'description_total') String descriptionTotal,
      @JsonKey(name: 'subtotal_summary') int subtotalSummary,
      @JsonKey(name: 'ppn_value_summary') int ppnValueSummary,
      @JsonKey(name: 'pph22_value_summary') int pph22ValueSummary,
      @JsonKey(name: 'total_summary') double totalSummary,
      @JsonKey(name: 'unit_id') String? unitId,
      @JsonKey(name: 'quantity') int? quantity});
}

/// @nodoc
class __$$PurchaseSummaryDetailImplCopyWithImpl<$Res>
    extends _$PurchaseSummaryDetailCopyWithImpl<$Res,
        _$PurchaseSummaryDetailImpl>
    implements _$$PurchaseSummaryDetailImplCopyWith<$Res> {
  __$$PurchaseSummaryDetailImplCopyWithImpl(_$PurchaseSummaryDetailImpl _value,
      $Res Function(_$PurchaseSummaryDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseSummaryDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? supplier = null,
    Object? transactionDate = null,
    Object? description = null,
    Object? materialName = null,
    Object? price = null,
    Object? subtotal = null,
    Object? ppnValue = null,
    Object? pph22Value = null,
    Object? total = null,
    Object? descriptionTotal = null,
    Object? subtotalSummary = null,
    Object? ppnValueSummary = null,
    Object? pph22ValueSummary = null,
    Object? totalSummary = null,
    Object? unitId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$PurchaseSummaryDetailImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      pph22Value: null == pph22Value
          ? _value.pph22Value
          : pph22Value // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      descriptionTotal: null == descriptionTotal
          ? _value.descriptionTotal
          : descriptionTotal // ignore: cast_nullable_to_non_nullable
              as String,
      subtotalSummary: null == subtotalSummary
          ? _value.subtotalSummary
          : subtotalSummary // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValueSummary: null == ppnValueSummary
          ? _value.ppnValueSummary
          : ppnValueSummary // ignore: cast_nullable_to_non_nullable
              as int,
      pph22ValueSummary: null == pph22ValueSummary
          ? _value.pph22ValueSummary
          : pph22ValueSummary // ignore: cast_nullable_to_non_nullable
              as int,
      totalSummary: null == totalSummary
          ? _value.totalSummary
          : totalSummary // ignore: cast_nullable_to_non_nullable
              as double,
      unitId: freezed == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseSummaryDetailImpl extends _PurchaseSummaryDetail {
  const _$PurchaseSummaryDetailImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'supplier') required this.supplier,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'subtotal') required this.subtotal,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'pph22_value') required this.pph22Value,
      @JsonKey(name: 'total') required this.total,
      @JsonKey(name: 'description_total') required this.descriptionTotal,
      @JsonKey(name: 'subtotal_summary') required this.subtotalSummary,
      @JsonKey(name: 'ppn_value_summary') required this.ppnValueSummary,
      @JsonKey(name: 'pph22_value_summary') required this.pph22ValueSummary,
      @JsonKey(name: 'total_summary') required this.totalSummary,
      @JsonKey(name: 'unit_id') this.unitId,
      @JsonKey(name: 'quantity') this.quantity})
      : super._();

  factory _$PurchaseSummaryDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseSummaryDetailImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'supplier')
  final String supplier;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'subtotal')
  final int subtotal;
  @override
  @JsonKey(name: 'ppn_value')
  final int ppnValue;
  @override
  @JsonKey(name: 'pph22_value')
  final int pph22Value;
  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'description_total')
  final String descriptionTotal;
  @override
  @JsonKey(name: 'subtotal_summary')
  final int subtotalSummary;
  @override
  @JsonKey(name: 'ppn_value_summary')
  final int ppnValueSummary;
  @override
  @JsonKey(name: 'pph22_value_summary')
  final int pph22ValueSummary;
  @override
  @JsonKey(name: 'total_summary')
  final double totalSummary;
  @override
  @JsonKey(name: 'unit_id')
  final String? unitId;
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;

  @override
  String toString() {
    return 'PurchaseSummaryDetail(transactionId: $transactionId, supplier: $supplier, transactionDate: $transactionDate, description: $description, materialName: $materialName, price: $price, subtotal: $subtotal, ppnValue: $ppnValue, pph22Value: $pph22Value, total: $total, descriptionTotal: $descriptionTotal, subtotalSummary: $subtotalSummary, ppnValueSummary: $ppnValueSummary, pph22ValueSummary: $pph22ValueSummary, totalSummary: $totalSummary, unitId: $unitId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseSummaryDetailImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.pph22Value, pph22Value) ||
                other.pph22Value == pph22Value) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.descriptionTotal, descriptionTotal) ||
                other.descriptionTotal == descriptionTotal) &&
            (identical(other.subtotalSummary, subtotalSummary) ||
                other.subtotalSummary == subtotalSummary) &&
            (identical(other.ppnValueSummary, ppnValueSummary) ||
                other.ppnValueSummary == ppnValueSummary) &&
            (identical(other.pph22ValueSummary, pph22ValueSummary) ||
                other.pph22ValueSummary == pph22ValueSummary) &&
            (identical(other.totalSummary, totalSummary) ||
                other.totalSummary == totalSummary) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      supplier,
      transactionDate,
      description,
      materialName,
      price,
      subtotal,
      ppnValue,
      pph22Value,
      total,
      descriptionTotal,
      subtotalSummary,
      ppnValueSummary,
      pph22ValueSummary,
      totalSummary,
      unitId,
      quantity);

  /// Create a copy of PurchaseSummaryDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseSummaryDetailImplCopyWith<_$PurchaseSummaryDetailImpl>
      get copyWith => __$$PurchaseSummaryDetailImplCopyWithImpl<
          _$PurchaseSummaryDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseSummaryDetailImplToJson(
      this,
    );
  }
}

abstract class _PurchaseSummaryDetail extends PurchaseSummaryDetail {
  const factory _PurchaseSummaryDetail(
      {@JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'supplier') required final String supplier,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'subtotal') required final int subtotal,
      @JsonKey(name: 'ppn_value') required final int ppnValue,
      @JsonKey(name: 'pph22_value') required final int pph22Value,
      @JsonKey(name: 'total') required final int total,
      @JsonKey(name: 'description_total')
      required final String descriptionTotal,
      @JsonKey(name: 'subtotal_summary') required final int subtotalSummary,
      @JsonKey(name: 'ppn_value_summary') required final int ppnValueSummary,
      @JsonKey(name: 'pph22_value_summary')
      required final int pph22ValueSummary,
      @JsonKey(name: 'total_summary') required final double totalSummary,
      @JsonKey(name: 'unit_id') final String? unitId,
      @JsonKey(name: 'quantity')
      final int? quantity}) = _$PurchaseSummaryDetailImpl;
  const _PurchaseSummaryDetail._() : super._();

  factory _PurchaseSummaryDetail.fromJson(Map<String, dynamic> json) =
      _$PurchaseSummaryDetailImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'supplier')
  String get supplier;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'subtotal')
  int get subtotal;
  @override
  @JsonKey(name: 'ppn_value')
  int get ppnValue;
  @override
  @JsonKey(name: 'pph22_value')
  int get pph22Value;
  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'description_total')
  String get descriptionTotal;
  @override
  @JsonKey(name: 'subtotal_summary')
  int get subtotalSummary;
  @override
  @JsonKey(name: 'ppn_value_summary')
  int get ppnValueSummary;
  @override
  @JsonKey(name: 'pph22_value_summary')
  int get pph22ValueSummary;
  @override
  @JsonKey(name: 'total_summary')
  double get totalSummary;
  @override
  @JsonKey(name: 'unit_id')
  String? get unitId;
  @override
  @JsonKey(name: 'quantity')
  int? get quantity;

  /// Create a copy of PurchaseSummaryDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseSummaryDetailImplCopyWith<_$PurchaseSummaryDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
