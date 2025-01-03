// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_status_rupiah_quarantine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialStatusRupiahQuarantine _$MaterialStatusRupiahQuarantineFromJson(
    Map<String, dynamic> json) {
  return _MaterialStatusRupiahQuarantine.fromJson(json);
}

/// @nodoc
mixin _$MaterialStatusRupiahQuarantine {
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
  int? get vatTotal => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_quarantine')
  int get quantityQuarantine => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_quarantine')
  int get valueQuarantine => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_quarantine_summary')
  int get valueQuarantineSummary => throw _privateConstructorUsedError;

  /// Serializes this MaterialStatusRupiahQuarantine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialStatusRupiahQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialStatusRupiahQuarantineCopyWith<MaterialStatusRupiahQuarantine>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStatusRupiahQuarantineCopyWith<$Res> {
  factory $MaterialStatusRupiahQuarantineCopyWith(
          MaterialStatusRupiahQuarantine value,
          $Res Function(MaterialStatusRupiahQuarantine) then) =
      _$MaterialStatusRupiahQuarantineCopyWithImpl<$Res,
          MaterialStatusRupiahQuarantine>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'material_name') String materialName,
      String na,
      @JsonKey(name: 'vat_total') int? vatTotal,
      int? price,
      @JsonKey(name: 'quantity_quarantine') int quantityQuarantine,
      @JsonKey(name: 'value_quarantine') int valueQuarantine,
      @JsonKey(name: 'value_quarantine_summary') int valueQuarantineSummary});
}

/// @nodoc
class _$MaterialStatusRupiahQuarantineCopyWithImpl<$Res,
        $Val extends MaterialStatusRupiahQuarantine>
    implements $MaterialStatusRupiahQuarantineCopyWith<$Res> {
  _$MaterialStatusRupiahQuarantineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialStatusRupiahQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? supplierName = null,
    Object? materialName = null,
    Object? na = null,
    Object? vatTotal = freezed,
    Object? price = freezed,
    Object? quantityQuarantine = null,
    Object? valueQuarantine = null,
    Object? valueQuarantineSummary = null,
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
      vatTotal: freezed == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityQuarantine: null == quantityQuarantine
          ? _value.quantityQuarantine
          : quantityQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      valueQuarantine: null == valueQuarantine
          ? _value.valueQuarantine
          : valueQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      valueQuarantineSummary: null == valueQuarantineSummary
          ? _value.valueQuarantineSummary
          : valueQuarantineSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialStatusRupiahQuarantineImplCopyWith<$Res>
    implements $MaterialStatusRupiahQuarantineCopyWith<$Res> {
  factory _$$MaterialStatusRupiahQuarantineImplCopyWith(
          _$MaterialStatusRupiahQuarantineImpl value,
          $Res Function(_$MaterialStatusRupiahQuarantineImpl) then) =
      __$$MaterialStatusRupiahQuarantineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'material_name') String materialName,
      String na,
      @JsonKey(name: 'vat_total') int? vatTotal,
      int? price,
      @JsonKey(name: 'quantity_quarantine') int quantityQuarantine,
      @JsonKey(name: 'value_quarantine') int valueQuarantine,
      @JsonKey(name: 'value_quarantine_summary') int valueQuarantineSummary});
}

/// @nodoc
class __$$MaterialStatusRupiahQuarantineImplCopyWithImpl<$Res>
    extends _$MaterialStatusRupiahQuarantineCopyWithImpl<$Res,
        _$MaterialStatusRupiahQuarantineImpl>
    implements _$$MaterialStatusRupiahQuarantineImplCopyWith<$Res> {
  __$$MaterialStatusRupiahQuarantineImplCopyWithImpl(
      _$MaterialStatusRupiahQuarantineImpl _value,
      $Res Function(_$MaterialStatusRupiahQuarantineImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialStatusRupiahQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? supplierName = null,
    Object? materialName = null,
    Object? na = null,
    Object? vatTotal = freezed,
    Object? price = freezed,
    Object? quantityQuarantine = null,
    Object? valueQuarantine = null,
    Object? valueQuarantineSummary = null,
  }) {
    return _then(_$MaterialStatusRupiahQuarantineImpl(
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
      vatTotal: freezed == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityQuarantine: null == quantityQuarantine
          ? _value.quantityQuarantine
          : quantityQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      valueQuarantine: null == valueQuarantine
          ? _value.valueQuarantine
          : valueQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      valueQuarantineSummary: null == valueQuarantineSummary
          ? _value.valueQuarantineSummary
          : valueQuarantineSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialStatusRupiahQuarantineImpl
    extends _MaterialStatusRupiahQuarantine {
  const _$MaterialStatusRupiahQuarantineImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'material_name') required this.materialName,
      required this.na,
      @JsonKey(name: 'vat_total') this.vatTotal,
      this.price,
      @JsonKey(name: 'quantity_quarantine') required this.quantityQuarantine,
      @JsonKey(name: 'value_quarantine') required this.valueQuarantine,
      @JsonKey(name: 'value_quarantine_summary')
      required this.valueQuarantineSummary})
      : super._();

  factory _$MaterialStatusRupiahQuarantineImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MaterialStatusRupiahQuarantineImplFromJson(json);

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
  final int? vatTotal;
  @override
  final int? price;
  @override
  @JsonKey(name: 'quantity_quarantine')
  final int quantityQuarantine;
  @override
  @JsonKey(name: 'value_quarantine')
  final int valueQuarantine;
  @override
  @JsonKey(name: 'value_quarantine_summary')
  final int valueQuarantineSummary;

  @override
  String toString() {
    return 'MaterialStatusRupiahQuarantine(transactionId: $transactionId, transactionDate: $transactionDate, supplierName: $supplierName, materialName: $materialName, na: $na, vatTotal: $vatTotal, price: $price, quantityQuarantine: $quantityQuarantine, valueQuarantine: $valueQuarantine, valueQuarantineSummary: $valueQuarantineSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialStatusRupiahQuarantineImpl &&
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
            (identical(other.quantityQuarantine, quantityQuarantine) ||
                other.quantityQuarantine == quantityQuarantine) &&
            (identical(other.valueQuarantine, valueQuarantine) ||
                other.valueQuarantine == valueQuarantine) &&
            (identical(other.valueQuarantineSummary, valueQuarantineSummary) ||
                other.valueQuarantineSummary == valueQuarantineSummary));
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
      quantityQuarantine,
      valueQuarantine,
      valueQuarantineSummary);

  /// Create a copy of MaterialStatusRupiahQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialStatusRupiahQuarantineImplCopyWith<
          _$MaterialStatusRupiahQuarantineImpl>
      get copyWith => __$$MaterialStatusRupiahQuarantineImplCopyWithImpl<
          _$MaterialStatusRupiahQuarantineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialStatusRupiahQuarantineImplToJson(
      this,
    );
  }
}

abstract class _MaterialStatusRupiahQuarantine
    extends MaterialStatusRupiahQuarantine {
  const factory _MaterialStatusRupiahQuarantine(
          {@JsonKey(name: 'transaction_id') required final String transactionId,
          @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          @JsonKey(name: 'supplier_name') required final String supplierName,
          @JsonKey(name: 'material_name') required final String materialName,
          required final String na,
          @JsonKey(name: 'vat_total') final int? vatTotal,
          final int? price,
          @JsonKey(name: 'quantity_quarantine')
          required final int quantityQuarantine,
          @JsonKey(name: 'value_quarantine') required final int valueQuarantine,
          @JsonKey(name: 'value_quarantine_summary')
          required final int valueQuarantineSummary}) =
      _$MaterialStatusRupiahQuarantineImpl;
  const _MaterialStatusRupiahQuarantine._() : super._();

  factory _MaterialStatusRupiahQuarantine.fromJson(Map<String, dynamic> json) =
      _$MaterialStatusRupiahQuarantineImpl.fromJson;

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
  int? get vatTotal;
  @override
  int? get price;
  @override
  @JsonKey(name: 'quantity_quarantine')
  int get quantityQuarantine;
  @override
  @JsonKey(name: 'value_quarantine')
  int get valueQuarantine;
  @override
  @JsonKey(name: 'value_quarantine_summary')
  int get valueQuarantineSummary;

  /// Create a copy of MaterialStatusRupiahQuarantine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialStatusRupiahQuarantineImplCopyWith<
          _$MaterialStatusRupiahQuarantineImpl>
      get copyWith => throw _privateConstructorUsedError;
}
