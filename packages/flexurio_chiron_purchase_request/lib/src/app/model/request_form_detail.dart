import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_form_detail.freezed.dart';
part 'request_form_detail.g.dart';

final dateNow = DateTime.now();

@freezed
class RequestFormDetail with _$RequestFormDetail {
  const factory RequestFormDetail({
    required int id,
    required double quantity,
    @JsonKey(name: 'material_request_form_id')
    required String? materialRequestFormId,
    @JsonKey(name: 'is_fast_track') required bool isFastTrack,
    @JsonKey(fromJson: _requestFormDetailStatusFromString)
    required RequestFormDetailStatus status,
    @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
    MaterialType? materialType,
    @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
    Material? material,
    @JsonKey(
      name: 'material_request',
      fromJson: MaterialRequest.fromJsonNullable,
    )
    MaterialRequest? materialRequest,
    @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
    MaterialUnit? unit,
  }) = _RequestFormDetail;
  const RequestFormDetail._();

  factory RequestFormDetail.fromJson(Map<String, Object?> json) =>
      _$RequestFormDetailFromJson(json);

  factory RequestFormDetail.empty() => RequestFormDetail(
        id: 0,
        materialType: MaterialType.empty(),
        unit: MaterialUnit.empty(),
        quantity: 0,
        isFastTrack: false,
        status: RequestFormDetailStatus.empty,
        materialRequestFormId: '',
      );

  String get temporaryKey {
    final materialId =
        material?.id ?? dateNow.microsecondsSinceEpoch.toString();
    final materialTypeId =
        materialType?.id ?? dateNow.microsecondsSinceEpoch.toString();
    return '$id#$materialId#$materialTypeId';
  }

  String get itemName {
    final materialId = material?.id ?? '-';
    final materialTypeId = materialType?.id ?? '-';
    if (materialId != '') {
      return materialId;
    } else if (materialTypeId != '') {
      return materialTypeId;
    } else {
      return dateNow.microsecondsSinceEpoch.toString();
    }
  }
}

enum RequestFormDetailStatus implements ColorType {
  empty('', ui.Colors.transparent),
  temporary('TEMPORARY', ui.Colors.blueGrey),
  input('INPUT', ui.Colors.blueGrey),
  confirm('CONFIRM', ui.Colors.blue),
  purchaseRequest('PURCHASE REQUEST', ui.Colors.amber),
  po('PO', ui.Colors.blue),
  close('CLOSE', ui.Colors.green),
  rejectProcurement('REJECT PROCUREMENT', ui.Colors.red);

  const RequestFormDetailStatus(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final ui.Color color;

  bool get isInput => this == RequestFormDetailStatus.input;
}

RequestFormDetailStatus _requestFormDetailStatusFromString(
  String type,
) {
  if (type == RequestFormDetailStatus.input.id) {
    return RequestFormDetailStatus.input;
  }
  if (type == RequestFormDetailStatus.confirm.id) {
    return RequestFormDetailStatus.confirm;
  }
  if (type == RequestFormDetailStatus.purchaseRequest.id) {
    return RequestFormDetailStatus.purchaseRequest;
  }
  if (type == RequestFormDetailStatus.po.id) {
    return RequestFormDetailStatus.po;
  }
  if (type == RequestFormDetailStatus.close.id) {
    return RequestFormDetailStatus.close;
  }
  if (type == RequestFormDetailStatus.rejectProcurement.id) {
    return RequestFormDetailStatus.rejectProcurement;
  }
  return RequestFormDetailStatus.empty;
}
