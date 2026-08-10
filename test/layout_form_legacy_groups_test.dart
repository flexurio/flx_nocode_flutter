import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

void main() {
  group('LayoutForm Legacy Groups Fallback Test', () {
    test('converts legacy groups structure into components array', () {
      final map = {
        'id': 'create',
        'name': 'create',
        'label': 'Create Entity',
        'groups': [
          {
            'columns': 2,
            'fields': ['name_project', 'total_budget']
          },
          {
            'columns': 1,
            'fields': ['notes']
          }
        ]
      };

      final form = LayoutForm.fromMap(map);

      expect(form.id, 'create');
      expect(form.components.length, 2);
    });
  });
}
