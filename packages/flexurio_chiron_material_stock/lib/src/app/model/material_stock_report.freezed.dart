// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_stock_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialStockReport _$MaterialStockReportFromJson(Map<String, dynamic> json) {
  return _MaterialStockReport.fromJson(json);
}

/// @nodoc
mixin _$MaterialStockReport {
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'na')
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialStockReportCopyWith<MaterialStockReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStockReportCopyWith<$Res> {
  factory $MaterialStockReportCopyWith(
          MaterialStockReport value, $Res Function(MaterialStockReport) then) =
      _$MaterialStockReportCopyWithImpl<$Res, MaterialStockReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'na') String na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate});
}

/// @nodoc
class _$MaterialStockReportCopyWithImpl<$Res, $Val extends MaterialStockReport>
    implements $MaterialStockReportCopyWith<$Res> {
  _$MaterialStockReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? materialUnitId = null,
    Object? quantity = null,
    Object? na = null,
    Object? expiredDate = null,
  }) {
    return _then(_value.copyWith(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialStockReportImplCopyWith<$Res>
    implements $MaterialStockReportCopyWith<$Res> {
  factory _$$MaterialStockReportImplCopyWith(_$MaterialStockReportImpl value,
          $Res Function(_$MaterialStockReportImpl) then) =
      __$$MaterialStockReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'na') String na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate});
}

/// @nodoc
class __$$MaterialStockReportImplCopyWithImpl<$Res>
    extends _$MaterialStockReportCopyWithImpl<$Res, _$MaterialStockReportImpl>
    implements _$$MaterialStockReportImplCopyWith<$Res> {
  __$$MaterialStockReportImplCopyWithImpl(_$MaterialStockReportImpl _value,
      $Res Function(_$MaterialStockReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? materialUnitId = null,
    Object? quantity = null,
    Object? na = null,
    Object? expiredDate = null,
  }) {
    return _then(_$MaterialStockReportImpl(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialStockReportImpl extends _MaterialStockReport {
  _$MaterialStockReportImpl(
      {@JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId,
      @JsonKey(name: 'qty') required this.quantity,
      @JsonKey(name: 'na') required this.na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate})
      : super._();

  factory _$MaterialStockReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialStockReportImplFromJson(json);

  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;
  @override
  @JsonKey(name: 'qty')
  final int quantity;
  @override
  @JsonKey(name: 'na')
  final String na;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;

  @override
  String toString() {
    return 'MaterialStockReport(materialId: $materialId, materialName: $materialName, materialUnitId: $materialUnitId, quantity: $quantity, na: $na, expiredDate: $expiredDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialStockReportImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialId, materialName,
      materialUnitId, quantity, na, expiredDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialStockReportImplCopyWith<_$MaterialStockReportImpl> get copyWith =>
      __$$MaterialStockReportImplCopyWithImpl<_$MaterialStockReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialStockReportImplToJson(
      this,
    );
  }
}

abstract class _MaterialStockReport extends MaterialStockReport {
  factory _MaterialStockReport(
      {@JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'material_unit_id') required final String materialUnitId,
      @JsonKey(name: 'qty') required final int quantity,
      @JsonKey(name: 'na') required final String na,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate}) = _$MaterialStockReportImpl;
  _MaterialStockReport._() : super._();

  factory _MaterialStockReport.fromJson(Map<String, dynamic> json) =
      _$MaterialStockReportImpl.fromJson;

  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;
  @override
  @JsonKey(name: 'qty')
  int get quantity;
  @override
  @JsonKey(name: 'na')
  String get na;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(ignore: true)
  _$$MaterialStockReportImplCopyWith<_$MaterialStockReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
