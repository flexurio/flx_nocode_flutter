import 'package:collection/collection.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension LayoutFormListExtension on List<LayoutForm> {
  List<LayoutForm> get updateForms {
    return where((element) => element.isUpdate).toList();
  }

  List<LayoutForm> get homeActionForms {
    return where((element) => element.isHome).toList();
  }

  LayoutForm? get home => firstWhereOrNull((e) => e.isHome);
  LayoutForm? get view => firstWhereOrNull((e) => e.isView);
  LayoutForm? get create => firstWhereOrNull((e) => e.isCreate);
  LayoutForm? get update => firstWhereOrNull((e) => e.isUpdate);
}
