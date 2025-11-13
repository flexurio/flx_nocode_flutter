import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentFieldDisplayWidgets on ComponentFieldDisplay {
  Widget toWidget(JsonMap data) {
    return TileDataVertical(
      label: label,
      child: Text(this.value),
    );
  }
}
