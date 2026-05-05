import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

extension ComponentTextWidgets on ComponentText {
  Widget toWidget(JsonMap data) {
    final style = TextStyle(
      fontSize: fontSize,
      fontWeight: _parseFontWeight(fontWeight),
      color: _parseColor(color),
    );

    final textWidget = Text(
      value.interpolateJavascript(data),
      style: style,
      textAlign: _parseTextAlign(textAlign),
    );

    if (widthMode == ComponentSizeMode.fill) {
      return SizedBox(width: double.infinity, child: textWidget);
    } else if (widthMode == ComponentSizeMode.fixed && width != null) {
      return SizedBox(width: width, child: textWidget);
    }

    return textWidget;
  }

  Widget toMockWidget() {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: _parseFontWeight(fontWeight),
        color: _parseColor(color),
      ),
      textAlign: _parseTextAlign(textAlign),
    );
  }

  FontWeight? _parseFontWeight(String? weight) {
    if (weight == null) return null;
    switch (weight.toLowerCase()) {
      case 'bold':
        return FontWeight.bold;
      case 'normal':
        return FontWeight.normal;
      case 'w100':
        return FontWeight.w100;
      case 'w200':
        return FontWeight.w200;
      case 'w300':
        return FontWeight.w300;
      case 'w400':
        return FontWeight.w400;
      case 'w500':
        return FontWeight.w500;
      case 'w600':
        return FontWeight.w600;
      case 'w700':
        return FontWeight.w700;
      case 'w800':
        return FontWeight.w800;
      case 'w900':
        return FontWeight.w900;
      default:
        return null;
    }
  }

  Color? _parseColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    try {
      String hexColor = hex.replaceAll('#', '');
      if (hexColor.length == 6) {
        hexColor = 'FF$hexColor';
      }
      return Color(int.parse('0x$hexColor'));
    } catch (_) {
      return null;
    }
  }

  TextAlign? _parseTextAlign(String? align) {
    if (align == null) return null;
    switch (align.toLowerCase()) {
      case 'left':
        return TextAlign.left;
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      case 'justify':
        return TextAlign.justify;
      default:
        return null;
    }
  }
}
