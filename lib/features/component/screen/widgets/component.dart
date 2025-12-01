import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_column.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_row.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_button.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

extension ComponentWidget on Component {
  Widget convertToWidget(JsonMap data) {
    // if (this.type == ComponentText.componentId) {
    //   return (this as ComponentText).toWidget(data);
    // } else
    if (this.type == ComponentTable.componentId) {
      return (this as ComponentTable).toWidget(data);
    } else if (this.type == ComponentFieldDisplay.componentId) {
      return (this as ComponentFieldDisplay).toWidget(data);
    } else if (this.type == ComponentRow.componentId) {
      return (this as ComponentRow).toWidget(data);
    } else if (this.type == ComponentColumn.componentId) {
      return (this as ComponentColumn).toWidget(data);
    } else if (this.type == ComponentTextField.componentId) {
      return (this as ComponentTextField).toWidget(data);
    } else if (this.type == ComponentButton.componentId) {
      return (this as ComponentButton).toWidget(data);
    }
    return NoCodeError('Unknown component type: ${this.type}');
  }
}
