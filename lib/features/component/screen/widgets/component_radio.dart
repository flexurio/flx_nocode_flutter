import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_radio.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentRadioWidgets on ComponentRadio {
  Widget toWidget(JsonMap data) {
    final items = options.isNotEmpty ? options : const ['Option 1', 'Option 2'];
    return _RadioGroup(
      label: label,
      options: items,
      initialValue: initialValue,
    );
  }
}

class _RadioGroup extends StatefulWidget {
  const _RadioGroup({
    required this.label,
    required this.options,
    required this.initialValue,
  });

  final String label;
  final List<String> options;
  final String initialValue;

  @override
  State<_RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<_RadioGroup> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue.isNotEmpty &&
        widget.options.contains(widget.initialValue)) {
      _selected = widget.initialValue;
    } else if (widget.options.isNotEmpty) {
      _selected = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ...widget.options.map(
          (opt) => RadioListTile<String>(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(opt),
            value: opt,
            groupValue: _selected,
            onChanged: (val) => setState(() => _selected = val),
          ),
        ),
      ],
    );
  }
}
