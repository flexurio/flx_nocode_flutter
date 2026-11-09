import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/menu_data_table_actions.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';

void main() {
  group('EntityCustom hide_filters Tests', () {
    test('EntityCustom.fromJson parses hide_filters correctly', () {
      final json = <String, dynamic>{
        'id': 'test_entity',
        'label': 'Test Label',
        'description': 'Test Desc',
        'fields': [],
        'views': [],
        'exports': [],
        'backend': {
          'read_all': {'method': 'GET', 'url': 'http://test'}
        },
        'pagination_option': <String, dynamic>{},
        'layout_form': [],
        'layout_table': <String, dynamic>{},
        'hide_filters': true,
      };

      final entity = EntityCustom.fromJson(json);
      expect(entity.hideFilters, isTrue);
    });

    test('EntityCustom.fromJson defaults hide_filters to false when omitted', () {
      final json = <String, dynamic>{
        'id': 'test_entity',
        'label': 'Test Label',
        'description': 'Test Desc',
        'fields': [],
        'views': [],
        'exports': [],
        'backend': {
          'read_all': {'method': 'GET', 'url': 'http://test'}
        },
        'pagination_option': <String, dynamic>{},
        'layout_form': [],
        'layout_table': <String, dynamic>{},
      };

      final entity = EntityCustom.fromJson(json);
      expect(entity.hideFilters, isFalse);
    });

    test('EntityCustom.toJson includes hide_filters', () {
      final entity = EntityCustom.empty().copyWith(hideFilters: true);
      final json = entity.toJson();
      expect(json['hide_filters'], isTrue);
    });

    test('EntityCustom.copyWith updates hideFilters', () {
      final entity = EntityCustom.empty();
      expect(entity.hideFilters, isFalse);

      final updated = entity.copyWith(hideFilters: true);
      expect(updated.hideFilters, isTrue);
    });

    testWidgets('MenuDataTableActions hides FilterButton when hideFilters is true',
        (tester) async {
      final entity = EntityCustom.empty().copyWith(
        hideFilters: true,
        actionsHome: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuDataTableActions(
              entity: entity,
              parentData: const [],
              embedded: true,
              bypassPermission: true,
              filters: const [],
              refreshButton: const SizedBox(),
              onFilterChanged: (_) {},
              onRefresh: () {},
            ),
          ),
        ),
      );

      expect(find.byType(FilterButton), findsNothing);
    });

    testWidgets('MenuDataTableActions shows FilterButton when hideFilters is false',
        (tester) async {
      final entity = EntityCustom.empty().copyWith(
        hideFilters: false,
        actionsHome: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuDataTableActions(
              entity: entity,
              parentData: const [],
              embedded: true,
              bypassPermission: true,
              filters: const [],
              refreshButton: const SizedBox(),
              onFilterChanged: (_) {},
              onRefresh: () {},
            ),
          ),
        ),
      );

      expect(find.byType(FilterButton), findsOneWidget);
    });
  });
}
