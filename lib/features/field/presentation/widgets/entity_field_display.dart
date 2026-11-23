import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/domain/field_value_label_resolver.dart';
import 'package:flx_nocode_flutter/features/field/domain/reference_label_cache.dart';
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

    if (field.effectiveDisplaySource != null) {
      final source = field.effectiveDisplaySource!;
      final cached = ReferenceLabelCache.instance.getCached(source, value);
      if (cached != null) {
        widget = Text(
          cached,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      } else {
        widget = FutureBuilder<String?>(
          future: ReferenceLabelCache.instance.resolveOne(source, value),
          builder: (context, snapshot) {
            return Text(
              snapshot.data ?? LayoutListTile.getValue(value),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            );
          },
        );
      }
    } else if (field.hasValueLabels) {
      final rawText = LayoutListTile.getValue(value);
      widget = Text(
        field.resolveDisplayLabel(rawText),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else if (field.isDateTime) {
      final fmt = field.dateTimeFormat;
      try {
        final date = DateTime.tryParse(value.toString()) ??
            DateFormat(fmt).parse(value.toString());
        widget = Text(
          DateFormat(fmt).format(date),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      } catch (_) {
        widget = Text(
          value.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
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
        widget = Text(
          value.format(field.decimal),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      } else {
        final parsed = num.tryParse(value.toString());
        widget = Text(
          parsed?.format(field.decimal) ?? 'type is not number',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      }
    } else if (field.isUserName) {
      // Tampilkan nama user berdasarkan ID (nip/user_id)
      final token = UserRepositoryAppNocode.instance.token ?? '';
      widget = FutureBuilder<String?>(
        future: EmployeeCache.instance.findName(
          accessToken: token,
          userId: value,
        ),
        builder: (context, snapshot) {
          return Text(
            snapshot.data ?? '-',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          );
        },
      );
    } else if (field.isUserNameWithId) {
      // Tampilkan NIP - Nama user, contoh: "1801005 - Bimo Fikri Wicaksono"
      final token = UserRepositoryAppNocode.instance.token ?? '';
      widget = FutureBuilder<String?>(
        future: EmployeeCache.instance.findNameWithId(
          accessToken: token,
          userId: value,
        ),
        builder: (context, snapshot) {
          return Text(
            snapshot.data ?? value.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          );
        },
      );
    } else if (field.isUserId) {
      // Tampilkan NIP/ID saja, contoh: "1801005"
      widget = Text(
        value.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    } else {
      final rawText = LayoutListTile.getValue(value);
      widget = Text(
        rawText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }

    final String rawStr = LayoutListTile.getValue(value);
    final String displayStr;
    if (widget is Text) {
      displayStr = widget.data ?? rawStr;
    } else if (field.effectiveDisplaySource != null) {
      final cached = ReferenceLabelCache.instance
          .getCached(field.effectiveDisplaySource!, value);
      displayStr = cached ?? rawStr;
    } else {
      displayStr =
          field.hasValueLabels ? field.resolveDisplayLabel(rawStr) : rawStr;
    }

    // Always match colors against the raw code (e.g. CLOSED), not the translated display label.
    final customColors = _resolveCustomColors(rawStr, field.backgroundColors, field.textColors);
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
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
          final baseColor =
              FieldValueLabelResolver.resolveChipColor(rawStr, field.chipColors);
          final backgroundColor = baseColor.withValues(alpha: isDark ? 0.2 : 0.12);
          final textColor = isDark ? baseColor.lighten(0.1) : baseColor;

          Widget chipLabel = Text(
            displayStr,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              height: 1.2,
              leadingDistribution: TextLeadingDistribution.even,
              fontWeight: FontWeight.bold,
            ),
          );

          if (field.effectiveDisplaySource != null &&
              ReferenceLabelCache.instance
                      .getCached(field.effectiveDisplaySource!, value) ==
                  null) {
            chipLabel = FutureBuilder<String?>(
              future: ReferenceLabelCache.instance
                  .resolveOne(field.effectiveDisplaySource!, value),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? displayStr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    height: 1.2,
                    leadingDistribution: TextLeadingDistribution.even,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            );
          }

          Widget chipContent = Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: baseColor.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: chipLabel,
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

        // Prioritas: kalau field copyable → pakai canCopy dengan wrap: true agar tidak overflow
        if (field.isCopyable == true) {
          widget = text.canCopy(onTap: onTap, wrap: true);
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
        if (entry.key != '*' && upperVal == entry.key.toUpperCase()) {
          bg = FieldValueLabelResolver.parseHexColor(entry.value);
          break;
        }
      }
      if (bg == null) {
        for (final entry in backgroundColors.entries) {
          if (entry.key != '*' && upperVal.contains(entry.key.toUpperCase())) {
            bg = FieldValueLabelResolver.parseHexColor(entry.value);
            break;
          }
        }
      }
      if (bg == null && backgroundColors.containsKey('*')) {
        bg = FieldValueLabelResolver.parseHexColor(backgroundColors['*']!);
      }
    }

    if (textColors != null) {
      for (final entry in textColors.entries) {
        if (entry.key != '*' && upperVal == entry.key.toUpperCase()) {
          text = FieldValueLabelResolver.parseHexColor(entry.value);
          break;
        }
      }
      if (text == null) {
        for (final entry in textColors.entries) {
          if (entry.key != '*' && upperVal.contains(entry.key.toUpperCase())) {
            text = FieldValueLabelResolver.parseHexColor(entry.value);
            break;
          }
        }
      }
      if (text == null && textColors.containsKey('*')) {
        text = FieldValueLabelResolver.parseHexColor(textColors['*']!);
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


