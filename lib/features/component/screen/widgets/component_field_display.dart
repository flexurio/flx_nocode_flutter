import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/field/domain/field_value_label_resolver.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/shared/services/employee_cache.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

extension ComponentFieldDisplayWidgets on ComponentFieldDisplay {
  EntityField? _findReferencedEntityField(JsonMap data) {
    final rawFields = data['__entityFields'];
    if (rawFields is! List<EntityField> || rawFields.isEmpty) return null;

    final targetRef = (fieldRef != null && fieldRef!.isNotEmpty)
        ? fieldRef!
        : FieldValueLabelResolver.extractSimpleFieldReference(value);
    if (targetRef == null || targetRef.isEmpty) return null;

    for (final field in rawFields) {
      if (field.reference == targetRef) return field;
    }
    return null;
  }

  Widget toWidget(JsonMap data) {
    final resolvedValue = this.value.interpolateJavascript(
      {
        ...data,
        "current": data,
      },
    );

    final referencedField = _findReferencedEntityField(data);
    final mergedLabels = <String, String>{
      if (referencedField != null) ...referencedField.effectiveValueLabels,
      if (valueLabels != null) ...valueLabels!,
    };
    final mergedChipColors = <String, String>{
      if (referencedField?.chipColors != null) ...referencedField!.chipColors!,
      if (chipColors != null) ...chipColors!,
    };

    Widget buildContent(String rawText) {
      final displayText = mergedLabels.isNotEmpty
          ? FieldValueLabelResolver.resolveLabel(
              rawText,
              valueLabels: mergedLabels,
            )
          : rawText;

      if (isChip == true) {
        return Builder(
          builder: (context) {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            final baseColor = FieldValueLabelResolver.resolveChipColor(
              rawText,
              mergedChipColors.isEmpty ? null : mergedChipColors,
            );
            final backgroundColor =
                baseColor.withValues(alpha: isDark ? 0.2 : 0.12);
            final textColor = isDark ? baseColor.lighten(0.1) : baseColor;

            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
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
                  displayText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    height: 1.2,
                    leadingDistribution: TextLeadingDistribution.even,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      }
      return Text(displayText);
    }

    if (valueType == 'user_name') {
      final token = UserRepositoryAppNocode.instance.token ?? '';
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
      final token = UserRepositoryAppNocode.instance.token ?? '';
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
