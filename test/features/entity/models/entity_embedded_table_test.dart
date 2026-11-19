import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity_embedded_table.dart';

void main() {
  group('EntityEmbeddedTable Unit Tests', () {
    test(
        'EntityEmbeddedTable.fromRaw with null returns empty entityId and null title',
        () {
      final embedded = EntityEmbeddedTable.fromRaw(null);

      expect(embedded.entityId, '');
      expect(embedded.title, isNull);
    });

    test('EntityEmbeddedTable.fromRaw with String parses entityId', () {
      final embedded = EntityEmbeddedTable.fromRaw(
          'sales_target_monthly_trend_detail_asm_summaries');

      expect(
          embedded.entityId, 'sales_target_monthly_trend_detail_asm_summaries');
      expect(embedded.title, isNull);
    });

    test('EntityEmbeddedTable.fromRaw with Map parses entity and title', () {
      final json = {
        'entity': 'sales_target_monthly_trend_detail_asm_summaries',
        'title': 'Performa Per Area Sales Manager (ASM)',
      };

      final embedded = EntityEmbeddedTable.fromRaw(json);

      expect(
          embedded.entityId, 'sales_target_monthly_trend_detail_asm_summaries');
      expect(embedded.title, 'Performa Per Area Sales Manager (ASM)');
    });

    test(
        'EntityEmbeddedTable.fromRaw parses alternative alias keys for entityId and title',
        () {
      final jsonTarget = {
        'target_entity': 'sub_table_entity',
        'label': 'Sub Table Title',
      };
      final embeddedTarget = EntityEmbeddedTable.fromRaw(jsonTarget);
      expect(embeddedTarget.entityId, 'sub_table_entity');
      expect(embeddedTarget.title, 'Sub Table Title');

      final jsonEntityId = {
        'entity_id': 'another_entity',
      };
      final embeddedEntityId = EntityEmbeddedTable.fromRaw(jsonEntityId);
      expect(embeddedEntityId.entityId, 'another_entity');
      expect(embeddedEntityId.title, isNull);

      final jsonId = {
        'id': 'third_entity',
      };
      final embeddedId = EntityEmbeddedTable.fromRaw(jsonId);
      expect(embeddedId.entityId, 'third_entity');
    });

    test('EntityEmbeddedTable.fromRaw with unexpected types falls back safely',
        () {
      expect(EntityEmbeddedTable.fromRaw(123).entityId, '');
      expect(EntityEmbeddedTable.fromRaw(true).entityId, '');
    });
  });
}
