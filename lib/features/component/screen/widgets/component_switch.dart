import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_switch.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentSwitchWidgets on ComponentSwitch {
  Widget toWidget(JsonMap data) {
    // In a real scenario, this would use a controller to manage state.
    // For now, we'll just render a standard SwitchListTile.
    return SwitchListTile(
      title: Text(label, style: const TextStyle(fontSize: 14)),
      value: initialValue,
      onChanged: enabled ? (val) {} : null,
      contentPadding: EdgeInsets.zero,
      dense: true,
    );
  }
}
