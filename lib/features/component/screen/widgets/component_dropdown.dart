import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentDropdownWidgets on ComponentDropdown {
  Widget toWidget(JsonMap data) {
    final items = options.isNotEmpty ? options : const ['Option 1', 'Option 2'];
    final initial = initialValue.isNotEmpty && items.contains(initialValue)
        ? initialValue
        : (items.isNotEmpty ? items.first : null);

    return DropdownButtonFormField<String>(
      value: initial,
      items: items
          .map(
            (opt) => DropdownMenuItem<String>(
              value: opt,
              child: Text(opt),
            ),
          )
          .toList(),
      decoration: InputDecoration(labelText: label),
      onChanged: (_) {},
    );
  }
}
