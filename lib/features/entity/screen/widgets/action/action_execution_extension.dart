import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/json_table_viewer.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/pages/create_page.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/pdf_preview_dialog.dart';
import 'package:flx_nocode_flutter/features/print/presentation/widgets/print_filter_dialog.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flx_nocode_flutter/src/app/util/general_xlsx.dart';
import 'package:flx_nocode_flutter/src/app/util/picker_file.dart';
import 'package:flx_nocode_flutter/features/print/domain/json_pdf_generator.dart';

import 'action_confirm_dialog_extension.dart';
import 'action_handler_extension.dart';

extension ActionExecutionExtension on ActionD {
  Future<void> executeSingle({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    required List<Map<String, dynamic>> parentData,
    VoidCallback? onSuccessCallback,
  }) async {
    if (validate) {
      final form = Form.of(context);
      if (!form.validate()) {
        return;
      }
    }

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
        await _handlePrint(
          entity: entity,
          context: context,
          data: data,
          onSuccessCallback: onSuccessCallback,
        );
        break;

      case ActionType.http:
        await showConfirmDialog(
          context: context,
          action: action,
          label: name,
          confirmationMessageText: confirmMessage,
          onConfirm: (ctx) => executeHttpSingle(entity, ctx, data,
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
              await executeHttpSingle(entity, ctx, data,
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
              finalValue = value!.interpolateJavascript(data);
            } else {
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

            if (finalValue is! Map && finalValue is! List) {
              if (controller.controllers.containsKey(varName)) {
                controller.controllers[varName]?.text = finalValue.toString();
              }
            }
            controller.initialData.refresh();

            await handleOnSuccessSingle(
              entity: entity,
              context: context,
              responseData: null,
              data: data,
              onSuccessCallback: onSuccessCallback,
            );
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

            await handleOnSuccessSingle(
              entity: entity,
              context: context,
              responseData: null,
              data: data,
              onSuccessCallback: onSuccessCallback,
            );
          }
        }
        break;

      case ActionType.removeVariable:
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

            final currentData = controller.initialData[varName];
            if (currentData is List) {
              final list = List.from(currentData);

              // We want to remove the item that matches the current 'data' (the row).
              // Since 'data' might have extra fields, we iterate and check if all
              // keys in the list item match the values in 'data'.
              list.removeWhere((item) {
                if (item is! Map) return false;
                for (final key in item.keys) {
                  if (item[key].toString() != data[key]?.toString()) {
                    return false;
                  }
                }
                return true;
              });

              controller.initialData[varName] = list;
              controller.initialData.refresh();

              await handleOnSuccessSingle(
                entity: entity,
                context: context,
                responseData: null,
                data: data,
                onSuccessCallback: onSuccessCallback,
              );
            }
          }
        }
        break;

      case ActionType.export:
        await showConfirmDialog(
          context: context,
          action: action,
          label: name,
          confirmationMessageText: confirmMessage,
          onConfirm: (ctx) async {
            if (http == null) {
              Toast(context).fail('No http data found');
              return;
            }
            final response = await http!.execute(data);
            if (response.statusCode != null &&
                response.statusCode! >= 200 &&
                response.statusCode! < 300) {
              final List<dynamic> rawList = (response.data is Map &&
                      (response.data as Map)['data'] is List)
                  ? (response.data as Map)['data']
                  : (response.data is List ? response.data : []);
              final list = rawList.cast<Map<String, dynamic>>().toList();

              if (list.isEmpty) {
                Toast(context).notify('No data to export');
                return;
              }

              final fields = exportColumns?.map((e) => e.body).toList() ??
                  list.first.keys.toList();

              if (exportFormat == 'pdf') {
                final pdf = pw.Document()
                  ..addPage(
                    await pdfGeneral(
                      data: list,
                      title: name,
                      fields: fields,
                      printedBy: UserRepositoryApp.instance.user?.name ?? '-',
                    ),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: '$name.pdf',
                );
              } else {
                final bytes = generalXlsxNoCode(context, list, fields);
                saveFile(bytes, '$name.xlsx');
              }
              Toast(context).success('Export success');
            } else {
              Toast(context).fail(response.message ?? 'Export failed');
            }
          },
        );
        break;

      default:
        Toast(context).fail('Unhandled ActionType: $type');
        break;
    }
  }

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

  Future<void> executeHttpMultiple(
    EntityCustom entity,
    BuildContext context,
    List<Map<String, dynamic>> data, {
    VoidCallback? onSuccessCallback,
  }) async {
    if (data.isEmpty) return;

    if (http == null) {
      Toast(context).fail('No http data found');
      handleOnFailure(context, 'No http data found');
      return;
    }

    try {
      final response = await http!.executeMultiple(data);
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

  Future<void> _handlePrint({
    required EntityCustom entity,
    required BuildContext context,
    required JsonMap data,
    VoidCallback? onSuccessCallback,
  }) async {
    if (layoutPrintId == null) {
      Toast(context).fail('No print layout specified in action');
      return;
    }

    final layout = entity.layoutPrint.findById(layoutPrintId!);
    if (layout == null) {
      Toast(context).fail('Print layout "$layoutPrintId" not found');
      return;
    }

    // ── Show filter dialog if filterFields are defined or layoutForm is specified ───
    Map<String, dynamic> filterData = {};
    List<Component> finalFilterFields = List.from(filterFields);

    if (layoutFormId != null && layoutFormId!.isNotEmpty) {
      dynamic formLayout;
      for (final f in entity.layoutForm) {
        if (f.id == layoutFormId) {
          formLayout = f;
          break;
        }
      }
      
      if (formLayout != null) {
        finalFilterFields = formLayout.components;
      } else {
        Toast(context).fail('Filter form layout "$layoutFormId" not found');
        return;
      }
    }

    if (finalFilterFields.isNotEmpty) {
      final result = await PrintFilterDialog.show(
        context,
        printName: layout.name,
        fields: finalFilterFields,
        initialData: data,
      );
      // User cancelled — abort print
      if (result == null) return;
      filterData = Map<String, dynamic>.from(result);
    }
    // ───────────────────────────────────────────────────────────────────

    final execute = (BuildContext ctx) async {
      try {
        // Merge: base data + filter values nested under 'filter' key
        // so templates like {{filter.department_id}} work
        JsonMap contextData = {
          ...Map<String, dynamic>.from(data),
          'filter': filterData,
          ...filterData, // also flat merge for backward compat
        };

        if (http != null) {
          final response = await http!.execute(contextData);
          if (response.statusCode != null &&
              response.statusCode! >= 200 &&
              response.statusCode! < 300) {
            final resData = response.data;
            if (resData is Map) {
              contextData.addAll(Map<String, dynamic>.from(resData));
            } else {
              contextData['data'] = resData;
            }
          } else {
            Toast(context)
                .fail(response.message ?? 'Failed to fetch print data');
            return;
          }
        }

        // Generate PDF using dynamic data context
        final layoutJson = layout.toMap();
        final pdfBytes =
            await JsonPdfGenerator.generate(layoutJson, data: contextData);

        if (context.mounted) {
          await PdfPreviewDialog.show(context, pdfBytes, layout.name);
        }

        onSuccessCallback?.call();
      } catch (e) {
        Toast(context).fail('Print error: $e');
        debugPrint('Print error: $e');
      }
    };

    if (confirmMessage != null && confirmMessage!.isNotEmpty) {
      await showConfirmDialog(
        context: context,
        action: action,
        label: name,
        confirmationMessageText: confirmMessage,
        onConfirm: execute,
      );
    } else {
      await execute(context);
    }
  }
}
