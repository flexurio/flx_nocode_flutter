// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderDetailImpl _$$PurchaseOrderDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      productionOrder:
          ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      material: Material.fromJsonNullable(json['material']),
      product: Product.fromJsonNullable(json['product']),
      unit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      unitConvert:
          MaterialUnit.fromJson(json['unit_convert'] as Map<String, Object?>),
      purchaseOrder: PurchaseOrder.fromJson(
          json['purchase_order'] as Map<String, dynamic>),
      quantity: (json['quantity_po'] as num).toDouble(),
      quantityReceived: (json['quantity_received'] as num?)?.toDouble(),
      quantityPurchaseOrderConverted:
          (json['quantity_po_converted'] as num?)?.toDouble() ?? 0,
      quantityReceivedConverted:
          (json['quantity_received_converted'] as num?)?.toDouble() ?? 0,
      price: (json['price'] as num).toDouble(),
      materialDesign: MaterialDesign.fromJson(
          json['material_design_code'] as Map<String, dynamic>),
      materialRequestDetail: json['materialRequestDetail'] == null
          ? null
          : PurchaseRequestDetail.fromJson(
              json['materialRequestDetail'] as Map<String, dynamic>),
      descriptionPettyCash: json['due_date'] as String? ?? '',
    );

Map<String, dynamic> _$$PurchaseOrderDetailImplToJson(
        _$PurchaseOrderDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'batch_no': instance.productionOrder,
      'material': instance.material,
      'product': instance.product,
      'material_unit': instance.unit,
      'unit_convert': instance.unitConvert,
      'purchase_order': instance.purchaseOrder,
      'quantity_po': instance.quantity,
      'quantity_received': instance.quantityReceived,
      'quantity_po_converted': instance.quantityPurchaseOrderConverted,
      'quantity_received_converted': instance.quantityReceivedConverted,
      'price': instance.price,
      'material_design_code': instance.materialDesign,
      'materialRequestDetail': instance.materialRequestDetail,
      'due_date': instance.descriptionPettyCash,
    };
