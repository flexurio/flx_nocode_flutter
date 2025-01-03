// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_receive_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceReceiveDetailImpl _$$InvoiceReceiveDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceReceiveDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      invoiceId: json['purchase_order_invoice_id'] as String,
      unitId: json['unit_id'] as String,
      material: Material.fromJson(json['material'] as Map<String, dynamic>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      qtyInvoice: (json['quantity_invoice'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$InvoiceReceiveDetailImplToJson(
        _$InvoiceReceiveDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'purchase_order_invoice_id': instance.invoiceId,
      'unit_id': instance.unitId,
      'material': instance.material,
      'product': instance.product,
      'quantity_invoice': instance.qtyInvoice,
      'price': instance.price,
      'total': instance.total,
    };
