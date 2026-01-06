import 'package:intl/intl.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

extension EntityFieldDummyValueX on EntityField {
  dynamic dummyValue() {
    if (isNumber) {
      return 1;
    }
    if (isDateTime) {
      return DateFormat(dateTimeFormat).format(DateTime.now());
    }
    return 'Sample text here';
  }
}
