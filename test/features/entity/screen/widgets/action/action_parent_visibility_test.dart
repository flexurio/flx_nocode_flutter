import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('ActionD Parent Visibility Tests', () {
    test(
        'isVisibleFor evaluates parent and row transaction_id condition correctly',
        () {
      final action = ActionD.fromJson({
        'id': 'lbb_realization',
        'name': '+ LBB Realization',
        'type': 'open_page',
        'layout_form_id': 'lbb_realization',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field':
                  "{{ is_detail == 1 || is_detail == '1' || is_detail == true || is_detail == 'true' }}",
              'op': '=',
              'value': false,
            },
            {
              'field':
                  "{{ (parent.transaction_id == null || parent.transaction_id == '' || parent.transaction_id == '-') && (transaction_id == null || transaction_id == '' || transaction_id == '-') }}",
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

    test(
        'isVisibleFor evaluates realization_submission empty or zero condition correctly',
        () {
      final action = ActionD.fromJson({
        'id': 'actual_realization',
        'name': 'Actual Realization',
        'type': 'open_page',
        'layout_form_id': 'actual_realization',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field':
                  "{{ (typeof parent === 'undefined' || !parent || parent.realization_submission == null || parent.realization_submission == '' || parent.realization_submission == 0 || parent.realization_submission == '0') && (typeof realization_submission === 'undefined' || realization_submission == null || realization_submission == '' || realization_submission == 0 || realization_submission == '0') }}",
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

    test(
        'isVisibleFor evaluates header status == INPUT condition correctly',
        () {
      final action = ActionD.fromJson({
        'id': 'delete',
        'name': 'Delete',
        'type': 'show_confirmation_dialog',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field':
                  "{{ String(typeof parentData !== 'undefined' && Array.isArray(parentData) && parentData.length > 0 && parentData[0] && parentData[0].status ? parentData[0].status : (typeof parent !== 'undefined' && parent && parent.status ? parent.status : (typeof status !== 'undefined' ? status : 'INPUT'))).trim().toUpperCase() }}",
              'op': '=',
              'value': 'INPUT',
            }
          ]
        },
      });

      // Case 1: Header status is 'CONFIRM' (parentData[0]), row status is 'INPUT' -> hidden
      expect(
        action.isVisibleFor(
          {'id': 1, 'status': 'INPUT'},
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'CONFIRM'},
            {'id': 1031}
          ],
        ),
        false,
      );

      // Case 2: Header status is 'INPUT' (parentData[0]), row status is 'INPUT' -> visible
      expect(
        action.isVisibleFor(
          {'id': 1, 'status': 'INPUT'},
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'INPUT'},
            {'id': 1031}
          ],
        ),
        true,
      );

      // Case 3: Header status is 'CONFIRM HO' -> hidden
      expect(
        action.isVisibleFor(
          {'id': 1, 'status': 'INPUT'},
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'CONFIRM HO'},
            {'id': 1031}
          ],
        ),
        false,
      );

      // Case 4: actions_home evaluation where parentData is provided -> hidden if header != INPUT
      expect(
        action.isVisibleFor(
          {},
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'CONFIRM'},
            {'id': 1031}
          ],
        ),
        false,
      );

      // Case 5: actions_home evaluation where parentData is provided -> visible if header == INPUT
      expect(
        action.isVisibleFor(
          {},
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'INPUT'},
            {'id': 1031}
          ],
        ),
        true,
      );

      // Case 6: actions_home evaluation fallback via data['status']
      expect(
        action.isVisibleFor(
          {'status': 'CONFIRM'},
        ),
        false,
      );
      expect(
        action.isVisibleFor(
          {'status': 'INPUT'},
        ),
        true,
      );
    });
  });
}
