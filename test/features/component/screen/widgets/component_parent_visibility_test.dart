import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_column.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_row.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';

void main() {
  group('Component Parent Data & VisibilityCondition', () {
    testWidgets('toWidget should populate parent from parentData and respect visibilityCondition', (tester) async {
      final datePicker = ComponentDatePicker(
        id: 'upcountry_start_date',
        label: 'Upcountry Start Date',
        visibilityCondition: "{{ parent.chart_of_account_id == '6021103' || parent.chart_of_account_id == 6021103 }}",
      );

      // 1. When parent.chart_of_account_id matches
      final matchingParentData = [
        {'id': 1, 'chart_of_account_id': 6021103, 'period': '202609'}
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: datePicker.toWidget(
              data: {},
              parentData: matchingParentData,
            ),
          ),
        ),
      );

      expect(find.text('Upcountry Start Date'), findsOneWidget);

      // 2. When parent.chart_of_account_id does NOT match
      final nonMatchingParentData = [
        {'id': 2, 'chart_of_account_id': 1234567, 'period': '202609'}
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: datePicker.toWidget(
              data: {},
              parentData: nonMatchingParentData,
            ),
          ),
        ),
      );

      expect(find.text('Upcountry Start Date'), findsNothing);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('ComponentRow and ComponentColumn should filter children using parent visibilityCondition', (tester) async {
      final Component row = ComponentRow(
        id: 'row_1',
        children: [
          ComponentText(id: 'txt_always', value: 'Always Visible'),
          ComponentDatePicker(
            id: 'upcountry_start_date',
            label: 'Upcountry Start Date',
            visibilityCondition: "{{ parent.chart_of_account_id == '6021103' }}",
          ),
          ComponentDatePicker(
            id: 'upcountry_end_date',
            label: 'Upcountry End Date',
            visibilityCondition: "{{ parent.chart_of_account_id == '6021103' }}",
          ),
        ],
      );

      // When matching
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: row.toWidget(
              data: {},
              parentData: [
                {'chart_of_account_id': '6021103'}
              ],
            ),
          ),
        ),
      );

      expect(find.text('Always Visible'), findsOneWidget);
      expect(find.text('Upcountry Start Date'), findsOneWidget);
      expect(find.text('Upcountry End Date'), findsOneWidget);

      // When not matching
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: row.toWidget(
              data: {},
              parentData: [
                {'chart_of_account_id': '9999999'}
              ],
            ),
          ),
        ),
      );

      expect(find.text('Always Visible'), findsOneWidget);
      expect(find.text('Upcountry Start Date'), findsNothing);
      expect(find.text('Upcountry End Date'), findsNothing);
    });
  });
}
