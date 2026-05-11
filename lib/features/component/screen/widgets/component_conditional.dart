import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_conditional.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

extension ComponentConditionalWidget on ComponentConditional {
  Widget toWidget(JsonMap data, {bool isSmall = false}) {
    final isThen = condition.evaluateVisibility(data);

    if (isThen) {
      return then.toWidget(data: data, isSmall: isSmall);
    } else {
      if (otherwise != null) {
        return otherwise!.toWidget(data: data, isSmall: isSmall);
      }
      return const SizedBox.shrink();
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
