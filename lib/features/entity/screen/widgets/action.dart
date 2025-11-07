import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/export/screen/widgets/export_to_pdf.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

extension ActionListExtenstion on List<ActionD> {
  List<Widget> toButtonList(
    EntityCustom entity,
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    return map((e) => e.button(entity, context, data, parentData)).toList();
  }
}

extension ActionExtenstion on ActionD {
  Future<void> executeHttp(
    EntityCustom entity,
    BuildContext context,
    Map<String, dynamic> data,
  ) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      _handleOnFailure(context, 'No http data found', raw: null);
      return;
    }

    final dio = Dio();

    try {
      final url = http!.url.replaceStringWithValues(data, urlEncode: true);
      final headers = http!.headersReplaceStringWithValues(data);
      final method = http!.method.toUpperCase();

      final options = Options(
        method: method,
        headers: headers,
      );

      final hasBody = ['POST', 'PUT', 'PATCH'].contains(method);
      dynamic body;

      if (hasBody && http!.body.isNotEmpty) {
        final replacedBody = http!.bodyReplaceStringWithValues(data);
        if (http!.useFormData) {
          body = FormData.fromMap(replacedBody);
        } else {
          body = replacedBody;
        }
      }

      print('================ HTTP REQUEST ================');
      print('→ Method : $method');
      print('→ URL    : $url');
      print('→ Headers: $headers');
      print('→ Body   : ${body ?? '{}'}');
      print('→ AsFormData: ${http!.useFormData}');
      print('==============================================');

      final response = await dio.request(
        url,
        data: body,
        options: options,
      );

      print('================ HTTP RESPONSE ================');
      print('← Status : ${response.statusCode}');
      print('← Data   : ${response.data}');
      print('==============================================');

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        Toast(context).success('Request success');
        _handleOnSuccess(
          data: data,
          entity: entity,
          context: context,
          responseData: response.data,
        );
      } else {
        final message = _extractErrorMessage(
          response.data,
          fallback:
              'Request failed: ${response.statusCode} - ${response.statusMessage}',
        );
        Toast(context).fail(message);
        _handleOnFailure(context, message, raw: response.data);
      }
    } on DioException catch (e) {
      print('================ HTTP ERROR ==================');
      print('❌ Type     : ${e.type}');
      print('❌ Message  : ${e.message}');
      print('❌ Response : ${e.response?.data}');
      print('==============================================');

      final message = _extractErrorMessage(
        e.response?.data,
        fallback: e.message ?? 'Unknown error occurred',
      );
      Toast(context).fail('HTTP Error: $message');
      _handleOnFailure(context, message, raw: e.response?.data);
    } catch (e) {
      print('================ UNEXPECTED ERROR =============');
      print('❌ $e');
      print('==============================================');
      final message = 'Unexpected error: $e';
      Toast(context).fail(message);
      _handleOnFailure(context, message, raw: null);
    }
  }

  void _handleOnSuccess({
    required EntityCustom entity,
    required BuildContext context,
    required dynamic responseData,
    required Map<String, dynamic> data,
  }) {
    final regex = RegExp(r'^exports\.([0-9a-fA-F\-]{36})$');
    final match =
        regex.firstMatch('exports.a12b34cd-56ef-78ab-90cd-ef1234567890');
    if (match != null) {
      final id = match.group(1);
      final index = entity.exports.indexWhere((e) => e.uuid == id);
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
    // switch (onSuccess) {
    //   case 'refresh':
    //     Toast(context).notify('Refreshing data...');
    //     break;
    //   case 'navigate_home':
    //     Navigator.of(context).pushReplacementNamed('/home');
    //     break;
    //   case 'show_dialog':
    //     showDialog(
    //       context: context,
    //       builder: (_) => AlertDialog(
    //         title: const Text('Success'),
    //         content: Text('Response: $responseData'),
    //       ),
    //     );
    //     break;
    //   case 'toast':
    //     Toast(context).success('Action completed successfully');
    //     break;
    //   default:
    //     break;
    // }
  }

  void _handleOnFailure(
    BuildContext context,
    String message, {
    dynamic raw,
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

  String _extractErrorMessage(
    dynamic responseData, {
    String fallback = 'Request failed',
  }) {
    if (responseData == null) return fallback;
    if (responseData is String && responseData.trim().isNotEmpty) {
      return responseData;
    }
    if (responseData is Map) {
      final msg = responseData['message'] ??
          responseData['error'] ??
          responseData['detail'];
      if (msg is String && msg.trim().isNotEmpty) return msg;
      final errors = responseData['errors'];
      if (errors != null) return errors.toString();
    }
    return fallback;
  }

  Widget button(
    EntityCustom entity,
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    final act = DataAction.print;

    return LightButton(
      title: name,
      permission: null,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
          _handleOnFailure(context, 'No http data found');
          return;
        }

        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) {
            bool isProgress = false;
            return StatefulBuilder(
              builder: (ctx, setState) {
                return CardConfirmation.action(
                  isProgress: isProgress,
                  action: act,
                  data: Entity.assetType,
                  label: name,
                  onConfirm: () async {
                    setState(() => isProgress = true);
                    try {
                      await executeHttp(entity, ctx, data);
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
      },
      action: act,
    );
  }
}
