import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/json_table_viewer.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/pages/create_page.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:get/get.dart';

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

  Future<void> executeSingle({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    required JsonList parentData,
    VoidCallback? onSuccessCallback,
  }) async {
    switch (type) {
      case ActionType.listJsonViewAsTable:
        if (reference == null) {
          Toast(context).fail('No reference found');
          return;
        }
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
        break;

      case ActionType.print:
      case ActionType.http:
        await showConfirmDialog(
          context: context,
          action: action,
          label: name,
          onConfirm: (ctx) => executeHttp(entity, ctx, data,
              onSuccessCallback: onSuccessCallback),
        );
        break;

      case ActionType.openPage:
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
            layoutFormId: layoutFormId!,
            onSuccess: (responseData) async {
              onSuccessCallback?.call();
              await handleOnSuccessSingle(
                entity: entity,
                context: context,
                responseData: responseData,
                data: data,
                onSuccessCallback: onSuccessCallback,
              );
            },
            filters: const <String, dynamic>{},
            parentData: parentData,
          ),
        );
        break;

      case ActionType.showDialog:
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
              layoutFormId: layoutFormId!,
              parentData: parentData,
              data: data,
              filters: const {},
              width: width,
              onSuccess: (responseData) async {
                onSuccessCallback?.call();
                await handleOnSuccessSingle(
                  entity: entity,
                  context: context,
                  responseData: responseData,
                  data: data,
                  onSuccessCallback: onSuccessCallback,
                );
              },
            );
          },
        );
        break;

      case ActionType.showSuccessDialogWithData:
        await handleOnSuccessSingle(
          entity: entity,
          context: context,
          responseData: null,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
        break;

      case ActionType.showConfirmationDialog:
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
              await handleOnSuccessSingle(
                entity: entity,
                context: context,
                responseData: null,
                data: data,
                onSuccessCallback: onSuccessCallback,
              );
            }
          },
        );
        break;

      case ActionType.setVariable:
        final varName = targetVariable;
        if (varName == null || varName.isEmpty) {
          Toast(context).fail('Target variable name is required');
          return;
        }

        final layoutId = data['layoutFormId'] as String?;

        if (layoutId != null) {
          final tag = 'create_page_$layoutId';
          if (Get.isRegistered<CreatePageController>(tag: tag)) {
            final controller = Get.find<CreatePageController>(tag: tag);

            dynamic finalValue;
            if (value != null && value!.isNotEmpty) {
              // Store specific interpolated value
              finalValue = value!.interpolateJavascript(data);
            } else {
              // Store entire form as a map
              final formState = <String, dynamic>{};
              controller.controllers.forEach((key, ctrl) {
                formState[key] = ctrl.text;
              });

              finalValue = {
                ...controller.initialData,
                ...formState,
              };
            }

            controller.initialData[varName] = finalValue;

            // If it's a simple value, try to update a matching controller if it exists
            if (finalValue is! Map && finalValue is! List) {
              if (controller.controllers.containsKey(varName)) {
                controller.controllers[varName]?.text = finalValue.toString();
              }
            }
            controller.initialData.refresh();
          }
        }
        break;

      case ActionType.appendVariable:
        final varName = targetVariable;
        if (varName == null || varName.isEmpty) {
          Toast(context).fail('Target variable name is required');
          return;
        }

        final layoutId = data['layoutFormId'] as String?;

        if (layoutId != null) {
          final tag = 'create_page_$layoutId';
          if (Get.isRegistered<CreatePageController>(tag: tag)) {
            final controller = Get.find<CreatePageController>(tag: tag);

            dynamic itemValue;
            if (value != null && value!.isNotEmpty) {
              itemValue = value!.interpolateJavascript(data);
            } else {
              // Store entire form as a map
              final formState = <String, dynamic>{};
              controller.controllers.forEach((key, ctrl) {
                formState[key] = ctrl.text;
              });
              itemValue = {
                ...controller.initialData,
                ...formState,
              };
            }

            final currentData = controller.initialData[varName];
            List<dynamic> list;
            if (currentData is List) {
              list = List.from(currentData);
            } else {
              list = [];
            }

            list.add(itemValue);
            controller.initialData[varName] = list;
            controller.initialData.refresh();
          }
        }
        break;

      default:
        Toast(context).fail('Unhandled ActionType: $type');
        break;
    }
  }

  // ------------------------------------------------------
  //                SINGLE HTTP EXECUTION
  // ------------------------------------------------------
  Future<void> executeHttpSingle(
    EntityCustom entity,
    BuildContext context,
    JsonMap data, {
    VoidCallback? onSuccessCallback,
  }) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      handleOnFailure(context, 'No http data found');
      return;
    }

    try {
      final response = await http!.execute(data);
      final statusCode = response.statusCode ?? 0;
      final isSuccess = statusCode >= 200 && statusCode < 300;

      if (isSuccess) {
        Toast(context).success('Request success');
        await handleOnSuccessSingle(
          entity: entity,
          context: context,
          responseData: response.data,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
      } else {
        final message = response.message ?? 'Request failed';
        Toast(context).fail(message);
        handleOnFailure(context, message, raw: response);
      }
    } on DioException catch (e) {
      final message = e.message ?? 'Request failed';
      Toast(context).fail(message);
      handleOnFailure(context, message, raw: e);
    } catch (e) {
      const message = 'Unexpected error';
      Toast(context).fail(message);
      handleOnFailure(context, message, raw: e);
    }
  }

  // ------------------------------------------------------
  //                MULTIPLE HTTP EXECUTION
  // ------------------------------------------------------
  Future<void> executeHttpMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data, {
    VoidCallback? onSuccessCallback,
  }) async {
    if (data.isEmpty) return;

    if (http == null) {
      Toast(context).fail('No http data found');
      handleOnFailure(context, 'No http data found');
      return;
    }

    try {
      final first = data.first;
      final response = await http!.execute(first);
      final statusCode = response.statusCode ?? 0;
      final isSuccess = statusCode >= 200 && statusCode < 300;

      if (isSuccess) {
        Toast(context).success('Request success');
        await handleOnSuccessMultiple(
          entity: entity,
          context: context,
          responseData: response.data,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
      } else {
        final message = response.message ?? 'Request failed';
        Toast(context).fail(message);
        handleOnFailure(context, message, raw: response);
      }
    } on DioException catch (e) {
      final message = e.message ?? 'Request failed';
      Toast(context).fail(message);
      handleOnFailure(context, message, raw: e);
    } catch (e) {
      const message = 'Unexpected error';
      Toast(context).fail(message);
      handleOnFailure(context, message, raw: e);
    }
  }

  // ------------------------------------------------------
  //                   SUCCESS HANDLERS
  // ------------------------------------------------------
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
    print('[ActionLogic] → onSuccess value: "$onSuccess"');

    final successType = ActionType.fromId(onSuccess);
    print('[ActionLogic] → successType: $successType');

    switch (successType) {
      case ActionType.showDialog:
        await showDialog(
          context: context,
          useRootNavigator: false,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Operation completed successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
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
        }
        print('[ActionLogic] 💎 Interpolation vars: $vars');

        final titleText =
            (successTitle ?? 'Success').interpolateJavascript(vars);
        final messageText = (successMessage ?? '').interpolateJavascript(vars);
        final copyLabelText = (copyLabel ?? 'Copy').interpolateJavascript(vars);
        final copyValueText = (copyValue ?? '').interpolateJavascript(vars);

        print('[ActionLogic] 💎 titleText: "$titleText"');
        print('[ActionLogic] 💎 messageText: "$messageText"');
        print('[ActionLogic] 💎 copyValueText: "$copyValueText"');

        await showDialog(
          context: context,
          useRootNavigator: false,
          builder: (_) => CardSuccessWithData(
            title: titleText,
            message: messageText,
            copyLabel: copyLabelText,
            copyValue: copyValueText,
          ),
        );
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
        // Assuming a standard way to go home or using GetX if available
        // For now, pop until we can't pop anymore or pop once if it's a dialog
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        break;
      default:
        print('[ActionLogic] → No standard ActionType matched for onSuccess');
        break;
    }

    final regex = RegExp(r'^exports\.([0-9a-fA-F\-]{36})$');
    final match = regex.firstMatch(onSuccess);

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
            'Authorization': 'Bearer ${UserRepositoryApp.instance.token}',
          },
        );
      } else {
        print(
            '[ActionLogic] ❌ Export ID $exportId NOT found in entity exports');
        print(
            '[ActionLogic] 🔍 Available exports: ${entity.exports.map((e) => e.uuid).toList()}');
      }
    } else {
      print('[ActionLogic] ℹ️ onSuccess does not match exports.UUID pattern');
    }
    print('==============================');
  }

  Future<void> handleOnSuccessMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required JsonList data,
    VoidCallback? onSuccessCallback,
  }) async {
    if (data.isNotEmpty) {
      await handleOnSuccessSingle(
        entity: entity,
        context: context,
        responseData: responseData,
        data: data.first,
        onSuccessCallback: onSuccessCallback,
      );
    }
  }

  // ------------------------------------------------------
  //                     FAILURE HANDLER
  // ------------------------------------------------------
  void handleOnFailure(
    BuildContext context,
    String message, {
    Object? raw,
  }) {
    print('==============================');
    print('[ActionLogic] ❌ _handleOnFailure()');
    print('[ActionLogic] → Action ID: $id');
    print('[ActionLogic] → onFailure value: "$onFailure"');
    print('[ActionLogic] → message: $message');

    final failureType = ActionType.fromId(onFailure);
    print('[ActionLogic] → failureType: $failureType');

    switch (failureType) {
      case ActionType.showErrorDialog:
        showDialog(
          context: context,
          useRootNavigator: false,
          builder: (_) => AlertDialog(
            title: const Text('Failed'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
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
    print('==============================');
  }

  // ------------------------------------------------------
  //                     UI HELPER (DIALOG)
  // ------------------------------------------------------
  Future<void> showConfirmDialog<T>({
    required BuildContext context,
    required DataAction action,
    required String label,
    String? confirmationMessageText,
    required Future<void> Function(BuildContext ctx) onConfirm,
  }) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (dialogCtx) {
        bool isProgress = false;
        return StatefulBuilder(builder: (ctx, setState) {
          return CardConfirmation.action(
            isProgress: isProgress,
            action: action,
            data: Entity.assetType,
            label: label,
            confirmationMessageText: confirmationMessageText,
            onConfirm: () async {
              setState(() => isProgress = true);
              try {
                await onConfirm(ctx);
                if (ctx.mounted) {
                  final route = ModalRoute.of(ctx);
                  if (route != null) {
                    if (route.isCurrent) {
                      Navigator.of(ctx).pop();
                    } else {
                      Navigator.of(ctx).removeRoute(route);
                    }
                  }
                }
              } finally {
                if (ctx.mounted) {
                  setState(() => isProgress = false);
                }
              }
            },
          );
        });
      },
    );
  }
}
