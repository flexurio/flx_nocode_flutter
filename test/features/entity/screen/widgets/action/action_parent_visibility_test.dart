import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('ActionD Parent Visibility Tests', () {
    test(
        'isVisibleFor evaluates parent header transaction_id has value and is_detail is false correctly',
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
                  "{{ (function(){ var tid = (typeof parentData !== 'undefined' && Array.isArray(parentData) && parentData.length > 0 && parentData[0] && parentData[0].transaction_id) ? parentData[0].transaction_id : (typeof parent !== 'undefined' && parent && parent.transaction_id ? parent.transaction_id : (typeof transaction_id !== 'undefined' ? transaction_id : null)); if (tid === null || tid === undefined) return false; var s = String(tid).trim(); return s !== '' && s !== '-' && s !== 'null' && s !== 'undefined'; })() }}",
              'op': '=',
              'value': true,
            }
          ]
        },
      });

      // Case 1: parent.transaction_id has value ('LBP/01/26090004') and row is not detail -> visible
      expect(
        action.isVisibleFor(
          {'is_detail': false},
          parentData: [
            {'transaction_id': 'LBP/01/26090004'}
          ],
        ),
        true,
      );

      // Case 2: parent.transaction_id is '-' (no transaction_id yet) -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': false},
          parentData: [
            {'transaction_id': '-'}
          ],
        ),
        false,
      );

      // Case 3: parent.transaction_id is null / empty -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': false},
          parentData: [
            {'transaction_id': null}
          ],
        ),
        false,
      );

      // Case 4: parent.transaction_id has value but row is detail (is_detail = true) -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': true},
          parentData: [
            {'transaction_id': 'LBP/01/26090004'}
          ],
        ),
        false,
      );
    });

    test(
        'isVisibleFor evaluates realization_submission has non-zero value and is_detail is false correctly',
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
                  "{{ is_detail == 1 || is_detail == '1' || is_detail == true || is_detail == 'true' }}",
              'op': '=',
              'value': false,
            },
            {
              'field':
                  "{{ (function(){ if (typeof realization_submission === 'undefined' || realization_submission === null) return false; var s = String(realization_submission).trim(); if (s === '' || s === '0' || s === 'null' || s === 'undefined') return false; var n = parseFloat(s.replace(/,/g, '')); return !isNaN(n) ? n !== 0 : true; })() }}",
              'op': '=',
              'value': true,
            }
          ]
        },
      });

      // Case 1: realization_submission is 0 -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'realization_submission': 0},
          parentData: [],
        ),
        false,
      );

      // Case 2: realization_submission is null -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'realization_submission': null},
          parentData: [],
        ),
        false,
      );

      // Case 3: realization_submission is '' -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'realization_submission': ''},
          parentData: [],
        ),
        false,
      );

      // Case 4: realization_submission is 100000 and is_detail is false -> visible
      expect(
        action.isVisibleFor(
          {'is_detail': false, 'realization_submission': 100000},
          parentData: [],
        ),
        true,
      );

      // Case 5: realization_submission is 100000 but is_detail is true -> hidden
      expect(
        action.isVisibleFor(
          {'is_detail': true, 'realization_submission': 100000},
          parentData: [],
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

    test('isVisibleFor evaluates Form Value Area row action with header status correctly', () {
      final action = ActionD.fromJson({
        'id': 'Update_Value_Area_Without_Detail',
        'name': 'Form Value Area',
        'type': 'open_page',
        'layout_form_id': 'value_area_without_detail',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field': '{{ actual_value }}',
              'op': '=',
              'value': 0,
            },
            {
              'field': '{{ transaction_id }}',
              'op': 'is_empty',
            },
            {
              'field':
                  "{{ is_detail == 1 || is_detail == '1' || is_detail == true || is_detail == 'true' }}",
              'op': '=',
              'value': false,
            },
            {
              'field':
                  "{{ String(typeof parentData !== 'undefined' && Array.isArray(parentData) && parentData.length > 0 && parentData[0] && parentData[0].status ? parentData[0].status : (typeof parent !== 'undefined' && parent && parent.status ? parent.status : (typeof status !== 'undefined' ? status : 'INPUT'))).trim().toUpperCase() }}",
              'op': '=',
              'value': 'INPUT',
            }
          ]
        },
      });

      // Case 1: Header status is 'CONFIRM' -> hidden
      expect(
        action.isVisibleFor(
          {
            'actual_value': 0,
            'transaction_id': null,
            'is_detail': false,
          },
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'CONFIRM'},
          ],
        ),
        false,
      );

      // Case 2: Header status is 'INPUT' and all other conditions match -> visible
      expect(
        action.isVisibleFor(
          {
            'actual_value': 0,
            'transaction_id': null,
            'is_detail': false,
          },
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'INPUT'},
          ],
        ),
        true,
      );

      // Case 3: Header status is 'INPUT' but is_detail is true -> hidden
      expect(
        action.isVisibleFor(
          {
            'actual_value': 0,
            'transaction_id': null,
            'is_detail': true,
          },
          parentData: [
            {'id': 'EVENT/2026/09/029', 'status': 'INPUT'},
          ],
        ),
        false,
      );
    });

    test(
        'isVisibleFor evaluates Expense Transaction Detail Sub lbb_realization condition correctly',
        () {
      final action = ActionD.fromJson({
        'id': 'lbb_realization',
        'name': 'LBB Realization',
        'type': 'open_page',
        'layout_form_id': 'lbb_realization',
        'is_multiple': false,
        'rule': {
          'all': [
            {
              'field':
                  "{{ (function(){ var tid = null; if (typeof parentData !== 'undefined' && Array.isArray(parentData)) { for (var i = 0; i < parentData.length; i++) { var p = parentData[i]; if (p) { var v = (p.transaction_id !== undefined ? p.transaction_id : p.transaksi_id); if (v !== undefined && v !== null) { var sv = String(v).trim(); if (sv !== '' && sv !== '-' && sv !== 'null' && sv !== 'undefined') { tid = v; break; } } } } } if (!tid && typeof parent !== 'undefined' && parent) { var v = (parent.transaction_id !== undefined ? parent.transaction_id : parent.transaksi_id); if (v !== undefined && v !== null) { var sv = String(v).trim(); if (sv !== '' && sv !== '-' && sv !== 'null' && sv !== 'undefined') { tid = v; } } } if (!tid) { var v = (typeof transaction_id !== 'undefined' ? transaction_id : (typeof transaksi_id !== 'undefined' ? transaksi_id : null)); if (v !== undefined && v !== null) { var sv = String(v).trim(); if (sv !== '' && sv !== '-' && sv !== 'null' && sv !== 'undefined') { tid = v; } } } if (tid === null || tid === undefined) return false; var s = String(tid).trim(); return s !== '' && s !== '-' && s !== 'null' && s !== 'undefined'; })() }}",
              'op': '=',
              'value': true,
            }
          ]
        },
      });

      // Case 1: parentData has [header, detail] where header has transaction_id -> visible
      expect(
        action.isVisibleFor(
          {'id': 1},
          parentData: [
            {'transaction_id': 'EVENT/2026/09/030'},
            {'id': 1034, 'transaction_id': null}
          ],
        ),
        true,
      );

      // Case 2: parentData has [header, detail] where header transaction_id is '-' -> hidden
      expect(
        action.isVisibleFor(
          {'id': 1},
          parentData: [
            {'transaction_id': '-'},
            {'id': 1034}
          ],
        ),
        false,
      );

      // Case 3: header transaction_id is null / empty -> hidden
      expect(
        action.isVisibleFor(
          {'id': 1},
          parentData: [
            {'transaction_id': null},
            {'id': 1034}
          ],
        ),
        false,
      );
    });

    test(
        'isVisibleFor evaluates Expense Transaction Detail Sub actual_realization condition correctly',
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
                  "{{ (function(){ var val = (typeof value_realization !== 'undefined') ? value_realization : (typeof parent !== 'undefined' && parent && typeof parent.value_realization !== 'undefined' ? parent.value_realization : null); if (val === null || val === undefined) return false; var s = String(val).trim(); if (s === '' || s === '0' || s === 'null' || s === 'undefined' || s === '-') return false; var n = parseFloat(s.replace(/,/g, '')); return !isNaN(n) ? n !== 0 : true; })() }}",
              'op': '=',
              'value': true,
            }
          ]
        },
      });

      // Case 1: value_realization is 0 -> hidden
      expect(
        action.isVisibleFor(
          {'value_realization': 0},
          parentData: [],
        ),
        false,
      );

      // Case 2: value_realization is null -> hidden
      expect(
        action.isVisibleFor(
          {'value_realization': null},
          parentData: [],
        ),
        false,
      );

      // Case 3: value_realization is '-' (as shown in user screenshot) -> hidden
      expect(
        action.isVisibleFor(
          {'value_realization': '-'},
          parentData: [],
        ),
        false,
      );

      // Case 4: value_realization is '' -> hidden
      expect(
        action.isVisibleFor(
          {'value_realization': ''},
          parentData: [],
        ),
        false,
      );

      // Case 5: value_realization is 50000 -> visible
      expect(
        action.isVisibleFor(
          {'value_realization': 50000},
          parentData: [],
        ),
        true,
      );

      // Case 6: value_realization is string '1,000,000' -> visible
      expect(
        action.isVisibleFor(
          {'value_realization': '1,000,000'},
          parentData: [],
        ),
        true,
      );
    });
  });
}

