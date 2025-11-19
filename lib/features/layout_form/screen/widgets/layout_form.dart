import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension LayoutFormWidget on LayoutForm {
  Widget toWidget(JsonMap data) {
    print('[LayoutFormWidget] toWidget');
    return Column(
      children: this.components.map((e) => e.convertToWidget(data)).toList(),
    );
  }
}
