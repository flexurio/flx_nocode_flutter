import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

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
        handleOnSuccessSingle(
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
        handleOnSuccessMultiple(
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
  void handleOnSuccessSingle({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required JsonMap data,
    VoidCallback? onSuccessCallback,
  }) {
    print('==============================');
    print('[ActionLogic] 🚀 handleOnSuccessSingle()');
    print('[ActionLogic] → Action ID: $id');
    print('[ActionLogic] → onSuccess value: "$onSuccess"');

    final successType = ActionType.fromId(onSuccess);
    print('[ActionLogic] → successType: $successType');

    switch (successType) {
      case ActionType.showDialog:
        showDialog(
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
      case ActionType.refresh:
        print('[ActionLogic] 🔃 Executing onSuccess refresh');
        onSuccessCallback?.call();
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

  void handleOnSuccessMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required JsonList data,
    VoidCallback? onSuccessCallback,
  }) {
    if (data.isNotEmpty) {
      handleOnSuccessSingle(
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
                Navigator.of(ctx).pop();
              } finally {
                if (Navigator.of(ctx).canPop()) {
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
