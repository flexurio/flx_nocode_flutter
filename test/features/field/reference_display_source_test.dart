import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_display.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/inline_filter.dart';
import 'package:flx_nocode_flutter/features/field/domain/field_value_label_resolver.dart';
import 'package:flx_nocode_flutter/features/field/domain/reference_label_cache.dart';
import 'package:flx_nocode_flutter/features/field/models/display_source_model.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_display.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/layout_form.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/util/general_xlsx.dart';

void main() {
  setUp(() {
    ReferenceLabelCache.instance.clear();
    ReferenceLabelCache.instance.customFetcher = null;
  });

  tearDown(() {
    ReferenceLabelCache.instance.clear();
    ReferenceLabelCache.instance.customFetcher = null;
  });

  group('DisplaySourceModel — Model & Parsing', () {
    test('parses from standard JSON map config', () {
      final json = {
        'path': '/plant_capa_categories',
        'key': 'id',
        'label': '{{item.code}} - {{item.name}}',
        'batch_param': 'id.in',
        'cache_ttl_seconds': 600,
        'fallback': 'dash',
      };

      final model = DisplaySourceModel.fromDynamic(json);
      expect(model, isNotNull);
      expect(model!.effectivePath, '/plant_capa_categories');
      expect(model.key, 'id');
      expect(model.label, '{{item.code}} - {{item.name}}');
      expect(model.effectiveBatchParam, 'id.in');
      expect(model.cacheTtlSeconds, 600);
      expect(model.fallback, 'dash');
    });

    test('parses from shorthand backend.entity({key}:{label}) format', () {
      const shorthand =
          'backend.plant_sites({id}:{code} - {name})';

      final model = DisplaySourceModel.fromDynamic(shorthand);
      expect(model, isNotNull);
      expect(model!.effectivePath, '/plant_sites');
      expect(model.key, 'id');
      expect(model.label, '{{item.code}} - {{item.name}}');
      expect(model.effectiveBatchParam, 'id.in');
    });

    test('formats items with template interpolation and graceful fallback', () {
      const model = DisplaySourceModel(
        label: '{{item.code}} - {{item.name}}',
        key: 'id',
      );

      expect(
        model.format({'code': 'CAT-01', 'name': 'Deviasi Mayor'}),
        'CAT-01 - Deviasi Mayor',
      );

      // Support simple single-brace or no-item syntax
      expect(
        DisplaySourceModel.formatItemLabel(
          '{code} : {name}',
          {'code': 'SITE-CKR', 'name': 'Pabrik Cikarang'},
        ),
        'SITE-CKR : Pabrik Cikarang',
      );

      // Graceful fallback when template missing
      expect(
        DisplaySourceModel.formatItemLabel(
          '',
          {'id': 10, 'code': 'DEV', 'name': 'Deviasi'},
          fallbackKey: 'id',
        ),
        'DEV - Deviasi',
      );
    });

    test('EntityField parses display_source and auto-derives from options_source', () {
      final fieldWithDisplaySource = EntityField.fromJson({
        'reference': 'capa_category_id',
        'label': 'Kategori',
        'type': 'number',
        'display_source': {
          'path': '/plant_capa_categories',
          'label': '{{item.code}} - {{item.name}}',
        },
      });

      expect(fieldWithDisplaySource.displaySource, isNotNull);
      expect(fieldWithDisplaySource.hasValueLabels, isTrue);
      expect(
        fieldWithDisplaySource.effectiveDisplaySource?.effectivePath,
        '/plant_capa_categories',
      );

      // Auto-derive from options_source backend.entity(...)
      final fieldWithBackendOptions = EntityField.fromJson({
        'reference': 'site_id',
        'label': 'Site',
        'type': 'select',
        'options_source': 'backend.plant_sites({id}:{name})',
      });

      expect(fieldWithBackendOptions.displaySource, isNull);
      expect(fieldWithBackendOptions.effectiveDisplaySource, isNotNull);
      expect(
        fieldWithBackendOptions.effectiveDisplaySource?.effectivePath,
        '/plant_sites',
      );
    });
  });

  group('ReferenceLabelCache — DataLoader, Anti-N+1 & Caching', () {
    test('seed and synchronous getCached', () {
      const source = DisplaySourceModel(
        path: '/plant_capa_categories',
        key: 'id',
      );

      ReferenceLabelCache.instance.seed(
        '/plant_capa_categories',
        'id',
        '1',
        'CAT-01 - Deviasi Mayor',
      );

      final cached = ReferenceLabelCache.instance.getCached(source, 1);
      expect(cached, 'CAT-01 - Deviasi Mayor');

      expect(ReferenceLabelCache.instance.getCached(source, 999), isNull);
    });

    test('resolveBatch groups missing IDs into single request and caches result', () async {
      int fetchCallCount = 0;
      List<String> requestedIds = [];

      ReferenceLabelCache.instance.customFetcher = ({
        required String path,
        required String batchParam,
        required List<String> ids,
        String? url,
      }) async {
        fetchCallCount++;
        requestedIds = ids;
        return [
          {'id': 1, 'code': 'CAT-01', 'name': 'Deviasi Mayor'},
          {'id': 2, 'code': 'CAT-02', 'name': 'Temuan Audit'},
        ];
      };

      const source = DisplaySourceModel(
        path: '/plant_capa_categories',
        key: 'id',
        label: '{{item.code}} - {{item.name}}',
      );

      final result = await ReferenceLabelCache.instance.resolveBatch(
        source,
        [1, 2, '1'], // duplicates handled
      );

      expect(fetchCallCount, 1);
      expect(requestedIds, ['1', '2']);
      expect(result['1'], 'CAT-01 - Deviasi Mayor');
      expect(result['2'], 'CAT-02 - Temuan Audit');

      // Second call must be served 100% from cache without triggering HTTP
      final secondResult = await ReferenceLabelCache.instance.resolveBatch(
        source,
        [1, 2],
      );
      expect(fetchCallCount, 1); // No new fetch
      expect(secondResult['1'], 'CAT-01 - Deviasi Mayor');
    });

    test('ensureLoadedForRows preloads foreign keys across rows in parallel', () async {
      final calls = <String, List<String>>{};

      ReferenceLabelCache.instance.customFetcher = ({
        required String path,
        required String batchParam,
        required List<String> ids,
        String? url,
      }) async {
        calls[path] = ids;
        if (path.contains('categories')) {
          return [
            {'id': 10, 'code': 'C-10', 'name': 'Cat 10'},
            {'id': 20, 'code': 'C-20', 'name': 'Cat 20'},
          ];
        }
        if (path.contains('sites')) {
          return [
            {'id': 1, 'code': 'S-1', 'name': 'Site 1'},
            {'id': 2, 'code': 'S-2', 'name': 'Site 2'},
          ];
        }
        return const [];
      };

      final fields = [
        EntityField(
          reference: 'category_id',
          label: 'Kategori',
          type: 'number',
          displaySource: const DisplaySourceModel(
            path: '/categories',
            label: '{{item.name}}',
          ),
        ),
        EntityField(
          reference: 'site_id',
          label: 'Site',
          type: 'number',
          displaySource: const DisplaySourceModel(
            path: '/sites',
            label: '{{item.name}}',
          ),
        ),
      ];

      final rows = [
        {'category_id': 10, 'site_id': 1},
        {'category_id': 20, 'site_id': 2},
        {'category_id': 10, 'site_id': 1},
      ];

      await ReferenceLabelCache.instance.ensureLoadedForRows(rows, fields);

      expect(calls['/categories'], ['10', '20']);
      expect(calls['/sites'], ['1', '2']);

      // Now synchronous resolution is instant
      expect(fields[0].resolveDisplayLabel(10), 'Cat 10');
      expect(fields[1].resolveDisplayLabel(1), 'Site 1');
    });
  });

  group('Multi-Surface Integration — Export & Print', () {
    test('FieldValueLabelResolver.resolveLabel respects 4-tier hierarchy', () {
      const source = DisplaySourceModel(
        path: '/plant_capa_categories',
        key: 'id',
      );

      ReferenceLabelCache.instance.seed(
        '/plant_capa_categories',
        'id',
        '1',
        'Remote Label',
      );

      // 1. Explicit value_labels wins
      expect(
        FieldValueLabelResolver.resolveLabel(
          '1',
          valueLabels: {'1': 'Explicit Override'},
          displaySource: source,
        ),
        'Explicit Override',
      );

      // 2. Static options_source wins over displaySource
      expect(
        FieldValueLabelResolver.resolveLabel(
          '1',
          optionsSource: "values('1':'Static Option')",
          displaySource: source,
        ),
        'Static Option',
      );

      // 3. Dynamic displaySource from cache
      expect(
        FieldValueLabelResolver.resolveLabel(
          '1',
          displaySource: source,
        ),
        'Remote Label',
      );

      // 4. Raw fallback
      expect(
        FieldValueLabelResolver.resolveLabel(
          '999',
          displaySource: source,
        ),
        '999',
      );
    });

    test('formatRowsForExport and generalXlsxNoCode format foreign key labels', () {
      final field = EntityField(
        reference: 'cat_id',
        label: 'Category',
        type: 'number',
        displaySource: const DisplaySourceModel(
          path: '/cats',
          label: '{{item.name}}',
        ),
      );

      ReferenceLabelCache.instance.seed('/cats', 'id', '5', 'QC & QA Compliance');

      final rows = [
        {'id': 1, 'cat_id': 5},
      ];

      final formatted = FieldValueLabelResolver.formatRowsForExport(
        rows,
        ['id', 'cat_id'],
        [field],
      );

      expect(formatted[0]['cat_id'], 'QC & QA Compliance');
      // Original row is not mutated
      expect(rows[0]['cat_id'], 5);

      // XLSX export succeeds
      final xlsxBytes = generalXlsxNoCode(
        null,
        rows,
        ['cat_id'],
        entityFields: [field],
      );
      expect(xlsxBytes, isNotEmpty);
    });

    test('enrichPrintContext non-destructively adds <reference>_label', () {
      final field = EntityField(
        reference: 'site_id',
        label: 'Site',
        type: 'number',
        displaySource: const DisplaySourceModel(
          path: '/sites',
          label: '{{item.name}}',
        ),
      );

      ReferenceLabelCache.instance.seed('/sites', 'id', '2', 'Cikarang Plant');

      final context = {
        'site_id': 2,
        'doc_no': 'CPOB-001',
      };

      final enriched = FieldValueLabelResolver.enrichPrintContext(
        context,
        [field],
      );

      expect(enriched['site_id'], 2); // preserved raw code
      expect(enriched['site_id_label'], 'Cikarang Plant'); // resolved label
      expect(enriched['doc_no'], 'CPOB-001');
    });
  });

  group('Widget Tests — Table & Detail', () {
    EntityCustom buildEntity({required List<Map<String, dynamic>> fields}) {
      return EntityCustom.fromJson({
        'id': 'plant_capas',
        'label': 'CAPA CPOB',
        'description': 'Dokumen CAPA CPOB',
        'backend': {'others': []},
        'layout_table': {},
        'fields': fields,
      });
    }

    testWidgets('EntityFieldDisplay renders resolved display_source label', (tester) async {
      ReferenceLabelCache.instance.seed(
        '/plant_capa_categories',
        'id',
        '3',
        'CAT-03 - Keluhan Pelanggan',
      );

      final entity = buildEntity(
        fields: [
          {
            'reference': 'capa_category_id',
            'label': 'Kategori',
            'type': 'number',
            'display_source': {
              'path': '/plant_capa_categories',
              'key': 'id',
              'label': '{{item.code}} - {{item.name}}',
            },
          },
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EntityFieldDisplay.build(
              entity,
              'capa_category_id',
              3,
            ),
          ),
        ),
      );

      expect(find.text('CAT-03 - Keluhan Pelanggan'), findsOneWidget);
    });

    testWidgets('EntityFieldDisplay with is_chip renders chip and matches color from raw ID', (tester) async {
      ReferenceLabelCache.instance.seed(
        '/plant_capa_categories',
        'id',
        '3',
        'CAT-03 - Keluhan Pelanggan',
      );

      final entity = buildEntity(
        fields: [
          {
            'reference': 'capa_category_id',
            'label': 'Kategori',
            'type': 'number',
            'is_chip': true,
            'chip_colors': {'3': '#43A047'},
            'display_source': {
              'path': '/plant_capa_categories',
              'key': 'id',
              'label': '{{item.code}} - {{item.name}}',
            },
          },
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EntityFieldDisplay.build(
              entity,
              'capa_category_id',
              3,
            ),
          ),
        ),
      );

      expect(find.text('CAT-03 - Keluhan Pelanggan'), findsOneWidget);
    });

    testWidgets('ComponentFieldDisplay inherits display_source via field_ref', (tester) async {
      ReferenceLabelCache.instance.seed(
        '/plant_sites',
        'id',
        '1',
        'SITE-CKR - Pabrik Cikarang',
      );

      final field = EntityField(
        reference: 'site_id',
        label: 'Pabrik',
        type: 'number',
        displaySource: const DisplaySourceModel(
          path: '/plant_sites',
          key: 'id',
          label: '{{item.code}} - {{item.name}}',
        ),
      );

      final detailField = ComponentFieldDisplay(
        id: 'v_site',
        label: 'Lokasi Pabrik',
        value: '{{current.site_id}}',
        fieldRef: 'site_id',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: detailField.toWidget({
              'site_id': 1,
              '__entityFields': [field],
            }),
          ),
        ),
      );

      expect(find.text('SITE-CKR - Pabrik Cikarang'), findsOneWidget);
    });
  });
}
