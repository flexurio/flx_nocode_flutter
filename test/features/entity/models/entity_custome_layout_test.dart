import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  group('EntityCustom Custom Layout Parsing Tests', () {
    test('EntityCustom.fromJson parses custome_layout correctly', () {
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
        'custome_layout': [
          {
            'label': 'Layout 1',
            'key': 'l1',
            'layout_table': {
              'col1': 5,
              'col2': 10,
            }
          }
        ],
      };

      final entity = EntityCustom.fromJson(json);
      expect(entity.customeLayout, hasLength(1));
      expect(entity.customeLayout[0].label, 'Layout 1');
      expect(entity.customeLayout[0].key, 'l1');
      expect(entity.customeLayout[0].layoutTable['col1'], 5);
      expect(entity.customeLayout[0].layoutTable['col2'], 10);
    });

    test('EntityCustom.fromJson parses custom_layout alias correctly', () {
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
        'custom_layout': [
          {
            'label': 'Layout Alias',
            'key': 'alias',
            'layout_table': {
              'col3': 8,
            }
          }
        ],
      };

      final entity = EntityCustom.fromJson(json);
      expect(entity.customeLayout, hasLength(1));
      expect(entity.customeLayout[0].label, 'Layout Alias');
      expect(entity.customeLayout[0].key, 'alias');
      expect(entity.customeLayout[0].layoutTable['col3'], 8);
    });

    test('EntityCustom.fromJson defaults to empty list when missing', () {
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
      expect(entity.customeLayout, isEmpty);
    });

    test('EntityCustom.toJson includes custome_layout', () {
      final customLayout = CustomeLayout(
        label: 'Layout Test',
        key: 'test_key',
        layoutTable: {'field1': 10},
      );
      final entity = EntityCustom.empty().copyWith(customeLayout: [customLayout]);
      final json = entity.toJson();
      
      expect(json['custome_layout'], isNotNull);
      final list = json['custome_layout'] as List;
      expect(list, hasLength(1));
      expect(list[0]['label'], 'Layout Test');
      expect(list[0]['key'], 'test_key');
      expect(list[0]['layout_table']['field1'], 10);
    });
  });
}
