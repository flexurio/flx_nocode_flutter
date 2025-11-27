import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flx_authentication_flutter/flx_authentication_flutter.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/layout_list_tile.dart';

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
      try {
        final date = DateTime.tryParse(value.toString()) ??
            DateFormat(field.dateTimeFormat).parse(value.toString());
        widget = Text(DateFormat(field.dateTimeFormat).format(date));
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
    } else {
      widget = Text(LayoutListTile.getValue(value));
    }

    // Gunakan extension yang sudah ada: canCopy / clickable
    if (widget is Text) {
      final text = widget;

      // Prioritas: kalau field copyable → pakai canCopy
      if (field.isCopyable == true) {
        return text.canCopy(onTap: onTap);
      }

      // Kalau tidak copyable tapi ada onTap → pakai clickable (link biru + underline)
      if (onTap != null) {
        return text.clickable(onTap: onTap);
      }
    }

    return widget;
  }
}
