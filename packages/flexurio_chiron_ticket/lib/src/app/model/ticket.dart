import 'package:json_annotation/json_annotation.dart';
part 'ticket.g.dart';

const customFieldRequesterName = 'Requester Name';
const customFieldRequesterNip = 'Requester NIP';

@JsonSerializable()
class Ticket {
  Ticket({
    required this.id,
    required this.name,
    required this.description,
    required this.dateCreated,
    required this.dateUpdated,
    required this.dateClosed,
    required this.archived,
    required this.assignees,
    required this.tags,
    required this.customFields,
    required this.status,
    required this.dueDate,
  });
  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  final String id;
  final String name;
  final String description;
  final bool archived;
  final List<Tag> tags;

  @JsonKey(name: 'date_created')
  final String dateCreated;

  @JsonKey(name: 'date_updated')
  final String dateUpdated;

  @JsonKey(name: 'date_closed')
  final String? dateClosed;

  @JsonKey(name: 'due_date')
  final String? dueDate;

  @JsonKey(fromJson: _assigneesFromJson)
  final List<Assignee> assignees;

  @JsonKey(name: 'custom_fields', fromJson: _customFieldsFromJson)
  final List<CustomField> customFields;

  @JsonKey(fromJson: Status.fromJson)
  final Status status;

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  Assignee? get assignee {
    if (assignees.isEmpty) return null;
    return assignees.first;
  }

  DateTime? get due {
    if (dueDate == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(int.parse(dueDate!));
  }

  DateTime get createdAt {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(dateCreated));
  }

  DateTime get updatedAt {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(dateUpdated));
  }

  String get requesterNip {
    for (final customField in customFields) {
      if (customField.name == customFieldRequesterNip) {
        return customField.value;
      }
    }
    return '';
  }

  String get requesterName {
    for (final customField in customFields) {
      if (customField.name == customFieldRequesterName) {
        return customField.value;
      }
    }
    return '';
  }
}

List<CustomField> _customFieldsFromJson(List<dynamic> data) {
  return data
      .where(
        (e) => [customFieldRequesterNip, customFieldRequesterName]
            .contains((e as Map)['name'] as String),
      )
      .map((e) => CustomField.fromJson(e as Map<String, dynamic>))
      .toList();
}

List<Assignee> _assigneesFromJson(List<dynamic> data) {
  return data.map((e) => Assignee.fromJson(e as Map<String, dynamic>)).toList();
}

@JsonSerializable()
class Assignee {
  Assignee({
    required this.id,
    required this.username,
    required this.color,
    required this.initials,
    required this.email,
    required this.profilePicture,
  });
  factory Assignee.fromJson(Map<String, dynamic> json) =>
      _$AssigneeFromJson(json);

  final int id;
  final String username;
  final String color;
  final String initials;
  final String email;

  @JsonKey(name: 'profile_picture')
  final String? profilePicture;

  Map<String, dynamic> toJson() => _$AssigneeToJson(this);
}

@JsonSerializable()
class Tag {
  Tag({
    required this.name,
    required this.tagFg,
    required this.tagBg,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  final String name;

  @JsonKey(name: 'tag_fg')
  final String tagFg;

  @JsonKey(name: 'tag_bg')
  final String tagBg;

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class Status {
  Status({
    required this.status,
    required this.color,
  });
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  final String status;
  final String color;
  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class CustomField {
  CustomField({
    required this.name,
    required this.value,
  });
  factory CustomField.fromJson(Map<String, dynamic> json) =>
      _$CustomFieldFromJson(json);

  final String name;
  final String value;
  Map<String, dynamic> toJson() => _$CustomFieldToJson(this);
}
