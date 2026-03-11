import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

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
    required List<Map<String, dynamic>> data,
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
}
