import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';

typedef Json = Map<String, dynamic>;
typedef JsonList = List<Map<String, dynamic>>;

extension ActionLogicExtension on ActionD {
  // ------------------------------------------------------
  //                PUBLIC API ALIAS
  // ------------------------------------------------------
  Future<void> executeHttp(
    EntityCustom entity,
    BuildContext context,
    Json data,
  ) =>
      executeHttpSingle(entity, context, data);

  Future<void> executeHttpList(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
  ) =>
      executeHttpMultiple(entity, context, data);

  // ------------------------------------------------------
  //                SINGLE HTTP EXECUTION
  // ------------------------------------------------------
  Future<void> executeHttpSingle(
    EntityCustom entity,
    BuildContext context,
    Json data,
  ) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      _handleOnFailure(context, 'No http data found');
      return;
    }

    try {
      final response = await http!.execute(data);
      final statusCode = response.statusCode ?? 0;
      final isSuccess = statusCode >= 200 && statusCode < 300;

      if (isSuccess) {
        Toast(context).success('Request success');
        _handleOnSuccessSingle(
          entity: entity,
          context: context,
          responseData: response.data,
          data: data,
        );
      } else {
        final message = response.message ?? 'Request failed';
        Toast(context).fail(message);
        _handleOnFailure(context, message, raw: response);
      }
    } on DioException catch (e) {
      final message = e.message ?? 'Request failed';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: e);
    } catch (e) {
      const message = 'Unexpected error';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: e);
    }
  }

  // ------------------------------------------------------
  //                MULTIPLE HTTP EXECUTION
  // ------------------------------------------------------
  Future<void> executeHttpMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
  ) async {
    if (data.isEmpty) return;

    if (http == null) {
      Toast(context).fail('No http data found');
      _handleOnFailure(context, 'No http data found');
      return;
    }

    try {
      final first = data.first;
      final response = await http!.execute(first);
      final statusCode = response.statusCode ?? 0;
      final isSuccess = statusCode >= 200 && statusCode < 300;

      if (isSuccess) {
        Toast(context).success('Request success');
        _handleOnSuccessMultiple(
          entity: entity,
          context: context,
          responseData: response.data,
          data: data,
        );
      } else {
        final message = response.message ?? 'Request failed';
        Toast(context).fail(message);
        _handleOnFailure(context, message, raw: response);
      }
    } on DioException catch (e) {
      final message = e.message ?? 'Request failed';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: e);
    } catch (e) {
      const message = 'Unexpected error';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: e);
    }
  }

  // ------------------------------------------------------
  //                   SUCCESS HANDLERS
  // ------------------------------------------------------
  void _handleOnSuccessSingle({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required Json data,
  }) {
    final regex = RegExp(r'^exports\.([0-9a-fA-F\-]{36})$');
    final match = regex.firstMatch(onSuccess);

    if (match != null) {
      final exportId = match.group(1) ?? '';

      final index = entity.exports.indexWhere((e) => e.uuid == exportId);
      if (index != -1) {
        final export = entity.exports[index];

        exportToPdf(
          export,
          data: data,
          headerProvider: () async => {
            'Authorization': 'Bearer ${UserRepositoryApp.instance.token}',
          },
        );
      }
    }
  }

  void _handleOnSuccessMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required JsonList data,
  }) {
    if (data.isNotEmpty) {
      _handleOnSuccessSingle(
        entity: entity,
        context: context,
        responseData: responseData,
        data: data.first,
      );
    }
  }

  // ------------------------------------------------------
  //                     FAILURE HANDLER
  // ------------------------------------------------------
  void _handleOnFailure(
    BuildContext context,
    String message, {
    Object? raw,
  }) {
    switch (onFailure) {
      case 'show_error_dialog':
        showDialog(
          context: context,
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

      case 'toast':
        Toast(context).fail(message);
        break;

      case 'navigate_back':
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

  // ------------------------------------------------------
  //                     UI HELPER (DIALOG)
  // ------------------------------------------------------
  Future<void> showConfirmDialog<T>({
    required BuildContext context,
    required DataAction action,
    required String label,
    required Future<void> Function(BuildContext ctx) onConfirm,
  }) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) {
        bool isProgress = false;
        return StatefulBuilder(builder: (ctx, setState) {
          return CardConfirmation.action(
            isProgress: isProgress,
            action: action,
            data: Entity.assetType,
            label: label,
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
