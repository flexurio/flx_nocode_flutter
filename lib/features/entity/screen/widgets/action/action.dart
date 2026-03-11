import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

export 'action_execution_extension.dart';
export 'action_handler_extension.dart';
export 'action_confirm_dialog_extension.dart';

import 'action_execution_extension.dart';

typedef JsonList = List<Map<String, dynamic>>;

extension ActionLogicExtension on ActionD {
  // ------------------------------------------------------
  //                PUBLIC API ALIAS
  // ------------------------------------------------------
  Future<void> executeHttp(
    EntityCustom entity,
    BuildContext context,
    JsonMap data, {
    VoidCallback? onSuccessCallback,
  }) =>
      executeHttpSingle(entity, context, data,
          onSuccessCallback: onSuccessCallback);

  Future<void> executeHttpList(
    EntityCustom entity,
    BuildContext context,
    JsonList data, {
    VoidCallback? onSuccessCallback,
  }) =>
      executeHttpMultiple(entity, context, data,
          onSuccessCallback: onSuccessCallback);
}
