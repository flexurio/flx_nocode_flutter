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
            child: Text(name),
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
            child: Text(name),
          );
        },
      );
    } else if (valueType == 'user_id') {
      return TileDataVertical(
        label: label,
        child: Text(resolvedValue),
      );
    }

    return TileDataVertical(
      label: label,
      child: Text(resolvedValue),
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
