import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_request.freezed.dart';
part 'purchase_request.g.dart';

enum PurchaseRequestType {
  purchaseOrder('Purchase Order'),
  pettyCash('Petty Cash');

  final String label;
  const PurchaseRequestType(this.label);

  static List<PurchaseRequestType> get list => <PurchaseRequestType>[
        PurchaseRequestType.purchaseOrder,
        PurchaseRequestType.pettyCash
      ];
}

enum CashFlowStatus implements ColorType {
  open('OPEN', Colors.orange),
  approve('APPROVE', Colors.green);

  const CashFlowStatus(this.status, this.color);

  @override
  String get label => status;

  List<CashFlowStatus> get list => [];

  @override
  final Color color;
  final String status;
}

enum PurchaseRequestStatus implements ColorType {
  empty('', Colors.transparent),
  input('INPUT', Colors.blueGrey),
  inProgress('IN PROGRESS', Colors.orange),
  rejectProcurement('REJECT PROCUREMENT', Colors.red),
  rejectManager('REJECT MANAGER', Colors.purple),
  confirm('CONFIRM', Colors.green),
  close('CLOSE', Colors.green);

  const PurchaseRequestStatus(this.id, this.color);
  final String id;

  static List<PurchaseRequestStatus> get list => [
        PurchaseRequestStatus.input,
        PurchaseRequestStatus.rejectManager,
        PurchaseRequestStatus.inProgress,
        PurchaseRequestStatus.rejectProcurement,
        PurchaseRequestStatus.close,
      ];

  static List<PurchaseRequestStatus> get requestFormList => [
        PurchaseRequestStatus.input,
        PurchaseRequestStatus.rejectManager,
        PurchaseRequestStatus.inProgress,
        PurchaseRequestStatus.close,
      ];

  @override
  String get label => id;

  @override
  final Color color;

  bool get isInput => this == PurchaseRequestStatus.input;
  bool get isInProgress => this == PurchaseRequestStatus.inProgress;
}

@freezed
class MaterialRequest with _$MaterialRequest {
  const factory MaterialRequest({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
    required DateTime dateOfNeed,
    @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
    required DateTime deliveryDate,
    required String description,
    @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
    required MaterialGroup materialGroup,
    @JsonKey(fromJson: Vendor.fromJsonNullable) required Vendor? vendor,
    @JsonKey(fromJson: Department.fromJson) required Department department,
    @JsonKey(
      name: 'department_budgeting',
      fromJson: Department.fromJson,
      defaultValue: Department.empty,
    )
    required Department departmentBudgeting,
    @JsonKey(fromJson: _materialRequestStatusFromString)
    required PurchaseRequestStatus status,
    @JsonKey(name: 'is_printed_by_id') int? isPrintById,
    @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
    DateTime? isPrintAt,
  }) = _MaterialRequest;

  factory MaterialRequest.empty() => MaterialRequest(
        department: Department.empty(),
        departmentBudgeting: Department.empty(),
        id: '',
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        dateOfNeed: DateTime(0),
        deliveryDate: DateTime(0),
        description: '',
        materialGroup: MaterialGroup.empty(),
        vendor: Vendor.empty(),
        status: PurchaseRequestStatus.empty,
        isPrintById: 0,
      );
  const MaterialRequest._();

  factory MaterialRequest.fromJson(Map<String, Object?> json) =>
      _$MaterialRequestFromJson(json);

  static MaterialRequest? fromJsonNullable(dynamic json) {
    if (json == null) return null;
    return _$MaterialRequestFromJson(json as Map<String, dynamic>);
  }
}

PurchaseRequestStatus _materialRequestStatusFromString(String type) {
  if (type == PurchaseRequestStatus.input.id) {
    return PurchaseRequestStatus.input;
  }
  if (type == PurchaseRequestStatus.inProgress.id) {
    return PurchaseRequestStatus.inProgress;
  }
  if (type == PurchaseRequestStatus.close.id) {
    return PurchaseRequestStatus.close;
  }
  if (type == PurchaseRequestStatus.confirm.id) {
    return PurchaseRequestStatus.confirm;
  }
  if (type == PurchaseRequestStatus.rejectProcurement.id) {
    return PurchaseRequestStatus.rejectProcurement;
  }
  if (type == PurchaseRequestStatus.rejectManager.id) {
    return PurchaseRequestStatus.rejectManager;
  }
  return PurchaseRequestStatus.empty;
}
