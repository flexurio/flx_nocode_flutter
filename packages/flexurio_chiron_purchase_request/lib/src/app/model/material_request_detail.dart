import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_request_detail.freezed.dart';
part 'material_request_detail.g.dart';

@freezed
class PurchaseRequestDetail with _$PurchaseRequestDetail {
  const factory PurchaseRequestDetail({
    required int id,
    @JsonKey(fromJson: _purchaseRequestDetailStatusFromString)
    required PurchaseRequestDetailStatus status,
    required MaterialUnit unit,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
    required DateTime dueDate,
    @JsonKey(name: 'material_request_form_id', defaultValue: '')
    required String materialRequestFormId,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'confirm_at', fromJson: isoDateToDateTime)
    required DateTime confirmAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @Default(0) double quantity,
    @Default(false) @JsonKey(name: 'is_fast_track') bool isFastTrack,
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
    @JsonKey(name: 'reject_at', fromJson: dateTimeNullable) DateTime? rejectAt,
    @JsonKey(
      name: 'confirm_material_request_form_at',
      fromJson: dateTimeNullable,
    )
    DateTime? confirmMaterialRequestFormAt,
    @JsonKey(name: 'close_request_form_at', fromJson: dateTimeNullable)
    DateTime? closeRequestFormAt,
    @JsonKey(name: 'reject_by_id') int? rejectById,
    @JsonKey(name: 'updated_by_id') int? updatedById,
    @JsonKey(name: 'confirm_by_id') int? confirmById,
    @JsonKey(name: 'close_request_form_by_id') int? closeRequestFormById,
    @JsonKey(name: 'confirm_material_request_form_by_id')
    int? confirmMaterialRequestFormById,
  }) = _PurchaseRequestDetail;
  const PurchaseRequestDetail._();

  factory PurchaseRequestDetail.fromRequestFormDetail(
    RequestFormDetail detail,
  ) {
    return PurchaseRequestDetail(
      id: detail.id,
      status: PurchaseRequestDetailStatus.empty,
      unit: detail.unit ?? MaterialUnit.empty(),
      quantity: detail.quantity,
      isFastTrack: detail.isFastTrack,
      material: detail.material,
      materialRequest: detail.materialRequest,
      dueDate: DateTime.now(),
      createdAt: DateTime.now(),
      confirmAt: DateTime.now(),
      updatedAt: DateTime.now(),
      createdById: 0,
      updatedById: 0,
      confirmById: 0,
      closeRequestFormById: 0,
      materialRequestFormId: '',
    );
  }

  factory PurchaseRequestDetail.fromJson(Map<String, Object?> json) =>
      _$PurchaseRequestDetailFromJson(json);

  factory PurchaseRequestDetail.empty() => PurchaseRequestDetail(
        id: 0,
        status: PurchaseRequestDetailStatus.empty,
        unit: MaterialUnit.empty(),
        product: Product.empty(),
        dueDate: DateTime(0),
        createdAt: DateTime(0),
        confirmAt: DateTime(0),
        updatedAt: DateTime(0),
        createdById: 0,
        updatedById: 0,
        confirmById: 0,
        closeRequestFormById: 0,
        materialRequestFormId: '',
      );

  String get temporaryKey =>
      '${material?.id}#${product?.id}#${materialDesign?.id}';

  String get itemName => material?.name ?? product?.name ?? '-';

  bool get isOrder => material?.isOrder ?? true;

  MaterialUnit? get unitCreate => material?.materialUnit ?? product?.unitOrder;

  PurchaseOrderDetail get toPurchaseOrderDetail =>
      PurchaseOrderDetail.empty().copyWith(
        material: material,
        product: product,
        quantity: quantity,
        unit: unit,
        materialDesign: materialDesign,
        materialRequestDetail: this,
      );
}

enum PurchaseRequestDetailStatus implements ColorType {
  empty('', ui.Colors.transparent),
  temporary('TEMPORARY', ui.Colors.blueGrey),
  input('INPUT', ui.Colors.blueGrey),
  confirm('CONFIRM', ui.Colors.blue),
  po('PO', ui.Colors.blue),
  close('CLOSE', ui.Colors.green),
  reject('REJECT', ui.Colors.orange),
  rejectProcurement('REJECT PROCUREMENT', ui.Colors.red);

  const PurchaseRequestDetailStatus(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final ui.Color color;

  bool get isInput => this == PurchaseRequestDetailStatus.input;
}

PurchaseRequestDetailStatus _purchaseRequestDetailStatusFromString(
  String type,
) {
  if (type == PurchaseRequestDetailStatus.input.id) {
    return PurchaseRequestDetailStatus.input;
  }
  if (type == PurchaseRequestDetailStatus.confirm.id) {
    return PurchaseRequestDetailStatus.confirm;
  }
  if (type == PurchaseRequestDetailStatus.po.id) {
    return PurchaseRequestDetailStatus.po;
  }
  if (type == PurchaseRequestDetailStatus.close.id) {
    return PurchaseRequestDetailStatus.close;
  }
  if (type == PurchaseRequestDetailStatus.rejectProcurement.id) {
    return PurchaseRequestDetailStatus.rejectProcurement;
  }
  if (type == PurchaseRequestDetailStatus.reject.id) {
    return PurchaseRequestDetailStatus.reject;
  }
  return PurchaseRequestDetailStatus.empty;
}
