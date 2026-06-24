import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component_user_name.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/shared/services/employee_cache.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

extension ComponentUserNameWidgets on ComponentUserName {
  Widget toWidget(JsonMap data) {
    final resolvedUserId = userId.interpolateJavascript({
      ...data,
      'current': data,
    });

    if (resolvedUserId.isEmpty || resolvedUserId == 'null') {
      return _buildDisplay(label, '-');
    }

    final token = UserRepositoryApp.instance.token ?? '';

    return FutureBuilder<String?>(
      future: EmployeeCache.instance.findName(
        accessToken: token,
        userId: resolvedUserId,
      ),
      builder: (context, snapshot) {
        final name = snapshot.data ?? '-';
        return _buildDisplay(label, name);
      },
    );
  }

  Widget _buildDisplay(String labelText, String valueText) {
    if (labelText.isEmpty) {
      return Text(valueText);
    }
    return TileDataVertical(
      label: labelText,
      child: Text(valueText),
    );
  }

  Widget toMockWidget() {
    return _buildDisplay(label, '—');
  }
}
