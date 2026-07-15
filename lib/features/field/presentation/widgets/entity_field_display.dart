import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_tooltip.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/layout_list_tile.dart';
import 'package:flx_nocode_flutter/shared/services/employee_cache.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

class EntityFieldDisplay {
  const EntityFieldDisplay._();

  static Widget build(
    EntityCustom entity,
    String label,
    dynamic value, {
    void Function()? onTap,
  }) {
    if (value == null) {
      return const Text('-');
    }

    // NOTE: avoid firstWhere throwing if not found
    final field = entity.fields.firstWhere(
      (e) => e.reference == label,
      orElse: () => EntityField.empty(),
    );

    late Widget widget;

    if (field.isDateTime) {
      final fmt = field.dateTimeFormat;
      try {
        final date = DateTime.tryParse(value.toString()) ??
            DateFormat(fmt).parse(value.toString());
        widget = Text(DateFormat(fmt).format(date));
      } catch (_) {
        widget = Text(value.toString());
      }
    } else if (field.isBool) {
      widget = BoolIcon(value == 1);
    } else if (field.isPermission) {
      final access = Access.fromValue(int.tryParse(value.toString()) ?? 0);
      widget = Wrap(
        spacing: 3,
        runSpacing: 3,
        children: access.permissions.entries.map((entry) {
          return Chip(
            label: Text(
              entry.key.tr(),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: entry.value
                ? (Access.permissionColors[entry.key] ?? Colors.grey)
                : Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: Colors.transparent),
            ),
          );
        }).toList(),
      );
    } else if (field.isNumber) {
      if (value is num) {
        widget = Text(value.format(field.decimal));
      } else {
        final parsed = num.tryParse(value.toString());
        widget = Text(parsed?.format(field.decimal) ?? 'type is not number');
      }
    } else if (field.isUserName) {
      // Tampilkan nama user berdasarkan ID (nip/user_id)
      final token = UserRepositoryApp.instance.token ?? '';
      widget = FutureBuilder<String?>(
        future: EmployeeCache.instance.findName(
          accessToken: token,
          userId: value,
        ),
        builder: (context, snapshot) {
          return Text(snapshot.data ?? '-');
        },
      );
    } else if (field.isUserNameWithId) {
      // Tampilkan NIP - Nama user, contoh: "1801005 - Bimo Fikri Wicaksono"
      final token = UserRepositoryApp.instance.token ?? '';
      widget = FutureBuilder<String?>(
        future: EmployeeCache.instance.findNameWithId(
          accessToken: token,
          userId: value,
        ),
        builder: (context, snapshot) {
          return Text(snapshot.data ?? value.toString());
        },
      );
    } else if (field.isUserId) {
      // Tampilkan NIP/ID saja, contoh: "1801005"
      widget = Text(value.toString());
    } else {
      widget = Text(LayoutListTile.getValue(value));
    }

    final String displayStr;
    if (widget is Text) {
      displayStr = widget.data ?? value.toString();
    } else {
      displayStr = value.toString();
    }

    final customColors = _resolveCustomColors(displayStr, field.backgroundColors, field.textColors);
    if (customColors.$1 != null) {
      widget = Builder(
        builder: (context) {
          final bgColor = customColors.$1!;
          final textColor = customColors.$2 ??
              (ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
                  ? Colors.white
                  : Colors.black87);

          Widget bgContent = Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.centerLeft,
            // 8px inner padding keeps text legible while the background fills
            // as close to the cell borders as the DataTable theme allows.
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: bgColor,
            child: Text(
              displayStr,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
          );

          if (onTap != null) {
            bgContent = InkWell(
              onTap: onTap,
              child: bgContent,
            );
          }

          return bgContent;
        },
      );
    } else if (field.isChip == true) {
      widget = Builder(
        builder: (context) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final baseColor = _resolveChipColor(displayStr, field.chipColors);
          final backgroundColor = baseColor.withValues(alpha: isDark ? 0.2 : 0.12);
          final textColor = isDark ? baseColor.lighten(0.1) : baseColor;

          Widget chipContent = Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: baseColor.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Text(
              displayStr,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

          if (onTap != null) {
            chipContent = InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(6),
              child: chipContent,
            );
          }

          return chipContent;
        },
      );
    } else {
      // Gunakan extension yang sudah ada: canCopy / clickable
      if (widget is Text) {
        final text = widget;

        // Prioritas: kalau field copyable → pakai canCopy
        if (field.isCopyable == true) {
          widget = text.canCopy(onTap: onTap);
          return _maybeWrapWithTooltip(widget, field, displayStr);
        }

        // Kalau tidak copyable tapi ada onTap → pakai clickable (link biru + underline)
        if (onTap != null) {
          widget = text.clickable(onTap: onTap);
          return _maybeWrapWithTooltip(widget, field, displayStr);
        }
      }
    }

    return _maybeWrapWithTooltip(widget, field, displayStr);
  }

  static Color _resolveChipColor(String value, Map<String, String>? customColors) {
    final upperVal = value.toUpperCase();

    if (customColors != null) {
      for (final entry in customColors.entries) {
        if (upperVal.contains(entry.key.toUpperCase())) {
          final color = _parseHexColor(entry.value);
          if (color != null) return color;
        }
      }
    }

    if (upperVal.contains('REJECT') || upperVal.contains('FAIL')) {
      return const Color(0XFFE53935); // Red
    }
    if (upperVal.contains('APPROVE') ||
        upperVal.contains('SUCCESS') ||
        upperVal.contains('DONE') ||
        upperVal.contains('OK')) {
      return const Color(0XFF43A047); // Green
    }
    if (upperVal.contains('INPUT') ||
        upperVal.contains('DRAFT') ||
        upperVal.contains('PENDING')) {
      return const Color(0XFF1E88E5); // Blue
    }
    if (upperVal.contains('CANCEL') || upperVal.contains('CLOSE')) {
      return const Color(0XFF757575); // Grey
    }
    if (upperVal.contains('PROGRESS') ||
        upperVal.contains('PROCESS') ||
        upperVal.contains('ACTIVE')) {
      return const Color(0XFFF57C00); // Orange
    }

    return const Color(0XFF607D8B); // Fallback Grey-Blue
  }

  static Color? _parseHexColor(String? hex) {
    if (hex == null || hex.isEmpty) return null;
    try {
      String cleanHex = hex.replaceAll('#', '');
      if (cleanHex.length == 6) {
        cleanHex = 'FF' + cleanHex;
      }
      return Color(int.parse(cleanHex, radix: 16));
    } catch (_) {
      return null;
    }
  }

  static (Color?, Color?) _resolveCustomColors(
    String value,
    Map<String, String>? backgroundColors,
    Map<String, String>? textColors,
  ) {
    final upperVal = value.toUpperCase();
    Color? bg;
    Color? text;

    if (backgroundColors != null) {
      for (final entry in backgroundColors.entries) {
        if (entry.key != '*' && upperVal.contains(entry.key.toUpperCase())) {
          bg = _parseHexColor(entry.value);
          break;
        }
      }
      if (bg == null && backgroundColors.containsKey('*')) {
        bg = _parseHexColor(backgroundColors['*']!);
      }
    }

    if (textColors != null) {
      for (final entry in textColors.entries) {
        if (entry.key != '*' && upperVal.contains(entry.key.toUpperCase())) {
          text = _parseHexColor(entry.value);
          break;
        }
      }
      if (text == null && textColors.containsKey('*')) {
        text = _parseHexColor(textColors['*']!);
      }
    }

    return (bg, text);
  }

  /// Wraps [child] with [EntityFieldTooltip] when the field is configured to
  /// show a tooltip. Otherwise returns [child] unchanged so existing rendering
  /// behavior is preserved when `is_tooltip` is absent or `false`.
  static Widget _maybeWrapWithTooltip(Widget child, EntityField field, String message) {
    if (field.isTooltip != true) {
      return child;
    }
    return EntityFieldTooltip(
      message: message,
      child: child,
    );
  }
}


