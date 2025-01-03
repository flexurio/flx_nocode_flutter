// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return_note_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReturnNoteDetailImpl _$$MaterialReturnNoteDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReturnNoteDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      returnNote: MaterialReturnNote.fromJson(
          json['return_note'] as Map<String, dynamic>),
      currency: Currency.fromJson(json['currency'] as Map<String, dynamic>),
      description: json['description'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      unit: json['unit'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      subtotal: (json['sub_total'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialReturnNoteDetailImplToJson(
        _$MaterialReturnNoteDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'return_note': instance.returnNote,
      'currency': instance.currency,
      'description': instance.description,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'unit': instance.unit,
      'quantity': instance.quantity,
      'price': instance.price,
      'sub_total': instance.subtotal,
    };
