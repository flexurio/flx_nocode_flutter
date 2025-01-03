// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      dateCreated: json['date_created'] as String,
      dateUpdated: json['date_updated'] as String,
      dateClosed: json['date_closed'] as String?,
      archived: json['archived'] as bool,
      assignees: _assigneesFromJson(json['assignees'] as List),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      customFields: _customFieldsFromJson(json['custom_fields'] as List),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'archived': instance.archived,
      'tags': instance.tags,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
      'date_closed': instance.dateClosed,
      'due_date': instance.dueDate,
      'assignees': instance.assignees,
      'custom_fields': instance.customFields,
      'status': instance.status,
    };

Assignee _$AssigneeFromJson(Map<String, dynamic> json) => Assignee(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      color: json['color'] as String,
      initials: json['initials'] as String,
      email: json['email'] as String,
      profilePicture: json['profile_picture'] as String?,
    );

Map<String, dynamic> _$AssigneeToJson(Assignee instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'color': instance.color,
      'initials': instance.initials,
      'email': instance.email,
      'profile_picture': instance.profilePicture,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      name: json['name'] as String,
      tagFg: json['tag_fg'] as String,
      tagBg: json['tag_bg'] as String,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'tag_fg': instance.tagFg,
      'tag_bg': instance.tagBg,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      status: json['status'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'status': instance.status,
      'color': instance.color,
    };

CustomField _$CustomFieldFromJson(Map<String, dynamic> json) => CustomField(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$CustomFieldToJson(CustomField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
