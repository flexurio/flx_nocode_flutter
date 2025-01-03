// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderAttachmentImpl _$$SalesOrderAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrderAttachmentImpl(
      document: json['document'] as String,
      revisionNo: (json['revision_no'] as num).toInt(),
      description: json['description'] as String?,
      extensionDocument: json['extension_document'] as String?,
    );

Map<String, dynamic> _$$SalesOrderAttachmentImplToJson(
        _$SalesOrderAttachmentImpl instance) =>
    <String, dynamic>{
      'document': instance.document,
      'revision_no': instance.revisionNo,
      'description': instance.description,
      'extension_document': instance.extensionDocument,
    };
