import 'package:intl/intl.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/models/type.dart';

/// Extension to provide dummy/placeholder values for [EntityField] configurations.
extension EntityFieldDummyValueX on EntityField {
  /// Generates a human-friendly dummy value based on the field type and label.
  ///
  /// This can be used to populate forms during development or when
  /// showcasing the UI with mock data.
  dynamic dummyValue() {
    return switch (typeEnum) {
      EntityFieldType.number => 1,
      EntityFieldType.dateTime => _dummyDateTime(),
      EntityFieldType.bool => true,
      EntityFieldType.text => _dummyText(),
    };
  }

  /// Formats the current date and time using the field's pattern.
  String _dummyDateTime() {
    return DateFormat(dateTimeFormat).format(DateTime.now());
  }

  /// Generates a context-aware text placeholder based on the field's label.
  String _dummyText() {
    final lowerLabel = label.toLowerCase();

    if (lowerLabel.contains('email')) return 'user@example.com';
    if (lowerLabel.contains('phone')) return '+6281234567890';
    if (lowerLabel.contains('name')) return 'John Doe';
    if (lowerLabel.contains('address')) return '123 Main St, Springfield';
    if (lowerLabel.contains('id') || lowerLabel.contains('code'))
      return 'REF-001';

    return 'Sample $label';
  }
}
