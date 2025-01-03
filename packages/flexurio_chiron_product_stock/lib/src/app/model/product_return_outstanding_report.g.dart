// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_return_outstanding_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReturnOutstandingReportImpl
    _$$ProductReturnOutstandingReportImplFromJson(Map<String, dynamic> json) =>
        _$ProductReturnOutstandingReportImpl(
          transactionNo: json['transaction_no'] as String,
          deliveryOrderId: json['delivery_order_id'] as String,
          customerName: json['customer_name'] as String,
          referenceNo: json['reference_no'] as String,
          description: json['description'] as String,
          productName: json['product_name'] as String,
          productId: json['product_id'] as String,
          qty: json['qty'] as String,
          quantityCheck: (json['quantity_check'] as num).toInt(),
          unitId: (json['unit_id'] as num).toInt(),
          price: (json['price'] as num).toInt(),
          subtotal: (json['subtotal'] as num).toInt(),
          batchNoId: json['batch_no_id'] as String,
          expirationDate: isoDateToDateTime(json['expiration_date'] as String?),
          status: json['status'] as String,
          qualityAssuranceCheckDate: isoDateToDateTime(
              json['quality_assurance_check_date'] as String?),
          taxInvoiceNo: json['tax_invoice_no'] as String?,
          deliveryOrderDate:
              dateTimeNullableFromJson(json['delivery_order_date'] as String?),
          productReturnDeliveryOrderDate: dateTimeNullableFromJson(
              json['product_return_delivery_order_date'] as String?),
          productReturnDeliveryOrderId:
              json['product_return_delivery_order_id'] as String?,
          createdAt: isoDateToDateTime(json['created_at'] as String?),
          confirmPpicAt: isoDateToDateTime(json['confirm_ppic_at'] as String?),
          confirmMarketingAt:
              isoDateToDateTime(json['confirm_marketing_at'] as String?),
          transactionTypeId: json['transaction_type_id'] as String,
        );

Map<String, dynamic> _$$ProductReturnOutstandingReportImplToJson(
        _$ProductReturnOutstandingReportImpl instance) =>
    <String, dynamic>{
      'transaction_no': instance.transactionNo,
      'delivery_order_id': instance.deliveryOrderId,
      'customer_name': instance.customerName,
      'reference_no': instance.referenceNo,
      'description': instance.description,
      'product_name': instance.productName,
      'product_id': instance.productId,
      'qty': instance.qty,
      'quantity_check': instance.quantityCheck,
      'unit_id': instance.unitId,
      'price': instance.price,
      'subtotal': instance.subtotal,
      'batch_no_id': instance.batchNoId,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'status': instance.status,
      'quality_assurance_check_date':
          instance.qualityAssuranceCheckDate.toIso8601String(),
      'tax_invoice_no': instance.taxInvoiceNo,
      'delivery_order_date': instance.deliveryOrderDate?.toIso8601String(),
      'product_return_delivery_order_date':
          instance.productReturnDeliveryOrderDate?.toIso8601String(),
      'product_return_delivery_order_id': instance.productReturnDeliveryOrderId,
      'created_at': instance.createdAt.toIso8601String(),
      'confirm_ppic_at': instance.confirmPpicAt.toIso8601String(),
      'confirm_marketing_at': instance.confirmMarketingAt.toIso8601String(),
      'transaction_type_id': instance.transactionTypeId,
    };
