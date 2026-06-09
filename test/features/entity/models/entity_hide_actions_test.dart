import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  group('EntityCustom Hide Row Actions Tests', () {
    test('EntityCustom.fromJson parses hide_row_actions correctly', () {
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
        'hide_row_actions': true,
      };

      final entity = EntityCustom.fromJson(json);
      expect(entity.hideRowActions, isTrue);
    });

    test('EntityCustom.fromJson defaults hide_row_actions to false', () {
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
      expect(entity.hideRowActions, isFalse);
    });

    test('EntityCustom.toJson includes hide_row_actions', () {
      final entity = EntityCustom.empty().copyWith(hideRowActions: true);
      final json = entity.toJson();
      expect(json['hide_row_actions'], isTrue);
    });
  });
}
