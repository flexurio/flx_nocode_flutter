import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/shared/services/employee_cache.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

extension ComponentFieldDisplayWidgets on ComponentFieldDisplay {
  Widget toWidget(JsonMap data) {
    final resolvedValue = this.value.interpolateJavascript(
      {
        ...data,
        "current": data,
      },
    );

    Widget buildContent(String text) {
      if (isChip == true) {
        return Builder(
          builder: (context) {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            final baseColor = _resolveChipColor(text, chipColors);
            final backgroundColor = baseColor.withValues(alpha: isDark ? 0.2 : 0.12);
            final textColor = isDark ? baseColor.lighten(0.1) : baseColor;

            return Container(
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
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        );
      }
      return Text(text);
    }

    if (valueType == 'user_name') {
      final token = UserRepositoryApp.instance.token ?? '';
      return FutureBuilder<String?>(
        future: EmployeeCache.instance.findName(
          accessToken: token,
          userId: resolvedValue,
        ),
        builder: (context, snapshot) {
          final name = snapshot.data ?? '-';
          return TileDataVertical(
            label: label,
            child: buildContent(name),
          );
        },
      );
    } else if (valueType == 'user_name_with_id') {
      final token = UserRepositoryApp.instance.token ?? '';
      return FutureBuilder<String?>(
        future: EmployeeCache.instance.findNameWithId(
          accessToken: token,
          userId: resolvedValue,
        ),
        builder: (context, snapshot) {
          final name = snapshot.data ?? resolvedValue;
          return TileDataVertical(
            label: label,
            child: buildContent(name),
          );
        },
      );
    } else if (valueType == 'user_id') {
      return TileDataVertical(
        label: label,
        child: buildContent(resolvedValue),
      );
    }

    return TileDataVertical(
      label: label,
      child: buildContent(resolvedValue),
    );
  }

  Color _resolveChipColor(String value, Map<String, String>? customColors) {
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

  Color? _parseHexColor(String? hex) {
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

  Widget toMockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
