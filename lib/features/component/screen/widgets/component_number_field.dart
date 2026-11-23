import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_number_field.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';

final _numberCellControllers = <String, TextEditingController>{};

extension ComponentNumberFieldWidgets on ComponentNumberField {
  Widget toWidget(Map<String, dynamic> data, {bool isSmall = false}) {
    final isRowCell = isSmall || data['onRowChanged'] is Function;
    final effectiveEnabled = enabled && data['readOnly'] != true;

    TextEditingController? controller;
    if (isRowCell) {
      final tableId = data['tableId']?.toString() ?? 'table';
      final rowIdentifier = data['rowKey']?.toString() ??
          data['rowIndex']?.toString() ??
          'row';
      final targetField = data['columnBody']?.toString() ?? id;
      final cacheKey = '${tableId}_${rowIdentifier}_$targetField';

      final row = data['row'] is Map ? data['row'] as Map : null;
      var currentText = row != null ? (row[targetField]?.toString() ?? '') : '';
      if (currentText.isEmpty && initialValue.isNotEmpty) {
        currentText = initialValue;
      }

      controller = _numberCellControllers[cacheKey];
      if (controller == null) {
        controller = TextEditingController(text: currentText);
        _numberCellControllers[cacheKey] = controller;
      } else if (controller.text != currentText) {
        controller.value = controller.value.copyWith(
          text: currentText,
          selection: TextSelection.collapsed(offset: currentText.length),
        );
      }
    } else {
      controller = data['controller'] as TextEditingController? ??
          (data['allControllers'] != null
              ? (data['allControllers']
                  as Map<String, TextEditingController>)[id]
              : null);
    }

    if (isCurrency && controller != null && controller.text.isNotEmpty) {
      final formatter = CurrencyTextInputFormatter.currency(
        symbol: '',
        decimalDigits: 0,
        locale: 'en',
      );
      final formatted = formatter.formatString(controller.text);
      if (formatted != controller.text) {
        controller.value = controller.value.copyWith(
          text: formatted,
          selection: TextSelection.collapsed(offset: formatted.length),
        );
      }
    }

    final formatters = isCurrency
        ? [
            CurrencyTextInputFormatter.currency(
              symbol: '',
              decimalDigits: 0,
              locale: 'en',
            ),
          ]
        : [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
          ];

    if (isSmall) {
      return FormField<String>(
        initialValue: controller!.text,
        validator: (_) {
          final actualValue = controller!.text;
          if (this.required && actualValue.trim().isEmpty) {
            return '${label.isNotEmpty ? label : id} is required';
          }
          return null;
        },
        builder: (fieldState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IgnorePointer(
                ignoring: !effectiveEnabled,
                child: Opacity(
                  opacity: effectiveEnabled ? 1.0 : 0.65,
                  child: FTextFieldSmall(
                    controller: controller!,
                    hintText: label,
                    textAlign: isCurrency ? TextAlign.end : TextAlign.start,
                    keyboardType: TextInputType.number,
                    inputFormatters: formatters,
                    onChanged: (val) {
                      fieldState.didChange(val);
                      if (fieldState.hasError) {
                        fieldState.validate();
                      }
                      final onRowChanged = data['onRowChanged'];
                      if (onRowChanged is Function) {
                        final targetField = data['columnBody']?.toString() ?? id;
                        final row = Map<String, dynamic>.from(
                            data['row'] as Map? ?? {});
                        if (row[targetField] != val) {
                          row[targetField] = val;
                          onRowChanged(row);
                        }
                      }
                    },
                  ),
                ),
              ),
              if (fieldState.hasError && fieldState.errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 2),
                  child: Text(
                    fieldState.errorText!,
                    style: TextStyle(
                      color: Theme.of(fieldState.context).colorScheme.error,
                      fontSize: 11,
                    ),
                  ),
                ),
            ],
          );
        },
      );
    }

    return FTextFormField(
      controller: controller,
      labelText: label,
      enabled: effectiveEnabled,
      hintText: initialValue.isEmpty ? null : initialValue,
      isNumeric: true,
      inputFormatters: formatters,
      validator: (value) {
        final actualValue = controller?.text ?? value;
        if (this.required && (actualValue == null || actualValue.trim().isEmpty)) {
          return '${label.isNotEmpty ? label : id} is required';
        }
        return null;
      },
      onChanged: data['onRowChanged'] is Function
          ? (val) {
              final onRowChanged = data['onRowChanged'] as Function;
              final targetField = data['columnBody']?.toString() ?? id;
              final row = Map<String, dynamic>.from(data['row'] as Map? ?? {});
              if (row[targetField] != val) {
                row[targetField] = val;
                onRowChanged(row);
              }
            }
          : null,
    );
  }

  Widget toMockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          height: 44,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: enabled ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: enabled ? Colors.grey.shade300 : Colors.grey.shade200,
            ),
          ),
          child: Text(
            initialValue.isNotEmpty ? initialValue : '0',
            style: TextStyle(
              color: initialValue.isNotEmpty
                  ? (enabled ? Colors.black87 : Colors.grey.shade500)
                  : Colors.grey.shade400,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
