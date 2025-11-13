import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentWidget on Component {
  Widget toWidget(JsonMap data) {
    if (this.type == ComponentText.compomentId) {
      return this.toWidget(data);
    } else if (this.type == ComponentTable.compomentId) {
      return this.toWidget(data);
    }
    return Container();
  }
}
