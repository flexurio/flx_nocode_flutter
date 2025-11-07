import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

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
  Future<void> executeHttp(BuildContext context) async {
    if (http == null) {
      Toast(context).fail('No http data found');
      return;
    }

    final dio = Dio();

    try {
      // Setup headers
      final options = Options(
        method: http!.method.toUpperCase(),
        headers: http!.headers,
      );

      // Request body (POST/PUT/PATCH)
      final body = http!.body.isNotEmpty ? http!.body : null;

      // Execute request
      final response = await dio.request(
        http!.url,
        data: body,
        options: options,
      );

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
      // Handle Dio-specific error
      final message =
          e.response?.data?['message'] ?? e.message ?? 'Unknown error occurred';
      Toast(context).fail('HTTP Error: $message');
    } catch (e) {
      // Handle generic error
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
            bool isProgress = false; // start false; akan dinamis di onConfirm
            return StatefulBuilder(
              builder: (ctx, setState) {
                return CardConfirmation.action(
                  // atur dinamis: pakai nilai runtime
                  isProgress: isProgress,
                  action: act,
                  data: Entity.assetType,
                  label: name,
                  onConfirm: () async {
                    // mulai loading
                    setState(() => isProgress = true);

                    try {
                      // jalankan HTTP via Dio (pakai extension yang sudah dibuat)
                      await executeHttp(ctx);
                      // jika perlu: tutup dialog setelah sukses
                      Navigator.of(ctx)
                          .pop(); // comment kalau ingin tetap di dialog
                    } catch (e) {
                      // error sudah di-toast di executeHttp; tetap di dialog
                    } finally {
                      // stop loading (kalau dialog belum tertutup)
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
