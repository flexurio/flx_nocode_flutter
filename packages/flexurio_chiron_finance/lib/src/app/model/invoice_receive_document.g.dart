// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_receive_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceReceiveDocumentImpl _$$InvoiceReceiveDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceReceiveDocumentImpl(
      id: (json['id'] as num).toInt(),
      documentPath: json['document'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$InvoiceReceiveDocumentImplToJson(
        _$InvoiceReceiveDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document': instance.documentPath,
      'description': instance.description,
      'name': instance.name,
    };
