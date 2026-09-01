import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  group('EntityCustom Pinned Columns Parsing Tests', () {
    Map<String, dynamic> createMinimalEntityJson(Map<String, dynamic> extra) {
      return {
        'id': 'test_entity',
        'label': 'Test Entity',
        'description': 'Description',
        'fields': [
          {
            'label': 'Subordinate Name',
            'reference': 'subordinate_name',
            'type': 'text',
          },
          {
            'label': 'Description',
            'reference': 'description',
            'type': 'text',
          },
          {
            'label': 'Area Value',
            'reference': 'area_value',
            'type': 'number',
          },
          {
            'label': 'NIP',
            'reference': 'nip',
            'type': 'text',
          },
        ],
        'backend': {
          'read_all': {
            'method': 'GET',
            'url': 'http://localhost/test',
          }
        },
        'layout_table': {
          'subordinate_name': 10,
          'description': 10,
          'area_value': 8,
          'nip': 4,
        },
        ...extra,
      };
    }

    test('defaults to empty list when pinned_columns is omitted', () {
      final json = createMinimalEntityJson({});
      final entity = EntityCustom.fromJson(json);

      expect(entity.pinnedColumns, isEmpty);
    });

    test('parses pinned_columns as List<String>', () {
      final json = createMinimalEntityJson({
        'pinned_columns': ['subordinate_name', 'description', 'area_value'],
      });
      final entity = EntityCustom.fromJson(json);

      expect(entity.pinnedColumns, equals(['subordinate_name', 'description', 'area_value']));
    });

    test('supports fallback pin_columns alias', () {
      final json = createMinimalEntityJson({
        'pin_columns': ['subordinate_name', 'area_value'],
      });
      final entity = EntityCustom.fromJson(json);

      expect(entity.pinnedColumns, equals(['subordinate_name', 'area_value']));
    });

    test('supports fallback freeze_columns alias with list', () {
      final json = createMinimalEntityJson({
        'freeze_columns': ['description'],
      });
      final entity = EntityCustom.fromJson(json);

      expect(entity.pinnedColumns, equals(['description']));
    });

    test('EntityCustom.empty() initializes with empty pinnedColumns', () {
      final emptyEntity = EntityCustom.empty();
      expect(emptyEntity.pinnedColumns, isEmpty);
    });

    test('copyWith preserves and updates pinnedColumns', () {
      final entity = EntityCustom.fromJson(createMinimalEntityJson({
        'pinned_columns': ['subordinate_name'],
      }));

      expect(entity.pinnedColumns, equals(['subordinate_name']));

      // Preserve
      final preserved = entity.copyWith();
      expect(preserved.pinnedColumns, equals(['subordinate_name']));

      // Update
      final updated = entity.copyWith(pinnedColumns: ['description', 'area_value']);
      expect(updated.pinnedColumns, equals(['description', 'area_value']));
    });
  });
}
