import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'component_dropdown_controller.dart';

class ComponentDropdownWidget extends StatefulWidget {
  final ComponentDropdown component;
  final JsonMap data;

  const ComponentDropdownWidget({
    super.key,
    required this.component,
    required this.data,
  });

  @override
  State<ComponentDropdownWidget> createState() =>
      _ComponentDropdownWidgetState();
}

class _ComponentDropdownWidgetState extends State<ComponentDropdownWidget> {
  late final ComponentDropdownController controller;
  late final String tag;

  @override
  void initState() {
    super.initState();
    tag = widget.component.id;
    controller = Get.put(
      ComponentDropdownController(
        component: widget.component,
        data: widget.data,
      ),
      tag: tag,
    );
  }

  @override
  void dispose() {
    Get.delete<ComponentDropdownController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final status = controller.isLoading.value
          ? Status.progress
          : (controller.error.value != null ? Status.error : Status.loaded);

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FDropDownSearch<Map<String, dynamic>>(
            status: status,
            items: controller.options,
            initialValue: controller.displayedValue.value,
            labelText: widget.component.label,
            enabled: !controller.isLoading.value,
            validator: widget.component.required
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return '${widget.component.label} is required';
                    }
                    return null;
                  }
                : null,
            itemAsString: (item) => item['label'] ?? '',
            onChanged: (val) {
              controller.onSelectionChanged(val);
            },
          ),
          if (controller.error.value != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SelectableText(
                'Error: ${controller.error.value}',
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      );
    });
  }
}
