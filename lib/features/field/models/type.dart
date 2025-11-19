import 'package:flutter/material.dart';

enum EntityFieldType {
  text('text'),
  number('number'),
  dateTime('datetime'),
  bool('bool');

  const EntityFieldType(this.id);

  static List<EntityFieldType> get list => [text, number, bool];

  static EntityFieldType fromId(String id) {
    try {
      return EntityFieldType.values.firstWhere((element) => element.id == id);
    } catch (_) {
      throw Exception('Invalid entity field type: $id');
    }
  }

  final String id;

  IconData get icon {
    switch (this) {
      case EntityFieldType.text:
        return Icons.text_fields;
      case EntityFieldType.number:
        return Icons.tag;
      case EntityFieldType.bool:
        return Icons.toggle_on;
      case EntityFieldType.dateTime:
        return Icons.date_range;
    }
  }
}
