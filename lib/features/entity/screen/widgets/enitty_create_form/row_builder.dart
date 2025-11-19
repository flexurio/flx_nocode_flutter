import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_form_widgets.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:gap/gap.dart';

class RowBuilder extends StatelessWidget {
  const RowBuilder({
    super.key,
    required this.row,
    required this.entity,
    required this.dataAction,
    required this.controllers,
    required this.formState,
    required this.parentData,
  });

  final RowLayout row;
  final EntityCustom entity;
  final DataAction dataAction;
  final Map<String, TextEditingController> controllers;
  final FormStateController formState;
  final List<Map<String, dynamic>> parentData;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: formState,
      builder: (context, _) {
        final state = formState.state;

        // Row-level visibility
        if (!row.isVisible(state)) {
          return const SizedBox.shrink();
        }

        final columns = (row.columns <= 0) ? 1 : row.columns;
        final fieldWidgets = <Widget>[];

        for (final key in row.fields) {
          final field = entity.getField(key);
          final controller = controllers[key];

          if (field != null && controller != null) {
            fieldWidgets
                .add(field.buildForm(dataAction, controller, parentData));
          } else if (field == null) {
            fieldWidgets.add(Text('Error: field "$key" not found'));
          } else {
            fieldWidgets.add(Text('Error: controller for "$key" not found'));
          }
        }

        final rows = <List<Widget>>[];
        for (var i = 0; i < fieldWidgets.length; i += columns) {
          final end = (i + columns < fieldWidgets.length)
              ? i + columns
              : fieldWidgets.length;
          final chunk = fieldWidgets.sublist(i, end);

          while (chunk.length < columns) {
            chunk.add(const SizedBox.shrink());
          }

          final wrappedCols = chunk
              .map((w) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [w],
                  ))
              .toList();

          rows.add(wrappedCols);
        }

        return Column(
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              RowFields(children: rows[i]),
              if (i < rows.length - 1) const Gap(12),
            ],
          ],
        );
      },
    );
  }
}
