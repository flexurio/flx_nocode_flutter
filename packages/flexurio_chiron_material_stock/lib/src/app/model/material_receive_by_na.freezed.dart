// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receive_by_na.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReceiveByNa _$MaterialReceiveByNaFromJson(Map<String, dynamic> json) {
  return _MaterialReceiveByNa.fromJson(json);
}

/// @nodoc
mixin _$MaterialReceiveByNa {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id', defaultValue: '')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id', defaultValue: '')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name', defaultValue: '')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id', defaultValue: '')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code_id', defaultValue: 0)
  int get designCodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity', defaultValue: 0)
  num get totalQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_total', defaultValue: 0)
  num get vatTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id', defaultValue: '')
  String get materialUnitId => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id', defaultValue: '')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', defaultValue: '')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString)
  MaterialReceiveDetailStatus get materialStatus =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReceiveByNaCopyWith<MaterialReceiveByNa> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiveByNaCopyWith<$Res> {
  factory $MaterialReceiveByNaCopyWith(
          MaterialReceiveByNa value, $Res Function(MaterialReceiveByNa) then) =
      _$MaterialReceiveByNaCopyWithImpl<$Res, MaterialReceiveByNa>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'delivery_order_id', defaultValue: '')
      String deliveryOrderId,
      @JsonKey(name: 'material_id', defaultValue: '') String materialId,
      @JsonKey(name: 'material_name', defaultValue: '') String materialName,
      @JsonKey(name: 'material_group_id', defaultValue: '')
      String materialGroupId,
      @JsonKey(name: 'design_code_id', defaultValue: 0) int designCodeId,
      @JsonKey(name: 'total_quantity', defaultValue: 0) num totalQty,
      @JsonKey(name: 'vat_total', defaultValue: 0) num vatTotal,
      @JsonKey(name: 'material_unit_id', defaultValue: '')
      String materialUnitId,
      @JsonKey(defaultValue: '') String na,
      @JsonKey(name: 'purchase_order_id', defaultValue: '')
      String purchaseOrderId,
      @JsonKey(name: 'batch_no', defaultValue: '') String batchNo,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      MaterialReceiveDetailStatus materialStatus});
}

/// @nodoc
class _$MaterialReceiveByNaCopyWithImpl<$Res, $Val extends MaterialReceiveByNa>
    implements $MaterialReceiveByNaCopyWith<$Res> {
  _$MaterialReceiveByNaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? deliveryOrderId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? materialGroupId = null,
    Object? designCodeId = null,
    Object? totalQty = null,
    Object? vatTotal = null,
    Object? materialUnitId = null,
    Object? na = null,
    Object? purchaseOrderId = null,
    Object? batchNo = null,
    Object? materialStatus = null,
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
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      designCodeId: null == designCodeId
          ? _value.designCodeId
          : designCodeId // ignore: cast_nullable_to_non_nullable
              as int,
      totalQty: null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as num,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as num,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      materialStatus: null == materialStatus
          ? _value.materialStatus
          : materialStatus // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveDetailStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialReceiveByNaImplCopyWith<$Res>
    implements $MaterialReceiveByNaCopyWith<$Res> {
  factory _$$MaterialReceiveByNaImplCopyWith(_$MaterialReceiveByNaImpl value,
          $Res Function(_$MaterialReceiveByNaImpl) then) =
      __$$MaterialReceiveByNaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'delivery_order_id', defaultValue: '')
      String deliveryOrderId,
      @JsonKey(name: 'material_id', defaultValue: '') String materialId,
      @JsonKey(name: 'material_name', defaultValue: '') String materialName,
      @JsonKey(name: 'material_group_id', defaultValue: '')
      String materialGroupId,
      @JsonKey(name: 'design_code_id', defaultValue: 0) int designCodeId,
      @JsonKey(name: 'total_quantity', defaultValue: 0) num totalQty,
      @JsonKey(name: 'vat_total', defaultValue: 0) num vatTotal,
      @JsonKey(name: 'material_unit_id', defaultValue: '')
      String materialUnitId,
      @JsonKey(defaultValue: '') String na,
      @JsonKey(name: 'purchase_order_id', defaultValue: '')
      String purchaseOrderId,
      @JsonKey(name: 'batch_no', defaultValue: '') String batchNo,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      MaterialReceiveDetailStatus materialStatus});
}

/// @nodoc
class __$$MaterialReceiveByNaImplCopyWithImpl<$Res>
    extends _$MaterialReceiveByNaCopyWithImpl<$Res, _$MaterialReceiveByNaImpl>
    implements _$$MaterialReceiveByNaImplCopyWith<$Res> {
  __$$MaterialReceiveByNaImplCopyWithImpl(_$MaterialReceiveByNaImpl _value,
      $Res Function(_$MaterialReceiveByNaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? deliveryOrderId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? materialGroupId = null,
    Object? designCodeId = null,
    Object? totalQty = null,
    Object? vatTotal = null,
    Object? materialUnitId = null,
    Object? na = null,
    Object? purchaseOrderId = null,
    Object? batchNo = null,
    Object? materialStatus = null,
  }) {
    return _then(_$MaterialReceiveByNaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      designCodeId: null == designCodeId
          ? _value.designCodeId
          : designCodeId // ignore: cast_nullable_to_non_nullable
              as int,
      totalQty: null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as num,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as num,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      materialStatus: null == materialStatus
          ? _value.materialStatus
          : materialStatus // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveDetailStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReceiveByNaImpl implements _MaterialReceiveByNa {
  _$MaterialReceiveByNaImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'delivery_order_id', defaultValue: '')
      required this.deliveryOrderId,
      @JsonKey(name: 'material_id', defaultValue: '') required this.materialId,
      @JsonKey(name: 'material_name', defaultValue: '')
      required this.materialName,
      @JsonKey(name: 'material_group_id', defaultValue: '')
      required this.materialGroupId,
      @JsonKey(name: 'design_code_id', defaultValue: 0)
      required this.designCodeId,
      @JsonKey(name: 'total_quantity', defaultValue: 0) required this.totalQty,
      @JsonKey(name: 'vat_total', defaultValue: 0) required this.vatTotal,
      @JsonKey(name: 'material_unit_id', defaultValue: '')
      required this.materialUnitId,
      @JsonKey(defaultValue: '') required this.na,
      @JsonKey(name: 'purchase_order_id', defaultValue: '')
      required this.purchaseOrderId,
      @JsonKey(name: 'batch_no', defaultValue: '') required this.batchNo,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      required this.materialStatus});

  factory _$MaterialReceiveByNaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReceiveByNaImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'delivery_order_id', defaultValue: '')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'material_id', defaultValue: '')
  final String materialId;
  @override
  @JsonKey(name: 'material_name', defaultValue: '')
  final String materialName;
  @override
  @JsonKey(name: 'material_group_id', defaultValue: '')
  final String materialGroupId;
  @override
  @JsonKey(name: 'design_code_id', defaultValue: 0)
  final int designCodeId;
  @override
  @JsonKey(name: 'total_quantity', defaultValue: 0)
  final num totalQty;
  @override
  @JsonKey(name: 'vat_total', defaultValue: 0)
  final num vatTotal;
  @override
  @JsonKey(name: 'material_unit_id', defaultValue: '')
  final String materialUnitId;
  @override
  @JsonKey(defaultValue: '')
  final String na;
  @override
  @JsonKey(name: 'purchase_order_id', defaultValue: '')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'batch_no', defaultValue: '')
  final String batchNo;
  @override
  @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString)
  final MaterialReceiveDetailStatus materialStatus;

  @override
  String toString() {
    return 'MaterialReceiveByNa(id: $id, createdAt: $createdAt, deliveryOrderId: $deliveryOrderId, materialId: $materialId, materialName: $materialName, materialGroupId: $materialGroupId, designCodeId: $designCodeId, totalQty: $totalQty, vatTotal: $vatTotal, materialUnitId: $materialUnitId, na: $na, purchaseOrderId: $purchaseOrderId, batchNo: $batchNo, materialStatus: $materialStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReceiveByNaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.designCodeId, designCodeId) ||
                other.designCodeId == designCodeId) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.vatTotal, vatTotal) ||
                other.vatTotal == vatTotal) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.materialStatus, materialStatus) ||
                other.materialStatus == materialStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      deliveryOrderId,
      materialId,
      materialName,
      materialGroupId,
      designCodeId,
      totalQty,
      vatTotal,
      materialUnitId,
      na,
      purchaseOrderId,
      batchNo,
      materialStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReceiveByNaImplCopyWith<_$MaterialReceiveByNaImpl> get copyWith =>
      __$$MaterialReceiveByNaImplCopyWithImpl<_$MaterialReceiveByNaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReceiveByNaImplToJson(
      this,
    );
  }
}

abstract class _MaterialReceiveByNa implements MaterialReceiveByNa {
  factory _MaterialReceiveByNa(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'delivery_order_id', defaultValue: '')
      required final String deliveryOrderId,
      @JsonKey(name: 'material_id', defaultValue: '')
      required final String materialId,
      @JsonKey(name: 'material_name', defaultValue: '')
      required final String materialName,
      @JsonKey(name: 'material_group_id', defaultValue: '')
      required final String materialGroupId,
      @JsonKey(name: 'design_code_id', defaultValue: 0)
      required final int designCodeId,
      @JsonKey(name: 'total_quantity', defaultValue: 0)
      required final num totalQty,
      @JsonKey(name: 'vat_total', defaultValue: 0) required final num vatTotal,
      @JsonKey(name: 'material_unit_id', defaultValue: '')
      required final String materialUnitId,
      @JsonKey(defaultValue: '') required final String na,
      @JsonKey(name: 'purchase_order_id', defaultValue: '')
      required final String purchaseOrderId,
      @JsonKey(name: 'batch_no', defaultValue: '')
      required final String batchNo,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      required final MaterialReceiveDetailStatus
          materialStatus}) = _$MaterialReceiveByNaImpl;

  factory _MaterialReceiveByNa.fromJson(Map<String, dynamic> json) =
      _$MaterialReceiveByNaImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'delivery_order_id', defaultValue: '')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'material_id', defaultValue: '')
  String get materialId;
  @override
  @JsonKey(name: 'material_name', defaultValue: '')
  String get materialName;
  @override
  @JsonKey(name: 'material_group_id', defaultValue: '')
  String get materialGroupId;
  @override
  @JsonKey(name: 'design_code_id', defaultValue: 0)
  int get designCodeId;
  @override
  @JsonKey(name: 'total_quantity', defaultValue: 0)
  num get totalQty;
  @override
  @JsonKey(name: 'vat_total', defaultValue: 0)
  num get vatTotal;
  @override
  @JsonKey(name: 'material_unit_id', defaultValue: '')
  String get materialUnitId;
  @override
  @JsonKey(defaultValue: '')
  String get na;
  @override
  @JsonKey(name: 'purchase_order_id', defaultValue: '')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'batch_no', defaultValue: '')
  String get batchNo;
  @override
  @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString)
  MaterialReceiveDetailStatus get materialStatus;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReceiveByNaImplCopyWith<_$MaterialReceiveByNaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
