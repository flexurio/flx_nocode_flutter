import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
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
    return map((e) => e.buttonSingle(entity, context, data, parentData))
        .toList();
  }

  List<Widget> buildButtonsMultiple({
    required EntityCustom entity,
    required BuildContext context,
    required JsonList data,
    required JsonList parentData,
  }) {
    return map((e) => e.buttonMultiple(entity, context, data, parentData))
        .toList();
  }
}

extension ActionExtenstion on ActionD {
  // ---------- PUBLIC API (alias agar pemanggilan tetap konsisten) ----------
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

  // ----------------------------- SINGLE ------------------------------------
  Future<void> executeHttpSingle(
    EntityCustom entity,
    BuildContext context,
    Json data,
  ) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      _handleOnFailure(context, 'No http data found', raw: null);
      return;
    }

    final String url = http!.url.replaceStringWithValues(data, urlEncode: true);
    final Map<String, String> headers =
        http!.headersReplaceStringWithValues(data);
    final String method = http!.method.toUpperCase();

    final bool hasBody = <String>{'POST', 'PUT', 'PATCH'}.contains(method);
    Object? body;

    if (hasBody && http!.body.isNotEmpty) {
      final Map<String, Object?> replacedBody =
          http!.bodyReplaceStringWithValues(data);
      body = http!.useFormData ? FormData.fromMap(replacedBody) : replacedBody;
    }

    await _executeHttpCore(
      entity: entity,
      context: context,
      url: url,
      headers: headers,
      method: method,
      body: body,
      useFormData: http!.useFormData,
      onSuccess: (Object? responseData) {
        _handleOnSuccessSingle(
          entity: entity,
          context: context,
          responseData: responseData,
          data: data,
        );
      },
    );
  }

  // ---------------------------- MULTIPLE -----------------------------------
  Future<void> executeHttpMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
  ) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      _handleOnFailure(context, 'No http data found', raw: null);
      return;
    }

    final String url =
        http!.url.replaceStringWithValues(data.first, urlEncode: true);
    final Map<String, String> headers =
        http!.headersReplaceStringWithValues(data.first);
    final String method = http!.method.toUpperCase();

    final bool hasBody = <String>{'POST', 'PUT', 'PATCH'}.contains(method);
    Object? body;

    if (hasBody && http!.body.isNotEmpty) {
      final Map<String, Object?> replacedBody =
          http!.bodyReplaceStringWithValuesMultiple(data);
      body = http!.useFormData ? FormData.fromMap(replacedBody) : replacedBody;
    }

    await _executeHttpCore(
      entity: entity,
      context: context,
      url: url,
      headers: headers,
      method: method,
      body: body,
      useFormData: http!.useFormData,
      onSuccess: (Object? responseData) {
        _handleOnSuccessMultiple(
          entity: entity,
          context: context,
          responseData: responseData,
          data: data,
        );
      },
    );
  }

  // --------------------------- CORE (DRY) ----------------------------------
  Future<void> _executeHttpCore({
    required EntityCustom entity,
    required BuildContext context,
    required String url,
    required Map<String, String> headers,
    required String method,
    required Object? body,
    required bool useFormData,
    required void Function(Object? responseData) onSuccess,
  }) async {
    final dio = Dio();
    final options = Options(method: method, headers: headers);

    _logHttpRequest(
        method: method,
        url: url,
        headers: headers,
        body: body,
        asFormData: useFormData);

    try {
      final Response<Object?> response = await dio.request<Object?>(
        url,
        data: body,
        options: options,
      );

      _logHttpResponse(statusCode: response.statusCode, data: response.data);

      final int status = response.statusCode ?? 0;
      if (status >= 200 && status < 300) {
        Toast(context).success('Request success');
        onSuccess(response.data);
      } else {
        final String message = _extractErrorMessage(
          response.data,
          fallback:
              'Request failed: ${response.statusCode} - ${response.statusMessage}',
        );
        Toast(context).fail(message);
        _handleOnFailure(context, message, raw: response.data);
      }
    } on DioException catch (e) {
      _logHttpError(
          type: e.type.toString(),
          message: e.message ?? '-',
          response: e.response?.data);
      final String message = _extractErrorMessage(
        e.response?.data,
        fallback: e.message ?? 'Unknown error occurred',
      );
      Toast(context).fail('HTTP Error: $message');
      _handleOnFailure(context, message, raw: e.response?.data);
    } catch (e) {
      _logUnexpectedError(e);
      final String message = 'Unexpected error: $e';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: null);
    }
  }

  // --------------------------- LOGGING (DRY) -------------------------------
  void _logHttpRequest({
    required String method,
    required String url,
    required Map<String, String> headers,
    required Object? body,
    required bool asFormData,
  }) {
    print('================ HTTP REQUEST ================');
    print('→ Method : $method');
    print('→ URL    : $url');
    print('→ Headers: $headers');
    print('→ Body   : ${body ?? '{}'}');
    print('→ AsFormData: $asFormData');
    print('==============================================');
  }

  void _logHttpResponse({required int? statusCode, required Object? data}) {
    print('================ HTTP RESPONSE ================');
    print('← Status : $statusCode');
    print('← Data   : $data');
    print('==============================================');
  }

  void _logHttpError(
      {required String type,
      required String message,
      required Object? response}) {
    print('================ HTTP ERROR ==================');
    print('❌ Type     : $type');
    print('❌ Message  : $message');
    print('❌ Response : $response');
    print('==============================================');
  }

  void _logUnexpectedError(Object error) {
    print('================ UNEXPECTED ERROR =============');
    print('❌ $error');
    print('==============================================');
  }

  // ------------------------ SUCCESS HANDLERS --------------------------------
  void _handleOnSuccessSingle({
    required EntityCustom entity,
    required BuildContext context,
    required Object? responseData,
    required Json data,
  }) {
    // Contoh rule export: "exports.<uuid-v4>"
    final RegExp regex = RegExp(r'^exports\.([0-9a-fA-F\-]{36})$');
    final RegExpMatch? match = regex.firstMatch(onSuccess);
    if (match != null) {
      final String id = match.group(1) ?? '';
      final int index = entity.exports.indexWhere((e) => e.uuid == id);
      if (index != -1) {
        final export = entity.exports[index];
        exportToPdf(
          export,
          data: data,
          headerProvider: () async => <String, String>{
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
    // Strategi sederhana: gunakan item pertama untuk kebutuhan export (bisa disesuaikan).
    if (data.isEmpty) return;
    _handleOnSuccessSingle(
      entity: entity,
      context: context,
      responseData: responseData,
      data: data.first,
    );
  }

  // --------------------------- FAILURE HANDLER ------------------------------
  void _handleOnFailure(
    BuildContext context,
    String message, {
    Object? raw,
  }) {
    switch (onFailure) {
      case 'show_error_dialog':
        showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Failed'),
            content: Text(message),
            actions: <Widget>[
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

  // --------------------------- ERROR PARSER ---------------------------------
  String _extractErrorMessage(
    Object? responseData, {
    String fallback = 'Request failed',
  }) {
    if (responseData == null) return fallback;
    if (responseData is String && responseData.trim().isNotEmpty) {
      return responseData;
    }
    if (responseData is Map<Object?, Object?>) {
      final Object? messageField = responseData['message'] ??
          responseData['error'] ??
          responseData['detail'];
      if (messageField is String && messageField.trim().isNotEmpty)
        return messageField;

      final Object? errors = responseData['errors'];
      if (errors != null) return errors.toString();
    }
    return fallback;
  }

  // -------------------------- UI HELPERS (DRY) ------------------------------
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
        return StatefulBuilder(
          builder: (ctx, setState) {
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
          },
        );
      },
    );
  }

  // ----------------------------- BUTTONS ------------------------------------
  Widget buttonSingle(
    EntityCustom entity,
    BuildContext context,
    Json data,
    JsonList parentData,
  ) {
    const DataAction act = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          _handleOnFailure(context, 'No http data found');
          return;
        }
        await _showConfirmDialog<void>(
          context: context,
          action: act,
          label: name,
          onConfirm: (ctx) => executeHttp(entity, ctx, data),
        );
      },
      action: act,
    );
  }

  Widget buttonMultiple(
    EntityCustom entity,
    BuildContext context,
    JsonList data,
    JsonList parentData,
  ) {
    const DataAction act = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          _handleOnFailure(context, 'No http data found');
          return;
        }
        await _showConfirmDialog<void>(
          context: context,
          action: act,
          label: name,
          onConfirm: (ctx) => executeHttpMultiple(entity, ctx, data),
        );
      },
      action: act,
    );
  }
}
