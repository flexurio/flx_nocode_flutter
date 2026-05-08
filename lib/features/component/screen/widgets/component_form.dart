import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_form.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentFormWidgets on ComponentForm {
  Widget toWidget(JsonMap data) {
    return _ComponentFormWidget(component: this, data: data);
  }

  Widget toMockWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Form Group',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.grey)),
          const SizedBox(height: 8),
          ...children.map((e) => e.toMockWidget()),
        ],
      ),
    );
  }
}

class _ComponentFormWidget extends StatefulWidget {
  final ComponentForm component;
  final JsonMap data;

  const _ComponentFormWidget({required this.component, required this.data});

  @override
  State<_ComponentFormWidget> createState() => _ComponentFormWidgetState();
}

class _ComponentFormWidgetState extends State<_ComponentFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.component.children.map((c) {
          return c.toWidget(
            data: widget.data,
            controllers: widget.data['allControllers']
                as Map<String, TextEditingController>?,
            parentData: (widget.data['parentData'] as List?)
                ?.cast<Map<String, dynamic>>(),
            dataAction: widget.data['dataAction'] as DataAction?,
          );
        }).toList(),
      ),
    );
  }
}
