import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

class ActionRowMultiple extends StatelessWidget {
  ActionRowMultiple({
    super.key,
    required this.rows,
    required this.entity,
    required this.parentData,
    required this.actions,
  });

  final List<Map<String, dynamic>> rows;
  final List<ActionD> actions;
  final EntityCustom entity;
  final List<Map<String, dynamic>> parentData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${rows.length} data selected'),
        Column(
          children: actions.buildButtonsMultiple(
            entity: entity,
            context: context,
            data: rows,
            parentData: parentData,
          ),
        ),
      ],
    );
  }
}
