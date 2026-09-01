import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

void main() {
  group('EntityField Pinned Parsing Tests', () {
    test('defaults isPinned to false when not present', () {
      final field = EntityField.fromJson({
        'label': 'Name',
        'reference': 'name',
        'type': 'text',
      });

      expect(field.isPinned, isFalse);
    });

    test('parses is_pinned: true', () {
      final field = EntityField.fromJson({
        'label': 'Subordinate Name',
        'reference': 'subordinate_name',
        'type': 'text',
        'is_pinned': true,
      });

      expect(field.isPinned, isTrue);
    });

    test('parses pinned: true fallback alias', () {
      final field = EntityField.fromJson({
        'label': 'Description',
        'reference': 'description',
        'type': 'text',
        'pinned': true,
      });

      expect(field.isPinned, isTrue);
    });

    test('parses is_pinned: false', () {
      final field = EntityField.fromJson({
        'label': 'NIP',
        'reference': 'nip',
        'type': 'text',
        'is_pinned': false,
      });

      expect(field.isPinned, isFalse);
    });

    test('copyWith preserves and updates isPinned', () {
      final field = EntityField(
        label: 'Area Value',
        reference: 'area_value',
        type: 'number',
        isPinned: true,
      );

      expect(field.isPinned, isTrue);

      // Preserve
      final preserved = field.copyWith();
      expect(preserved.isPinned, isTrue);

      // Update to false
      final updated = field.copyWith(isPinned: false);
      expect(updated.isPinned, isFalse);
    });
  });
}
