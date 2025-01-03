import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive.freezed.dart';
part 'material_receive.g.dart';

@freezed
class MaterialReceive with _$MaterialReceive {
  const factory MaterialReceive({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'transaction_type', fromJson: TransactionType.fromJson)
    required TransactionType transactionType,
    @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
    required PurchaseOrder purchaseOrder,
    @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
    required MaterialGroup materialGroup,
    @JsonKey(name: 'department', fromJson: Department.fromJson)
    required Department department,
    @JsonKey(name: 'vendor', fromJson: Vendor.fromJson) required Vendor vendor,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
    required DateTime deliveryOrderDate,
    required String description,
    @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
    required WarehouseMaterialReceive warehouse,
    @JsonKey(name: 'is_invoice_receive', defaultValue: false)
    required bool isInvoiceReceive,
  }) = _MaterialReceive;
  const MaterialReceive._();

  factory MaterialReceive.empty() => MaterialReceive(
        id: '',
        createdAt: DateTime(0),
        updatedAt: DateTime(0),
        transactionType: TransactionType.empty(),
        purchaseOrder: PurchaseOrder.empty(),
        materialGroup: MaterialGroup.empty(),
        department: Department.empty(),
        vendor: Vendor.empty(),
        deliveryOrderId: '',
        deliveryOrderDate: DateTime(0),
        description: '',
        warehouse: WarehouseMaterialReceive.empty,
        isInvoiceReceive: false,
      );

  factory MaterialReceive.fromJson(Map<String, dynamic> json) =>
      _$MaterialReceiveFromJson(json);

  MaterialReceiveType get type {
    if (purchaseOrder.id != '') {
      return MaterialReceiveType.purchaseOrder;
    }
    return MaterialReceiveType.nonPurchaseOrder;
  }
}

enum MaterialReceiveType implements ColorType {
  purchaseOrder('Purchase Order', Colors.blue),
  nonPurchaseOrder('Non Purchase Order', Colors.purple);

  const MaterialReceiveType(this.title, this.color);
  final String title;

  static List<MaterialReceiveType> get list => [
        MaterialReceiveType.purchaseOrder,
        MaterialReceiveType.nonPurchaseOrder,
      ];

  @override
  String get label => title;

  @override
  final Color color;
}

enum WarehouseMaterialReceive implements ColorType {
  empty('', Colors.transparent),
  ppic('IC', Colors.blue),
  alkes('ALKES', Colors.green),
  engineering('ENGINEERING', Colors.grey),
  cs('CS', Colors.orange),
  rnd('RnD', Colors.purple);

  const WarehouseMaterialReceive(this.id, this.color);
  final String id;

  static List<WarehouseMaterialReceive> get list => [
        WarehouseMaterialReceive.ppic,
        WarehouseMaterialReceive.alkes,
        WarehouseMaterialReceive.engineering,
        WarehouseMaterialReceive.cs,
        WarehouseMaterialReceive.rnd,
      ];

  @override
  String get label => id;

  @override
  final Color color;

  static WarehouseMaterialReceive fromString(String id) {
    if (id == WarehouseMaterialReceive.empty.id) {
      return WarehouseMaterialReceive.empty;
    }
    if (id == WarehouseMaterialReceive.ppic.id) {
      return WarehouseMaterialReceive.ppic;
    }
    if (id == WarehouseMaterialReceive.alkes.id) {
      return WarehouseMaterialReceive.alkes;
    }
    if (id == WarehouseMaterialReceive.engineering.id) {
      return WarehouseMaterialReceive.engineering;
    }
    if (id == WarehouseMaterialReceive.cs.id) {
      return WarehouseMaterialReceive.cs;
    }
    if (id == WarehouseMaterialReceive.rnd.id) {
      return WarehouseMaterialReceive.rnd;
    }
    return WarehouseMaterialReceive.empty;
  }
}

class MaterialReceiveCreateForm {
  MaterialReceiveCreateForm({
    required this.transactionType,
    required this.purchaseOrder,
    required this.warehouse,
    required this.materialGroup,
    required this.deliveryOrderId,
    required this.deliveryOrderDate,
    required this.description,
    required this.department,
    required this.vendor,
  });

  final TransactionType transactionType;
  final PurchaseOrder? purchaseOrder;
  final MaterialGroup? materialGroup;
  final Department? department;
  final Vendor? vendor;
  final String warehouse;
  final String deliveryOrderId;
  final DateTime? deliveryOrderDate;
  final String description;
}

class MaterialReceiveCreateTypeForm {
  MaterialReceiveCreateTypeForm({
    required this.mutation,
    required this.type,
  });

  final bool mutation;
  final MaterialReceiveType type;
}
