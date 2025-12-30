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

typedef Json = Map<String, dynamic>;
typedef JsonList = List<Map<String, dynamic>>;

// ------------------------------------------------------
//             EXTENSION ON LIST<ACTIOND>
// ------------------------------------------------------
extension ActionListWidgetExtension on List<ActionD> {
  List<Widget> buildButtonsSingleRow({
    required EntityCustom entity,
    required BuildContext context,
    required Json data,
    required JsonList parentData,
  }) {
    return where((action) => action.isVisibleFor(data))
        .map((e) => e.buttonSingle(entity, context, data, parentData))
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
  bool isVisibleFor(Json data) {
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
    return LightButtonSmall(
      title: name,
      action: action,
      onPressed: () async {
        if (type == ActionType.showDialog) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) {
              return CreatePage.prepare(
                popup: true,
                embedded: true,
                entity: entity,
                layoutFormId: layoutFormId ?? '',
                parentData: parentData,
                filters: filters,
                onSuccess: () {
                  onSuccess();
                  Navigator.of(ctx).pop();
                },
              );
            },
          );
        } else {
          // Default to openPage
          await Navigator.push(
            context,
            CreatePage.route(
              entity: entity,
              onSuccess: onSuccess,
              embedded: false,
              parentData: parentData,
              filters: filters,
              layoutFormId: layoutFormId ?? '',
            ),
          );
        }
      },
      permissions: null,
      iconOverride: actionIcon(this),
    );
  }

  IconData? actionIcon(ActionD action) {
    if (action.icon != null) {
      return getIconByName(action.icon);
    }
    // Note: iconCode is deprecated for release builds due to tree-shaking limitations.
    // We prioritize the named 'icon' property which uses a constant mapping.
    return null;
  }

  Widget buttonSingle(
    EntityCustom entity,
    BuildContext context,
    Json data,
    JsonList parentData,
  ) {
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
        );
      case ActionType.openPage:
        return _buildButtonOpenPage(
          entity: entity,
          context: context,
          data: data,
          layoutFormId: layoutFormId,
        );
      case ActionType.showDialog:
        return _buildButtonShowDialog(
          entity: entity,
          context: context,
          data: data,
          layoutFormId: layoutFormId,
          parentData: parentData,
        );
      case ActionType.http:
        return _buildButtonHttp(
          entity: entity,
          context: context,
          data: data,
        );
      default:
        return NoCodeError(
          'Unhandled ActionType: $type',
          debugInfo:
              'ActionType "$type" is not handled in ActionWidgetExtension.buttonSingle.',
          description:
              'The action type "$type" is not implemented in ActionWidgetExtension.buttonMultiple. This indicates a missing UI component for this action.',
          suggestion:
              'Please ensure all ActionType enum values are handled in the switch statement within ActionWidgetExtension.buttonMultiple.',
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
      permission: null,
      action: actionType,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          return;
        }

        await showConfirmDialog(
          context: context,
          action: actionType,
          label: name,
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
    required Json data,
  }) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      action: actionType,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          return;
        }
        await showConfirmDialog(
          context: context,
          action: actionType,
          label: name,
          onConfirm: (ctx) => executeHttp(entity, ctx, data),
        );
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonListJsonViewAsTable({
    required EntityCustom entity,
    required BuildContext context,
    required Json data,
    required String? reference,
  }) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      action: actionType,
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
    required Json data,
    required String? layoutFormId,
  }) {
    const actionType = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      action: actionType,
      onPressed: () async {
        if (layoutFormId == null) {
          Toast(context).fail('No page found');
          return;
        }

        await Navigator.push(
          context,
          CreatePage.route(
            entity: entity,
            embedded: false,
            layoutFormId: layoutFormId,
            onSuccess: () {},
            filters: const <String, dynamic>{},
            parentData: const <Map<String, dynamic>>[],
          ),
        );
      },
      iconOverride: actionIcon(this),
    );
  }

  Widget _buildButtonShowDialog({
    required EntityCustom entity,
    required BuildContext context,
    required Json data,
    required String? layoutFormId,
    required JsonList parentData,
  }) {
    const actionType = DataAction.add;

    return LightButton(
      title: name,
      permission: null,
      action: actionType,
      onPressed: () async {
        if (layoutFormId == null) {
          Toast(context).fail('No page found');
          return;
        }

        await showDialog(
          context: context,
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
              onSuccess: () {
                Navigator.of(ctx).pop();
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
    required Json data,
  }) {
    final actionType = action;

    return LightButton(
      title: name,
      permission: null,
      action: actionType,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          return;
        }
        await executeHttp(entity, context, data);
      },
      iconOverride: actionIcon(this),
    );
  }
}
