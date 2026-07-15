import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/models/type.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/utils/create_page_controller_utils.dart';

void main() {
  group('EntityField Date Formatting Extensions Tests', () {
    test('typeEnum detects both date and datetime types as dateTime', () {
      final fieldDate = EntityField(label: 'Date', reference: 'date', type: 'date');
      final fieldDateWithFormat = EntityField(label: 'Date', reference: 'date', type: 'date(MMMM DD, YYYY)');
      final fieldDateTime = EntityField(label: 'DateTime', reference: 'datetime', type: 'datetime(YYYY-MM-DD HH:mm:ss)');

      expect(fieldDate.typeEnum, EntityFieldType.dateTime);
      expect(fieldDate.isDateTime, isTrue);

      expect(fieldDateWithFormat.typeEnum, EntityFieldType.dateTime);
      expect(fieldDateWithFormat.isDateTime, isTrue);

      expect(fieldDateTime.typeEnum, EntityFieldType.dateTime);
      expect(fieldDateTime.isDateTime, isTrue);
    });

    test('dateTimeFormat extracts and converts JS-like formats to Dart formats', () {
      final fieldDate = EntityField(label: 'Date', reference: 'date', type: 'date');
      final fieldDateWithFormat = EntityField(label: 'Date', reference: 'date', type: 'date(MMMM DD, YYYY)');
      final fieldDateTime = EntityField(label: 'DateTime', reference: 'datetime', type: 'datetime(YYYY-MM-DD HH:mm:ss)');
      final fieldDateTimeWithD = EntityField(label: 'DateTime', reference: 'datetime', type: 'datetime(MMMM D, YYYY)');

      expect(fieldDate.dateTimeFormat, 'yyyy-MM-dd');
      expect(fieldDateWithFormat.dateTimeFormat, 'MMMM dd, yyyy');
      expect(fieldDateTime.dateTimeFormat, 'yyyy-MM-dd HH:mm:ss');
      expect(fieldDateTimeWithD.dateTimeFormat, 'MMMM d, yyyy');
    });

    test('formatDateTimeField normalizes JS tokens and formats correctly', () {
      final field = EntityField(label: 'Date', reference: 'date', type: 'date(MMMM DD, YYYY)');
      
      // Test formatting simple ISO date string to JS-like format translated to Dart
      final formatted = CreatePageControllerUtils.formatDateTimeField(field, '2026-07-14 06:28:51');
      expect(formatted, 'July 14, 2026');

      // Test formatting using a customFormat that contains JS tokens
      final formattedCustom = CreatePageControllerUtils.formatDateTimeField(
        field,
        '2026-07-14 06:28:51',
        customFormat: 'YYYY/MM/DD',
      );
      expect(formattedCustom, '2026/07/14');
    });
  });
}
