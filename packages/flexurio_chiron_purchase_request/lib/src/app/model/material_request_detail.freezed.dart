// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_request_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseRequestDetail _$PurchaseRequestDetailFromJson(
    Map<String, dynamic> json) {
  return _PurchaseRequestDetail.fromJson(json);
}

/// @nodoc
mixin _$PurchaseRequestDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
  PurchaseRequestDetailStatus get status => throw _privateConstructorUsedError;
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_form_id', defaultValue: '')
  String get materialRequestFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
  DateTime get confirmAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fast_track')
  bool get isFastTrack => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get batchExpiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String? get batchNo => throw _privateConstructorUsedError;
  String? get productCreate => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
  Material? get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
  MaterialRequest? get materialRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
  Product? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
  MaterialDesign? get materialDesign => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_at', fromJson: dateTimeNullable)
  DateTime? get rejectAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
  DateTime? get confirmMaterialRequestFormAt =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
  DateTime? get closeRequestFormAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_by_id')
  int? get rejectById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int? get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_by_id')
  int? get confirmById => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_request_form_by_id')
  int? get closeRequestFormById => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_material_request_form_by_id')
  int? get confirmMaterialRequestFormById => throw _privateConstructorUsedError;

  /// Serializes this PurchaseRequestDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseRequestDetailCopyWith<PurchaseRequestDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseRequestDetailCopyWith<$Res> {
  factory $PurchaseRequestDetailCopyWith(PurchaseRequestDetail value,
          $Res Function(PurchaseRequestDetail) then) =
      _$PurchaseRequestDetailCopyWithImpl<$Res, PurchaseRequestDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
      PurchaseRequestDetailStatus status,
      MaterialUnit unit,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'material_request_form_id', defaultValue: '')
      String materialRequestFormId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
      DateTime confirmAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      double quantity,
      @JsonKey(name: 'is_fast_track') bool isFastTrack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DateTime? batchExpiredDate,
      @JsonKey(name: 'batch_no') String? batchNo,
      String? productCreate,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      Material? material,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      MaterialRequest? materialRequest,
      @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
      Product? product,
      @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
      MaterialDesign? materialDesign,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullable)
      DateTime? rejectAt,
      @JsonKey(
          name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
      DateTime? confirmMaterialRequestFormAt,
      @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
      DateTime? closeRequestFormAt,
      @JsonKey(name: 'reject_by_id') int? rejectById,
      @JsonKey(name: 'updated_by_id') int? updatedById,
      @JsonKey(name: 'confirm_by_id') int? confirmById,
      @JsonKey(name: 'close_request_form_by_id') int? closeRequestFormById,
      @JsonKey(name: 'confirm_material_request_form_by_id')
      int? confirmMaterialRequestFormById});

  $MaterialUnitCopyWith<$Res> get unit;
  $MaterialCopyWith<$Res>? get material;
  $MaterialRequestCopyWith<$Res>? get materialRequest;
  $ProductCopyWith<$Res>? get product;
  $MaterialDesignCopyWith<$Res>? get materialDesign;
}

/// @nodoc
class _$PurchaseRequestDetailCopyWithImpl<$Res,
        $Val extends PurchaseRequestDetail>
    implements $PurchaseRequestDetailCopyWith<$Res> {
  _$PurchaseRequestDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? unit = null,
    Object? dueDate = null,
    Object? materialRequestFormId = null,
    Object? createdAt = null,
    Object? confirmAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? quantity = null,
    Object? isFastTrack = null,
    Object? batchExpiredDate = freezed,
    Object? batchNo = freezed,
    Object? productCreate = freezed,
    Object? material = freezed,
    Object? materialRequest = freezed,
    Object? product = freezed,
    Object? materialDesign = freezed,
    Object? rejectAt = freezed,
    Object? confirmMaterialRequestFormAt = freezed,
    Object? closeRequestFormAt = freezed,
    Object? rejectById = freezed,
    Object? updatedById = freezed,
    Object? confirmById = freezed,
    Object? closeRequestFormById = freezed,
    Object? confirmMaterialRequestFormById = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestDetailStatus,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestFormId: null == materialRequestFormId
          ? _value.materialRequestFormId
          : materialRequestFormId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmAt: null == confirmAt
          ? _value.confirmAt
          : confirmAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isFastTrack: null == isFastTrack
          ? _value.isFastTrack
          : isFastTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      batchExpiredDate: freezed == batchExpiredDate
          ? _value.batchExpiredDate
          : batchExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      productCreate: freezed == productCreate
          ? _value.productCreate
          : productCreate // ignore: cast_nullable_to_non_nullable
              as String?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      materialRequest: freezed == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      rejectAt: freezed == rejectAt
          ? _value.rejectAt
          : rejectAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmMaterialRequestFormAt: freezed == confirmMaterialRequestFormAt
          ? _value.confirmMaterialRequestFormAt
          : confirmMaterialRequestFormAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeRequestFormAt: freezed == closeRequestFormAt
          ? _value.closeRequestFormAt
          : closeRequestFormAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectById: freezed == rejectById
          ? _value.rejectById
          : rejectById // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmById: freezed == confirmById
          ? _value.confirmById
          : confirmById // ignore: cast_nullable_to_non_nullable
              as int?,
      closeRequestFormById: freezed == closeRequestFormById
          ? _value.closeRequestFormById
          : closeRequestFormById // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmMaterialRequestFormById: freezed == confirmMaterialRequestFormById
          ? _value.confirmMaterialRequestFormById
          : confirmMaterialRequestFormById // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res>? get material {
    if (_value.material == null) {
      return null;
    }

    return $MaterialCopyWith<$Res>(_value.material!, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialRequestCopyWith<$Res>? get materialRequest {
    if (_value.materialRequest == null) {
      return null;
    }

    return $MaterialRequestCopyWith<$Res>(_value.materialRequest!, (value) {
      return _then(_value.copyWith(materialRequest: value) as $Val);
    });
  }

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res>? get materialDesign {
    if (_value.materialDesign == null) {
      return null;
    }

    return $MaterialDesignCopyWith<$Res>(_value.materialDesign!, (value) {
      return _then(_value.copyWith(materialDesign: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseRequestDetailImplCopyWith<$Res>
    implements $PurchaseRequestDetailCopyWith<$Res> {
  factory _$$PurchaseRequestDetailImplCopyWith(
          _$PurchaseRequestDetailImpl value,
          $Res Function(_$PurchaseRequestDetailImpl) then) =
      __$$PurchaseRequestDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
      PurchaseRequestDetailStatus status,
      MaterialUnit unit,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'material_request_form_id', defaultValue: '')
      String materialRequestFormId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
      DateTime confirmAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'created_by_id') int createdById,
      double quantity,
      @JsonKey(name: 'is_fast_track') bool isFastTrack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      DateTime? batchExpiredDate,
      @JsonKey(name: 'batch_no') String? batchNo,
      String? productCreate,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      Material? material,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      MaterialRequest? materialRequest,
      @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
      Product? product,
      @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
      MaterialDesign? materialDesign,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullable)
      DateTime? rejectAt,
      @JsonKey(
          name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
      DateTime? confirmMaterialRequestFormAt,
      @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
      DateTime? closeRequestFormAt,
      @JsonKey(name: 'reject_by_id') int? rejectById,
      @JsonKey(name: 'updated_by_id') int? updatedById,
      @JsonKey(name: 'confirm_by_id') int? confirmById,
      @JsonKey(name: 'close_request_form_by_id') int? closeRequestFormById,
      @JsonKey(name: 'confirm_material_request_form_by_id')
      int? confirmMaterialRequestFormById});

  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $MaterialCopyWith<$Res>? get material;
  @override
  $MaterialRequestCopyWith<$Res>? get materialRequest;
  @override
  $ProductCopyWith<$Res>? get product;
  @override
  $MaterialDesignCopyWith<$Res>? get materialDesign;
}

/// @nodoc
class __$$PurchaseRequestDetailImplCopyWithImpl<$Res>
    extends _$PurchaseRequestDetailCopyWithImpl<$Res,
        _$PurchaseRequestDetailImpl>
    implements _$$PurchaseRequestDetailImplCopyWith<$Res> {
  __$$PurchaseRequestDetailImplCopyWithImpl(_$PurchaseRequestDetailImpl _value,
      $Res Function(_$PurchaseRequestDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? unit = null,
    Object? dueDate = null,
    Object? materialRequestFormId = null,
    Object? createdAt = null,
    Object? confirmAt = null,
    Object? updatedAt = null,
    Object? createdById = null,
    Object? quantity = null,
    Object? isFastTrack = null,
    Object? batchExpiredDate = freezed,
    Object? batchNo = freezed,
    Object? productCreate = freezed,
    Object? material = freezed,
    Object? materialRequest = freezed,
    Object? product = freezed,
    Object? materialDesign = freezed,
    Object? rejectAt = freezed,
    Object? confirmMaterialRequestFormAt = freezed,
    Object? closeRequestFormAt = freezed,
    Object? rejectById = freezed,
    Object? updatedById = freezed,
    Object? confirmById = freezed,
    Object? closeRequestFormById = freezed,
    Object? confirmMaterialRequestFormById = freezed,
  }) {
    return _then(_$PurchaseRequestDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestDetailStatus,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestFormId: null == materialRequestFormId
          ? _value.materialRequestFormId
          : materialRequestFormId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmAt: null == confirmAt
          ? _value.confirmAt
          : confirmAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      isFastTrack: null == isFastTrack
          ? _value.isFastTrack
          : isFastTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      batchExpiredDate: freezed == batchExpiredDate
          ? _value.batchExpiredDate
          : batchExpiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNo: freezed == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String?,
      productCreate: freezed == productCreate
          ? _value.productCreate
          : productCreate // ignore: cast_nullable_to_non_nullable
              as String?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      materialRequest: freezed == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      rejectAt: freezed == rejectAt
          ? _value.rejectAt
          : rejectAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmMaterialRequestFormAt: freezed == confirmMaterialRequestFormAt
          ? _value.confirmMaterialRequestFormAt
          : confirmMaterialRequestFormAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeRequestFormAt: freezed == closeRequestFormAt
          ? _value.closeRequestFormAt
          : closeRequestFormAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectById: freezed == rejectById
          ? _value.rejectById
          : rejectById // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedById: freezed == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmById: freezed == confirmById
          ? _value.confirmById
          : confirmById // ignore: cast_nullable_to_non_nullable
              as int?,
      closeRequestFormById: freezed == closeRequestFormById
          ? _value.closeRequestFormById
          : closeRequestFormById // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmMaterialRequestFormById: freezed == confirmMaterialRequestFormById
          ? _value.confirmMaterialRequestFormById
          : confirmMaterialRequestFormById // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseRequestDetailImpl extends _PurchaseRequestDetail {
  const _$PurchaseRequestDetailImpl(
      {required this.id,
      @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
      required this.status,
      required this.unit,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'material_request_form_id', defaultValue: '')
      required this.materialRequestFormId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
      required this.confirmAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      this.quantity = 0,
      @JsonKey(name: 'is_fast_track') this.isFastTrack = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.batchExpiredDate,
      @JsonKey(name: 'batch_no') this.batchNo,
      this.productCreate,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      this.material,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      this.materialRequest,
      @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
      this.product,
      @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
      this.materialDesign,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullable) this.rejectAt,
      @JsonKey(
          name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
      this.confirmMaterialRequestFormAt,
      @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
      this.closeRequestFormAt,
      @JsonKey(name: 'reject_by_id') this.rejectById,
      @JsonKey(name: 'updated_by_id') this.updatedById,
      @JsonKey(name: 'confirm_by_id') this.confirmById,
      @JsonKey(name: 'close_request_form_by_id') this.closeRequestFormById,
      @JsonKey(name: 'confirm_material_request_form_by_id')
      this.confirmMaterialRequestFormById})
      : super._();

  factory _$PurchaseRequestDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseRequestDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
  final PurchaseRequestDetailStatus status;
  @override
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'material_request_form_id', defaultValue: '')
  final String materialRequestFormId;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
  final DateTime confirmAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey()
  final double quantity;
  @override
  @JsonKey(name: 'is_fast_track')
  final bool isFastTrack;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final DateTime? batchExpiredDate;
  @override
  @JsonKey(name: 'batch_no')
  final String? batchNo;
  @override
  final String? productCreate;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
  final Material? material;
  @override
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
  final MaterialRequest? materialRequest;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
  final Product? product;
  @override
  @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
  final MaterialDesign? materialDesign;
  @override
  @JsonKey(name: 'reject_at', fromJson: dateTimeNullable)
  final DateTime? rejectAt;
  @override
  @JsonKey(name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
  final DateTime? confirmMaterialRequestFormAt;
  @override
  @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
  final DateTime? closeRequestFormAt;
  @override
  @JsonKey(name: 'reject_by_id')
  final int? rejectById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int? updatedById;
  @override
  @JsonKey(name: 'confirm_by_id')
  final int? confirmById;
  @override
  @JsonKey(name: 'close_request_form_by_id')
  final int? closeRequestFormById;
  @override
  @JsonKey(name: 'confirm_material_request_form_by_id')
  final int? confirmMaterialRequestFormById;

  @override
  String toString() {
    return 'PurchaseRequestDetail(id: $id, status: $status, unit: $unit, dueDate: $dueDate, materialRequestFormId: $materialRequestFormId, createdAt: $createdAt, confirmAt: $confirmAt, updatedAt: $updatedAt, createdById: $createdById, quantity: $quantity, isFastTrack: $isFastTrack, batchExpiredDate: $batchExpiredDate, batchNo: $batchNo, productCreate: $productCreate, material: $material, materialRequest: $materialRequest, product: $product, materialDesign: $materialDesign, rejectAt: $rejectAt, confirmMaterialRequestFormAt: $confirmMaterialRequestFormAt, closeRequestFormAt: $closeRequestFormAt, rejectById: $rejectById, updatedById: $updatedById, confirmById: $confirmById, closeRequestFormById: $closeRequestFormById, confirmMaterialRequestFormById: $confirmMaterialRequestFormById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseRequestDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.materialRequestFormId, materialRequestFormId) ||
                other.materialRequestFormId == materialRequestFormId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.confirmAt, confirmAt) ||
                other.confirmAt == confirmAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isFastTrack, isFastTrack) ||
                other.isFastTrack == isFastTrack) &&
            (identical(other.batchExpiredDate, batchExpiredDate) ||
                other.batchExpiredDate == batchExpiredDate) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.productCreate, productCreate) ||
                other.productCreate == productCreate) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialRequest, materialRequest) ||
                other.materialRequest == materialRequest) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign) &&
            (identical(other.rejectAt, rejectAt) ||
                other.rejectAt == rejectAt) &&
            (identical(other.confirmMaterialRequestFormAt,
                    confirmMaterialRequestFormAt) ||
                other.confirmMaterialRequestFormAt ==
                    confirmMaterialRequestFormAt) &&
            (identical(other.closeRequestFormAt, closeRequestFormAt) ||
                other.closeRequestFormAt == closeRequestFormAt) &&
            (identical(other.rejectById, rejectById) ||
                other.rejectById == rejectById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.confirmById, confirmById) ||
                other.confirmById == confirmById) &&
            (identical(other.closeRequestFormById, closeRequestFormById) ||
                other.closeRequestFormById == closeRequestFormById) &&
            (identical(other.confirmMaterialRequestFormById,
                    confirmMaterialRequestFormById) ||
                other.confirmMaterialRequestFormById ==
                    confirmMaterialRequestFormById));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        status,
        unit,
        dueDate,
        materialRequestFormId,
        createdAt,
        confirmAt,
        updatedAt,
        createdById,
        quantity,
        isFastTrack,
        batchExpiredDate,
        batchNo,
        productCreate,
        material,
        materialRequest,
        product,
        materialDesign,
        rejectAt,
        confirmMaterialRequestFormAt,
        closeRequestFormAt,
        rejectById,
        updatedById,
        confirmById,
        closeRequestFormById,
        confirmMaterialRequestFormById
      ]);

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseRequestDetailImplCopyWith<_$PurchaseRequestDetailImpl>
      get copyWith => __$$PurchaseRequestDetailImplCopyWithImpl<
          _$PurchaseRequestDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseRequestDetailImplToJson(
      this,
    );
  }
}

abstract class _PurchaseRequestDetail extends PurchaseRequestDetail {
  const factory _PurchaseRequestDetail(
      {required final int id,
      @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
      required final PurchaseRequestDetailStatus status,
      required final MaterialUnit unit,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'material_request_form_id', defaultValue: '')
      required final String materialRequestFormId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
      required final DateTime confirmAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      final double quantity,
      @JsonKey(name: 'is_fast_track') final bool isFastTrack,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final DateTime? batchExpiredDate,
      @JsonKey(name: 'batch_no') final String? batchNo,
      final String? productCreate,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      final Material? material,
      @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
      final MaterialRequest? materialRequest,
      @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
      final Product? product,
      @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
      final MaterialDesign? materialDesign,
      @JsonKey(name: 'reject_at', fromJson: dateTimeNullable)
      final DateTime? rejectAt,
      @JsonKey(
          name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
      final DateTime? confirmMaterialRequestFormAt,
      @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
      final DateTime? closeRequestFormAt,
      @JsonKey(name: 'reject_by_id') final int? rejectById,
      @JsonKey(name: 'updated_by_id') final int? updatedById,
      @JsonKey(name: 'confirm_by_id') final int? confirmById,
      @JsonKey(name: 'close_request_form_by_id')
      final int? closeRequestFormById,
      @JsonKey(name: 'confirm_material_request_form_by_id')
      final int? confirmMaterialRequestFormById}) = _$PurchaseRequestDetailImpl;
  const _PurchaseRequestDetail._() : super._();

  factory _PurchaseRequestDetail.fromJson(Map<String, dynamic> json) =
      _$PurchaseRequestDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
  PurchaseRequestDetailStatus get status;
  @override
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'material_request_form_id', defaultValue: '')
  String get materialRequestFormId;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
  DateTime get confirmAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'is_fast_track')
  bool get isFastTrack;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get batchExpiredDate;
  @override
  @JsonKey(name: 'batch_no')
  String? get batchNo;
  @override
  String? get productCreate;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
  Material? get material;
  @override
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJson)
  MaterialRequest? get materialRequest;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJsonNullable)
  Product? get product;
  @override
  @JsonKey(name: 'design_code', fromJson: MaterialDesign.fromJsonNullable)
  MaterialDesign? get materialDesign;
  @override
  @JsonKey(name: 'reject_at', fromJson: dateTimeNullable)
  DateTime? get rejectAt;
  @override
  @JsonKey(name: 'confirm_material_request_form_at', fromJson: dateTimeNullable)
  DateTime? get confirmMaterialRequestFormAt;
  @override
  @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
  DateTime? get closeRequestFormAt;
  @override
  @JsonKey(name: 'reject_by_id')
  int? get rejectById;
  @override
  @JsonKey(name: 'updated_by_id')
  int? get updatedById;
  @override
  @JsonKey(name: 'confirm_by_id')
  int? get confirmById;
  @override
  @JsonKey(name: 'close_request_form_by_id')
  int? get closeRequestFormById;
  @override
  @JsonKey(name: 'confirm_material_request_form_by_id')
  int? get confirmMaterialRequestFormById;

  /// Create a copy of PurchaseRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseRequestDetailImplCopyWith<_$PurchaseRequestDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
