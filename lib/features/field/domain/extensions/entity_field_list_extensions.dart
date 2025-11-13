import 'package:flx_nocode_flutter/features/field/models/field.dart';

extension EntityFieldListX on List<EntityField> {
  int findIndex(String reference) {
    for (var i = 0; i < length; i++) {
      if (this[i].reference == reference) {
        return i;
      }
    }
    return -1;
  }
}
