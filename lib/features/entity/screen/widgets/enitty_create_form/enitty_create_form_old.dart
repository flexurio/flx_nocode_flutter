import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

import '../../../../../flx_nocode_flutter.dart';

class EntityCreateFormOld extends StatefulWidget {
  const EntityCreateFormOld({
    super.key,
    required this.dataAction,
    required this.entity,
    required this.controllers,
    required this.layoutForm,
    required this.parentData,
  });

  final DataAction dataAction;
  final EntityCustom entity;
  final Map<String, TextEditingController> controllers;
  final LayoutForm layoutForm;
  final List<Map<String, dynamic>> parentData;

  @override
  State<EntityCreateFormOld> createState() => _EntityCreateFormOldState();
}

class _EntityCreateFormOldState extends State<EntityCreateFormOld> {
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

        final children = <Widget>[];
        for (final component in widget.layoutForm.components) {
          children.add(
            widget.layoutForm.renderComponent(
              context: context,
              component: component,
              data: state,
              controllers: widget.controllers,
              parentData: widget.parentData,
              dataAction: widget.dataAction,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        );
      },
    );
  }
}
