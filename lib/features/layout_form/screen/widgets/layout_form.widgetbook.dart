import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_controller.dart';
import 'package:get/get.dart' hide Response;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'layout_form.dart';

class MockDio extends Mock implements Dio {}

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
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

  return StatefulBuilder(builder: (context, setState) {
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
                onPressed:
                    pageRef[0] > 0 ? () => setState(() => pageRef[0]--) : null,
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
  });
}

@UseCase(name: 'Interactive Table Form', type: Column)
Widget interactiveTableFormUseCase(BuildContext context) {
  const layoutId = 'interactive_inventory';
  const jsonRaw = '''
  {
    "id": "$layoutId",
    "label": "Inventory Manager",
    "submit_workflow": {
      "actions": [
        {
          "type": "loop",
          "items": "{{ inventory_list }}",
          "item_var": "row",
          "actions": [
            {
              "type": "http",
              "name": "Post Row",
              "http": {
                "method": "POST",
                "url": "https://api.example.com/inventory",
                "body": {
                  "product_name": "{{ vars.row.name }}",
                  "quantity": "{{ vars.row.qty }}"
                }
              }
            }
          ]
        },
        {
          "type": "toast",
          "variant": "success",
          "message": "All items submitted sequentially!"
        }
      ]
    },
    "components": [
      {
        "id": "main_layout",
        "type": "column",
        "events": {},
        "x_align": "left",
        "y_align": "top",
        "gap": 24.0,
        "widthMode": "fill",
        "children": [
          {
            "id": "input_section",
            "type": "row",
            "events": {},
            "x_align": "left",
            "y_align": "top",
            "horizontal_gap": 16.0,
            "widthMode": "fill",
            "children": [
              {
                "id": "name",
                "type": "text_field",
                "label": "Item Name",
                "maxLength": 50,
                "maxLines": 1,
                "flex": 2,
                "widthMode": "fill"
              },
              {
                "id": "qty",
                "type": "number_field",
                "label": "Quantity",
                "flex": 1,
                "widthMode": "fill"
              }
            ]
          },
          {
            "id": "action_row",
            "type": "row",
            "events": {},
            "x_align": "right",
            "y_align": "top",
            "widthMode": "fill",
            "children": [
              {
                "id": "add_btn",
                "type": "button",
                "text": "Add to Table",
                "color": "#2196F3",
                "variant": "primary",
                "size": "medium",
                "widthMode": "hug",
                "flex": null,
                "on_click": {
                  "id": "append_item",
                  "type": "append_variable",
                  "name": "Add",
                  "target_variable": "inventory_list",
                  "on_success": "clear_form"
                }
              }
            ]
          },
          {
            "id": "inventory_table",
            "type": "table",
            "reference_id": "inventory_list",
            "columns": [
              { "header": "Item Name", "body": "name", "width": 200.0 },
              { "header": "Quantity", "body": "qty", "width": 100.0 }
            ]
          }
        ]
      }
    ]
  }
  ''';

  final map = json.decode(jsonRaw) as Map<String, dynamic>;
  final form = LayoutForm.fromMap(map);
  // Mock Dio for the workflow submission
  final mockDio = MockDio();
  when(() => mockDio.post<Map<String, dynamic>>(
        any(),
        data: any(named: 'data'),
        queryParameters: any(named: 'queryParameters'),
        options: any(named: 'options'),
      )).thenAnswer((_) async {
    await Future.delayed(const Duration(seconds: 2));
    return Response(
      requestOptions: RequestOptions(path: ''),
      data: {'status': 'success'},
      statusCode: 200,
    );
  });

  EntityCustomRepository.instance = EntityCustomRepository(
    dio: mockDio,
    onUnauthorized: () {},
  );

  final entity = EntityCustom.empty().copyWith(
    id: 'mock_entity',
    layoutForm: [form],
  );

  // Initialize the required EntityController for the workflow submission
  Get.put(
    EntityController(entity),
    tag: 'entity_ctrl_$layoutId',
  );

  return GetBuilder<CreatePageController>(
    init: CreatePageController(
      entity: entity,
      layoutFormId: layoutId,
      initialDataInput: {'inventory_list': []},
      parentData: [],
    ),
    tag: 'create_page_$layoutId',
    builder: (controller) {
      return Obx(() {
        // Prepare the data context that widgets expect
        final dataContext = {
          'layoutFormId': layoutId,
          'entity': entity,
          ...controller.initialData,
          'allControllers': controller.controllers,
        };

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      form.label,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    // Rendering components from JSON
                    form.toWidget(dataContext),

                    const SizedBox(height: 32),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => controller.submit(context),
                          icon: const Icon(Icons.send),
                          label: const Text('Submit Sequential'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    },
  );
}
