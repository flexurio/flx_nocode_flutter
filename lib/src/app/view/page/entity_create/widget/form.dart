import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

import 'package:gap/gap.dart';

import '../../../../../../flx_nocode_flutter.dart';

class EntityCreateForm extends StatelessWidget {
  const EntityCreateForm({
    super.key,
    required this.dataAction,
    required this.entity,
    required this.controllers,
  });

  final DataAction dataAction;
  final EntityCustom entity;
  final Map<String, TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    final actionName = dataAction.isEdit ? 'update' : 'create';

    final actions = entity.layoutForm;

    final action = actions.cast<LayoutForm?>().firstWhere(
          (a) => a?.name == actionName,
          orElse: () => null,
        );

    if (action == null) {
      return Text('Error: Layout "$actionName" not found');
    }

    final children = <Widget>[];
    for (var i = 0; i < action.groups.length; i++) {
      final group = action.groups[i];
      children.add(_GroupBuilder(
        group: group,
        entity: entity,
        dataAction: dataAction,
        controllers: controllers,
      ));
      if (i < action.groups.length - 1) children.add(const Gap(24));
    }

    return Column(children: children);
  }
}

class _GroupBuilder extends StatelessWidget {
  const _GroupBuilder({
    required this.group,
    required this.entity,
    required this.dataAction,
    required this.controllers,
  });

  final GroupLayout group;
  final EntityCustom entity;
  final DataAction dataAction;
  final Map<String, TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    final rowsWidgets = <Widget>[];
    for (var i = 0; i < group.rows.length; i++) {
      rowsWidgets.add(_RowBuilder(
        row: group.rows[i],
        entity: entity,
        dataAction: dataAction,
        controllers: controllers,
      ));
      if (i < group.rows.length - 1) rowsWidgets.add(const Gap(12));
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
  }
}

class _RowBuilder extends StatelessWidget {
  const _RowBuilder({
    required this.row,
    required this.entity,
    required this.dataAction,
    required this.controllers,
  });

  final RowLayout row;
  final EntityCustom entity;
  final DataAction dataAction;
  final Map<String, TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    final columns = (row.columns <= 0) ? 1 : row.columns;

    final fieldWidgets = <Widget>[];
    for (final key in row.fields) {
      final field = entity.getField(key);
      final controller = controllers[key];

      if (field != null && controller != null) {
        fieldWidgets.add(field.buildForm(dataAction, controller));
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
        chunk.add(Container());
      }

      final wrappedColumns = chunk
          .map((w) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [w],
              ))
          .toList();

      rows.add(wrappedColumns);
    }

    return Column(
      children: [
        for (var i = 0; i < rows.length; i++) ...[
          RowFields(children: rows[i]),
          if (i < rows.length - 1) const Gap(12),
        ],
      ],
    );
  }
}
