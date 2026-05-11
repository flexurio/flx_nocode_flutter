import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_multi_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'component_multi_dropdown_controller.dart';

class ComponentMultiDropdownWidget extends StatefulWidget {
  final ComponentMultiDropdown component;
  final JsonMap data;
  final bool isSmall;

  const ComponentMultiDropdownWidget({
    super.key,
    required this.component,
    required this.data,
    this.isSmall = false,
  });

  @override
  State<ComponentMultiDropdownWidget> createState() =>
      _ComponentMultiDropdownWidgetState();
}

class _ComponentMultiDropdownWidgetState extends State<ComponentMultiDropdownWidget> {
  late final ComponentMultiDropdownController controller;
  late final String tag;

  @override
  void initState() {
    super.initState();
    tag = '${widget.component.id}_${identityHashCode(this)}';

    if (Get.isRegistered<ComponentMultiDropdownController>(tag: tag)) {
      controller = Get.find<ComponentMultiDropdownController>(tag: tag);
      controller.updateData(widget.data);
    } else {
      controller = Get.put(
        ComponentMultiDropdownController(
          component: widget.component,
          data: widget.data,
        ),
        tag: tag,
      );
    }
  }

  @override
  void didUpdateWidget(ComponentMultiDropdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      controller.updateData(widget.data);
    }
  }

  @override
  void dispose() {
    Get.delete<ComponentMultiDropdownController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final status = controller.isLoading.value
          ? Status.progress
          : (controller.error.value != null ? Status.error : Status.loaded);

      // Using FDropDownSearchSmallMultiple as it's confirmed to exist in the project
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FDropDownSearchSmallMultiple<Map<String, dynamic>>(
              status: status,
              items: controller.options,
              initialValue: controller.displayedValues,
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
              itemAsString: (item) => item['label']?.toString() ?? '',
              onChanged: (val) {
                controller.onSelectionsChanged(val);
              },
              iconField: Icons.list,
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
        ),
      );
    });
  }
}
