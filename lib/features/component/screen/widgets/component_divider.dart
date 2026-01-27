import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_divider.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentDividerWidgets on ComponentDivider {
  Widget toWidget(JsonMap data) {
    return Divider(
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
