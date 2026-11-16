import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/entity_data_table.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity_badge_config.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';

void main() {
  setUp(() {
    flavorConfig = FlavorConfig(
      companyId: 'test',
      companyName: 'Test',
      companyPhone: '123',
      companyWebsite: 'test.com',
      companyAddress: 'Test Address',
      apiUrl: 'http://localhost',
      color: Colors.blue,
      colorSoft: Colors.lightBlue,
      backgroundLoginPage: '',
      applicationConfig: null,
    );
  });

  group('EntityDataTable Configurable Badges', () {
    test('parses badges from entity JSON and field JSON correctly', () {
      final json = {
        'id': 'test_entity',
        'label': 'Test Entity',
        'description': 'Test',
        'badges': [
          'tahun',
          'bulan',
          {
            'reference': 'area',
            'label': 'Wilayah',
            'icon': 'location',
          }
        ],
        'fields': [
          {
            'label': 'Year',
            'reference': 'tahun',
            'type': 'text',
            'is_badge': true,
            'icon': 'calendar',
          },
          {
            'label': 'Month',
            'reference': 'bulan',
            'type': 'text',
            'is_badge': true,
            'icon': 'calendar',
          },
          {
            'label': 'Branch',
            'reference': 'branch',
            'type': 'text',
            'is_badge': true,
            'icon': 'business',
          },
        ],
        'backend': {
          'read_all': {
            'method': 'GET',
            'url': 'http://localhost/test',
          }
        },
        'layout_table': {
          'product': 10,
        },
      };

      final entity = EntityCustom.fromJson(json);

      expect(entity.badges, hasLength(3));
      expect(entity.badges[0].reference, 'tahun');
      expect(entity.badges[1].reference, 'bulan');
      expect(entity.badges[2].reference, 'area');
      expect(entity.badges[2].label, 'Wilayah');
      expect(entity.badges[2].icon, 'location');

      // Check resolvedBadges merges explicit badges and fields with is_badge: true
      final resolved = entity.resolvedBadges;
      expect(resolved.map((b) => b.reference).toList(),
          containsAll(['tahun', 'bulan', 'area', 'branch']));
    });

    test('ActionD parses badges property correctly', () {
      final actionJson = {
        'id': 'test_action',
        'name': 'Open Detail',
        'type': 'show_dialog',
        'view_type': 'table',
        'target_entity': 'sales_target_monthly_trend_details',
        'badges': ['tahun', 'bulan', 'customer'],
      };

      final action = ActionD.fromJson(actionJson);
      expect(action.badges, equals(['tahun', 'bulan', 'customer']));
    });

    test('resolveBadgeIcon resolves custom and inferred icons', () {
      expect(resolveBadgeIcon('calendar', 'foo'), Icons.calendar_today_outlined);
      expect(resolveBadgeIcon('location', 'foo'), Icons.location_on_outlined);
      expect(resolveBadgeIcon('person', 'foo'), Icons.person_outline);
      expect(resolveBadgeIcon('category', 'foo'), Icons.category_outlined);
      expect(resolveBadgeIcon(null, 'tahun'), Icons.calendar_today_outlined);
      expect(resolveBadgeIcon(null, 'bulan'), Icons.calendar_today_outlined);
      expect(resolveBadgeIcon(null, 'area'), Icons.location_on_outlined);
      expect(resolveBadgeIcon(null, 'customer'), Icons.person_outline);
      expect(resolveBadgeIcon(null, 'product'), Icons.inventory_2_outlined);
      expect(resolveBadgeIcon(null, 'status'), Icons.flag_outlined);
      expect(resolveBadgeIcon(null, 'unknown_field'), Icons.label_outline);
    });

    testWidgets(
      'renders badges defined in JSON (year, month, and other arbitrary parameters like area & customer)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final entityJson = {
          'id': 'sales_target_monthly_trend_details',
          'label': 'Sales Target Monthly Trend Details',
          'description': 'Laporan detail tren target dan estimasi penjualan bulanan',
          'badges': [
            'tahun',
            'bulan',
            {
              'reference': 'area',
              'label': 'Wilayah',
              'icon': 'location',
            },
            'customer',
          ],
          'fields': [
            {
              'label': 'Year',
              'reference': 'tahun',
              'type': 'text',
              'is_badge': true,
              'icon': 'calendar',
            },
            {
              'label': 'Month',
              'reference': 'bulan',
              'type': 'text',
              'is_badge': true,
              'icon': 'calendar',
            },
            {
              'label': 'Area',
              'reference': 'area',
              'type': 'text',
            },
            {
              'label': 'Customer',
              'reference': 'customer',
              'type': 'text',
            },
            {
              'label': 'Product',
              'reference': 'product',
              'type': 'text',
            },
            {
              'label': 'Estimation',
              'reference': 'estimasi',
              'type': 'number',
            },
          ],
          'layout_table': {
            'product': 12,
            'estimasi': 10,
          },
          'backend': {
            'read_all': {
              'method': 'GET',
              'url': 'http://localhost/test',
              'mock_enabled': true,
              'mock_data': [
                {
                  'tahun': '2026',
                  'bulan': '03',
                  'area': 'MDNA1',
                  'customer': 'CUST-METISKA',
                  'product': 'COUPLUS',
                  'estimasi': 5000000,
                },
              ],
            },
          },
          'pagination_option': {
            'sort_by': 'product',
            'ascending': true,
          },
          'hide_filters': true,
          'hide_row_actions': true,
          'freeze_first_column': false,
          'freeze_last_column': false,
          'freezed_column': false,
        };

        final entity = EntityCustom.fromJson(entityJson);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MenuDataTableCustom.prepare(
                entity: entity,
                embedded: true,
                bypassPermission: true,
                parentData: const [],
                initialFilters: [
                  Filter(reference: 'tahun', value: '2026'),
                  Filter(reference: 'bulan', value: '03'),
                  Filter(reference: 'area', value: 'MDNA1'),
                  Filter(reference: 'customer', value: 'CUST-METISKA'),
                ],
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        // Check that year & month badges are rendered
        expect(find.text('Year: 2026'), findsOneWidget);
        expect(find.text('Month: 03'), findsOneWidget);

        // Check that custom parameter badges (area with custom label 'Wilayah' & customer) are rendered
        expect(find.text('Wilayah: MDNA1'), findsOneWidget);
        expect(find.text('Customer: CUST-METISKA'), findsOneWidget);

        // Check that badged fields are NOT rendered as table columns
        final dataTableFinder =
            find.byType(DataTableBackend<Map<String, dynamic>>);
        expect(dataTableFinder, findsOneWidget);

        final dataTableBackend = tester
            .widget<DataTableBackend<Map<String, dynamic>>>(dataTableFinder);
        final columnHeaders =
            dataTableBackend.columns.map((c) => c.head.label).toList();

        expect(columnHeaders, isNot(contains('Year')));
        expect(columnHeaders, isNot(contains('Month')));
        expect(columnHeaders, isNot(contains('Area')));
        expect(columnHeaders, isNot(contains('Customer')));
        expect(columnHeaders, contains('Product'));
        expect(columnHeaders, contains('Estimation'));
      },
    );
  });
}
