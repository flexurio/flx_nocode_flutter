import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'component_dropdown_widget.dart';

extension ComponentDropdownWidgets on ComponentDropdown {
  Widget toWidget(JsonMap data) {
    return ComponentDropdownWidget(
      component: this,
      data: data,
    );
  }
}
