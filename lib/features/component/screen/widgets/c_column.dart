import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

import 'package:gap/gap.dart';

/// Widget builder for [ComponentColumn].
extension ComponentColumnWidgets on ComponentColumn {
  /// Converts this component definition into an actual Flutter [Column] widget.
  Widget toWidget(JsonMap data) {
    // Create a copy of data and remove 'controller' to ensure children
    // do not inherit the parent container's controller.
    final childData = Map<String, dynamic>.from(data);
    childData.remove('controller');

    final widgets = children
        .map((child) => child.convertToWidget(childData))
        .toList(growable: false);

    if (widgets.isEmpty) return const SizedBox.shrink();
    if (widgets.length == 1) return widgets.first;

    final List<Widget> childrenWithGap = [];
    for (int i = 0; i < widgets.length; i++) {
      childrenWithGap.add(widgets[i]);
      if (i < widgets.length - 1 && gap > 0) {
        childrenWithGap.add(Gap(gap));
      }
    }

    return Column(
      mainAxisAlignment: _mapYAlignToMainAxis(yAlign),
      crossAxisAlignment: _mapXAlignToCrossAxis(xAlign),
      children: childrenWithGap,
    );
  }
}

/// Converts simple `y_align` keywords into Flutter's [MainAxisAlignment].
MainAxisAlignment _mapYAlignToMainAxis(String raw) {
  switch (raw.trim()) {
    case 'center':
      return MainAxisAlignment.center;
    case 'bottom':
      return MainAxisAlignment.end;
    case 'between':
      return MainAxisAlignment.spaceBetween;
    case 'around':
      return MainAxisAlignment.spaceAround;
    case 'evenly':
      return MainAxisAlignment.spaceEvenly;
    case 'top':
    default:
      return MainAxisAlignment.start;
  }
}

/// Converts simple `x_align` keywords into Flutter's [CrossAxisAlignment].
CrossAxisAlignment _mapXAlignToCrossAxis(String raw) {
  switch (raw.trim()) {
    case 'center':
      return CrossAxisAlignment.center;
    case 'right':
      return CrossAxisAlignment.end;
    case 'stretch':
      return CrossAxisAlignment.stretch;
    case 'left':
    default:
      return CrossAxisAlignment.start;
  }
}
