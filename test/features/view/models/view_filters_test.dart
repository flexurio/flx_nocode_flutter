import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/view/models/view.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';

void main() {
  group('DView.filters Dynamic Resolution Tests', () {
    late EntityCustom dummyEntity;

    setUp(() {
      dummyEntity = EntityCustom.empty().copyWith(id: 'test_entity');
    });

    test('resolves filters directly from current row data', () {
      final view = DView(
        id: 'view_1',
        label: 'Sub Details',
        entity: 'sub_details',
        filter: {
          'target_header_id': 'header_id',
          'target_code': 'code',
        },
      );

      final data = {
        'header_id': 'HDR-001',
        'code': 'CODE-123',
        'unused_field': 'hello',
      };

      final filters = view.filters(dummyEntity, data);

      expect(filters.length, 2);
      expect(filters[0].reference, 'target_header_id');
      expect(filters[0].value, 'HDR-001');
      expect(filters[1].reference, 'target_code');
      expect(filters[1].value, 'CODE-123');
    });

    test('resolves from activeFilters when sourceKey is missing in current data', () {
      final view = DView(
        id: 'view_2',
        label: 'Realization Details',
        entity: 'realization_details',
        filter: {
          'target_sub_id': 'id',
          'target_detail_id': 'detail_id',
        },
      );

      // Current data only has 'id'
      final data = {'id': 'SUB-99'};

      // activeFilters passed from previous navigation tier has 'detail_id'
      final activeFilters = {'detail_id': 'DET-101'};

      final filters = view.filters(
        dummyEntity,
        data,
        null,
        activeFilters,
      );

      expect(filters.length, 2);
      expect(filters.firstWhere((f) => f.reference == 'target_sub_id').value, 'SUB-99');
      expect(filters.firstWhere((f) => f.reference == 'target_detail_id').value, 'DET-101');
    });

    test('resolves from parentData stack when missing in data and activeFilters', () {
      final view = DView(
        id: 'view_3',
        label: 'Deep Child',
        entity: 'deep_child',
        filter: {
          'target_child_id': 'id',
          'parent_code': 'parent_code',
          'grandparent_ref': 'root_ref',
        },
      );

      final currentData = {'id': 'CHILD-1'};

      final parentData = [
        // Level 0 (Grandparent / Root)
        {'root_ref': 'ROOT-ABC', 'level': '0'},
        // Level 1 (Immediate parent)
        {'parent_code': 'PARENT-XYZ', 'level': '1'},
      ];

      final filters = view.filters(
        dummyEntity,
        currentData,
        parentData,
        null,
      );

      expect(filters.length, 3);
      expect(filters.firstWhere((f) => f.reference == 'target_child_id').value, 'CHILD-1');
      expect(filters.firstWhere((f) => f.reference == 'parent_code').value, 'PARENT-XYZ');
      expect(filters.firstWhere((f) => f.reference == 'grandparent_ref').value, 'ROOT-ABC');
    });

    test('prioritizes data > activeFilters > nearest parentData', () {
      final view = DView(
        id: 'view_4',
        label: 'Priority Test',
        entity: 'priority_test',
        filter: {
          'key_a': 'key_a',
          'key_b': 'key_b',
          'key_c': 'key_c',
        },
      );

      final currentData = {
        'key_a': 'from_data',
      };

      final activeFilters = {
        'key_a': 'from_active_filters_shadowed',
        'key_b': 'from_active_filters',
      };

      final parentData = [
        {'key_a': 'from_parent_old', 'key_b': 'from_parent_old', 'key_c': 'from_parent_deep'},
        {'key_c': 'from_nearest_parent'},
      ];

      final filters = view.filters(
        dummyEntity,
        currentData,
        parentData,
        activeFilters,
      );

      expect(filters.length, 3);
      expect(filters.firstWhere((f) => f.reference == 'key_a').value, 'from_data');
      expect(filters.firstWhere((f) => f.reference == 'key_b').value, 'from_active_filters');
      expect(filters.firstWhere((f) => f.reference == 'key_c').value, 'from_nearest_parent');
    });

    test('ignores keys that cannot be found anywhere in hierarchy', () {
      final view = DView(
        id: 'view_5',
        label: 'Missing Keys Test',
        entity: 'missing_keys',
        filter: {
          'found_key': 'present_field',
          'missing_key': 'non_existent_field',
        },
      );

      final currentData = {'present_field': 'val123'};

      final filters = view.filters(dummyEntity, currentData);

      expect(filters.length, 1);
      expect(filters.first.reference, 'found_key');
      expect(filters.first.value, 'val123');
    });

    test('ignores null or empty sourceKey in filter mapping', () {
      final view = DView(
        id: 'view_6',
        label: 'Empty Key Test',
        entity: 'empty_key',
        filter: {
          'valid_key': 'present_field',
          'empty_source': '',
        },
      );

      final currentData = {'present_field': 'valid_val'};

      final filters = view.filters(dummyEntity, currentData);

      expect(filters.length, 1);
      expect(filters.first.reference, 'valid_key');
      expect(filters.first.value, 'valid_val');
    });
  });
}
