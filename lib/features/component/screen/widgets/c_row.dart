import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:gap/gap.dart';

/// Widget builder for [ComponentRow].
extension ComponentRowWidgets on ComponentRow {
  /// Builds a Flutter [Row] widget based on x_align and y_align.
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

    final List<Widget> rowChildren = [];
    for (int i = 0; i < widgets.length; i++) {
      rowChildren.add(Expanded(child: widgets[i]));
      if (i < widgets.length - 1 && horizontalGap > 0) {
        rowChildren.add(Gap(horizontalGap));
      }
    }

    return Row(
      mainAxisAlignment: _mapXAlign(xAlign),
      crossAxisAlignment: _mapYAlign(yAlign),
      children: rowChildren,
    );
  }
}

/// Converts human-friendly JSON `x_align` into Flutter MainAxisAlignment.
MainAxisAlignment _mapXAlign(String raw) {
  switch (raw.trim()) {
    case 'center':
      return MainAxisAlignment.center;
    case 'right':
      return MainAxisAlignment.end;
    case 'between':
      return MainAxisAlignment.spaceBetween;
    case 'around':
      return MainAxisAlignment.spaceAround;
    case 'evenly':
      return MainAxisAlignment.spaceEvenly;
    case 'left':
    default:
      return MainAxisAlignment.start;
  }
}

/// Converts human-friendly JSON `y_align` into Flutter CrossAxisAlignment.
CrossAxisAlignment _mapYAlign(String raw) {
  switch (raw.trim()) {
    case 'center':
      return CrossAxisAlignment.center;
    case 'bottom':
      return CrossAxisAlignment.end;
    case 'stretch':
      return CrossAxisAlignment.stretch;
    case 'top':
    default:
      return CrossAxisAlignment.start;
  }
}
