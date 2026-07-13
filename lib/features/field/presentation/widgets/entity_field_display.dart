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

    // Gunakan extension yang sudah ada: canCopy / clickable
    if (widget is Text) {
      final text = widget;
      final displayStr = text.data ?? value.toString();

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

    final String displayStr;
    if (widget is Text) {
      displayStr = widget.data ?? value.toString();
    } else {
      displayStr = value.toString();
    }
    return _maybeWrapWithTooltip(widget, field, displayStr);
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
