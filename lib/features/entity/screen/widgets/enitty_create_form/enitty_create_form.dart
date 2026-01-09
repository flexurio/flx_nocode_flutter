import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/c_column.dart';
import 'package:flx_nocode_flutter/features/component/models/c_row.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';

import '../../../../../flx_nocode_flutter.dart';

class EntityCreateForm extends StatefulWidget {
  const EntityCreateForm({
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
  State<EntityCreateForm> createState() => _EntityCreateFormState();
}

class _EntityCreateFormState extends State<EntityCreateForm> {
  late final FormStateController _formState;
  final Map<String, TextEditingController> _localControllers = {};

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _formState = FormStateController({
      ...widget.controllers,
      ..._localControllers,
    });
  }

  void _initializeControllers() {
    final ids = <String>{};
    _collectComponentIds(widget.layoutForm.components, ids);

    for (final id in ids) {
      if (!widget.controllers.containsKey(id)) {
        _localControllers[id] = TextEditingController();
      }
    }
  }

  void _collectComponentIds(List<Component> components, Set<String> ids) {
    for (final c in components) {
      ids.add(c.id);
      if (c is ComponentColumn) {
        _collectComponentIds(c.children, ids);
      } else if (c is ComponentRow) {
        _collectComponentIds(c.children, ids);
      }
    }
  }

  @override
  void dispose() {
    _formState.dispose();
    for (final controller in _localControllers.values) {
      controller.dispose();
    }
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

        if (widget.layoutForm.components.isEmpty) {
          return NoCodeError(
            'Empty Layout Form',
            debugInfo:
                'Entity: ${widget.entity.label}, Layout: ${widget.layoutForm.id}',
            description:
                'The layout form for this entity does not contain any components to display.',
            suggestion:
                'Please add components to the layout form in the entity configuration.',
          );
        }

        final allControllers = {
          ...widget.controllers,
          ..._localControllers,
        };

        final children = widget.layoutForm.components.map((c) {
          final ctrl = allControllers[c.id];
          return c.convertToWidget({
            'controller': ctrl,
            'allControllers': allControllers,
            'data': state,
            'form': state,
            'current': state,
            if (widget.parentData.isNotEmpty) 'parent': widget.parentData.last,
          });
        }).toList();
        return Column(children: children);
      },
    );
  }
}
