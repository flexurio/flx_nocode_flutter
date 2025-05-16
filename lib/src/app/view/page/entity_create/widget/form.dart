import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/layout.dart';
import 'package:gap/gap.dart';

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
    String action = 'create';
    if (dataAction.isEdit) {
      action = 'update';
    }

    final children = <Widget>[];
    final layouts = entity.layout;
    final layoutAction = layouts.containsKey(action);
    if (layoutAction) {
      final layout = (layouts[action] as Map<String, dynamic>).entries;
      for (final entry in layout) {
        final layoutGroup = LayoutGroup.fromMapEntry(entry);
        final layout = layoutGroup.buildForm(
          entity,
          dataAction,
          controllers,
        );
        children.addAll([layout, Gap(24)]);
      }
      children.removeLast();
    } else {
      children.add(Text("Error: Layout \"$action\" not found"));
    }
    return Column(children: children);
  }
}
