// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentFile _$CommentFileFromJson(Map<String, dynamic> json) => CommentFile(
      id: json['id'] as String,
      name: json['name'] as String,
      extension: json['extension'] as String,
      thumbnail: json['thumbnail_medium'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CommentFileToJson(CommentFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'extension': instance.extension,
      'url': instance.url,
      'thumbnail_medium': instance.thumbnail,
    };
