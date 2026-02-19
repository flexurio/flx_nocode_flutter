import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_container.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';

extension ComponentContainerWidgets on ComponentContainer {
  Widget toWidget({required JsonMap data}) {
    return _buildContainer(
      child: _buildChildren(data: data),
    );
  }

  Widget toMockWidget() {
    return _buildContainer(
      child: _buildChildren(isMock: true),
    );
  }

  Widget _buildContainer({required Widget child}) {
    double? effectiveWidth = width;
    if (widthMode == 'fill') effectiveWidth = double.infinity;
    if (widthMode == 'hug') effectiveWidth = null;

    double? effectiveHeight = height;
    if (heightMode == 'fill') effectiveHeight = double.infinity;
    if (heightMode == 'hug') effectiveHeight = null;

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      padding: padding != null ? EdgeInsets.all(padding!) : null,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      decoration: BoxDecoration(
        color: _parseColor(color),
        borderRadius:
            borderRadius != null ? BorderRadius.circular(borderRadius!) : null,
        border: (borderColor != null || borderWidth != null)
            ? Border.all(
                color: _parseColor(borderColor) ?? Colors.transparent,
                width: borderWidth ?? 1.0,
              )
            : null,
      ),
      child: child,
    );
  }

  Widget _buildChildren({JsonMap? data, bool isMock = false}) {
    if (child == null) return const SizedBox.shrink();

    return isMock ? child!.toMockWidget() : child!.toWidget(data: data!);
  }

  Color? _parseColor(String? hexString) {
    if (hexString == null || hexString.isEmpty) return null;
    try {
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return null;
    }
  }
}
