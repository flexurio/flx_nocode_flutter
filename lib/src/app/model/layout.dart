import 'package:flexurio_no_code/src/app/model/entity.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Layout {
  List<String> fields;
  int columns;

  Layout({
    required this.fields,
    required this.columns,
  });

  Widget buildForm(
    EntityCustom entity,
    DataAction action,
    Map<String, TextEditingController> controller,
  ) {
    final children = <Widget>[];
    final row = <Widget>[];

    for (final key in fields) {
      final field = entity.getField(key);
      final child = field?.buildForm(action, controller[key]!);
      if (child != null) {
        row.add(child);
      } else {
        row.add(Text('Error: "$key" not found'));
      }
      if (row.length == columns) {
        children.add(RowFields(children: List.from(row)));
        row.clear();
      }
    }
    if (row.isNotEmpty) {
      final remaining = columns - row.length;
      for (var i = 0; i < remaining; i++) {
        row.add(Container());
      }
      children.add(RowFields(children: List.from(row)));
    }

    return Wrap(children: children, runSpacing: 24);
  }

  factory Layout.fromMapEntry(MapEntry map) {
    return Layout(
      fields: (map.key as String).split(','),
      columns: map.value,
    );
  }
}

class LayoutGroup {
  String? title;
  List<Layout> layouts;

  LayoutGroup({
    required this.title,
    required this.layouts,
  });

  Widget buildForm(
    EntityCustom entity,
    DataAction action,
    Map<String, TextEditingController> controller,
  ) {
    final children = <Widget>[];
    for (final layout in layouts) {
      children.addAll([layout.buildForm(entity, action, controller), Gap(24)]);
    }
    children.removeLast();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        ...children,
        Gap(12),
        Divider(),
      ],
    );
  }

  factory LayoutGroup.fromMapEntry(MapEntry<String, dynamic> map) {
    return LayoutGroup(
      title: map.key,
      layouts: (map.value as Map<String, dynamic>)
          .entries
          .map((e) => Layout.fromMapEntry(e))
          .toList(),
    );
  }
}
