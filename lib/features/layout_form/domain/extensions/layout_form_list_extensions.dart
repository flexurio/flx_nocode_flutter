import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';

extension LayoutFormListExtension on List<LayoutForm> {
  List<LayoutForm> get updateForms {
    return where((element) => element.formType == FormType.update).toList();
  }

  List<LayoutForm> get homeActionForms {
    return where((element) => element.formType == FormType.home).toList();
  }

  LayoutForm? getByType(FormType type) {
    final index = indexWhere((e) => e.id == type.name && !e.useNewForm);
    if (index > -1) {
      return this[index];
    }
    return null;
  }

  int getTypeIndex(FormType type) {
    final index = indexWhere((e) => e.id == type.name);
    return index == -1 ? 0 : index;
  }
}
