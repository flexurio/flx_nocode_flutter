import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:gap/gap.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/group_builder.dart';

import '../../../../../flx_nocode_flutter.dart';

class EntityCreateForm extends StatefulWidget {
  const EntityCreateForm({
    super.key,
    required this.dataAction,
    required this.entity,
    required this.controllers,
    required this.layoutForm,
  });

  final DataAction dataAction;
  final EntityCustom entity;
  final Map<String, TextEditingController> controllers;
  final LayoutForm layoutForm;

  @override
  State<EntityCreateForm> createState() => _EntityCreateFormState();
}

class _EntityCreateFormState extends State<EntityCreateForm> {
  late final FormStateController _formState;

  @override
  void initState() {
    super.initState();
    _formState = FormStateController(widget.controllers);
  }

  @override
  void dispose() {
    _formState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _formState,
      builder: (context, _) {
        final state = _formState.state;

        final formVisible = widget.layoutForm.isVisible(state);
        if (!formVisible) {
          return const SizedBox.shrink();
        }

        final visibleGroups = widget.layoutForm.groups
            .where((g) => g.isVisible(state))
            .toList(growable: false);

        final children = <Widget>[];
        for (var i = 0; i < visibleGroups.length; i++) {
          final group = visibleGroups[i];
          children.add(GroupBuilder(
            group: group,
            entity: widget.entity,
            dataAction: widget.dataAction,
            controllers: widget.controllers,
            formState: _formState, // pass down for reactive rows
          ));
          if (i < visibleGroups.length - 1) children.add(const Gap(24));
        }

        return Column(children: children);
      },
    );
  }
}
