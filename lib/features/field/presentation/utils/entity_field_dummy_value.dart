import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

extension EntityFieldDummyValueX on EntityField {
  dynamic dummyValue() {
    if (isNumber) {
      return 1;
    }
    if (isDateTime) {
      // menggunakan extension yMMMMd dari flx_core_flutter
      return DateTime.now().yMMMMd;
    }
    return 'Sample text here';
  }
}
