import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';

part 'petty_cash.freezed.dart';
part 'petty_cash.g.dart';

@freezed
class PettyCash with _$PettyCash {
  const factory PettyCash({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
    required PurchaseOrder purchaseOrder,
    @JsonKey(
        name: 'purchase_order_down_payment',
        fromJson: PurchaseOrderDownPayment.fromJson)
    required PurchaseOrderDownPayment purchaseOrderDownPayment,
    required double amount,
    @JsonKey(fromJson: PettyCashStatus.fromString)
    required PettyCashStatus status,
    @JsonKey(name: 'reject_reason') required String rejectReason,
    required String recipient,
    @JsonKey(name: 'realization_amount') required double realizationAmount,
    @JsonKey(name: 'return_amount') double? returnAmount,
    @JsonKey(name: 'shipping_cost') required double shippingCost,
    @JsonKey(name: 'discount') required double discountAmount,
    @JsonKey(name: 'pph') required double pphAmount,
    @JsonKey(name: 'ppn') required double ppnAmount,
    required double rounding,
    @JsonKey(name: 'approve_finance_at', fromJson: isoDateToDateTime)
    required DateTime approveFinanceAt,
    @JsonKey(name: 'type', fromJson: PettyCashType.fromString)
    required PettyCashType type,
    @JsonKey(name: 'realization_no') String? realizationNo,
    @JsonKey(name: 'document_receive_by') int? documentReceiveBy,
    @JsonKey(name: 'document_receive_at') DateTime? documentReceiveAt,
    @JsonKey(name: 'supplier', fromJson: Supplier.fromJson) Supplier? supplier,
    String? description,
    @JsonKey(fromJson: Department.fromJson) required Department department,
    @JsonKey(name: 'business_trip', fromJson: VehicleRent.fromJson)
    required VehicleRent vehicleRent,
  }) = _PettyCash;
  const PettyCash._();

  factory PettyCash.fromJson(Map<String, dynamic> json) =>
      _$PettyCashFromJson(json);

  factory PettyCash.empty() => PettyCash(
        id: '',
        purchaseOrderDownPayment: PurchaseOrderDownPayment.empty(),
        type: PettyCashType.pettyCash,
        createdAt: DateTime(0),
        createdById: 0,
        updatedAt: DateTime(0),
        updateById: 0,
        purchaseOrder: PurchaseOrder.empty(),
        amount: 0,
        status: PettyCashStatus.empty,
        rejectReason: '',
        recipient: '',
        realizationAmount: 0,
        returnAmount: 0,
        shippingCost: 0,
        discountAmount: 0,
        rounding: 0,
        pphAmount: 0,
        ppnAmount: 0,
        approveFinanceAt: DateTime(0),
        documentReceiveAt: DateTime(0),
        description: '',
        department: Department.empty(),
        vehicleRent: VehicleRent.empty(),
      );
  bool get canApproveFinance =>
      status.isApproveAccounting &&
      realizationAmount != 0 &&
      documentReceiveBy != 0;

  bool get isGeneralExpense => type.id == PettyCashType.generalExpense.id;
  bool get isVehicleRent => vehicleRent.id.isNotEmpty;
}

enum PettyCashStatus implements ColorType {
  empty('', Colors.transparent),
  input('INPUT', Colors.blueGrey),
  approveManager('APPROVE MANAGER', Colors.blue),
  rejectManager('REJECT MANAGER', Colors.red),
  approveAccounting('APPROVE ACCOUNTING', Colors.blue),
  rejectAccounting('REJECT ACCOUNTING', Colors.red),
  approveFinance('APPROVE FINANCE', Colors.blue),
  rejectFinance('REJECT FINANCE', Colors.red),
  close('CLOSE', Colors.green);

  const PettyCashStatus(this.id, this.color);
  final String id;

  static List<PettyCashStatus> get list => List.from(values)..remove(empty);

  @override
  String get label => id;

  @override
  final Color color;

  static PettyCashStatus fromString(String id) {
    if (id == PettyCashStatus.input.id) {
      return PettyCashStatus.input;
    }
    if (id == PettyCashStatus.approveManager.id) {
      return PettyCashStatus.approveManager;
    }
    if (id == PettyCashStatus.rejectManager.id) {
      return PettyCashStatus.rejectManager;
    }
    if (id == PettyCashStatus.approveAccounting.id) {
      return PettyCashStatus.approveAccounting;
    }
    if (id == PettyCashStatus.rejectAccounting.id) {
      return PettyCashStatus.rejectAccounting;
    }
    if (id == PettyCashStatus.approveFinance.id) {
      return PettyCashStatus.approveFinance;
    }
    if (id == PettyCashStatus.rejectFinance.id) {
      return PettyCashStatus.rejectFinance;
    }
    if (id == PettyCashStatus.input.id) {
      return PettyCashStatus.input;
    }
    if (id == PettyCashStatus.close.id) {
      return PettyCashStatus.close;
    }
    return PettyCashStatus.empty;
  }

  bool get isInput => this == PettyCashStatus.input;
  bool get isApproveManager => this == PettyCashStatus.approveManager;
  bool get isApproveAccounting => this == PettyCashStatus.approveAccounting;
  bool get isApproveFinance => this == PettyCashStatus.approveFinance;
  bool get isClose => this == PettyCashStatus.close;
}

enum PettyCashType implements ColorType {
  generalExpense('General Expense', 'General Expense', Colors.purple),
  pettyCash('Petty Cash', 'Petty Cash', Colors.green),
  vehicleRent('Business Trip', 'Vehicle Rent', Colors.blue);

  const PettyCashType(this.id, this.label, this.color);
  final String id;
  final String label;

  static List<PettyCashType> get list => List.from(values);

  bool get isPettyCash => this == PettyCashType.pettyCash;
  bool get isVehicleRent => this == PettyCashType.vehicleRent;
  bool get isGeneralExpense => this == PettyCashType.generalExpense;

  @override
  final Color color;

  static PettyCashType fromString(String id) {
    if (id == PettyCashType.pettyCash.id) {
      return PettyCashType.pettyCash;
    }
    if (id == PettyCashType.vehicleRent.id) {
      return PettyCashType.vehicleRent;
    }
    if (id == PettyCashType.generalExpense.id) {
      return PettyCashType.generalExpense;
    }
    return PettyCashType.pettyCash;
  }
}
