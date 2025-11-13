import 'package:flutter/widgets.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

extension EntityFieldFormControllersX on List<EntityField> {
  Map<String, TextEditingController> generateControllers() {
    final map = <String, TextEditingController>{};
    for (final field in this) {
      map[field.reference] = TextEditingController();
    }
    return map;
  }
}
