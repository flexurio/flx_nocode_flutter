import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart'
    hide TextTranslateExtension;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_core_flutter/src/app/view/widget/f_drop_down/_container_drop_down.dart';
import 'package:gap/gap.dart';
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

class _ComponentMultiDropdownWidgetState
    extends State<ComponentMultiDropdownWidget> {
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

      // Follow the ComponentDropdownWidget pattern:
      // - If isSmall is true, use a compact view (similar to FDropDownSearchSmall)
      // - Otherwise, use the regular FDropDownSearchMultiple
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.isSmall)
              ContainerDropDown<Map<String, dynamic>>(
                status: status,
                showSelectedItems: false,
                builder: (
                  foregroundColor,
                  border,
                  dropdownButtonProps,
                  popupProps,
                  decoratorProps,
                ) {
                  return DropdownSearch<Map<String, dynamic>>.multiSelection(
                    enabled: !controller.isLoading.value,
                    compareFn: (a, b) => a['value'] == b['value'],
                    validator: widget.component.required
                        ? (value) {
                            if (value == null || value.isEmpty) {
                              return '${widget.component.label} is required';
                            }
                            return null;
                          }
                        : null,
                    suffixProps: DropdownSuffixProps(
                      dropdownButtonProps: dropdownButtonProps,
                    ),
                    items: (f, p) => controller.options,
                    itemAsString: (item) => item['label']?.toString() ?? '',
                    dropdownBuilder: (context, selectedItems) {
                      return Row(
                        children: [
                          const Gap(12),
                          const Icon(Icons.list, size: 16),
                          const Gap(18),
                          Expanded(
                            child: Text(
                              selectedItems.isEmpty
                                  ? '${tr('choose')} ${widget.component.label}'
                                  : selectedItems
                                      .map((e) => e['label'])
                                      .join(', '),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: foregroundColor),
                            ),
                          ),
                        ],
                      );
                    },
                    decoratorProps: decoratorProps,
                    onSelected: (val) {
                      controller.onSelectionsChanged(val);
                    },
                    selectedItems: controller.displayedValues,
                  );
                },
              )
            else
              FDropDownSearchMultiple<Map<String, dynamic>>(
                status: status,
                items: controller.options,
                selectedItems: controller.displayedValues,
                labelText: widget.component.label,
                // enabled: !controller.isLoading.value,
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
                dropdownBuilder: (context, selectedItems) {
                  return Text(
                    selectedItems.isEmpty
                        ? '${tr('choose')} ${widget.component.label}'
                        : selectedItems.map((e) => e['label']).join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
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
        ),
      );
    });
  }
}
