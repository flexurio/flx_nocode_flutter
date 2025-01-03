// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_service_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionServiceOrderImpl _$$ProductionServiceOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionServiceOrderImpl(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      batchNo: json['batch_no'] as String,
      productName: json['product_name'] as String,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
      purchaseOrderId: json['purchase_order_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      isBulk: json['is_bulk'] as bool,
      productStatus:
          ProductionProductStatus.fromString(json['product_status'] as String),
      productScale: ProductionProductScale.fromString(json['scale'] as String),
      expirationDate: isoDateToDateTime(json['expiration_date'] as String?),
      isRework: json['is_rework'] as bool,
      isCancel: json['is_cancel'] as bool,
      description: json['description'] as String,
      cancelReworkById: (json['cancel_rework_by_id'] as num?)?.toInt(),
      cancelReworkAt: dateTimeNullable(json['cancel_rework_at'] as String?),
      cancelReworkReason: json['cancel_rework_reason'] as String?,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$ProductionServiceOrderImplToJson(
        _$ProductionServiceOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'batch_no': instance.batchNo,
      'product_name': instance.productName,
      'customer': instance.customer,
      'purchase_order_id': instance.purchaseOrderId,
      'quantity': instance.quantity,
      'is_bulk': instance.isBulk,
      'product_status':
          _$ProductionProductStatusEnumMap[instance.productStatus]!,
      'scale': _$ProductionProductScaleEnumMap[instance.productScale]!,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'is_rework': instance.isRework,
      'is_cancel': instance.isCancel,
      'description': instance.description,
      'cancel_rework_by_id': instance.cancelReworkById,
      'cancel_rework_at': instance.cancelReworkAt?.toIso8601String(),
      'cancel_rework_reason': instance.cancelReworkReason,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ProductionProductStatusEnumMap = {
  ProductionProductStatus.empty: 'empty',
  ProductionProductStatus.processValidation: 'processValidation',
  ProductionProductStatus.regular: 'regular',
  ProductionProductStatus.pilotScale: 'pilotScale',
  ProductionProductStatus.pilotValidationProcessScale:
      'pilotValidationProcessScale',
  ProductionProductStatus.observation: 'observation',
};

const _$ProductionProductScaleEnumMap = {
  ProductionProductScale.empty: 'empty',
  ProductionProductScale.production: 'production',
  ProductionProductScale.tollOut: 'tollOut',
  ProductionProductScale.pilot: 'pilot',
  ProductionProductScale.reguler: 'reguler',
  ProductionProductScale.pilotTollOut: 'pilotTollOut',
};
