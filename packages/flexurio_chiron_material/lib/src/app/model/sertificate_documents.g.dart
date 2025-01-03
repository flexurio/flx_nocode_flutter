// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sertificate_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SertificateDocumentsImpl _$$SertificateDocumentsImplFromJson(
        Map<String, dynamic> json) =>
    _$SertificateDocumentsImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
    );

Map<String, dynamic> _$$SertificateDocumentsImplToJson(
        _$SertificateDocumentsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
