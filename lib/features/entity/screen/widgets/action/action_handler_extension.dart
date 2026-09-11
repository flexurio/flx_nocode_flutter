import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:get/get.dart';

extension ActionSuccessHandlerExtension on ActionD {
  Future<void> handleOnSuccessSingle({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required JsonMap data,
    VoidCallback? onSuccessCallback,
  }) async {
    print('==============================');
    print('[ActionLogic] 🚀 handleOnSuccessSingle()');
    print('[ActionLogic] → Action ID: $id');
    print('[ActionLogic] → onSuccess values: $onSuccess');

    for (final actionStr in onSuccess) {
      final successType = ActionType.fromId(actionStr);
      print('[ActionLogic] → successType: $successType');

      final regex = RegExp(r'^exports\.([0-9a-fA-F\-]{36})$');
      final match = regex.firstMatch(actionStr);

      if (match != null) {
        final exportId = match.group(1) ?? '';
        print('[ActionLogic] ✅ Match Export UUID: $exportId');

        final index = entity.exports.indexWhere((e) => e.uuid == exportId);
        if (index != -1) {
          final export = entity.exports[index];
          print('[ActionLogic] 📄 Triggering exportToPdf for: ${export.name}');

          exportToPdf(
            export,
            data: data,
            headerProvider: () async => {
              'Authorization': 'Bearer ${UserRepositoryAppNocode.instance.token}',
            },
          );
        } else {
          print(
              '[ActionLogic] ❌ Export ID $exportId NOT found in entity exports');
          print(
              '[ActionLogic] 🔍 Available exports: ${entity.exports.map((e) => e.uuid).toList()}');
        }
        continue;
      }

      switch (successType) {
        case ActionType.showDialog:
          await showDialog(
            context: context,
            useRootNavigator: true,
            builder: (dialogCtx) => AlertDialog(
              title: const Text('Success'),
              content: const Text('Operation completed successfully.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogCtx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          break;
        case ActionType.toast:
          Toast(context).success('Request success');
          break;
        case ActionType.showSuccessDialogWithData:
          final vars = <String, dynamic>{};
          print('[ActionLogic] 💎 responseData: $responseData');
          if (responseData is Map<String, dynamic>) {
            vars.addAll(responseData);
            if (responseData.containsKey('data') && responseData['data'] is Map) {
              for (final entry in (responseData['data'] as Map).entries) {
                if (!vars.containsKey(entry.key.toString())) {
                  vars[entry.key.toString()] = entry.value;
                }
              }
            }
          }
          print('[ActionLogic] 💎 Interpolation vars: $vars');

          final isMultiple = data['_is_multiple_context'] == true;
          final originalList =
              (data['_original_list'] as List?)?.cast<Map<String, dynamic>>();

          String interpolate(String? text) {
            if (text == null) return '';
            var result = text;
            if (isMultiple && originalList != null) {
              result = result.replaceStringWithValuesMultiple(originalList);
            }
            return result.interpolateJavascript(vars).renderWithData(data);
          }

          final titleText = interpolate(successTitle ?? 'Success');
          final messageText = interpolate(successMessage);
          final copyLabelText = interpolate(copyLabel ?? 'Copy');
          final copyValueText = interpolate(copyValue);

          print('[ActionLogic] 💎 titleText: "$titleText"');
          print('[ActionLogic] 💎 messageText: "$messageText"');
          print('[ActionLogic] 💎 copyValueText: "$copyValueText"');

          // Capture NavigatorState while context is valid
          final navigator = Navigator.of(context, rootNavigator: false);

          var effectiveConfirmAction = confirmAction;
          if (effectiveConfirmAction == null) {
            final reloadedEntity =
                await EntityCustom.getEntity(entity.id, forceReload: true);
            if (reloadedEntity != null) {
              for (final a in reloadedEntity.actionsHome) {
                if (a.id == id && a.confirmAction != null) {
                  effectiveConfirmAction = a.confirmAction;
                  break;
                }
              }
              if (effectiveConfirmAction == null) {
                for (final a in reloadedEntity.actions.singleRow) {
                  if (a.id == id && a.confirmAction != null) {
                    effectiveConfirmAction = a.confirmAction;
                    break;
                  }
                }
              }
            }
            if (effectiveConfirmAction != null) {
              print(
                  '[ActionLogic] 🔄 Found confirmAction after fresh entity load: $effectiveConfirmAction');
            }
          }

          final confirmed = await showDialog<bool?>(
            context: context,
            useRootNavigator: true,
            builder: (_) => CardSuccessWithData(
              title: titleText,
              message: messageText,
              copyLabel: copyLabelText,
              copyValue: copyValueText,
            ),
          );

          print(
              '[ActionLogic] 💎 Dialog closed. confirmed: $confirmed, confirmAction: $effectiveConfirmAction');

          if (effectiveConfirmAction != null && confirmed != false) {
            await _handleConfirmAction(
              navigator: navigator,
              context: context,
              confirmAction: effectiveConfirmAction,
              vars: vars,
              data: data,
            );
          }
          break;
        case ActionType.refresh:
          print('[ActionLogic] 🔃 Executing onSuccess refresh');
          onSuccessCallback?.call();
          break;
        case ActionType.navigateBack:
          print('[ActionLogic] 🔙 Executing onSuccess navigateBack');
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Toast(context).notify('Cannot navigate back');
          }
          break;
        case ActionType.navigateHome:
          print('[ActionLogic] 🏠 Executing onSuccess navigateHome');
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          break;
        case ActionType.clearForm:
          print('[ActionLogic] ✨ Executing onSuccess clearForm');
          final layoutId = data['layoutFormId'];
          if (layoutId != null &&
              Get.isRegistered<CreatePageController>(
                  tag: 'create_page_$layoutId')) {
            Get.find<CreatePageController>(tag: 'create_page_$layoutId')
                .clearForm();
          }
          break;
        default:
          print('[ActionLogic] → No standard ActionType matched for onSuccess: $actionStr');
          break;
      }
    }
    print('==============================');
  }

  Future<void> handleOnSuccessMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required List<Map<String, dynamic>> data,
    VoidCallback? onSuccessCallback,
  }) async {
    if (data.isNotEmpty) {
      // Merge data for interpolation (e.g. for {selected.id})
      final mergedData = <String, dynamic>{};
      final allKeys = data.expand((e) => e.keys).toSet();
      for (final key in allKeys) {
        final uniqueValues = data
            .map((e) => e[key]?.toString() ?? '')
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList();
        if (uniqueValues.length == 1) {
          mergedData[key] = uniqueValues.first;
        } else if (uniqueValues.length > 1) {
          mergedData[key] = uniqueValues.join(',');
        }
      }

      // Track that this is a multiple context for specific interpolation logic
      mergedData['_is_multiple_context'] = true;
      mergedData['_original_list'] = data;

      await handleOnSuccessSingle(
        entity: entity,
        context: context,
        responseData: responseData,
        data: mergedData,
        onSuccessCallback: onSuccessCallback,
      );
    }
  }

  void handleOnFailure(
    BuildContext context,
    String message, {
    Object? raw,
  }) {
    print('==============================');
    print('[ActionLogic] ❌ _handleOnFailure()');
    print('[ActionLogic] → Action ID: $id');
    print('[ActionLogic] → onFailure values: "$onFailure"');
    print('[ActionLogic] → message: $message');

    for (final actionStr in onFailure) {
      final failureType = ActionType.fromId(actionStr);
      print('[ActionLogic] → failureType: $failureType');

      switch (failureType) {
        case ActionType.showErrorDialog:
          showDialog(
            context: context,
            useRootNavigator: true,
            builder: (dialogCtx) => AlertDialog(
              title: const Text('Failed'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogCtx).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
          break;

        case ActionType.toast:
          Toast(context).fail(message);
          break;

        case ActionType.navigateBack:
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Toast(context).notify('Cannot navigate back');
          }
          break;

        default:
          break;
      }
    }
    print('==============================');
  }

  Future<void> _handleConfirmAction({
    required NavigatorState navigator,
    required BuildContext context,
    required Map<String, dynamic> confirmAction,
    required Map<String, dynamic> vars,
    required Map<String, dynamic> data,
  }) async {
    final type = confirmAction['type']?.toString().toLowerCase();
    if (type == 'navigate' || type == 'direct' || type == 'open_page') {
      final targetEntityId = (confirmAction['entity_id'] ??
              confirmAction['entity'] ??
              confirmAction['page'] ??
              '')
          .toString();

      if (targetEntityId.isEmpty) {
        print('[ActionLogic] ⚠️ targetEntityId is empty in confirmAction');
        return;
      }

      final rawParams = confirmAction['params'];
      final resolvedParams = <String, dynamic>{};

      if (rawParams is Map) {
        for (final entry in rawParams.entries) {
          final key = entry.key.toString();
          final val = entry.value;
          if (val is String) {
            resolvedParams[key] =
                val.interpolateJavascript(vars).renderWithData(data);
          } else {
            resolvedParams[key] = val;
          }
        }
      }

      print(
          '[ActionLogic] 🚀 Confirm navigate to: $targetEntityId, params: $resolvedParams');

      final initialFilters = resolvedParams.entries
          .map((e) => Filter(reference: e.key, value: e.value?.toString() ?? ''))
          .toList();

      final handler = NavigateActionHandler.instance;
      Widget page;
      if (handler != null) {
        Color? primaryColor;
        if (context.mounted) {
          primaryColor = Theme.of(context).colorScheme.primary;
        } else if (Get.context?.mounted == true) {
          primaryColor = Theme.of(Get.context!).colorScheme.primary;
        }
        page = handler(
          entityId: targetEntityId,
          params: resolvedParams,
          primaryColor: primaryColor ?? const Color(0xFF2196F3),
        );
      } else {
        page = MenuCustom.fromId(
          entityId: targetEntityId,
          parentData: [resolvedParams],
          initialFilters: initialFilters,
          firstPage: false,
          embedded: true,
        );
      }

      try {
        if (navigator.mounted) {
          print('[ActionLogic] 🚀 Pushing page via captured navigator');
          await navigator.push(
            MaterialPageRoute(builder: (_) => page),
          );
        } else if (context.mounted) {
          print('[ActionLogic] 🚀 Pushing page via context.mounted');
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => page),
          );
        } else {
          final fallbackCtx = Get.context ?? Get.key.currentContext;
          if (fallbackCtx != null) {
            print('[ActionLogic] 🚀 Pushing page via fallback Get.context');
            await Navigator.of(fallbackCtx).push(
              MaterialPageRoute(builder: (_) => page),
            );
          } else {
            print(
                '[ActionLogic] ❌ No valid navigator or context found to navigate');
          }
        }
      } catch (e, stack) {
        print('[ActionLogic] ❌ Error navigating to $targetEntityId: $e\n$stack');
      }
    }
  }
}
