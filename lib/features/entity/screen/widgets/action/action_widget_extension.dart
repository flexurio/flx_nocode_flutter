import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_button_regular.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

typedef JsonList = List<Map<String, dynamic>>;

// ------------------------------------------------------
//             EXTENSION ON LIST<ACTIOND>
// ------------------------------------------------------
extension ActionListWidgetExtension on List<ActionD> {
  List<Widget> buildButtonsSingleRow({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    required JsonList parentData,
    bool? bypassPermission,
    VoidCallback? onSuccessCallback,
  }) {
    return where((action) => action.isVisibleFor(data))
        .map((e) => e.buttonSingle(
              entity,
              context,
              data,
              parentData,
              bypassPermission: bypassPermission,
              onSuccessCallback: onSuccessCallback,
            ))
        .toList();
  }

  List<Widget> buildButtonsMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required JsonList data,
    required JsonList parentData,
    bool? bypassPermission,
  }) {
    return where((action) => action.isVisibleForList(data))
        .map((e) => e.buttonMultiple(
              entity,
              context,
              data,
              parentData,
              bypassPermission: bypassPermission,
            ))
        .toList();
  }
}

// ------------------------------------------------------
//             EXTENSION ON ACTIOND (WIDGETS)
// ------------------------------------------------------
extension ActionWidgetExtension on ActionD {
  bool isVisibleFor(JsonMap data) {
    try {
      return rule?.evaluate(data) ?? true;
    } catch (e) {
      debugPrint('Action rule evaluation failed: $e');
      return true; // Fail open to avoid breaking UI
    }
  }

  bool isVisibleForList(JsonList data) {
    if (data.isEmpty) return isVisibleFor({});
    return data.every(isVisibleFor);
  }

  Widget buildButtonRegular({
    required BuildContext context,
    required EntityCustom entity,
    required JsonList parentData,
    required JsonMap filters,
    bool? bypassPermission,
    required VoidCallback onSuccess,
  }) {
    return ActionButtonRegular(
      actionD: this,
      entity: entity,
      parentData: parentData,
      filters: filters,
      onSuccess: onSuccess,
      bypassPermission: bypassPermission,
    );
  }

  IconData? actionIcon(ActionD action) {
    if (action.icon != null) {
      return getIconByName(action.icon);
    }
    // We prioritize the named 'icon' property which uses a constant mapping.
    return null;
  }

  Color? _parseColor(String? colorStr) {
    if (colorStr == null || colorStr.isEmpty) return null;
    try {
      if (colorStr.startsWith('#')) {
        var hex = colorStr.replaceFirst('#', '');
        if (hex.length == 6) hex = 'FF$hex';
        return Color(int.parse('0x$hex'));
      }
      if (colorStr.startsWith('0x')) {
        return Color(int.parse(colorStr));
      }
      return Color(int.parse('0x$colorStr'));
    } catch (e) {
      debugPrint('Error parsing color: $colorStr');
      return null;
    }
  }

  Widget buttonSingle(
    EntityCustom entity,
    BuildContext context,
    JsonMap data,
    JsonList parentData, {
    bool? bypassPermission,
    VoidCallback? onSuccessCallback,
  }) {
    return LightButton(
      title: name,
      permission: (bypassPermission ?? entity.bypassAllPermissions)
          ? null
          : getPermission(entity.id),
      iconColor: _parseColor(iconColor),
      onPressed: () => executeSingle(
        entity: entity,
        context: context,
        data: data,
        parentData: parentData,
        onSuccessCallback: onSuccessCallback,
      ),
      iconOverride: actionIcon(this),
    );
  }

  Widget buttonMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
    JsonList parentData, {
    bool? bypassPermission,
  }) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: (bypassPermission ?? entity.bypassAllPermissions)
          ? null
          : getPermission(entity.id),
      action: actionType,
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        if (http == null && type != ActionType.showConfirmationDialog) {
          Toast(context).fail('No http data found');
          return;
        }

        await showConfirmDialog(
          context: context,
          action: actionType,
          label: name,
          confirmationMessageText: confirmMessage,
          onConfirm: (ctx) => executeHttpMultiple(entity, ctx, data),
        );
      },
      iconOverride: actionIcon(this),
    );
  }
}
