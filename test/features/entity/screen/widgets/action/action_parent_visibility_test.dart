import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('ActionD Parent Visibility Tests', () {
    test('isVisibleFor evaluates parent and row transaction_id condition correctly', () {
      final action = ActionD.fromJson({
        'id': 'lbb_realization',
        'name': '+ LBB Realization',
        'type': 'open_page',
        'layout_form_id': 'lbb_realization',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field': "{{ is_detail == 1 || is_detail == '1' || is_detail == true || is_detail == 'true' }}",
              'op': '=',
              'value': false,
            },
            {
              'field': "{{ (parent.transaction_id == null || parent.transaction_id == '' || parent.transaction_id == '-') && (transaction_id == null || transaction_id == '' || transaction_id == '-') }}",
              'op': '=',
              'value': true,
            }
          ]
        },
      });

      // Case 1: parent.transaction_id is '-' and row is not detail -> visible
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'transaction_id': '-'},
          parentData: [
            {'transaction_id': '-'}
          ],
        ),
        true,
      );

      // Case 2: parent.transaction_id is 'LBP/01/26090004' -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'transaction_id': null},
          parentData: [
            {'transaction_id': 'LBP/01/26090004'}
          ],
        ),
        false,
      );

      // Case 3: parentData is empty and row transaction_id is '-' -> visible
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'transaction_id': '-'},
          parentData: [],
        ),
        true,
      );

      // Case 4: row is detail (is_detail = true) -> hidden regardless of transaction_id
      expect(
        action.isVisibleFor(
          {'is_detail': true, 'transaction_id': '-'},
          parentData: [
            {'transaction_id': '-'}
          ],
        ),
        false,
      );
    });

    test('isVisibleFor evaluates realization_submission empty or zero condition correctly', () {
      final action = ActionD.fromJson({
        'id': 'actual_realization',
        'name': 'Actual Realization',
        'type': 'open_page',
        'layout_form_id': 'actual_realization',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field': "{{ (typeof parent === 'undefined' || !parent || parent.realization_submission == null || parent.realization_submission == '' || parent.realization_submission == 0 || parent.realization_submission == '0') && (typeof realization_submission === 'undefined' || realization_submission == null || realization_submission == '' || realization_submission == 0 || realization_submission == '0') }}",
              'op': '=',
              'value': true,
            }
          ]
        },
      });

      // Case 1: realization_submission is 0 -> visible
      expect(
        action.isVisibleFor(
          {'realization_submission': 0},
          parentData: [],
        ),
        true,
      );

      // Case 2: realization_submission is null -> visible
      expect(
        action.isVisibleFor(
          {'realization_submission': null},
          parentData: [],
        ),
        true,
      );

      // Case 3: realization_submission is 100000 -> hidden
      expect(
        action.isVisibleFor(
          {'realization_submission': 100000},
          parentData: [],
        ),
        false,
      );

      // Case 4: in sub-detail where parent.realization_submission is 0 -> visible
      expect(
        action.isVisibleFor(
          {'id': 1},
          parentData: [
            {'realization_submission': 0}
          ],
        ),
        true,
      );

      // Case 5: in sub-detail where parent.realization_submission is 100000 -> hidden
      expect(
        action.isVisibleFor(
          {'id': 1},
          parentData: [
            {'realization_submission': 100000}
          ],
        ),
        false,
      );
    });
  });
}
