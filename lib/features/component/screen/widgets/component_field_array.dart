import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' hide TColumn;
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_array_controller.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentFieldArrayWidgets on ComponentFieldArray {
  Widget toWidget(JsonMap data) {
    return _ComponentFieldArrayWidget(
      key: ValueKey(id),
      component: this,
      data: data,
    );
  }

  Widget toMockWidget() {
    final isRequired = (constraints.minRows ?? 0) > 0;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
              child: Row(
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (isRequired)
                    const Text(
                      ' *',
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                ],
              ),
            ),
          if (presentation == FieldArrayPresentation.card)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      '#1',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    for (final c in columns) ...[
                      if (c.component != null)
                        c.component!.toMockWidget()
                      else
                        Text(
                          c.header,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      const SizedBox(height: 8),
                    ],
                  ],
                ),
              ),
            )
          else ...[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                border: Border(
                  top: label.isNotEmpty
                      ? BorderSide(color: Colors.grey.shade200)
                      : BorderSide.none,
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  for (final c in columns)
                    Expanded(
                      flex: (c.width ?? 160).toInt(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          c.header,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  if (rowActions.allowDelete && !readOnly)
                    const SizedBox(width: 48),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                children: [
                  for (final c in columns)
                    Expanded(
                      flex: (c.width ?? 160).toInt(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: c.component != null
                            ? _buildCompactMockCell(c)
                            : Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                      ),
                    ),
                  if (rowActions.allowDelete && !readOnly)
                    const SizedBox(
                      width: 48,
                      child: Icon(Icons.delete_outline,
                          size: 18, color: Colors.grey),
                    ),
                ],
              ),
            ),
          ],
          if (rowActions.allowAdd && !readOnly)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: null,
                  icon: const Icon(Icons.add, size: 16),
                  label: Text(rowActions.addLabel),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCompactMockCell(FieldArrayColumn col) {
    final comp = col.component;
    IconData? trailingIcon;
    String placeholder = col.header.isNotEmpty ? col.header : 'Enter value...';

    if (comp is ComponentDropdown) {
      trailingIcon = Icons.arrow_drop_down;
      placeholder = 'Select ${col.header}...';
    } else if (comp is ComponentDatePicker) {
      trailingIcon = Icons.calendar_today;
      placeholder = (comp.dateFormat ?? 'yyyy-MM-dd').toUpperCase();
    } else if (comp is ComponentNumberField) {
      placeholder = '0';
    } else if (comp is ComponentTextField) {
      placeholder = 'Enter ${col.header}...';
    }

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              placeholder,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          if (trailingIcon != null)
            Icon(trailingIcon, size: 16, color: Colors.grey.shade500),
        ],
      ),
    );
  }
}

class _ComponentFieldArrayWidget extends StatefulWidget {
  const _ComponentFieldArrayWidget({
    super.key,
    required this.component,
    required this.data,
  });

  final ComponentFieldArray component;
  final JsonMap data;

  @override
  State<_ComponentFieldArrayWidget> createState() =>
      _ComponentFieldArrayWidgetState();
}

class _ComponentFieldArrayWidgetState
    extends State<_ComponentFieldArrayWidget> {
  late final String tag;
  late final ComponentFieldArrayController controller;
  final GlobalKey<FormFieldState<List<JsonMap>>> _fieldKey =
      GlobalKey<FormFieldState<List<JsonMap>>>();

  @override
  void initState() {
    super.initState();
    tag = 'field_array_${widget.component.id}_${identityHashCode(this)}';
    controller = Get.put(
      ComponentFieldArrayController(
        component: widget.component,
        contextData: widget.data,
      ),
      tag: tag,
    );
  }

  @override
  void didUpdateWidget(covariant _ComponentFieldArrayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      controller.updateContextData(widget.data);
    }
  }

  @override
  void dispose() {
    Get.delete<ComponentFieldArrayController>(tag: tag);
    super.dispose();
  }

  bool _isColumnRequired(FieldArrayColumn col) {
    final comp = col.component;
    if (comp is ComponentInputBase) return comp.required;
    return false;
  }

  void _syncFieldState() {
    final state = _fieldKey.currentState;
    if (state != null) {
      state.didChange(controller.rows.toList(growable: false));
      if (state.hasError) {
        state.validate();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorColor = theme.colorScheme.error;

    return FormField<List<JsonMap>>(
      key: _fieldKey,
      initialValue: controller.rows.toList(growable: false),
      validator: (_) => controller.validateCollection(),
      builder: (fieldState) {
        return Obx(() {
          final rows = controller.rows.toList(growable: false);
          final keys = controller.rowKeys.toList(growable: false);
          final isReadOnly = controller.isReadOnly;
          final canAdd = controller.canAddRow;
          final canDelete = controller.canDeleteRow;
          final isRequired = (widget.component.constraints.minRows ?? 0) > 0;
          final maxRows = widget.component.constraints.maxRows;

          final isTableMode =
              widget.component.presentation == FieldArrayPresentation.table;
          final borderColor =
              fieldState.hasError ? errorColor : Colors.grey.shade300;

          final contentWidget = isTableMode
              ? _buildTablePresentation(
                  context: context,
                  rows: rows,
                  keys: keys,
                  isReadOnly: isReadOnly,
                  canDelete: canDelete,
                )
              : _buildCardPresentation(
                  context: context,
                  rows: rows,
                  keys: keys,
                  isReadOnly: isReadOnly,
                  canDelete: canDelete,
                );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.component.label.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        widget.component.label,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (isRequired && !isReadOnly)
                        Text(
                          ' *',
                          style: TextStyle(
                            color: errorColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          maxRows != null
                              ? '${rows.length} / $maxRows'
                              : '${rows.length}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (isTableMode)
                Container(
                  decoration: fieldState.hasError
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: errorColor),
                        )
                      : null,
                  child: contentWidget,
                )
              else
                Container(
                  width: widget.component.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: borderColor),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: contentWidget,
                ),
              if (fieldState.hasError && fieldState.errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    fieldState.errorText!,
                    style: TextStyle(
                      color: errorColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              if (!isReadOnly && widget.component.rowActions.allowAdd)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: OutlinedButton.icon(
                    key: Key('field_array_${widget.component.id}_add'),
                    onPressed: canAdd
                        ? () {
                            controller.addRow();
                            _syncFieldState();
                          }
                        : null,
                    icon: const Icon(Icons.add, size: 16),
                    label: Text(widget.component.rowActions.addLabel),
                  ),
                ),
            ],
          );
        });
      },
    );
  }

  Widget _buildTablePresentation({
    required BuildContext context,
    required List<JsonMap> rows,
    required List<String> keys,
    required bool isReadOnly,
    required bool canDelete,
  }) {
    final tableColumns = widget.component.columns.map((col) {
      final showRequiredMark = _isColumnRequired(col) && !isReadOnly;
      return TableColumn<JsonMap>(
        title: showRequiredMark ? '${col.header} *' : col.header,
        width: col.width ?? 200,
        builder: (row, index) {
          final rowKey = index < keys.length
              ? keys[index]
              : '${widget.component.id}_$index';
          return SizedBox(
            width: col.width ?? 200,
            child: _buildCell(
              context: context,
              column: col,
              row: row,
              index: index,
              rowKey: rowKey,
              isSmall: true,
              isReadOnly: isReadOnly,
            ),
          );
        },
      );
    }).toList();

    if (canDelete) {
      tableColumns.add(
        TableColumn<JsonMap>(
          title: '',
          width: 64,
          alignment: Alignment.center,
          builder: (row, index) {
            return IconButton(
              key: Key('field_array_${widget.component.id}_delete_$index'),
              tooltip: 'Delete row',
              icon: Icon(
                Icons.delete_outline,
                size: 18,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: () {
                controller.removeRow(index);
                _syncFieldState();
              },
            );
          },
        ),
      );
    }

    if (tableColumns.isEmpty) {
      tableColumns.add(
        TableColumn<JsonMap>(
          title: 'No Columns',
          width: 200,
          builder: (_, __) => const Text('-'),
        ),
      );
    }

    final effectiveRowHeight =
        widget.component.rowHeight ?? (isReadOnly ? 48.0 : 78.0);

    return YuhuTable<JsonMap>(
      width: widget.component.width,
      data: rows,
      columns: tableColumns,
      rowHeight: effectiveRowHeight,
      disableModify: true,
    );
  }

  Widget _buildCardPresentation({
    required BuildContext context,
    required List<JsonMap> rows,
    required List<String> keys,
    required bool isReadOnly,
    required bool canDelete,
  }) {
    if (rows.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Center(
          child: Text(
            widget.component.rowActions.emptyMessage,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < rows.length; i++)
            KeyedSubtree(
              key: ValueKey(
                  i < keys.length ? keys[i] : '${widget.component.id}_$i'),
              child: Container(
                margin: EdgeInsets.only(bottom: i < rows.length - 1 ? 12 : 0),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#${i + 1}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (canDelete)
                          IconButton(
                            key: Key(
                              'field_array_${widget.component.id}_delete_$i',
                            ),
                            tooltip: 'Delete row',
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(4),
                            icon: Icon(
                              Icons.delete_outline,
                              size: 18,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            onPressed: () {
                              controller.removeRow(i);
                              _syncFieldState();
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    for (var cIdx = 0;
                        cIdx < widget.component.columns.length;
                        cIdx++) ...[
                      _buildCell(
                        context: context,
                        column: widget.component.columns[cIdx],
                        row: rows[i],
                        index: i,
                        rowKey: i < keys.length
                            ? keys[i]
                            : '${widget.component.id}_$i',
                        isSmall: false,
                        isReadOnly: isReadOnly,
                      ),
                      if (cIdx < widget.component.columns.length - 1)
                        const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCell({
    required BuildContext context,
    required FieldArrayColumn column,
    required JsonMap row,
    required int index,
    required String rowKey,
    required bool isSmall,
    required bool isReadOnly,
  }) {
    if (column.component != null) {
      return KeyedSubtree(
        key: ValueKey('${rowKey}_${column.body}'),
        child: column.component!.toWidget(
          isSmall: isSmall,
          data: {
            ...widget.data,
            ...row,
            'current': row,
            'row': row,
            'data': row,
            'tableId': widget.component.id,
            'rowIndex': index,
            'rowKey': rowKey,
            'columnBody': column.body,
            'readOnly': isReadOnly,
            'onRowChanged': (newData) {
              if (newData is Map) {
                controller.onRowChanged(
                  index,
                  Map<String, dynamic>.from(newData),
                );
                _syncFieldState();
              }
            },
          },
        ),
      );
    }

    final rawValue = controller.resolveValue(row, column.body);
    final text = (rawValue == null && column.body.contains('{{'))
        ? column.body
        : (rawValue?.toString() ?? '');
    final interpolatedText = text.interpolateJavascript({
      ...widget.data,
      ...row,
      'current': row,
      'row': row,
      'data': row,
      'columnBody': column.body,
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        interpolatedText.isEmpty ? '-' : interpolatedText,
        style: const TextStyle(fontSize: 13),
      ),
    );
  }
}
