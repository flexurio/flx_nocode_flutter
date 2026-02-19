import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
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
        .map((child) => child.toWidget(data: childData))
        .toList(growable: false);

    if (widgets.isEmpty) return const SizedBox.shrink();
    if (widgets.length == 1) return widgets.first;

    final parentWidthMode = widthMode?.toLowerCase();
    final mainAxisSize =
        (parentWidthMode == 'hug') ? MainAxisSize.min : MainAxisSize.max;

    final List<Widget> rowChildren = [];
    for (int i = 0; i < widgets.length; i++) {
      final child = children[i];
      Widget rowChild = widgets[i];

      String? widthMode;
      double? fixedWidth;
      int? flexValue;

      if (child is ComponentContainer) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
      } else if (child is ComponentRow) {
        widthMode = child.widthMode;
      } else if (child is ComponentColumn) {
        widthMode = child.widthMode;
      } else if (child is ComponentDropdown) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentDatePicker) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentTextField) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentNumberField) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentButton) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      }

      final mode = widthMode?.toLowerCase();
      if (mode == 'fill') {
        if (mainAxisSize == MainAxisSize.max) {
          rowChildren.add(Expanded(flex: flexValue ?? 1, child: rowChild));
        } else {
          // Smart detection: parent is hug, child is fill. Force a width to prevent crash.
          rowChildren.add(SizedBox(width: 200, child: rowChild));
        }
      } else if (mode == 'fixed' && fixedWidth != null) {
        rowChildren.add(SizedBox(width: fixedWidth, child: rowChild));
      } else {
        // Default to hug if not specified or unrecognized
        // To prevent 'blank' inputs, we give them a default width if explicitly hug in a row
        if (child is ComponentDropdown ||
            child is ComponentDatePicker ||
            child is ComponentTextField ||
            child is ComponentNumberField ||
            child is ComponentButton) {
          rowChildren.add(SizedBox(width: 200, child: rowChild));
        } else {
          rowChildren.add(rowChild);
        }
      }

      if (i < widgets.length - 1 && horizontalGap > 0) {
        rowChildren.add(Gap(horizontalGap));
      }
    }

    return Row(
      mainAxisAlignment: _mapXAlign(xAlign),
      crossAxisAlignment: _mapYAlign(yAlign),
      mainAxisSize: mainAxisSize,
      children: rowChildren,
    );
  }

  Widget toMockWidget() {
    final widgets =
        children.map((child) => child.toMockWidget()).toList(growable: false);

    if (widgets.isEmpty) return const SizedBox.shrink();
    if (widgets.length == 1) return widgets.first;

    final parentWidthMode = widthMode?.toLowerCase();
    final mainAxisSize =
        (parentWidthMode == 'hug') ? MainAxisSize.min : MainAxisSize.max;

    final List<Widget> rowChildren = [];
    for (int i = 0; i < widgets.length; i++) {
      final child = children[i];
      Widget rowChild = widgets[i];

      String? widthMode;
      double? fixedWidth;
      int? flexValue;

      if (child is ComponentContainer) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
      } else if (child is ComponentRow) {
        widthMode = child.widthMode;
      } else if (child is ComponentColumn) {
        widthMode = child.widthMode;
      } else if (child is ComponentDropdown) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentDatePicker) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentTextField) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentNumberField) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      } else if (child is ComponentButton) {
        widthMode = child.widthMode;
        fixedWidth = child.width;
        flexValue = child.flex;
      }

      final mode = widthMode?.toLowerCase();
      if (mode == 'fill') {
        if (mainAxisSize == MainAxisSize.max) {
          rowChildren.add(Expanded(flex: flexValue ?? 1, child: rowChild));
        } else {
          rowChildren.add(SizedBox(width: 200, child: rowChild));
        }
      } else if (mode == 'fixed' && fixedWidth != null) {
        rowChildren.add(SizedBox(width: fixedWidth, child: rowChild));
      } else {
        if (child is ComponentDropdown ||
            child is ComponentDatePicker ||
            child is ComponentTextField ||
            child is ComponentNumberField ||
            child is ComponentButton) {
          rowChildren.add(SizedBox(width: 200, child: rowChild));
        } else {
          rowChildren.add(rowChild);
        }
      }

      if (i < widgets.length - 1 && horizontalGap > 0) {
        rowChildren.add(Gap(horizontalGap));
      }
    }

    return Row(
      mainAxisAlignment: _mapXAlign(xAlign),
      crossAxisAlignment: _mapYAlign(yAlign),
      mainAxisSize: mainAxisSize,
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
