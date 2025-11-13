import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';

extension ComponentFieldDisplayWidgets on ComponentFieldDisplay {
  Widget toWidget() {
    return TileDataVertical(
      label: label,
      child: Text(this.value),
    );
  }
}
