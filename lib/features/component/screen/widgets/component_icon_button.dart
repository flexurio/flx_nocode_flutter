import 'package:flutter/material.dart';

import 'package:flx_nocode_flutter/features/component/models/component_icon_button.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';

Color _parseColor(String input, [Color? fallback]) {
  final fb = fallback ?? Colors.blue;
  final s = input.trim();
  try {
    if (s.startsWith('#')) {
      final hex = s.substring(1);
      int value;
      if (hex.length == 6) {
        value = int.parse('FF$hex', radix: 16);
      } else if (hex.length == 8) {
        value = int.parse(hex, radix: 16);
      } else {
        return fb;
      }
      return Color(value);
    }
    // simple named colors fallback
    switch (s.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
      case 'gray':
        return Colors.grey;
    }
  } catch (_) {}
  return fb;
}

IconData _parseIcon(String input) {
  switch (input.trim().toLowerCase()) {
    case 'add':
      return Icons.add;
    case 'edit':
      return Icons.edit_outlined;
    case 'delete':
      return Icons.delete;
    case 'close':
      return Icons.close;
    case 'search':
      return Icons.search;
    case 'menu':
      return Icons.menu;
    case 'refresh':
      return Icons.refresh;
    case 'settings':
      return Icons.settings;
    case 'arrow_back':
      return Icons.arrow_back;
    case 'arrow_forward':
      return Icons.arrow_forward;
    case 'check':
      return Icons.check;
    case 'warning':
      return Icons.warning;
    case 'error':
      return Icons.error;
    case 'info':
      return Icons.info;
    case 'help':
      return Icons.help_outline;
    case 'list':
      return Icons.notes_rounded;
    case 'visibility':
    case 'view':
      return Icons.visibility_outlined;
    case 'more_vert':
      return Icons.more_vert;
    case 'more_horiz':
      return Icons.more_horiz;
    default:
      return Icons.help_outline;
  }
}

extension ComponentIconButtonWidgets on ComponentIconButton {
  Widget toWidget(JsonMap data) {
    final color = _parseColor(this.color);
    final iconData = _parseIcon(this.icon);

    // Map size string to concrete values
    final double defaultIconSize;
    final double buttonSize;
    switch (size) {
      case 'small':
        defaultIconSize = 18;
        buttonSize = 36;
        break;
      case 'large':
        defaultIconSize = 24;
        buttonSize = 52;
        break;
      case 'medium':
      default:
        defaultIconSize = 20;
        buttonSize = 44;
        break;
    }
    final iconSize = this.iconSize ?? defaultIconSize;

    ButtonStyle? style;

    // Configure style based on variant
    switch (variant) {
      case 'filled':
        style = IconButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          hoverColor: color.withValues(alpha: 0.9),
          minimumSize: Size(buttonSize, buttonSize),
          fixedSize: Size(buttonSize, buttonSize),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        );
        break;
      case 'soft':
        style = IconButton.styleFrom(
          backgroundColor: color.withValues(alpha: 0.1),
          foregroundColor: color,
          hoverColor: color.withValues(alpha: 0.16),
          minimumSize: Size(buttonSize, buttonSize),
          fixedSize: Size(buttonSize, buttonSize),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        );
        break;
      case 'outlined':
        style = IconButton.styleFrom(
          backgroundColor: Colors.transparent, // transparent
          foregroundColor: color,
          hoverColor: color.withValues(alpha: 0.08),
          side: BorderSide(color: color.withValues(alpha: 0.28)),
          minimumSize: Size(buttonSize, buttonSize),
          fixedSize: Size(buttonSize, buttonSize),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        );
        break;
      case 'ghost':
      default:
        style = IconButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: color,
          hoverColor: color.withValues(alpha: 0.08),
          minimumSize: Size(buttonSize, buttonSize),
          fixedSize: Size(buttonSize, buttonSize),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        );
        break;
    }

    return Builder(builder: (context) {
      return SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: IconButton(
          icon: Icon(iconData, size: iconSize),
          style: style,
          onPressed: () {
            if (onClick != null) {
              final entity = data['entity'];
              if (entity is EntityCustom) {
                onClick!.executeSingle(
                  entity: entity,
                  context: context,
                  data: data,
                  parentData: (data['parentData'] as List?)
                          ?.cast<Map<String, dynamic>>() ??
                      [],
                );
              } else {
                print('[ComponentIconButton] Entity not found or invalid type');
              }
            }
          },
          tooltip: icon, // Simple tooltip
        ),
      );
    });
  }

  Widget toMockWidget() {
    final color = _parseColor(this.color);
    final iconData = _parseIcon(this.icon);

    final double defaultIconSize;
    final double buttonSize;
    switch (size) {
      case 'small':
        defaultIconSize = 18;
        buttonSize = 36;
        break;
      case 'large':
        defaultIconSize = 24;
        buttonSize = 52;
        break;
      case 'medium':
      default:
        defaultIconSize = 20;
        buttonSize = 44;
        break;
    }
    final iconSize = this.iconSize ?? defaultIconSize;

    // Creating a mock look
    BoxDecoration decoration;
    Color iconColor;

    switch (variant) {
      case 'filled':
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.18),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        );
        iconColor = Colors.white;
        break;
      case 'soft':
        decoration = BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(14),
        );
        iconColor = color;
        break;
      case 'outlined':
        decoration = BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.28)),
        );
        iconColor = color;
        break;
      case 'ghost':
      default:
        decoration = const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        );
        iconColor = color;
        break;
    }

    return Container(
      width: buttonSize,
      height: buttonSize,
      alignment: Alignment.center,
      decoration: decoration,
      child: Icon(
        iconData,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
