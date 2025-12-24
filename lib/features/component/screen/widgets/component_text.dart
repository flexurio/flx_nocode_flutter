import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentTextWidgets on ComponentText {
  Widget toWidget(JsonMap data) {
    return Text(value);
  }
}
