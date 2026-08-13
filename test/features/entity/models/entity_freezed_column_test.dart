import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  group('EntityCustom Freezed Column Parsing Tests', () {
    Map<String, dynamic> createMinimalEntityJson(Map<String, dynamic> extra) {
      return {
        'id': 'test_entity',
        'label': 'Test Entity',
        'description': 'Description',
        'fields': [
          {
            'label': 'ID',
            'reference': 'id',
            'type': 'number',
          }
        ],
        'backend': {
          'read_all': {
            'method': 'GET',
            'url': 'http://localhost/test',
          }
        },
        'layout_table': {'id': 10},
        ...extra,
      };
    }

    test('defaults to freezing both columns when freezed_column is omitted', () {
      final json = createMinimalEntityJson({});
      final entity = EntityCustom.fromJson(json);

      expect(entity.freezeFirstColumn, isTrue);
      expect(entity.freezeLastColumn, isTrue);
    });

    test('unfreezes both columns when freezed_column is false', () {
      final json = createMinimalEntityJson({'freezed_column': false});
      final entity = EntityCustom.fromJson(json);

      expect(entity.freezeFirstColumn, isFalse);
      expect(entity.freezeLastColumn, isFalse);
    });

    test('freezes both columns when freezed_column is true', () {
      final json = createMinimalEntityJson({'freezed_column': true});
      final entity = EntityCustom.fromJson(json);

      expect(entity.freezeFirstColumn, isTrue);
      expect(entity.freezeLastColumn, isTrue);
    });

    test('supports string options first / first_only', () {
      final json = createMinimalEntityJson({'freezed_column': 'first'});
      final entity = EntityCustom.fromJson(json);

      expect(entity.freezeFirstColumn, isTrue);
      expect(entity.freezeLastColumn, isFalse);
    });

    test('supports string options last / last_only', () {
      final json = createMinimalEntityJson({'freezed_column': 'last'});
      final entity = EntityCustom.fromJson(json);

      expect(entity.freezeFirstColumn, isFalse);
      expect(entity.freezeLastColumn, isTrue);
    });

    test('supports fine-grained freeze_first_column and freeze_last_column overrides', () {
      final json = createMinimalEntityJson({
        'freeze_first_column': true,
        'freeze_last_column': false,
      });
      final entity = EntityCustom.fromJson(json);

      expect(entity.freezeFirstColumn, isTrue);
      expect(entity.freezeLastColumn, isFalse);
    });
  });
}
