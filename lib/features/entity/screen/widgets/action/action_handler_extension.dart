import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
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

        final isMultiple = data['_is_multiple_context'] == true;
        final originalList = (data['_original_list'] as List?)?.cast<Map<String, dynamic>>();

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
