import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentCheckboxWidgets on ComponentCheckbox {
  Widget toWidget(JsonMap data) {
    final controller = data['controller'];
    return _CheckboxTile(
      label: label,
      defaultValue: value,
      controller: controller is TextEditingController ? controller : null,
    );
  }
}

class _CheckboxTile extends StatefulWidget {
  const _CheckboxTile({
    required this.label,
    required this.defaultValue,
    this.controller,
  });

  final String label;
  final bool defaultValue;
  final TextEditingController? controller;

  @override
  State<_CheckboxTile> createState() => _CheckboxTileState();
}

class _CheckboxTileState extends State<_CheckboxTile> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = _parseValue(widget.controller?.text) ?? widget.defaultValue;
    // Sync initial value to controller if empty
    if (widget.controller != null && widget.controller!.text.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.controller!.text = _checked ? '1' : '0';
        }
      });
    }
  }

  bool? _parseValue(String? value) {
    if (value == null || value.isEmpty) return null;
    final v = value.toLowerCase();
    return v == '1' || v == 'true';
  }

  void _updateController(bool value) {
    setState(() {
      _checked = value;
    });
    if (widget.controller != null) {
      widget.controller!.text = value ? '1' : '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    // If controller text changes externally (e.g. from a rule), update state
    if (widget.controller != null) {
      final ctrlValue = _parseValue(widget.controller!.text);
      if (ctrlValue != null && ctrlValue != _checked) {
        _checked = ctrlValue;
      }
    }

    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      value: _checked,
      title: Text(widget.label),
      onChanged: (val) => _updateController(val ?? false),
    );
  }
}
