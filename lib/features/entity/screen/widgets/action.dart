import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/shared/services/http_request_executor.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

typedef Json = Map<String, dynamic>;
typedef JsonList = List<Map<String, dynamic>>;

extension ActionListExtenstion on List<ActionD> {
  List<Widget> buildButtonsSingle({
    required EntityCustom entity,
    required BuildContext context,
    required Json data,
    required JsonList parentData,
  }) {
    return map(
      (e) => e.buttonSingle(entity, context, data, parentData),
    ).toList();
  }

  List<Widget> buildButtonsMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required JsonList data,
    required JsonList parentData,
  }) {
    return map(
      (e) => e.buttonMultiple(entity, context, data, parentData),
    ).toList();
  }
}

extension ActionExtenstion on ActionD {
  // Public API Alias
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

  // Singleton executor
  HttpRequestExecutor get _http => HttpRequestExecutor();

  // ------------------------------------------------------
  //                 SINGLE HTTP EXECUTION
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

    final url = http!.url.replaceStringWithValues(data, urlEncode: true);
    final headers = http!.headersReplaceStringWithValues(data);
    final method = http!.method.toUpperCase();

    final bool hasBody = <String>{'POST', 'PUT', 'PATCH'}.contains(method);
    Object? body;

    if (hasBody && http!.body.isNotEmpty) {
      final replaced = http!.bodyReplaceStringWithValues(data);
      body = http!.useFormData ? FormData.fromMap(replaced) : replaced;
    }

    final result = await _http.execute(
      HttpRequestConfig(
        method: method,
        url: url,
        headers: headers,
        body: body,
        asFormData: http!.useFormData,
      ),
    );

    if (result.isSuccess) {
      Toast(context).success('Request success');
      _handleOnSuccessSingle(
        entity: entity,
        context: context,
        responseData: result.data,
        data: data,
      );
    } else {
      final message = result.message ?? 'Request failed';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: result.raw);
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

    final first = data.first;

    final url = http!.url.replaceStringWithValues(first, urlEncode: true);
    final headers = http!.headersReplaceStringWithValues(first);
    final method = http!.method.toUpperCase();

    final bool hasBody = <String>{'POST', 'PUT', 'PATCH'}.contains(method);

    Object? body;
    if (hasBody && http!.body.isNotEmpty) {
      final replaced = http!.bodyReplaceStringWithValuesMultiple(data);
      body = http!.useFormData ? FormData.fromMap(replaced) : replaced;
    }

    final result = await _http.execute(
      HttpRequestConfig(
        method: method,
        url: url,
        headers: headers,
        body: body,
        asFormData: http!.useFormData,
      ),
    );

    if (result.isSuccess) {
      Toast(context).success('Request success');
      _handleOnSuccessMultiple(
        entity: entity,
        context: context,
        responseData: result.data,
        data: data,
      );
    } else {
      final message = result.message ?? 'Request failed';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: result.raw);
    }
  }

  // ------------------------------------------------------
  //                    SUCCESS HANDLERS
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
  //                       FAILURE HANDLER
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
  //                        UI HELPERS
  // ------------------------------------------------------
  Future<void> _showConfirmDialog<T>({
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

  // ------------------------------------------------------
  //                      BUTTONS
  // ------------------------------------------------------
  Widget buttonSingle(
    EntityCustom entity,
    BuildContext context,
    Json data,
    JsonList parentData,
  ) {
    const action = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      action: action,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          _handleOnFailure(context, 'No http data found');
          return;
        }
        await _showConfirmDialog(
          context: context,
          action: action,
          label: name,
          onConfirm: (ctx) => executeHttp(entity, ctx, data),
        );
      },
    );
  }

  Widget buttonMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
    JsonList parentData,
  ) {
    const action = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      action: action,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          _handleOnFailure(context, 'No http data found');
          return;
        }
        await _showConfirmDialog(
          context: context,
          action: action,
          label: name,
          onConfirm: (ctx) => executeHttpMultiple(entity, ctx, data),
        );
      },
    );
  }
}
