import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_conditional.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

extension ComponentConditionalWidget on ComponentConditional {
  Widget toWidget(JsonMap data, {bool isSmall = false}) {
    final isThen = condition.evaluateVisibility(data);

    // Sync text field controller values for the active branch
    final activeComponent = isThen ? then : (otherwise ?? then);
    _syncTextFieldValues(activeComponent, data);

    if (isThen) {
      // Use KeyedSubtree to force Flutter to recreate the widget subtree
      // when switching branches. This ensures stateful widgets like dropdowns
      // reinitialize with the correct httpData/URL configuration.
      return KeyedSubtree(
        key: ValueKey('${id}_then_${then.id}'),
        child: then.toWidget(data: data, isSmall: isSmall),
      );
    } else {
      if (otherwise != null) {
        return KeyedSubtree(
          key: ValueKey('${id}_else_${otherwise!.id}'),
          child: otherwise!.toWidget(data: data, isSmall: isSmall),
        );
      }
      return const SizedBox.shrink();
    }
  }

  /// Syncs TextEditingController values for text_field components in the
  /// active branch. This ensures fields with initialValue (like "PJT OBA SK"
  /// vs "QA Manager") show the correct text when branches switch.
  void _syncTextFieldValues(Component component, JsonMap data) {
    final allControllers =
        data['allControllers'] as Map<String, TextEditingController>?;
    if (allControllers == null) return;

    _syncComponentTree(component, allControllers);
  }

  void _syncComponentTree(
      Component component, Map<String, TextEditingController> controllers) {
    if (component is ComponentTextField) {
      final controller = controllers[component.id];
      if (controller != null && component.initialValue.isNotEmpty) {
        if (controller.text != component.initialValue) {
          controller.text = component.initialValue;
        }
      }
    } else if (component is ComponentRow) {
      for (final child in component.children) {
        _syncComponentTree(child, controllers);
      }
    } else if (component is ComponentColumn) {
      for (final child in component.children) {
        _syncComponentTree(child, controllers);
      }
    }
  }

  Widget toMockWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Conditional: $condition'),
        const Divider(),
        const Text('Then:'),
        then.toMockWidget(),
        if (otherwise != null) ...[
          const Divider(),
          const Text('Else:'),
          otherwise!.toMockWidget(),
        ],
      ],
    );
  }
}
