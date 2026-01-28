import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension LayoutFormWidget on LayoutForm {
  Widget toWidget(JsonMap data) {
    print('[LayoutFormWidget] toWidget');
    if (multiForms.isNotEmpty) {
      final requestedPage = data['page'];
      final int currentPage = requestedPage is num && multiForms.isNotEmpty
          ? requestedPage.toInt().clamp(0, multiForms.length - 1)
          : 0;

      final children =
          multiForms.map((f) => f.toWidget(data)).toList(growable: false);
      final titles = multiForms.map((f) => f.label).toList(growable: false);

      return MultiForm(
        children: children,
        titles: titles,
        page: currentPage,
      );
    }

    return Column(
      children: components.map((e) => e.toWidget(data: data)).toList(),
    );
  }
}
