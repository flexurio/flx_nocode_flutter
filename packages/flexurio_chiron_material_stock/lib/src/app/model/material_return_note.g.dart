// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReturnNoteImpl _$$MaterialReturnNoteImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReturnNoteImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      id: json['id'] as String,
      supplier: Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      purchaseOrder: PurchaseOrder.fromJson(
          json['purchase_order'] as Map<String, dynamic>),
      returnDate: isoDateToDateTime(json['return_date'] as String?),
      invoiceNo: json['invoice_no'] as String,
      invoiceDate: isoDateToDateTime(json['invoice_date'] as String?),
      taxInvoiceNo: json['tax_invoice_no'] as String,
      taxInvoiceDate: isoDateToDateTime(json['tax_invoice_date'] as String?),
      description: json['description'] as String,
      isReceivedDocument: json['is_received_document'] as bool,
    );

Map<String, dynamic> _$$MaterialReturnNoteImplToJson(
        _$MaterialReturnNoteImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'supplier': instance.supplier,
      'purchase_order': instance.purchaseOrder,
      'return_date': instance.returnDate.toIso8601String(),
      'invoice_no': instance.invoiceNo,
      'invoice_date': instance.invoiceDate.toIso8601String(),
      'tax_invoice_no': instance.taxInvoiceNo,
      'tax_invoice_date': instance.taxInvoiceDate.toIso8601String(),
      'description': instance.description,
      'is_received_document': instance.isReceivedDocument,
    };
