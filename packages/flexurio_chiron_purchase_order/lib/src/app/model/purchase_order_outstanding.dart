import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_outstanding.freezed.dart';
part 'purchase_order_outstanding.g.dart';

@freezed
class PurchaseOrderOutstanding with _$PurchaseOrderOutstanding {
  const factory PurchaseOrderOutstanding({
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_name') required String materialName,
    required String divisi,
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'material_request_id') required String materialRequestId,
    @JsonKey(name: 'material_request_date', fromJson: isoDateToDateTime) required DateTime materialRequestDate,
    @JsonKey(name: 'period_material_request') required String periodMaterialRequest,
    @JsonKey(name: 'quantity_po') required int quantityPo,
    required int value,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime) required DateTime dateOfNeed,
    @JsonKey(name: 'period_date_of_need') required String periodDateOfNeed,
    @JsonKey(name: 'material_request_due_date', fromJson: isoDateToDateTime) required DateTime materialRequestDueDate,
    @JsonKey(name: 'material_request_detail_status') required String materialRequestDetailStatus,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    @JsonKey(name: 'purchase_order_date', fromJson: isoDateToDateTime) required DateTime purchaseOrderDate,
    @JsonKey(name: 'transaction_id') required String transactionId,
    required int quantity,
    @JsonKey(name: 'quantity_received_converted') required int quantityReceivedConverted,
    @JsonKey(name: 'material_receive_date', fromJson: isoDateToDateTime) required DateTime materialReceiveDate,
    @JsonKey(name: 'quantity_release_converted') required int quantityReleaseConverted,
    @JsonKey(name: 'quantity_reject_converted') required int quantityRejectConverted,
    @JsonKey(name: 'material_receive_material_status_qc') required String materialReceiveMaterialStatusQc,
    @JsonKey(name: 'quantity_quarantine') required int quantityQuarantine,
    @JsonKey(name: 'release_date', fromJson: isoDateToDateTime) required DateTime releaseDate,
    @JsonKey(name: 'reject_date', fromJson: isoDateToDateTime) required DateTime rejectDate,
    required String na,
    @JsonKey(name: 'purchase_order_description') required String purchaseOrderDescription,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'design_code_id') required String designCodeId,
    @JsonKey(name: 'purchase_order_status') required String purchaseOrderStatus,
  }) = _PurchaseOrderOutstanding;

  factory PurchaseOrderOutstanding.fromJson(Map<String, dynamic> json) => _$PurchaseOrderOutstandingFromJson(json);
}