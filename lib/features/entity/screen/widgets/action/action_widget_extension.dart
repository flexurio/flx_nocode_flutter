import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/pages/create_page.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';
import 'json_table_viewer.dart';
import 'action_button_regular.dart';

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
    VoidCallback? onSuccessCallback,
  }) {
    return where((action) => action.isVisibleFor(data))
        .map((e) => e.buttonSingle(entity, context, data, parentData,
            onSuccessCallback: onSuccessCallback))
        .toList();
  }

  List<Widget> buildButtonsMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required JsonList data,
    required JsonList parentData,
  }) {
    return where((action) => action.isVisibleForList(data))
        .map((e) => e.buttonMultiple(entity, context, data, parentData))
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
    required VoidCallback onSuccess,
  }) {
    return ActionButtonRegular(
      actionD: this,
      entity: entity,
      parentData: parentData,
      filters: filters,
      onSuccess: onSuccess,
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
    VoidCallback? onSuccessCallback,
  }) {
    switch (type) {
      case ActionType.listJsonViewAsTable:
        return _buildButtonListJsonViewAsTable(
          entity: entity,
          context: context,
          data: data,
          reference: reference,
        );
      case ActionType.print:
        return _buildButtonPrint(
          entity: entity,
          context: context,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
      case ActionType.openPage:
        return _buildButtonOpenPage(
          entity: entity,
          context: context,
          data: data,
          layoutFormId: layoutFormId,
          parentData: parentData,
          onSuccessCallback: onSuccessCallback,
        );
      case ActionType.showDialog:
        return _buildButtonShowDialog(
          entity: entity,
          context: context,
          data: data,
          layoutFormId: layoutFormId,
          parentData: parentData,
          onSuccessCallback: onSuccessCallback,
        );
      case ActionType.http:
        return _buildButtonHttp(
          entity: entity,
          context: context,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
      case ActionType.showConfirmationDialog:
        return _buildButtonShowConfirmationDialog(
          entity: entity,
          context: context,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
      default:
        return NoCodeError(
          'Unhandled ActionType: $type',
          debugInfo:
              'ActionType "$type" is not handled in ActionWidgetExtension.buttonSingle. Available types: ${ActionType.values}',
          description:
              'The action type "$type" is not implemented in ActionWidgetExtension.buttonSingle. This indicates a missing UI component for this action.',
          suggestion:
              'Please ensure all ActionType enum values are handled in the switch statement within ActionWidgetExtension.buttonSingle.',
        );
    }
  }

  Widget buttonMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
    JsonList parentData,
  ) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
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

  // ------------------------------------------------------
  //                PRIVATE WIDGET BUILDERS
  // ------------------------------------------------------

  Widget _buildButtonPrint({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    VoidCallback? onSuccessCallback,
  }) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
      action: actionType,
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          return;
        }
        await showConfirmDialog(
          context: context,
          action: actionType,
          label: name,
          onConfirm: (ctx) => executeHttp(entity, ctx, data,
              onSuccessCallback: onSuccessCallback),
        );
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonListJsonViewAsTable({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    required String? reference,
  }) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
      action: actionType,
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        if (reference == null) {
          Toast(context).fail('No reference found');
          return;
        }

        // Mengambil data dari reference
        final dynamic rawData = data[reference];
        dynamic jsonData;

        if (rawData is String) {
          try {
            jsonData = jsonDecode(rawData);
          } catch (e) {
            jsonData = null;
          }
        } else {
          jsonData = rawData;
        }

        if (jsonData == null) {
          await showDialog(
            context: context,
            useRootNavigator: false,
            builder: (ctx) => AlertDialog(
              title: const Text('Error'),
              content: const Text('JSON tidak valid atau data kosong.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          return;
        }

        await showJsonAsTableDialog(context, jsonData);
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonOpenPage({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    required String? layoutFormId,
    required JsonList parentData,
    VoidCallback? onSuccessCallback,
  }) {
    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        if (layoutFormId == null) {
          Toast(context).fail('No page found');
          return;
        }

        await Navigator.push(
          context,
          CreatePage.route(
            data: data,
            entity: entity,
            embedded: false,
            layoutFormId: layoutFormId,
            onSuccess: () {
              onSuccessCallback?.call();
            },
            filters: const <String, dynamic>{},
            parentData: parentData,
          ),
        );
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonShowDialog({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    required String? layoutFormId,
    required JsonList parentData,
    VoidCallback? onSuccessCallback,
  }) {
    const actionType = DataAction.add;

    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
      action: actionType,
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        if (layoutFormId == null) {
          Toast(context).fail('No page found');
          return;
        }

        await showDialog(
          context: context,
          useRootNavigator: false,
          barrierDismissible: false,
          builder: (ctx) {
            return CreatePage.prepare(
              popup: true,
              embedded: true,
              entity: entity,
              layoutFormId: layoutFormId,
              parentData: parentData,
              data: data,
              filters: const {},
              width: width,
              onSuccess: () {
                onSuccessCallback?.call();
              },
            );
          },
        );
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonHttp({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    VoidCallback? onSuccessCallback,
  }) {
    final actionType = action;

    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
      action: actionType,
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          return;
        }
        await executeHttp(entity, context, data,
            onSuccessCallback: onSuccessCallback);
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonShowConfirmationDialog({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    VoidCallback? onSuccessCallback,
  }) {
    return LightButton(
      title: name,
      permission: entity.bypassAllPermissions ? null : getPermission(entity.id),
      action: action,
      iconColor: _parseColor(iconColor),
      onPressed: () async {
        await showConfirmDialog(
          context: context,
          action: action,
          label: name,
          confirmationMessageText: confirmMessage,
          onConfirm: (ctx) async {
            if (http != null) {
              await executeHttp(entity, ctx, data,
                  onSuccessCallback: onSuccessCallback);
            } else {
              // Trigger success even without HTTP if explicitly set as confirmation dialog
              handleOnSuccessSingle(
                entity: entity,
                context: context,
                responseData: null,
                data: data,
                onSuccessCallback: onSuccessCallback,
              );
            }
          },
        );
      },
      iconOverride: actionIcon(this),
    );
  }
}
