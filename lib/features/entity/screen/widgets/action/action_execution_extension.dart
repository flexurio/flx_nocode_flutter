import 'dart:convert';
import 'dart:typed_data';
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
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/util/string.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flx_nocode_flutter/src/app/util/general_xlsx.dart';
import 'package:flx_nocode_flutter/src/app/util/picker_file.dart';
import 'package:flx_nocode_flutter/features/print/domain/json_pdf_generator.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_controller.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:flx_nocode_flutter/features/entity/models/action_signature.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/electronic_signature_dialog.dart';

import 'action_confirm_dialog_extension.dart';
import 'action_handler_extension.dart';

// Resolve leaf templates without stringifying containers or changing scalar types.
Object? _resolveVariableValue(Object? template, JsonMap data) {
  if (template is String) return template.interpolateJavascript(data);
  if (template is Map) {
    return template.map((key, value) =>
        MapEntry(key.toString(), _resolveVariableValue(value, data)));
  }
  if (template is List) {
    return template.map((value) => _resolveVariableValue(value, data)).toList();
  }
  return template;
}

bool _hasVariableValue(Object? value) =>
    value is String ? value.isNotEmpty : value != null;

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

    // For `openPage`, defer e-signature to CreatePageController.submit() so the
    // user fills & validates the form first, then signs right before submit.
    // For `showConfirmationDialog`, prompt e-signature inside `onConfirm` so
    // confirmation happens before password verification.
    final deferSignatureToTarget =
        type == ActionType.openPage || type == ActionType.showConfirmationDialog;

    SignatureResult? signatureResult;
    if (signature != null && !deferSignatureToTarget) {
      signatureResult = await ElectronicSignatureDialog.prompt(
        context: context,
        signature: signature!,
        actionName: name,
      );
      if (signatureResult == null || !context.mounted) {
        // User aborted e-signature verification
        return;
      }
    }

    // Merge signature payload into context data if verified
    final effectiveData = signatureResult != null
        ? <String, dynamic>{
            ...data,
            'signature': signatureResult.toMap(),
            'signature_token': signatureResult.token,
            'signature_meaning': signatureResult.meaning,
          }
        : data;

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
            useRootNavigator: true,
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
          data: effectiveData,
          onSuccessCallback: onSuccessCallback,
        );
        break;

      case ActionType.http:
        await showConfirmDialog(
          context: context,
          action: action,
          label: name,
          confirmationMessageText: confirmMessage,
          onConfirm: (ctx) => executeHttpSingle(
            entity,
            ctx,
            effectiveData,
            onSuccessCallback: onSuccessCallback,
          ),
        );
        break;

      case ActionType.workflow:
        await executeWorkflowSingle(
          entity,
          context,
          effectiveData,
          onSuccessCallback: onSuccessCallback,
        );
        break;

      case ActionType.openPage:
        if (layoutFormId == null) {
          Toast(context).fail('No page found');
          return;
        }
        if (popup || this.popup) {
          await showDialog(
            context: context,
            useRootNavigator: true,
            barrierDismissible: false,
            builder: (ctx) {
              return CreatePage.prepare(
                popup: true,
                embedded: true,
                entity: entity,
                layoutFormId: layoutFormId!,
                showSubmitButton: showSubmitButton,
                parentData: parentData,
                data: effectiveData,
                filters: const {},
                width: effectiveWidth,
                actionSignature: signature,
                actionName: name,
                onSuccess: (responseData) async {
                  onSuccessCallback?.call();
                  await handleOnSuccessSingle(
                    entity: entity,
                    context: context,
                    responseData: responseData,
                    data: effectiveData,
                    onSuccessCallback: onSuccessCallback,
                  );
                },
              );
            },
          );
        } else {
          await Navigator.push(
            context,
            CreatePage.route(
              data: effectiveData,
              entity: entity,
              embedded: false,
              layoutFormId: layoutFormId!,
              width: effectiveWidth,
              showSubmitButton: showSubmitButton,
              actionSignature: signature,
              actionName: name,
              onSuccess: (responseData) async {
                onSuccessCallback?.call();
                await handleOnSuccessSingle(
                  entity: entity,
                  context: context,
                  responseData: responseData,
                  data: effectiveData,
                  onSuccessCallback: onSuccessCallback,
                );
              },
              filters: const <String, dynamic>{},
              parentData: parentData,
            ),
          );
        }
        break;

      case ActionType.showDialog:
        final effectiveViewType = (viewType ?? '').toLowerCase();
        final hasTargetEntity =
            targetEntityId != null && targetEntityId!.isNotEmpty;

        if (effectiveViewType == 'cards' || effectiveViewType == 'grid') {
          final target = targetEntityId ?? entity.id;
          final resolvedFilters = <Filter>[];

          final interpVars = <String, dynamic>{
            'row': data,
            'field': reference ?? '',
            ...data,
          };

          if (filters != null) {
            for (final f in filters!) {
              if (f is Map) {
                final ref = (f['reference'] ?? f['field'] ?? '').toString();
                var rawVal = (f['value'] ?? '').toString();
                if (rawVal.contains('{{')) {
                  rawVal = rawVal.interpolateJavascript(interpVars);
                }
                final backendKey = f['backend_key']?.toString();
                resolvedFilters.add(Filter(
                  reference: ref,
                  value: rawVal,
                  backendKey: backendKey,
                ));
              }
            }
          }

          if (params != null) {
            for (final entry in params!.entries) {
              var val = entry.value.toString();
              if (val.contains('{{')) {
                val = val.interpolateJavascript(interpVars);
              }
              final key = entry.key;
              final ref =
                  key.endsWith('.eq') ? key.substring(0, key.length - 3) : key;
              resolvedFilters.add(Filter(
                reference: ref,
                value: val,
                backendKey: key,
              ));
            }
          }

          await showDialog(
            context: context,
            useRootNavigator: true,
            barrierDismissible: true,
            builder: (ctx) {
              final size = MediaQuery.of(ctx).size;
              final dialogWidth =
                  width ?? (size.width * 0.85).clamp(520.0, 1150.0);
              final interpVars = <String, dynamic>{
                'row': data,
                'field': reference ?? '',
                ...data,
              };
              var dialogTitle = title ?? name;
              if (dialogTitle.contains('{{')) {
                dialogTitle = dialogTitle.interpolateJavascript(interpVars);
              }

              return Dialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: dialogWidth,
                    maxHeight: (size.height * 0.9).clamp(320.0, 850.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(ctx).colorScheme.surfaceContainerHighest,
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.table_chart_outlined, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                dialogTitle,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(Icons.close, size: 20),
                              onPressed: () => Navigator.of(ctx).pop(),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          color: Colors.white,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: EntityCardGridView.fromId(
                              entityId: target,
                              initialFilters: resolvedFilters,
                              parentData: [...parentData, data],
                              badges: badges,
                              onRefresh: () => onSuccessCallback?.call(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          break;
        }

        if (effectiveViewType == 'table' ||
            (effectiveViewType.isEmpty && hasTargetEntity)) {
          final target = targetEntityId ?? entity.id;
          final resolvedFilters = <Filter>[];

          final interpVars = <String, dynamic>{
            'row': data,
            'field': reference ?? '',
            ...data,
          };

          if (filters != null) {
            for (final f in filters!) {
              if (f is Map) {
                final ref = (f['reference'] ?? f['field'] ?? '').toString();
                var rawVal = (f['value'] ?? '').toString();
                if (rawVal.contains('{{')) {
                  rawVal = rawVal.interpolateJavascript(interpVars);
                }
                final backendKey = f['backend_key']?.toString();
                resolvedFilters.add(Filter(
                  reference: ref,
                  value: rawVal,
                  backendKey: backendKey,
                ));
              }
            }
          }

          if (params != null) {
            for (final entry in params!.entries) {
              var val = entry.value.toString();
              if (val.contains('{{')) {
                val = val.interpolateJavascript(interpVars);
              }
              final key = entry.key;
              final ref =
                  key.endsWith('.eq') ? key.substring(0, key.length - 3) : key;
              resolvedFilters.add(Filter(
                reference: ref,
                value: val,
                backendKey: key,
              ));
            }
          }

          await showDialog(
            context: context,
            useRootNavigator: true,
            barrierDismissible: true,
            builder: (ctx) {
              final size = MediaQuery.of(ctx).size;
              final dialogWidth =
                  width ?? (size.width * 0.85).clamp(600.0, 1200.0);
              final dialogHeight = (size.height * 0.8).clamp(400.0, 800.0);
              final interpVars = <String, dynamic>{
                'row': data,
                'field': reference ?? '',
                ...data,
              };
              var dialogTitle = title ?? name;
              if (dialogTitle.contains('{{')) {
                dialogTitle = dialogTitle.interpolateJavascript(interpVars);
              }

              return Dialog(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: dialogWidth,
                  height: dialogHeight,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(ctx).colorScheme.surfaceContainerHighest,
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.table_chart_outlined, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                dialogTitle,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(Icons.close, size: 20),
                              onPressed: () => Navigator.of(ctx).pop(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: MenuCustom.fromId(
                          entityId: target,
                          embedded: true,
                          bypassPermission: AccessPolicyEvaluator
                              .instance.config.bypassAllPermissions,
                          initialFilters: resolvedFilters,
                          badges: badges,
                          parentData: [...parentData, data],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
          break;
        }

        if (layoutFormId == null) {
          Toast(context).fail('No page found');
          return;
        }
        await showDialog(
          context: context,
          useRootNavigator: true,
          barrierDismissible: false,
          builder: (ctx) {
            return CreatePage.prepare(
              popup: true,
              embedded: true,
              entity: entity,
              layoutFormId: layoutFormId!,
              showSubmitButton: showSubmitButton,
              parentData: parentData,
              data: data,
              filters: const {},
              width: effectiveWidth,
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
            var confirmedData = effectiveData;
            if (signature != null) {
              final confirmedSig = await ElectronicSignatureDialog.prompt(
                context: ctx,
                signature: signature!,
                actionName: name,
              );
              if (confirmedSig == null || !ctx.mounted) return;
              confirmedData = <String, dynamic>{
                ...effectiveData,
                'signature': confirmedSig.toMap(),
                'signature_token': confirmedSig.token,
                'signature_meaning': confirmedSig.meaning,
              };
            }
            if (http != null) {
              await executeHttpSingle(
                entity,
                ctx,
                confirmedData,
                onSuccessCallback: onSuccessCallback,
              );
            } else {
              await handleOnSuccessSingle(
                entity: entity,
                context: context,
                responseData: null,
                data: confirmedData,
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

        final layoutId =
            (data['rootLayoutFormId'] ?? data['layoutFormId']) as String?;

        if (layoutId != null) {
          final tag = 'create_page_$layoutId';
          if (Get.isRegistered<CreatePageController>(tag: tag)) {
            final controller = Get.find<CreatePageController>(tag: tag);

            dynamic finalValue;
            if (_hasVariableValue(value)) {
              finalValue = _resolveVariableValue(value, data);
            } else {
              final formState = <String, dynamic>{};
              controller.controllers.forEach((key, ctrl) {
                formState[key] = ctrl.text;
              });

              finalValue = {...controller.initialData, ...formState};
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

        final layoutId =
            (data['rootLayoutFormId'] ?? data['layoutFormId']) as String?;

        if (layoutId != null) {
          final tag = 'create_page_$layoutId';
          if (Get.isRegistered<CreatePageController>(tag: tag)) {
            final controller = Get.find<CreatePageController>(tag: tag);

            dynamic itemValue;
            if (_hasVariableValue(value)) {
              itemValue = _resolveVariableValue(value, data);
            } else {
              final formState = <String, dynamic>{};
              controller.controllers.forEach((key, ctrl) {
                if (key != varName) {
                  formState[key] = ctrl.text;
                }
              });
              final cleanInitialData =
                  Map<String, dynamic>.from(controller.initialData);
              cleanInitialData.remove(varName);
              cleanInitialData
                  .removeWhere((key, val) => val is List || val is Map);
              itemValue = {...cleanInitialData, ...formState};
            }

            List<dynamic> list = [];
            final currentData = controller.initialData[varName];
            if (currentData is List) {
              list = List.from(currentData);
            } else if (currentData is String && currentData.isNotEmpty) {
              try {
                final decoded = jsonDecode(currentData);
                if (decoded is List) {
                  list = List.from(decoded);
                }
              } catch (_) {}
            }

            list.add(itemValue);
            controller.initialData[varName] = list;
            if (controller.controllers.containsKey(varName)) {
              controller.controllers[varName]?.text = jsonEncode(list);
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

      case ActionType.removeVariable:
        final varName = targetVariable;
        if (varName == null || varName.isEmpty) {
          Toast(context).fail('Target variable name is required');
          return;
        }

        final layoutId =
            (data['rootLayoutFormId'] ?? data['layoutFormId']) as String?;

        CreatePageController? controller;
        if (layoutId != null &&
            Get.isRegistered<CreatePageController>(
                tag: 'create_page_$layoutId')) {
          controller =
              Get.find<CreatePageController>(tag: 'create_page_$layoutId');
        } else if (Get.isRegistered<CreatePageController>()) {
          controller = Get.find<CreatePageController>();
        }

        if (controller != null) {
          List<dynamic> list = [];
          final currentData = controller.initialData[varName];
          if (currentData is List) {
            list = List.from(currentData);
          } else if (currentData is String && currentData.isNotEmpty) {
            try {
              final decoded = jsonDecode(currentData);
              if (decoded is List) {
                list = List.from(decoded);
              }
            } catch (_) {}
          }

          final rowIndexRaw = data['rowIndex'];
          if (rowIndexRaw is int &&
              rowIndexRaw >= 0 &&
              rowIndexRaw < list.length) {
            list.removeAt(rowIndexRaw);
          } else if (rowIndexRaw is String &&
              int.tryParse(rowIndexRaw) != null) {
            final idx = int.parse(rowIndexRaw);
            if (idx >= 0 && idx < list.length) {
              list.removeAt(idx);
            }
          } else {
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
          }

          controller.initialData[varName] = list;
          if (controller.controllers.containsKey(varName)) {
            controller.controllers[varName]?.text = jsonEncode(list);
          }
          controller.initialData.refresh();

          // Also notify table reload listener if registered for this table
          final tableId = data['tableId'] as String?;
          if (tableId != null &&
              controller.tableReloadListeners.containsKey(tableId)) {
            controller.tableReloadListeners[tableId]?.call();
          }

          await handleOnSuccessSingle(
            entity: entity,
            context: context,
            responseData: null,
            data: data,
            onSuccessCallback: onSuccessCallback,
          );
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
                final formattedList =
                    FieldValueLabelResolver.formatRowsForExport(
                  list,
                  fields,
                  entity.fields,
                );
                final pdf = pw.Document()
                  ..addPage(
                    await pdfGeneral(
                      data: formattedList,
                      title: name,
                      fields: fields,
                      printedBy:
                          UserRepositoryAppNocode.instance.user?.name ?? '-',
                    ),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: '$name.pdf',
                );
              } else {
                final bytes = generalXlsxNoCode(
                  context,
                  list,
                  fields,
                  entityFields: entity.fields,
                );
                saveFileNocode(bytes, '$name.xlsx');
              }
              Toast(context).success('Export success');
            } else {
              Toast(context).fail(response.message ?? 'Export failed');
            }
          },
        );
        break;

      case ActionType.displayPdf:
        await _handleDisplayPdf(context: context, data: data);
        break;
      case ActionType.download:
        await _handleDownload(context: context, data: data);
        break;

      default:
        Toast(context).fail('Unhandled ActionType: $type');
        break;
    }
  }

  Future<void> executeWorkflowSingle(
    EntityCustom entity,
    BuildContext context,
    JsonMap data, {
    VoidCallback? onSuccessCallback,
  }) async {
    if (workflow == null) {
      Toast(context).fail('No workflow definition found');
      handleOnFailure(context, 'No workflow definition found');
      return;
    }

    await showConfirmDialog(
      context: context,
      action: action,
      label: name,
      confirmationMessageText: confirmMessage,
      onConfirm: (ctx) async {
        try {
          final formMap = data['form'] is Map
              ? Map<String, dynamic>.from(data['form'] as Map)
              : <String, dynamic>{};
          final recordMap = data['data'] is Map
              ? Map<String, dynamic>.from(data['data'] as Map)
              : Map<String, dynamic>.from(data);

          final definition = WorkflowDefinition.fromJson(workflow!);
          final executor = GetxHttpExecutor();

          final signatureMap = data['signature'] is Map
              ? Map<String, dynamic>.from(data['signature'] as Map)
              : <String, dynamic>{};

          final workflowCtx = WorkflowContext(
            form: formMap,
            data: recordMap,
            signature: signatureMap,
            auth: AuthContext(
              permissions: UserRepositoryAppNocode.instance.permissions,
            ),
            httpExecutor: executor,
            validator: (scope, _) async {},
          );

          final result = await WorkflowExecutor(
            definition,
            ui: ProductionUiBridge(
              layoutFormId: data['layoutFormId']?.toString(),
            ),
          ).run(workflowCtx);

          if (result.isSuccess) {
            Toast(context).success('Workflow completed successfully');
            await handleOnSuccessSingle(
              entity: entity,
              context: context,
              responseData: result.data,
              data: data,
              onSuccessCallback: onSuccessCallback,
            );
          } else {
            final message = workflowCtx.vars['last_error']?.toString() ??
                result.error?.message ??
                'Workflow failed';
            Toast(context).fail(message);
            handleOnFailure(context, message);
          }
        } catch (e) {
          final message = e.toString();
          Toast(context).fail(message);
          handleOnFailure(context, message, raw: e);
        }
      },
    );
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
          'form': filterData, // allows {{form.xxx}} templates to resolve
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
            Toast(
              context,
            ).fail(response.message ?? 'Failed to fetch print data');
            return;
          }
        }

        // Generate PDF using dynamic data context
        final layoutJson = layout.toMap();
        final pdfBytes = await JsonPdfGenerator.generate(
          layoutJson,
          data: contextData,
          entityFields: entity.fields,
        );

        if (context.mounted) {
          await PdfPreviewDialog.show(
            context,
            pdfBytes,
            layout.name,
            canPrint: canPrint,
            canDownload: canDownload,
          );
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

  Future<void> _handleDownload({
    required BuildContext context,
    required JsonMap data,
  }) async {
    final request = http?.toRequestConfig(data);
    final rawUrl = request?.url ?? (value is String ? value as String : null);
    final initialUrl = rawUrl?.renderWithData(data).interpolateJavascript(data);

    if (initialUrl == null || initialUrl.isEmpty) {
      Toast(context).fail('No URL found for download');
      return;
    }

    try {
      final resolved = await resolveDocumentRequest(
        data: data,
        metadataFailureFallback: 'Failed to load download data',
        requestConfig: request,
      );
      final url = resolved.url;
      if (url == null || url.isEmpty) {
        Toast(context).fail(
          resolved.errorMessage ?? 'Failed to load download data',
        );
        return;
      }

      final response =
          await Api.attachActivityInterceptor(Dio()).request<List<int>>(
        url,
        options: Options(
          method: 'GET',
          headers: request?.headers ?? const <String, String>{},
          responseType: ResponseType.bytes,
        ),
      );

      final statusCode = response.statusCode ?? 0;
      final bytes = response.data;
      if (statusCode < 200 || statusCode >= 300 || bytes == null) {
        Toast(context).fail('Failed to download file');
        return;
      }

      // Try to get filename from content-disposition
      String filename = name.isNotEmpty ? name : 'downloaded_file';
      final contentDisposition = response.headers.value('content-disposition');
      if (contentDisposition != null) {
        final regExp = RegExp('filename="?([^"]+)"?');
        final match = regExp.firstMatch(contentDisposition);
        if (match != null && match.groupCount >= 1) {
          filename = match.group(1)!;
        }
      } else {
        // Fallback to URL path if filename not in header
        final uri = Uri.tryParse(url);
        if (uri != null && uri.pathSegments.isNotEmpty) {
          final lastSegment = uri.pathSegments.last;
          if (lastSegment.contains('.')) {
            filename = lastSegment;
          } else if (filename == name && name.isNotEmpty) {
            // Keep name but maybe add extension if we know it?
            // For now just keep name.
          }
        }
      }

      // Ensure we have an extension if possible
      if (!filename.contains('.')) {
        if (_looksLikePdfUrl(url)) {
          filename += '.pdf';
        }
      }

      saveFileNocode(bytes, filename);
      Toast(context).success('Download success: $filename');
    } on DioException catch (e) {
      Toast(context).fail(e.message ?? 'Failed to download file');
    } catch (e) {
      Toast(context).fail('Failed to download file');
    }
  }

  Future<void> _handleDisplayPdf({
    required BuildContext context,
    required JsonMap data,
  }) async {
    final request = http?.toRequestConfig(data);
    final rawUrl = request?.url ?? (value is String ? value as String : null);
    final initialUrl = rawUrl?.renderWithData(data).interpolateJavascript(data);

    if (initialUrl == null || initialUrl.isEmpty) {
      Toast(context).fail('No PDF URL found');
      return;
    }

    try {
      final resolved = await resolveDocumentRequest(
        data: data,
        metadataFailureFallback: 'Failed to load PDF data',
        requestConfig: request,
      );
      final url = resolved.url;
      if (url == null || url.isEmpty) {
        Toast(context).fail(
          resolved.errorMessage ?? 'Failed to load PDF data',
        );
        return;
      }

      final response =
          await Api.attachActivityInterceptor(Dio()).request<List<int>>(
        url,
        options: Options(
          method: 'GET',
          headers: request?.headers ?? const <String, String>{},
          responseType: ResponseType.bytes,
        ),
      );

      final statusCode = response.statusCode ?? 0;
      final bytes = response.data;
      if (statusCode < 200 || statusCode >= 300 || bytes == null) {
        Toast(context).fail('Failed to load PDF');
        return;
      }

      await PdfPreviewDialog.show(
        context,
        Uint8List.fromList(bytes),
        name.isNotEmpty ? name : 'Display File PDF',
        canPrint: canPrint,
        canDownload: canDownload,
      );
    } on DioException catch (e) {
      Toast(context).fail(e.message ?? 'Failed to load PDF');
    } catch (e) {
      Toast(context).fail('Failed to load PDF');
    }
  }

  /// Resolves the effective document URL for download and PDF preview actions.
  @visibleForTesting
  Future<({String? url, String? errorMessage})> resolveDocumentRequest({
    required JsonMap data,
    required String metadataFailureFallback,
    HttpRequestConfig? requestConfig,
    Future<HttpRequestResult> Function(HttpData http, JsonMap data)?
        executeHttp,
  }) async {
    final request = requestConfig ?? http?.toRequestConfig(data);
    final rawUrl = request?.url ?? (value is String ? value as String : null);
    var url = rawUrl?.renderWithData(data).interpolateJavascript(data);

    if (url == null || url.isEmpty) {
      return (url: null, errorMessage: null);
    }

    final hasDirectValue = value is String && (value as String).isNotEmpty;
    final shouldLoadMetadata =
        http != null && !hasDirectValue && !_looksLikePdfUrl(url);
    final backendHost = Configuration.instance.backendHost;

    if (shouldLoadMetadata) {
      final metadata = executeHttp != null
          ? await executeHttp(http!, data)
          : await http!.execute(data);
      if (!metadata.isSuccess) {
        return (
          url: null,
          errorMessage: metadata.message ?? metadataFailureFallback,
        );
      }

      final documentUrl = _extractDocumentUrl(metadata.data);
      if (documentUrl != null && documentUrl.isNotEmpty) {
        final metadataBaseUrl =
            resolveMetadataBaseUrl(request?.url, backendHost);
        url = normalizeDocumentUrl(documentUrl, metadataBaseUrl);
      }
    } else {
      url = normalizeDocumentUrl(url, backendHost);
    }

    return (url: url, errorMessage: null);
  }

  /// Chooses the base URL for normalizing URLs returned by a metadata endpoint.
  @visibleForTesting
  String resolveMetadataBaseUrl(String? requestUrl, String backendHost) {
    final candidate = requestUrl?.trim() ?? '';
    final candidateUri = Uri.tryParse(candidate);
    if (candidateUri != null &&
        candidateUri.hasAuthority &&
        !isInternalOrLoopbackHost(candidateUri.host)) {
      return candidate;
    }

    final trimmedBackend = backendHost.trim();
    final backendUri = Uri.tryParse(trimmedBackend);
    if (backendUri != null &&
        backendUri.hasAuthority &&
        backendUri.host.toLowerCase() != '0.0.0.0') {
      return trimmedBackend;
    }

    if (candidateUri != null && candidateUri.hasAuthority) {
      return candidate;
    }
    return trimmedBackend;
  }

  bool _looksLikePdfUrl(String url) {
    final uri = Uri.tryParse(url);
    final path = (uri?.path ?? url).toLowerCase();
    return path.endsWith(".pdf");
  }

  String? _extractDocumentUrl(Object? payload) {
    if (payload is Map) {
      final direct = payload['document'];
      if (direct is String && direct.isNotEmpty) return direct;

      final rows = payload['data'];
      if (rows is List && rows.isNotEmpty) {
        final first = rows.first;
        if (first is Map) {
          final document = first['document'];
          if (document is String && document.isNotEmpty) return document;
        }
      }
    }

    if (payload is List && payload.isNotEmpty) {
      final first = payload.first;
      if (first is Map) {
        final document = first['document'];
        if (document is String && document.isNotEmpty) return document;
      }
    }

    return null;
  }

  /// Normalizes relative, loopback, or internal `/static/` URLs against [baseUrl].
  @visibleForTesting
  String normalizeDocumentUrl(String documentUrl, String baseUrl) {
    final trimmedDoc = documentUrl.trim();
    final documentUri =
        Uri.tryParse(trimmedDoc) ?? Uri.tryParse(Uri.encodeFull(trimmedDoc));
    final baseUri = Uri.tryParse(baseUrl.trim());

    if (documentUri == null) return documentUrl;
    if (baseUri == null || !baseUri.hasAuthority) return documentUri.toString();

    final originUri = Uri(
      scheme: baseUri.scheme,
      host: baseUri.host,
      port: baseUri.hasPort ? baseUri.port : null,
    );

    if (!documentUri.hasScheme || !documentUri.hasAuthority) {
      final normalizedPath = documentUri.path.startsWith('/')
          ? documentUri.path
          : '/${documentUri.path}';
      return originUri
          .replace(
            path: normalizedPath,
            query: documentUri.hasQuery ? documentUri.query : null,
          )
          .toString();
    }

    final baseHost = baseUri.host.toLowerCase();
    if (baseHost == '0.0.0.0') {
      return documentUri.toString();
    }

    final host = documentUri.host.toLowerCase();
    final isLoopbackOrWildcard = host == 'localhost' ||
        host == '127.0.0.1' ||
        host == '0.0.0.0' ||
        host == '::1';
    final isInternalStaticMismatch = documentUri.path.startsWith('/static/') &&
        isInternalOrLoopbackHost(host) &&
        host != baseHost;

    if (isLoopbackOrWildcard || isInternalStaticMismatch) {
      return documentUri
          .replace(
            scheme: baseUri.scheme,
            host: baseUri.host,
            port: baseUri.hasPort ? baseUri.port : null,
          )
          .toString();
    }

    return documentUri.toString();
  }

  /// Returns true for loopback, wildcard, private IPv4, or internal Docker/dev hostnames.
  @visibleForTesting
  bool isInternalOrLoopbackHost(String rawHost) {
    final host = rawHost.trim().toLowerCase();
    if (host.isEmpty) return false;

    if (host == 'localhost' ||
        host == '127.0.0.1' ||
        host == '0.0.0.0' ||
        host == '::1' ||
        host == '[::1]') {
      return true;
    }

    // Single-label internal/Docker service hostnames (e.g. "backend", "api").
    if (!host.contains('.') && !host.contains(':')) {
      return true;
    }

    if (host.endsWith('.local') ||
        host.endsWith('.internal') ||
        host.endsWith('.localhost')) {
      return true;
    }

    final octets = host.split('.');
    if (octets.length == 4) {
      final parts = octets.map(int.tryParse).toList();
      if (parts.every((p) => p != null && p >= 0 && p <= 255)) {
        final a = parts[0]!;
        final b = parts[1]!;
        if (a == 10 || a == 127) return true;
        if (a == 192 && b == 168) return true;
        if (a == 172 && b >= 16 && b <= 31) return true;
        if (a == 169 && b == 254) return true;
      }
    }

    return false;
  }
}
