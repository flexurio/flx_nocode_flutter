// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_outstanding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderOutstanding _$PurchaseOrderOutstandingFromJson(
    Map<String, dynamic> json) {
  return _PurchaseOrderOutstanding.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderOutstanding {
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  String get divisi => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_id')
  String get materialRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
  DateTime get materialRequestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_material_request')
  String get periodMaterialRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_po')
  int get quantityPo => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'period_date_of_need')
  String get periodDateOfNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
  DateTime get materialRequestDueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_detail_status')
  String get materialRequestDetailStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
  DateTime get purchaseOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_received_converted')
  int get quantityReceivedConverted => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
  DateTime get materialReceiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_release_converted')
  int get quantityReleaseConverted => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_reject_converted')
  int get quantityRejectConverted => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_receive_material_status_qc')
  String get materialReceiveMaterialStatusQc =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_quarantine')
  int get quantityQuarantine => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  DateTime get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
  DateTime get rejectDate => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_description')
  String get purchaseOrderDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code_id')
  String get designCodeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_status')
  String get purchaseOrderStatus => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderOutstanding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderOutstanding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderOutstandingCopyWith<PurchaseOrderOutstanding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderOutstandingCopyWith<$Res> {
  factory $PurchaseOrderOutstandingCopyWith(PurchaseOrderOutstanding value,
          $Res Function(PurchaseOrderOutstanding) then) =
      _$PurchaseOrderOutstandingCopyWithImpl<$Res, PurchaseOrderOutstanding>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      String divisi,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_request_id') String materialRequestId,
      @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
      DateTime materialRequestDate,
      @JsonKey(name: 'period_material_request') String periodMaterialRequest,
      @JsonKey(name: 'quantity_po') int quantityPo,
      int value,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'period_date_of_need') String periodDateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      DateTime materialRequestDueDate,
      @JsonKey(name: 'material_request_detail_status')
      String materialRequestDetailStatus,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      DateTime purchaseOrderDate,
      @JsonKey(name: 'transaction_id') String transactionId,
      int quantity,
      @JsonKey(name: 'quantity_received_converted')
      int quantityReceivedConverted,
      @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
      DateTime materialReceiveDate,
      @JsonKey(name: 'quantity_release_converted') int quantityReleaseConverted,
      @JsonKey(name: 'quantity_reject_converted') int quantityRejectConverted,
      @JsonKey(name: 'material_receive_material_status_qc')
      String materialReceiveMaterialStatusQc,
      @JsonKey(name: 'quantity_quarantine') int quantityQuarantine,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      DateTime releaseDate,
      @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
      DateTime rejectDate,
      String na,
      @JsonKey(name: 'purchase_order_description')
      String purchaseOrderDescription,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'design_code_id') String designCodeId,
      @JsonKey(name: 'purchase_order_status') String purchaseOrderStatus});
}

/// @nodoc
class _$PurchaseOrderOutstandingCopyWithImpl<$Res,
        $Val extends PurchaseOrderOutstanding>
    implements $PurchaseOrderOutstandingCopyWith<$Res> {
  _$PurchaseOrderOutstandingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderOutstanding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? divisi = null,
    Object? materialGroupId = null,
    Object? materialRequestId = null,
    Object? materialRequestDate = null,
    Object? periodMaterialRequest = null,
    Object? quantityPo = null,
    Object? value = null,
    Object? unitId = null,
    Object? dateOfNeed = null,
    Object? periodDateOfNeed = null,
    Object? materialRequestDueDate = null,
    Object? materialRequestDetailStatus = null,
    Object? purchaseOrderId = null,
    Object? purchaseOrderDate = null,
    Object? transactionId = null,
    Object? quantity = null,
    Object? quantityReceivedConverted = null,
    Object? materialReceiveDate = null,
    Object? quantityReleaseConverted = null,
    Object? quantityRejectConverted = null,
    Object? materialReceiveMaterialStatusQc = null,
    Object? quantityQuarantine = null,
    Object? releaseDate = null,
    Object? rejectDate = null,
    Object? na = null,
    Object? purchaseOrderDescription = null,
    Object? supplierName = null,
    Object? designCodeId = null,
    Object? purchaseOrderStatus = null,
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
      divisi: null == divisi
          ? _value.divisi
          : divisi // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequestId: null == materialRequestId
          ? _value.materialRequestId
          : materialRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequestDate: null == materialRequestDate
          ? _value.materialRequestDate
          : materialRequestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodMaterialRequest: null == periodMaterialRequest
          ? _value.periodMaterialRequest
          : periodMaterialRequest // ignore: cast_nullable_to_non_nullable
              as String,
      quantityPo: null == quantityPo
          ? _value.quantityPo
          : quantityPo // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodDateOfNeed: null == periodDateOfNeed
          ? _value.periodDateOfNeed
          : periodDateOfNeed // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequestDueDate: null == materialRequestDueDate
          ? _value.materialRequestDueDate
          : materialRequestDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestDetailStatus: null == materialRequestDetailStatus
          ? _value.materialRequestDetailStatus
          : materialRequestDetailStatus // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDate: null == purchaseOrderDate
          ? _value.purchaseOrderDate
          : purchaseOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      quantityReceivedConverted: null == quantityReceivedConverted
          ? _value.quantityReceivedConverted
          : quantityReceivedConverted // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceiveDate: null == materialReceiveDate
          ? _value.materialReceiveDate
          : materialReceiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantityReleaseConverted: null == quantityReleaseConverted
          ? _value.quantityReleaseConverted
          : quantityReleaseConverted // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRejectConverted: null == quantityRejectConverted
          ? _value.quantityRejectConverted
          : quantityRejectConverted // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceiveMaterialStatusQc: null == materialReceiveMaterialStatusQc
          ? _value.materialReceiveMaterialStatusQc
          : materialReceiveMaterialStatusQc // ignore: cast_nullable_to_non_nullable
              as String,
      quantityQuarantine: null == quantityQuarantine
          ? _value.quantityQuarantine
          : quantityQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rejectDate: null == rejectDate
          ? _value.rejectDate
          : rejectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDescription: null == purchaseOrderDescription
          ? _value.purchaseOrderDescription
          : purchaseOrderDescription // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      designCodeId: null == designCodeId
          ? _value.designCodeId
          : designCodeId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderStatus: null == purchaseOrderStatus
          ? _value.purchaseOrderStatus
          : purchaseOrderStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderOutstandingImplCopyWith<$Res>
    implements $PurchaseOrderOutstandingCopyWith<$Res> {
  factory _$$PurchaseOrderOutstandingImplCopyWith(
          _$PurchaseOrderOutstandingImpl value,
          $Res Function(_$PurchaseOrderOutstandingImpl) then) =
      __$$PurchaseOrderOutstandingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      String divisi,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_request_id') String materialRequestId,
      @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
      DateTime materialRequestDate,
      @JsonKey(name: 'period_material_request') String periodMaterialRequest,
      @JsonKey(name: 'quantity_po') int quantityPo,
      int value,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'period_date_of_need') String periodDateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      DateTime materialRequestDueDate,
      @JsonKey(name: 'material_request_detail_status')
      String materialRequestDetailStatus,
      @JsonKey(name: 'purchase_order_id') String purchaseOrderId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      DateTime purchaseOrderDate,
      @JsonKey(name: 'transaction_id') String transactionId,
      int quantity,
      @JsonKey(name: 'quantity_received_converted')
      int quantityReceivedConverted,
      @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
      DateTime materialReceiveDate,
      @JsonKey(name: 'quantity_release_converted') int quantityReleaseConverted,
      @JsonKey(name: 'quantity_reject_converted') int quantityRejectConverted,
      @JsonKey(name: 'material_receive_material_status_qc')
      String materialReceiveMaterialStatusQc,
      @JsonKey(name: 'quantity_quarantine') int quantityQuarantine,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      DateTime releaseDate,
      @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
      DateTime rejectDate,
      String na,
      @JsonKey(name: 'purchase_order_description')
      String purchaseOrderDescription,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'design_code_id') String designCodeId,
      @JsonKey(name: 'purchase_order_status') String purchaseOrderStatus});
}

/// @nodoc
class __$$PurchaseOrderOutstandingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderOutstandingCopyWithImpl<$Res,
        _$PurchaseOrderOutstandingImpl>
    implements _$$PurchaseOrderOutstandingImplCopyWith<$Res> {
  __$$PurchaseOrderOutstandingImplCopyWithImpl(
      _$PurchaseOrderOutstandingImpl _value,
      $Res Function(_$PurchaseOrderOutstandingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderOutstanding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialId = null,
    Object? materialName = null,
    Object? divisi = null,
    Object? materialGroupId = null,
    Object? materialRequestId = null,
    Object? materialRequestDate = null,
    Object? periodMaterialRequest = null,
    Object? quantityPo = null,
    Object? value = null,
    Object? unitId = null,
    Object? dateOfNeed = null,
    Object? periodDateOfNeed = null,
    Object? materialRequestDueDate = null,
    Object? materialRequestDetailStatus = null,
    Object? purchaseOrderId = null,
    Object? purchaseOrderDate = null,
    Object? transactionId = null,
    Object? quantity = null,
    Object? quantityReceivedConverted = null,
    Object? materialReceiveDate = null,
    Object? quantityReleaseConverted = null,
    Object? quantityRejectConverted = null,
    Object? materialReceiveMaterialStatusQc = null,
    Object? quantityQuarantine = null,
    Object? releaseDate = null,
    Object? rejectDate = null,
    Object? na = null,
    Object? purchaseOrderDescription = null,
    Object? supplierName = null,
    Object? designCodeId = null,
    Object? purchaseOrderStatus = null,
  }) {
    return _then(_$PurchaseOrderOutstandingImpl(
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      divisi: null == divisi
          ? _value.divisi
          : divisi // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequestId: null == materialRequestId
          ? _value.materialRequestId
          : materialRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequestDate: null == materialRequestDate
          ? _value.materialRequestDate
          : materialRequestDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodMaterialRequest: null == periodMaterialRequest
          ? _value.periodMaterialRequest
          : periodMaterialRequest // ignore: cast_nullable_to_non_nullable
              as String,
      quantityPo: null == quantityPo
          ? _value.quantityPo
          : quantityPo // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodDateOfNeed: null == periodDateOfNeed
          ? _value.periodDateOfNeed
          : periodDateOfNeed // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequestDueDate: null == materialRequestDueDate
          ? _value.materialRequestDueDate
          : materialRequestDueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialRequestDetailStatus: null == materialRequestDetailStatus
          ? _value.materialRequestDetailStatus
          : materialRequestDetailStatus // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDate: null == purchaseOrderDate
          ? _value.purchaseOrderDate
          : purchaseOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      quantityReceivedConverted: null == quantityReceivedConverted
          ? _value.quantityReceivedConverted
          : quantityReceivedConverted // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceiveDate: null == materialReceiveDate
          ? _value.materialReceiveDate
          : materialReceiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantityReleaseConverted: null == quantityReleaseConverted
          ? _value.quantityReleaseConverted
          : quantityReleaseConverted // ignore: cast_nullable_to_non_nullable
              as int,
      quantityRejectConverted: null == quantityRejectConverted
          ? _value.quantityRejectConverted
          : quantityRejectConverted // ignore: cast_nullable_to_non_nullable
              as int,
      materialReceiveMaterialStatusQc: null == materialReceiveMaterialStatusQc
          ? _value.materialReceiveMaterialStatusQc
          : materialReceiveMaterialStatusQc // ignore: cast_nullable_to_non_nullable
              as String,
      quantityQuarantine: null == quantityQuarantine
          ? _value.quantityQuarantine
          : quantityQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rejectDate: null == rejectDate
          ? _value.rejectDate
          : rejectDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDescription: null == purchaseOrderDescription
          ? _value.purchaseOrderDescription
          : purchaseOrderDescription // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      designCodeId: null == designCodeId
          ? _value.designCodeId
          : designCodeId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderStatus: null == purchaseOrderStatus
          ? _value.purchaseOrderStatus
          : purchaseOrderStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderOutstandingImpl implements _PurchaseOrderOutstanding {
  const _$PurchaseOrderOutstandingImpl(
      {@JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      required this.divisi,
      @JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'material_request_id') required this.materialRequestId,
      @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
      required this.materialRequestDate,
      @JsonKey(name: 'period_material_request')
      required this.periodMaterialRequest,
      @JsonKey(name: 'quantity_po') required this.quantityPo,
      required this.value,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required this.dateOfNeed,
      @JsonKey(name: 'period_date_of_need') required this.periodDateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      required this.materialRequestDueDate,
      @JsonKey(name: 'material_request_detail_status')
      required this.materialRequestDetailStatus,
      @JsonKey(name: 'purchase_order_id') required this.purchaseOrderId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      required this.purchaseOrderDate,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      required this.quantity,
      @JsonKey(name: 'quantity_received_converted')
      required this.quantityReceivedConverted,
      @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
      required this.materialReceiveDate,
      @JsonKey(name: 'quantity_release_converted')
      required this.quantityReleaseConverted,
      @JsonKey(name: 'quantity_reject_converted')
      required this.quantityRejectConverted,
      @JsonKey(name: 'material_receive_material_status_qc')
      required this.materialReceiveMaterialStatusQc,
      @JsonKey(name: 'quantity_quarantine') required this.quantityQuarantine,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      required this.releaseDate,
      @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
      required this.rejectDate,
      required this.na,
      @JsonKey(name: 'purchase_order_description')
      required this.purchaseOrderDescription,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'design_code_id') required this.designCodeId,
      @JsonKey(name: 'purchase_order_status')
      required this.purchaseOrderStatus});

  factory _$PurchaseOrderOutstandingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderOutstandingImplFromJson(json);

  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  final String divisi;
  @override
  @JsonKey(name: 'material_group_id')
  final String materialGroupId;
  @override
  @JsonKey(name: 'material_request_id')
  final String materialRequestId;
  @override
  @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
  final DateTime materialRequestDate;
  @override
  @JsonKey(name: 'period_material_request')
  final String periodMaterialRequest;
  @override
  @JsonKey(name: 'quantity_po')
  final int quantityPo;
  @override
  final int value;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  final DateTime dateOfNeed;
  @override
  @JsonKey(name: 'period_date_of_need')
  final String periodDateOfNeed;
  @override
  @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
  final DateTime materialRequestDueDate;
  @override
  @JsonKey(name: 'material_request_detail_status')
  final String materialRequestDetailStatus;
  @override
  @JsonKey(name: 'purchase_order_id')
  final String purchaseOrderId;
  @override
  @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
  final DateTime purchaseOrderDate;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'quantity_received_converted')
  final int quantityReceivedConverted;
  @override
  @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
  final DateTime materialReceiveDate;
  @override
  @JsonKey(name: 'quantity_release_converted')
  final int quantityReleaseConverted;
  @override
  @JsonKey(name: 'quantity_reject_converted')
  final int quantityRejectConverted;
  @override
  @JsonKey(name: 'material_receive_material_status_qc')
  final String materialReceiveMaterialStatusQc;
  @override
  @JsonKey(name: 'quantity_quarantine')
  final int quantityQuarantine;
  @override
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  final DateTime releaseDate;
  @override
  @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
  final DateTime rejectDate;
  @override
  final String na;
  @override
  @JsonKey(name: 'purchase_order_description')
  final String purchaseOrderDescription;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'design_code_id')
  final String designCodeId;
  @override
  @JsonKey(name: 'purchase_order_status')
  final String purchaseOrderStatus;

  @override
  String toString() {
    return 'PurchaseOrderOutstanding(materialId: $materialId, materialName: $materialName, divisi: $divisi, materialGroupId: $materialGroupId, materialRequestId: $materialRequestId, materialRequestDate: $materialRequestDate, periodMaterialRequest: $periodMaterialRequest, quantityPo: $quantityPo, value: $value, unitId: $unitId, dateOfNeed: $dateOfNeed, periodDateOfNeed: $periodDateOfNeed, materialRequestDueDate: $materialRequestDueDate, materialRequestDetailStatus: $materialRequestDetailStatus, purchaseOrderId: $purchaseOrderId, purchaseOrderDate: $purchaseOrderDate, transactionId: $transactionId, quantity: $quantity, quantityReceivedConverted: $quantityReceivedConverted, materialReceiveDate: $materialReceiveDate, quantityReleaseConverted: $quantityReleaseConverted, quantityRejectConverted: $quantityRejectConverted, materialReceiveMaterialStatusQc: $materialReceiveMaterialStatusQc, quantityQuarantine: $quantityQuarantine, releaseDate: $releaseDate, rejectDate: $rejectDate, na: $na, purchaseOrderDescription: $purchaseOrderDescription, supplierName: $supplierName, designCodeId: $designCodeId, purchaseOrderStatus: $purchaseOrderStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderOutstandingImpl &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.divisi, divisi) || other.divisi == divisi) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.materialRequestId, materialRequestId) ||
                other.materialRequestId == materialRequestId) &&
            (identical(other.materialRequestDate, materialRequestDate) ||
                other.materialRequestDate == materialRequestDate) &&
            (identical(other.periodMaterialRequest, periodMaterialRequest) ||
                other.periodMaterialRequest == periodMaterialRequest) &&
            (identical(other.quantityPo, quantityPo) ||
                other.quantityPo == quantityPo) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.dateOfNeed, dateOfNeed) ||
                other.dateOfNeed == dateOfNeed) &&
            (identical(other.periodDateOfNeed, periodDateOfNeed) ||
                other.periodDateOfNeed == periodDateOfNeed) &&
            (identical(other.materialRequestDueDate, materialRequestDueDate) ||
                other.materialRequestDueDate == materialRequestDueDate) &&
            (identical(other.materialRequestDetailStatus, materialRequestDetailStatus) ||
                other.materialRequestDetailStatus ==
                    materialRequestDetailStatus) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId) &&
            (identical(other.purchaseOrderDate, purchaseOrderDate) ||
                other.purchaseOrderDate == purchaseOrderDate) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.quantityReceivedConverted, quantityReceivedConverted) ||
                other.quantityReceivedConverted == quantityReceivedConverted) &&
            (identical(other.materialReceiveDate, materialReceiveDate) ||
                other.materialReceiveDate == materialReceiveDate) &&
            (identical(other.quantityReleaseConverted, quantityReleaseConverted) ||
                other.quantityReleaseConverted == quantityReleaseConverted) &&
            (identical(other.quantityRejectConverted, quantityRejectConverted) ||
                other.quantityRejectConverted == quantityRejectConverted) &&
            (identical(other.materialReceiveMaterialStatusQc, materialReceiveMaterialStatusQc) ||
                other.materialReceiveMaterialStatusQc ==
                    materialReceiveMaterialStatusQc) &&
            (identical(other.quantityQuarantine, quantityQuarantine) ||
                other.quantityQuarantine == quantityQuarantine) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.rejectDate, rejectDate) ||
                other.rejectDate == rejectDate) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(
                    other.purchaseOrderDescription, purchaseOrderDescription) ||
                other.purchaseOrderDescription == purchaseOrderDescription) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.designCodeId, designCodeId) ||
                other.designCodeId == designCodeId) &&
            (identical(other.purchaseOrderStatus, purchaseOrderStatus) ||
                other.purchaseOrderStatus == purchaseOrderStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        materialId,
        materialName,
        divisi,
        materialGroupId,
        materialRequestId,
        materialRequestDate,
        periodMaterialRequest,
        quantityPo,
        value,
        unitId,
        dateOfNeed,
        periodDateOfNeed,
        materialRequestDueDate,
        materialRequestDetailStatus,
        purchaseOrderId,
        purchaseOrderDate,
        transactionId,
        quantity,
        quantityReceivedConverted,
        materialReceiveDate,
        quantityReleaseConverted,
        quantityRejectConverted,
        materialReceiveMaterialStatusQc,
        quantityQuarantine,
        releaseDate,
        rejectDate,
        na,
        purchaseOrderDescription,
        supplierName,
        designCodeId,
        purchaseOrderStatus
      ]);

  /// Create a copy of PurchaseOrderOutstanding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderOutstandingImplCopyWith<_$PurchaseOrderOutstandingImpl>
      get copyWith => __$$PurchaseOrderOutstandingImplCopyWithImpl<
          _$PurchaseOrderOutstandingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderOutstandingImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderOutstanding implements PurchaseOrderOutstanding {
  const factory _PurchaseOrderOutstanding(
      {@JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      required final String divisi,
      @JsonKey(name: 'material_group_id') required final String materialGroupId,
      @JsonKey(name: 'material_request_id')
      required final String materialRequestId,
      @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
      required final DateTime materialRequestDate,
      @JsonKey(name: 'period_material_request')
      required final String periodMaterialRequest,
      @JsonKey(name: 'quantity_po') required final int quantityPo,
      required final int value,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required final DateTime dateOfNeed,
      @JsonKey(name: 'period_date_of_need')
      required final String periodDateOfNeed,
      @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
      required final DateTime materialRequestDueDate,
      @JsonKey(name: 'material_request_detail_status')
      required final String materialRequestDetailStatus,
      @JsonKey(name: 'purchase_order_id') required final String purchaseOrderId,
      @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
      required final DateTime purchaseOrderDate,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      required final int quantity,
      @JsonKey(name: 'quantity_received_converted')
      required final int quantityReceivedConverted,
      @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
      required final DateTime materialReceiveDate,
      @JsonKey(name: 'quantity_release_converted')
      required final int quantityReleaseConverted,
      @JsonKey(name: 'quantity_reject_converted')
      required final int quantityRejectConverted,
      @JsonKey(name: 'material_receive_material_status_qc')
      required final String materialReceiveMaterialStatusQc,
      @JsonKey(name: 'quantity_quarantine')
      required final int quantityQuarantine,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      required final DateTime releaseDate,
      @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
      required final DateTime rejectDate,
      required final String na,
      @JsonKey(name: 'purchase_order_description')
      required final String purchaseOrderDescription,
      @JsonKey(name: 'supplier_name') required final String supplierName,
      @JsonKey(name: 'design_code_id') required final String designCodeId,
      @JsonKey(name: 'purchase_order_status')
      required final String
          purchaseOrderStatus}) = _$PurchaseOrderOutstandingImpl;

  factory _PurchaseOrderOutstanding.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderOutstandingImpl.fromJson;

  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  String get divisi;
  @override
  @JsonKey(name: 'material_group_id')
  String get materialGroupId;
  @override
  @JsonKey(name: 'material_request_id')
  String get materialRequestId;
  @override
  @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime)
  DateTime get materialRequestDate;
  @override
  @JsonKey(name: 'period_material_request')
  String get periodMaterialRequest;
  @override
  @JsonKey(name: 'quantity_po')
  int get quantityPo;
  @override
  int get value;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed;
  @override
  @JsonKey(name: 'period_date_of_need')
  String get periodDateOfNeed;
  @override
  @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime)
  DateTime get materialRequestDueDate;
  @override
  @JsonKey(name: 'material_request_detail_status')
  String get materialRequestDetailStatus;
  @override
  @JsonKey(name: 'purchase_order_id')
  String get purchaseOrderId;
  @override
  @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime)
  DateTime get purchaseOrderDate;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'quantity_received_converted')
  int get quantityReceivedConverted;
  @override
  @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime)
  DateTime get materialReceiveDate;
  @override
  @JsonKey(name: 'quantity_release_converted')
  int get quantityReleaseConverted;
  @override
  @JsonKey(name: 'quantity_reject_converted')
  int get quantityRejectConverted;
  @override
  @JsonKey(name: 'material_receive_material_status_qc')
  String get materialReceiveMaterialStatusQc;
  @override
  @JsonKey(name: 'quantity_quarantine')
  int get quantityQuarantine;
  @override
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  DateTime get releaseDate;
  @override
  @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime)
  DateTime get rejectDate;
  @override
  String get na;
  @override
  @JsonKey(name: 'purchase_order_description')
  String get purchaseOrderDescription;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'design_code_id')
  String get designCodeId;
  @override
  @JsonKey(name: 'purchase_order_status')
  String get purchaseOrderStatus;

  /// Create a copy of PurchaseOrderOutstanding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderOutstandingImplCopyWith<_$PurchaseOrderOutstandingImpl>
      get copyWith => throw _privateConstructorUsedError;
}
