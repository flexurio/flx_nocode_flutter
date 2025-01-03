import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_detail.freezed.dart';
part 'purchase_order_detail.g.dart';

@freezed
class PurchaseOrderDetail with _$PurchaseOrderDetail {
  const factory PurchaseOrderDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(fromJson: ProductionOrder.fromJson, name: 'batch_no')
    required ProductionOrder? productionOrder,
    @JsonKey(fromJson: Material.fromJsonNullable) required Material? material,
    @JsonKey(fromJson: Product.fromJsonNullable) required Product? product,
    @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unit,
    @JsonKey(name: 'unit_convert', fromJson: MaterialUnit.fromJson)
    required MaterialUnit unitConvert,
    @JsonKey(name: 'purchase_order', fromJson: PurchaseOrder.fromJson)
    required PurchaseOrder purchaseOrder,
    @JsonKey(name: 'quantity_po') required double quantity,
    @JsonKey(name: 'quantity_received') double? quantityReceived,
    @JsonKey(name: 'quantity_po_converted', defaultValue: 0)
    required double quantityPurchaseOrderConverted,
    @JsonKey(name: 'quantity_received_converted', defaultValue: 0)
    required double quantityReceivedConverted,
    required double price,
    @JsonKey(name: 'material_design_code', fromJson: MaterialDesign.fromJson)
    MaterialDesign? materialDesign,
    PurchaseRequestDetail? materialRequestDetail,
    @JsonKey(name: 'due_date', defaultValue: '') String? descriptionPettyCash,
  }) = _PurchaseOrderDetail;
  factory PurchaseOrderDetail.empty() => PurchaseOrderDetail(
        quantityPurchaseOrderConverted: 0,
        createdAt: DateTime.now(),
        id: 0,
        unit: MaterialUnit.empty(),
        product: Product.empty(),
        productionOrder: null,
        quantityReceivedConverted: 0,
        material: null,
        quantity: 0,
        quantityReceived: 0,
        price: 0,
        purchaseOrder: PurchaseOrder.empty(),
        descriptionPettyCash: '',
        unitConvert: MaterialUnit.empty(),
        materialDesign: MaterialDesign.empty(),
      );
  const PurchaseOrderDetail._();

  factory PurchaseOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderDetailFromJson(json);

  double get subtotal => quantity * price;

  String get itemName => material?.name ?? product?.name ?? '-';

  double get quantityPurchaseOrder =>
      quantityPurchaseOrderConverted - quantityReceivedConverted;

  bool get hasProductionOrder =>
      productionOrder?.id != null && productionOrder?.id != '';

  String get temporaryKey =>
      '${material?.id}#${material?.materialUnit.id}#${materialDesign?.id}';

  PurchaseRequestDetail get toMaterialRequestDetail =>
      PurchaseRequestDetail.empty().copyWith(
        product: product,
        material: material,
        quantity: quantity,
        materialDesign: materialDesign,
        id: materialRequestDetail?.id ?? 0,
        unit: unit,
      );

  bool get isProduct => product != null && product?.id != '';

  String get materialId {
    if (material != null) {
      return material!.id;
    }
    if (product != null) {
      return product!.id;
    }
    throw AssertionError();
  }
}
