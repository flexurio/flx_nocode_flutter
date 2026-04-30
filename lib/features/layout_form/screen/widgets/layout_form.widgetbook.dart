import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'layout_form.dart';

@UseCase(name: 'Simple Form (From JSON)', type: Column)
Widget simpleLayoutFormUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "simple_form",
    "label": "User Information",
    "components": [
      {
        "id": "name",
        "type": "text_field",
        "label": "Full Name",
        "required": true
      },
      {
        "id": "email",
        "type": "text_field",
        "label": "Email Address"
      },
      {
        "id": "gender",
        "type": "dropdown",
        "label": "Gender",
        "options": ["Male", "Female", "Prefer not to say"]
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final form = LayoutForm.fromMap(map);

  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                form.label,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              form.toWidget({}),
            ],
          ),
        ),
      ),
    ),
  );
}

@UseCase(name: 'Multi-Step Wizard', type: Column)
Widget wizardLayoutFormUseCase(BuildContext context) {
  const jsonRaw = '''
  {
    "id": "wizard_form",
    "label": "Registration Wizard",
    "multi_forms": [
      {
        "id": "step1",
        "label": "Account Details",
        "components": [
          { "id": "username", "type": "text_field", "label": "Username", "required": true },
          { "id": "password", "type": "text_field", "label": "Password", "required": true }
        ]
      },
      {
        "id": "step2",
        "label": "Personal Profile",
        "components": [
          { "id": "first_name", "type": "text_field", "label": "First Name" },
          { "id": "last_name", "type": "text_field", "label": "Last Name" },
          { "id": "dob", "type": "date_picker", "label": "Date of Birth" }
        ]
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final form = LayoutForm.fromMap(map);

  return StatefulBuilder(
    builder: (context, setState) {
      // Note: In a real app, this state would be managed by a controller
      // and 'page' would be part of the context data passed to toWidget.
      final List<int> pageRef = [0];
      
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              form.label,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: form.toWidget({'page': pageRef[0]}),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pageRef[0] > 0 
                    ? () => setState(() => pageRef[0]--) 
                    : null,
                  child: const Text('Back'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: pageRef[0] < form.multiForms.length - 1 
                    ? () => setState(() => pageRef[0]++) 
                    : null,
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      );
    }
  );
}
