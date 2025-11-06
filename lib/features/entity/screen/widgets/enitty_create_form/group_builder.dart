import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/row_builder.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:gap/gap.dart';

class GroupBuilder extends StatelessWidget {
  const GroupBuilder({
    super.key,
    required this.group,
    required this.entity,
    required this.dataAction,
    required this.controllers,
    required this.formState,
    required this.parentData,
  });

  final GroupLayout group;
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

        if (!group.isVisible(state)) {
          return const SizedBox.shrink();
        }

        final visibleRows =
            group.rows.where((r) => r.isVisible(state)).toList(growable: false);

        final rowsWidgets = <Widget>[];
        for (var i = 0; i < visibleRows.length; i++) {
          rowsWidgets.add(RowBuilder(
            parentData: parentData,
            row: visibleRows[i],
            entity: entity,
            dataAction: dataAction,
            controllers: controllers,
            formState: formState,
          ));
          if (i < visibleRows.length - 1) rowsWidgets.add(const Gap(12));
        }

        if (rowsWidgets.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (group.title.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  group.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            ...rowsWidgets,
            const Gap(12),
            const Divider(),
          ],
        );
      },
    );
  }
}
