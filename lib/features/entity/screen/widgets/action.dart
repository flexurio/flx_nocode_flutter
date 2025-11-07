import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';

extension ActionListExtenstion on List<ActionD> {
  List<Widget> toButtonList(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    return map((e) => e.button(context, data, parentData)).toList();
  }
}

extension ActionExtenstion on ActionD {
  Future<void> executeHttp(
      BuildContext context, Map<String, dynamic> data) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      return;
    }

    final dio = Dio();

    try {
      final url = http!.url.replaceStringWithValues(data, urlEncode: true);
      final headers = http!.headersReplaceStringWithValues(data);

      // Setup headers
      final options = Options(
        method: http!.method.toUpperCase(),
        headers: headers,
      );

      // Request body (POST/PUT/PATCH)
      final body = http!.body.isNotEmpty ? http!.body : null;

      // 🔍 DEBUG PRINT
      print('================ HTTP REQUEST ================');
      print('→ Method : ${http!.method.toUpperCase()}');
      print('→ URL    : ${url}');
      print('→ Headers: ${headers}');
      print('→ Body   : ${body ?? '{}'}');
      print('==============================================');

      // Execute request
      final response = await dio.request(
        url,
        data: body,
        options: options,
      );

      // 🔍 RESPONSE DEBUG
      print('================ HTTP RESPONSE ================');
      print('← Status : ${response.statusCode}');
      print('← Data   : ${response.data}');
      print('==============================================');

      // Handle success
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        Toast(context).success('Request success');
        _handleOnSuccess(context, response.data);
      } else {
        Toast(context).fail(
          'Request failed: ${response.statusCode} - ${response.statusMessage}',
        );
      }
    } on DioException catch (e) {
      // 🔍 ERROR DEBUG
      print('================ HTTP ERROR ==================');
      print('❌ Type     : ${e.type}');
      print('❌ Message  : ${e.message}');
      print('❌ Response : ${e.response?.data}');
      print('==============================================');

      final message =
          e.response?.data?['message'] ?? e.message ?? 'Unknown error occurred';
      Toast(context).fail('HTTP Error: $message');
    } catch (e) {
      print('================ UNEXPECTED ERROR =============');
      print('❌ $e');
      print('==============================================');
      Toast(context).fail('Unexpected error: $e');
    }
  }

  void _handleOnSuccess(BuildContext context, dynamic responseData) {
    switch (onSuccess) {
      case 'refresh':
        Toast(context).notify('Refreshing data...');
        // Contoh: context.read<MyBloc>().add(MyRefreshEvent());
        break;
      case 'navigate_home':
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      case 'show_dialog':
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Success'),
            content: Text('Response: $responseData'),
          ),
        );
        break;
      default:
        // Do nothing or show a message
        Toast(context).notify('Action completed successfully');
    }
  }

  Widget button(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    final act = DataAction.print;
    // final id = data['id'].toString();

    return LightButton(
      title: name,
      permission: null,
      onPressed: () async {
        if (http == null) {
          Toast(context).fail('No http data found');
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
                    // mulai loading
                    setState(() => isProgress = true);

                    try {
                      await executeHttp(ctx, data);
                      Navigator.of(ctx).pop();
                    } catch (e) {
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
