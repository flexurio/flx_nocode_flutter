import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_drop_down.dart';

extension EntityFieldFormWidgetsX on EntityField {
  bool _enabled(DataAction action) {
    if (action == DataAction.create) {
      return allowCreate ?? false;
    } else if (action == DataAction.edit) {
      return allowUpdate ?? false;
    } else {
      return false;
    }
  }

  Widget buildForm(
    DataAction action,
    TextEditingController controller,
    List<Map<String, dynamic>> parentData,
  ) {
    final isEnabled = _enabled(action);
    if (optionsSource != null) {
      return buildFieldDropDown(action, controller, isEnabled, parentData);
    } else if (isDateTime) {
      return buildFieldDateTime(action, controller, isEnabled);
    } else if (isBool) {
      return buildFieldBool(action, controller, isEnabled);
    } else if (isPermission) {
      return buildFieldPermission(action, controller, isEnabled);
    }

    return buildFieldText(action, controller, isEnabled);
  }

  Widget buildFieldBool(
    DataAction action,
    TextEditingController controller,
    bool isEnabled,
  ) {
    final value = controller.text == '1';
    return AbsorbPointer(
      absorbing: !isEnabled,
      child: FieldCheckBox(
        label: label,
        initialValue: value,
        onChanged: (value) => controller.text = value ? '1' : '0',
      ),
    );
  }

  Widget buildFieldPermission(
    DataAction action,
    TextEditingController controller,
    bool isEnabled,
  ) {
    return AbsorbPointer(
      absorbing: !isEnabled,
      child: FieldCheckboxPermission(
        initialValue: Access.fromValue(int.tryParse(controller.text) ?? 0),
        onChanged: (value) {
          controller.text = value.getValue().toString();
        },
      ),
    );
  }

  Widget buildFieldDateTime(
    DataAction action,
    TextEditingController controller,
    bool isEnabled,
  ) {
    final value = controller.text;
    controller.text = '';
    DateTime? initialDate;
    try {
      if (value != 'null') {
        initialDate = action.isEdit
            ? (DateTime.tryParse(value) ?? DateFormat.yMMMMd().parse(value))
            : null;
      }
    } catch (e) {
      // debugPrint('[EntityField] error $e');
    }
    return FieldDatePicker(
      labelText: label,
      initialSelectedDate: initialDate,
      controller: controller,
      validator: requiredObjectValidator.call,
    );
  }

  Widget buildFieldDropDown(
    DataAction action,
    TextEditingController controller,
    bool isEnabled,
    List<Map<String, dynamic>> parentData,
  ) {
    return FDropDownSearchEntity(
      parentData: parentData,
      label: label,
      itemAsString: (id, label) => '$id - $label',
      entityField: this,
      initialValue: action.isEdit ? MapEntry(controller.text, '') : null,
      enabled: isEnabled,
      isRequired: this.required,
      onChanged: (value) {
        controller.text = value!.key.toString();
      },
    );
  }

  Widget buildFieldText(
    DataAction action,
    TextEditingController controller,
    bool isEnabled,
  ) {
    return FTextFormField(
      labelText: label,
      enabled: isEnabled,
      controller: controller,
      inputFormatters:
          isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
      validator: MultiValidator([
        if (this.required) requiredValidator,
        LengthValidator(
          minLength: minLength,
          maxLength: maxLength,
        ),
        if (pattern != null)
          PatternValidator(
            pattern!,
            errorText: patternError ?? 'Invalid format',
          ),
      ]),
    );
  }
}
