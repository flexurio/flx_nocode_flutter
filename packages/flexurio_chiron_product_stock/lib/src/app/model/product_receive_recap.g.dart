// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_receive_recap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReceiveRecapImpl _$$ProductReceiveRecapImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReceiveRecapImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      barcodeNo: json['barcode_no'] as String,
      barcodeOriginNo: json['barcode_origin_no'] as String,
      barcodeResultNo: json['barcode_result_no'] as String,
      vatNo: (json['vat_no'] as num).toInt(),
      vatTotal: (json['vat_total'] as num).toInt(),
      qty: (json['qty'] as num).toInt(),
      na: json['na'] as String,
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
      status: json['status'] as String,
      price: (json['price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      warehouse: json['warehouse'] as String,
      isDocumentComplete: json['is_document_complete'] as bool,
      releaseAt: isoDateToDateTime(json['release_at'] as String?),
      releaseById: (json['release_by_id'] as num).toInt(),
      isPartial: json['is_partial'] as bool,
      unit: MaterialUnit.fromJson(json['unit'] as Map<String, Object?>),
      batchNo:
          ProductionOrder.fromJson(json['batch_no'] as Map<String, dynamic>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productReceive: ProductReceive.fromJson(
          json['product_received'] as Map<String, dynamic>),
      isDocAcc: json['is_doc_acc'] as bool?,
      docAccDate: dateTimeNullableFromJson(json['doc_acc_date'] as String?),
      isDocumentCompleteAt:
          dateTimeNullableFromJson(json['is_document_complete_at'] as String?),
      isDocumentCompleteById:
          (json['is_document_complete_by_id'] as num?)?.toInt(),
      rejectAt: dateTimeNullableFromJson(json['reject_at'] as String?),
      rejectById: (json['reject_by_id'] as num?)?.toInt(),
      rejectReason: json['reject_reason'] as String?,
    );

Map<String, dynamic> _$$ProductReceiveRecapImplToJson(
        _$ProductReceiveRecapImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'barcode_no': instance.barcodeNo,
      'barcode_origin_no': instance.barcodeOriginNo,
      'barcode_result_no': instance.barcodeResultNo,
      'vat_no': instance.vatNo,
      'vat_total': instance.vatTotal,
      'qty': instance.qty,
      'na': instance.na,
      'expired_date': instance.expiredDate.toIso8601String(),
      'status': instance.status,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'warehouse': instance.warehouse,
      'is_document_complete': instance.isDocumentComplete,
      'release_at': instance.releaseAt.toIso8601String(),
      'release_by_id': instance.releaseById,
      'is_partial': instance.isPartial,
      'unit': instance.unit,
      'batch_no': instance.batchNo,
      'product': instance.product,
      'product_received': instance.productReceive,
      'is_doc_acc': instance.isDocAcc,
      'doc_acc_date': instance.docAccDate?.toIso8601String(),
      'is_document_complete_at':
          instance.isDocumentCompleteAt?.toIso8601String(),
      'is_document_complete_by_id': instance.isDocumentCompleteById,
      'reject_at': instance.rejectAt?.toIso8601String(),
      'reject_by_id': instance.rejectById,
      'reject_reason': instance.rejectReason,
    };
