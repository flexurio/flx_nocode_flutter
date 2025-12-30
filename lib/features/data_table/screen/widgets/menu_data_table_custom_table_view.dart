import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/action_row_multiple.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_display.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

class MenuDataTableCustomTableView extends StatelessWidget {
  const MenuDataTableCustomTableView({
    super.key,
    required this.entity,
    required this.status,
    required this.pageOptions,
    required this.embedded,
    required this.parentData,
    required this.bypassPermission,
    required this.filtersMap,
    required this.actionLeft,
    required this.actionRightBuilder,
    required this.onChanged,
    required this.onRefresh,
  });

  final EntityCustom entity;
  final Status status;
  final PageOptions<Map<String, dynamic>> pageOptions;
  final bool embedded;
  final List<Map<String, dynamic>> parentData;
  final bool bypassPermission;
  final Map<String, dynamic> filtersMap;

  /// tombol/komponen sisi kiri di atas tabel (mis. chips filter info)
  final List<Widget> actionLeft;

  /// builder untuk action kanan (menerima refreshButton dari DataTableBackend)
  final List<Widget> Function(Widget refreshButton) actionRightBuilder;

  /// callback ketika pagination/sort/filter berubah
  final void Function(PageOptions<Map<String, dynamic>>?) onChanged;

  /// callback untuk refresh manual (pull-to-refresh / tombol refresh)
  final FutureOr<void> Function([PageOptions<Map<String, dynamic>>?]) onRefresh;

  @override
  Widget build(BuildContext context) {
    final fields = entity.layoutTable.keys.toList();
    final fieldsValue = entity.layoutTable.values.toList();

    if (fields.isEmpty) {
      return NoCodeError('layout_table is empty');
    }
    final multipleRowActions = entity.actions.multipleRow;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTableBackend<Map<String, dynamic>>(
        key: ValueKey(pageOptions.hashCode),
        status: status,
        pageOptions: pageOptions,
        onChanged: onChanged,
        onRefresh: onRefresh,
        freezeFirstColumn: true,
        freezeLastColumn: true,
        actionLeft: actionLeft,
        actionRight: actionRightBuilder,
        actionMultiple: multipleRowActions.isEmpty
            ? null
            : (selectedRows) {
                if (selectedRows.isEmpty) return null;
                return ActionRowMultiple(
                  actions: entity.actions.multipleRow,
                  rows: selectedRows,
                  entity: entity,
                  parentData: parentData,
                );
              },
        columns: [
          ..._buildColumns(context, fields, fieldsValue),
          ..._buildRowActions(context),
        ],
      ),
    );
  }

  List<DTColumn<Map<String, dynamic>>> _buildColumns(
    BuildContext context,
    List<String> fields,
    List<dynamic> fieldsValue,
  ) {
    return List.generate(fields.length, (index) {
      final field = entity.getField(fields[index]);
      if (field == null) {
        return DTColumn(
          widthFlex: 1,
          head: DTHead(label: '<Unknown>', backendKeySort: ''),
          body: (data) => const DataCell(Text('<Unknown>')),
        );
      }

      final width = fieldsValue[index] as int?;
      return DTColumn(
        widthFlex: (width ?? 1).toDouble(),
        head: DTHead(
          backendKeySort: field.reference,
          label: field.label,
          numeric: (field.isNumber) && index != 0,
        ),
        body: (row) => DataCell(
          EntityFieldDisplay.build(
            entity,
            field.reference,
            row[field.reference],
            onTap: index != 0
                ? null
                : () async {
                    await Navigator.push(
                      context,
                      EntityViewPage.route(
                        parentData: parentData,
                        embedded: embedded,
                        entity: entity,
                        data: row,
                        filters: filtersMap,
                      ),
                    );
                    onRefresh();
                  },
          ),
        ),
      );
    });
  }

  /// builder untuk action kanan (menerima refreshButton dari DataTableBackend)
  List<DTColumn<Map<String, dynamic>>> _buildRowActions(BuildContext context) {
    return [
      DTColumn(
        widthFlex: 4,
        head: DTHead(label: 'actions'.tr(), backendKeySort: null),
        body: (data) => DataCell(
          Row(
            children: [
              ActionsButton(
                children: EntityViewPage.actionsLarge(
                  parentData: parentData,
                  context: context,
                  data: data,
                  filters: filtersMap,
                  entity: entity,
                  onRefresh: (ctx) => onRefresh(),
                  bypassPermission: bypassPermission,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
