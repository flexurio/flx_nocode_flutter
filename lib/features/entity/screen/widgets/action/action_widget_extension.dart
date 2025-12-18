import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
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

  Widget buildButtonRegular() {
    return LightButtonSmall(
      title: name,
      action: DataAction.print,
      onPressed: () {},
      permissions: null,
    );
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
          // Menggunakan method dari action_logic_extension.dart
          // Note: _handleOnFailure di logic extension bersifat private,
          // tapi karena kita mengimport filenya, kita sebaiknya memanggil executeHttpMultiple
          // yang sudah menghandle error. Namun jika ingin manual, logic failure harus dipublic-kan.
          // Di sini saya panggil return saja karena executeHttpMultiple akan handle validasi.
          return;
        }

        // Menggunakan showConfirmDialog dari action_logic_extension.dart
        await showConfirmDialog(
          context: context,
          action: actionType,
          label: name,
          onConfirm: (ctx) => executeHttpMultiple(entity, ctx, data),
        );
      },
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

        // Memanggil fungsi dari json_table_viewer.dart
        await showJsonAsTableDialog(context, jsonData);
      },
    );
  }
}
