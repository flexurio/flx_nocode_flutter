import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_radio.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

extension ComponentRadioWidgets on ComponentRadio {
  Widget toWidget(JsonMap data) {
    final items = options.isNotEmpty ? options : const ['Option 1', 'Option 2'];
    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null);

    return FormField<String>(
      initialValue: initialValue.isNotEmpty && items.contains(initialValue)
          ? initialValue
          : (items.isNotEmpty ? items.first : null),
      validator: this.required
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            }
          : null,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _RadioGroup(
              label: label,
              options: items,
              initialValue: state.value ?? '',
              onChanged: (val) {
                state.didChange(val);
                if (val != null) {
                  controller?.text = val;
                }
              },
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _RadioGroup extends StatefulWidget {
  const _RadioGroup({
    required this.label,
    required this.options,
    required this.initialValue,
    required this.onChanged,
  });

  final String label;
  final List<String> options;
  final String initialValue;
  final ValueChanged<String?> onChanged;

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
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: Text(opt),
            value: opt,
            groupValue: _selected,
            onChanged: (val) {
              setState(() => _selected = val);
              widget.onChanged(val);
            },
          ),
        ),
      ],
    );
  }
}
