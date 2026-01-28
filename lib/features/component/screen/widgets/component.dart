import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/models/component_radio.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_button.dart';
import 'package:flx_nocode_flutter/features/component/models/component_number_field.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/models/component_container.dart';
import 'package:flx_nocode_flutter/features/component/models/component_switch.dart';
import 'package:flx_nocode_flutter/features/component/models/component_image.dart';
import 'package:flx_nocode_flutter/features/component/models/component_divider.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_column.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/c_row.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_radio.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_text_field.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_text.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_number_field.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_button.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_container.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_switch.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_image.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_divider.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

extension ComponentWidget on Component {
  Widget toWidget({
    required JsonMap data,
    Map<String, TextEditingController>? controllers,
    List<Map<String, dynamic>>? parentData,
    DataAction? dataAction,
  }) {
    final fullData = {
      ...data,
      if (controllers != null) 'allControllers': controllers,
      if (parentData != null) 'parentData': parentData,
      if (dataAction != null) 'dataAction': dataAction,
    };

    if (this.type == ComponentText.componentId) {
      return (this as ComponentText).toWidget(fullData);
    } else if (this.type == ComponentTable.componentId) {
      return (this as ComponentTable).toWidget(fullData);
    } else if (this.type == ComponentFieldDisplay.componentId) {
      return (this as ComponentFieldDisplay).toWidget(fullData);
    } else if (this.type == ComponentRow.componentId) {
      return (this as ComponentRow).toWidget(fullData);
    } else if (this.type == ComponentColumn.componentId) {
      return (this as ComponentColumn).toWidget(fullData);
    } else if (this.type == ComponentTextField.componentId) {
      return (this as ComponentTextField).toWidget(fullData);
    } else if (this.type == ComponentDatePicker.componentId) {
      return (this as ComponentDatePicker).toWidget(fullData);
    } else if (this.type == ComponentCheckbox.componentId) {
      return (this as ComponentCheckbox).toWidget(fullData);
    } else if (this.type == ComponentDropdown.componentId) {
      return (this as ComponentDropdown).toWidget(fullData);
    } else if (this.type == ComponentRadio.componentId) {
      return (this as ComponentRadio).toWidget(fullData);
    } else if (this.type == ComponentButton.componentId) {
      return (this as ComponentButton).toWidget(fullData);
    } else if (this.type == ComponentNumberField.componentId) {
      return (this as ComponentNumberField).toWidget(fullData);
    } else if (this.type == ComponentContainer.componentId) {
      return (this as ComponentContainer).toWidget(fullData);
    } else if (this.type == ComponentSwitch.componentId) {
      return (this as ComponentSwitch).toWidget(fullData);
    } else if (this.type == ComponentImage.componentId) {
      return (this as ComponentImage).toWidget(fullData);
    } else if (this.type == ComponentDivider.componentId) {
      return (this as ComponentDivider).toWidget(fullData);
    }
    return NoCodeError('Unknown component type: ${this.type}');
  }
}
