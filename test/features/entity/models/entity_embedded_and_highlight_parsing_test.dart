import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity_embedded_table.dart';
import 'package:flx_nocode_flutter/features/entity/models/highlight_top_rows.dart';

void main() {
  group('EntityCustom Embedded Table and Highlight Top Rows Parsing', () {
    Map<String, dynamic> createBaseEntityJson(Map<String, dynamic> extra) {
      return {
        'id': 'sales_target_monthly_trend_detail_summaries',
        'label': 'Sales Target Monthly Trend Detail Summaries',
        'description':
            'Laporan ringkasan detail tren target dan estimasi penjualan bulanan',
        'fields': [
          {'label': 'Year', 'reference': 'year', 'type': 'text'},
          {'label': 'Month', 'reference': 'month', 'type': 'text'},
          {'label': 'Target', 'reference': 'target', 'type': 'number'},
          {
            'label': 'Estimation',
            'reference': 'sales_estimation',
            'type': 'number'
          },
          {'label': 'Actual', 'reference': 'sales_actual', 'type': 'number'},
        ],
        'backend': {
          'read_all': {
            'method': 'GET',
            'url': 'http://localhost/test',
          }
        },
        'layout_table': {
          'year': 8,
          'month': 8,
          'target': 12,
        },
        ...extra,
      };
    }

    test('EntityCustom parses embedded_table configuration from JSON', () {
      final json = createBaseEntityJson({
        'embedded_table': {
          'entity': 'sales_target_monthly_trend_detail_asm_summaries',
          'title': 'Performa Per Area Sales Manager (ASM)',
        },
      });

      final entity = EntityCustom.fromJson(json);

      expect(entity.embeddedTable, isNotNull);
      expect(entity.embeddedTable!.entityId,
          'sales_target_monthly_trend_detail_asm_summaries');
      expect(
          entity.embeddedTable!.title, 'Performa Per Area Sales Manager (ASM)');
    });

    test('EntityCustom parses embedded_sub_table alias from JSON', () {
      final json = createBaseEntityJson({
        'embedded_sub_table': {
          'entity': 'sub_asm_summaries',
          'title': 'Sub Table',
        },
      });

      final entity = EntityCustom.fromJson(json);

      expect(entity.embeddedTable, isNotNull);
      expect(entity.embeddedTable!.entityId, 'sub_asm_summaries');
      expect(entity.embeddedTable!.title, 'Sub Table');
    });

    test('EntityCustom parses embedded_entity shorthand string from JSON', () {
      final json = createBaseEntityJson({
        'embedded_entity': 'sales_target_monthly_trend_detail_asm_summaries',
      });

      final entity = EntityCustom.fromJson(json);

      expect(entity.embeddedEntity,
          'sales_target_monthly_trend_detail_asm_summaries');
    });

    test('EntityCustom parses highlight_top_rows configuration from JSON', () {
      final json = createBaseEntityJson({
        'highlight_top_rows': {
          'count': 5,
          'color': '#EFF6FF',
        },
      });

      final entity = EntityCustom.fromJson(json);

      expect(entity.highlightTopRows, isNotNull);
      expect(entity.highlightTopRows!.count, 5);
      expect(entity.highlightTopRows!.color, const Color(0xFFEFF6FF));
      expect(entity.highlightTopRows!.getColor(0), const Color(0xFFEFF6FF));
      expect(entity.highlightTopRows!.getColor(4), isNotNull);
      expect(entity.highlightTopRows!.getColor(5), isNull);
    });

    test('EntityCustom parses top_rows_highlight alias from JSON', () {
      final json = createBaseEntityJson({
        'top_rows_highlight': {
          'count': 3,
          'color': '#FEF3C7',
        },
      });

      final entity = EntityCustom.fromJson(json);

      expect(entity.highlightTopRows, isNotNull);
      expect(entity.highlightTopRows!.count, 3);
      expect(entity.highlightTopRows!.color, const Color(0xFFFEF3C7));
    });

    test(
        'EntityCustom defaults embedded and highlight fields to null when omitted',
        () {
      final json = createBaseEntityJson({});
      final entity = EntityCustom.fromJson(json);

      expect(entity.embeddedTable, isNull);
      expect(entity.embeddedEntity, isNull);
      expect(entity.highlightTopRows, isNull);
    });

    test(
        'EntityCustom.empty() initializes embedded and highlight fields to null',
        () {
      final emptyEntity = EntityCustom.empty();

      expect(emptyEntity.embeddedTable, isNull);
      expect(emptyEntity.embeddedEntity, isNull);
      expect(emptyEntity.highlightTopRows, isNull);
    });

    test(
        'EntityCustom.copyWith preserves and updates embedded and highlight fields',
        () {
      final initial = EntityCustom.fromJson(createBaseEntityJson({
        'embedded_entity': 'initial_entity',
        'highlight_top_rows': {'count': 2, 'color': '#EFF6FF'},
      }));

      expect(initial.embeddedEntity, 'initial_entity');
      expect(initial.highlightTopRows?.count, 2);

      // Updating fields
      final updated = initial.copyWith(
        embeddedTable: const EntityEmbeddedTable(
          entityId: 'new_sub_table',
          title: 'New Sub Title',
        ),
        embeddedEntity: 'updated_entity',
        highlightTopRows: const HighlightTopRows(count: 10),
      );

      expect(updated.embeddedTable?.entityId, 'new_sub_table');
      expect(updated.embeddedTable?.title, 'New Sub Title');
      expect(updated.embeddedEntity, 'updated_entity');
      expect(updated.highlightTopRows?.count, 10);

      // Preserving fields when omitted in copyWith
      final preserved = updated.copyWith(label: 'Updated Label');
      expect(preserved.label, 'Updated Label');
      expect(preserved.embeddedTable?.entityId, 'new_sub_table');
      expect(preserved.embeddedEntity, 'updated_entity');
      expect(preserved.highlightTopRows?.count, 10);
    });
  });
}
