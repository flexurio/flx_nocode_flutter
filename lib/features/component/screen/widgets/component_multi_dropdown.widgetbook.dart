import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_multi_dropdown.dart';
import 'component_multi_dropdown.dart';
import 'component_multi_dropdown_widget.dart';

@UseCase(name: 'Mock Design (From JSON)', type: ComponentMultiDropdownWidget)
Widget mockComponentMultiDropdownDesign(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "design_multi_dropdown",
    "label": "Interests",
    "options": ["Sports", "Music", "Coding", "Travel"],
    "widthMode": "fixed",
    "width": 300
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentMultiDropdown.fromMap(map);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: component.toMockWidget(),
  );
}

@UseCase(name: 'Live Widget (Local Data)', type: ComponentMultiDropdownWidget)
Widget mockComponentMultiDropdownLive(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "live_multi_dropdown",
    "label": "Select Skills",
    "options": ["Flutter", "Dart", "Go", "Firebase"],
    "widthMode": "fill"
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final component = ComponentMultiDropdown.fromMap(map);

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: component.toWidget({}),
  );
}

@UseCase(name: 'Fill Width', type: ComponentMultiDropdownWidget)
Widget mockComponentMultiDropdownFill(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ComponentMultiDropdown(
      id: 'fill',
      label: 'Fill Width Multi Dropdown',
      options: const ['Option A', 'Option B'],
      initialValues: const [],
      widthMode: ComponentSizeMode.fill,
    ).toMockWidget(),
  );
}

@UseCase(name: 'Fixed Width', type: ComponentMultiDropdownWidget)
Widget mockComponentMultiDropdownFixed(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ComponentMultiDropdown(
      id: 'fixed',
      label: 'Fixed Width (350px)',
      options: const ['One', 'Two', 'Three'],
      initialValues: const [],
      widthMode: ComponentSizeMode.fixed,
      width: 350,
    ).toMockWidget(),
  );
}

@UseCase(name: 'Hug Content', type: ComponentMultiDropdownWidget)
Widget mockComponentMultiDropdownHug(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ComponentMultiDropdown(
          id: 'hug-short',
          label: 'Short',
          options: const [],
          initialValues: const [],
          widthMode: ComponentSizeMode.hug,
        ).toMockWidget(),
        const SizedBox(height: 16),
        ComponentMultiDropdown(
          id: 'hug-long',
          label: 'Very Long Multi Dropdown Label To Test Hug Content',
          options: const [],
          initialValues: const [],
          widthMode: ComponentSizeMode.hug,
        ).toMockWidget(),
      ],
    ),
  );
}
