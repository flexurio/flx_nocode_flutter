import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'component_dropdown.dart';
import 'component_dropdown_widget.dart';

@UseCase(name: 'Fill Width', type: ComponentDropdownWidget)
Widget mockComponentDropdownFill(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ComponentDropdown(
      id: 'fill',
      label: 'Fill Width Dropdown',
      options: const [],
      initialValue: '',
      widthMode: 'fill',
    ).toMockWidget(),
  );
}

@UseCase(name: 'Fixed Width', type: ComponentDropdownWidget)
Widget mockComponentDropdownFixed(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ComponentDropdown(
      id: 'fixed',
      label: 'Fixed Width (300px)',
      options: const [],
      initialValue: '',
      widthMode: 'fixed',
      width: 300,
    ).toMockWidget(),
  );
}

@UseCase(name: 'Hug Content', type: ComponentDropdownWidget)
Widget mockComponentDropdownHug(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComponentDropdown(
          id: 'hug-short',
          label: 'Short',
          options: const [],
          initialValue: '',
          widthMode: 'hug',
        ).toMockWidget(),
        const SizedBox(height: 16),
        ComponentDropdown(
          id: 'hug-long',
          label: 'Very Long Label To Test Hug Content',
          options: const [],
          initialValue: '',
          widthMode: 'hug',
        ).toMockWidget(),
      ],
    ),
  );
}
