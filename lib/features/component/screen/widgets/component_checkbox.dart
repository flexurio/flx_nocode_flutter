import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_checkbox.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentCheckboxWidgets on ComponentCheckbox {
  Widget toWidget(JsonMap data) {
    return _CheckboxTile(label: label, value: value);
  }
}

class _CheckboxTile extends StatefulWidget {
  const _CheckboxTile({required this.label, required this.value});

  final String label;
  final bool value;

  @override
  State<_CheckboxTile> createState() => _CheckboxTileState();
}

class _CheckboxTileState extends State<_CheckboxTile> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      value: _checked,
      title: Text(widget.label),
      onChanged: (val) => setState(() => _checked = val ?? false),
    );
  }
}
