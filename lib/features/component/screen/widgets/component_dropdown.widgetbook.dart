import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'component_dropdown.dart';
import 'component_dropdown_widget.dart';

@UseCase(name: 'Mock Widget', type: ComponentDropdownWidget)
Widget mockComponentDropdownRaw(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ComponentDropdown.empty('mock-dropdown').toMockWidget(),
  );
}
