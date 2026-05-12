import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

extension ComponentDatePickerWidgets on ComponentDatePicker {
  Widget toWidget(JsonMap data) {
    return _DatePickerWidget(component: this, data: data);
  }

  Widget toMockWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          height: 44,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: enabled ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: enabled ? Colors.grey.shade300 : Colors.grey.shade200,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  initialValue.isNotEmpty
                      ? initialValue
                      : (dateFormat ?? 'yyyy-MM-dd').toUpperCase(),
                  style: TextStyle(
                    color: initialValue.isNotEmpty
                        ? (enabled ? Colors.black87 : Colors.grey.shade500)
                        : Colors.grey.shade400,
                    fontSize: 13,
                  ),
                ),
              ),
              Icon(
                Icons.calendar_today,
                color: enabled ? Colors.grey.shade600 : Colors.grey.shade400,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DatePickerWidget extends StatefulWidget {
  final ComponentDatePicker component;
  final JsonMap data;

  const _DatePickerWidget({
    required this.component,
    required this.data,
  });

  @override
  State<_DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<_DatePickerWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _initController();
    _setupListeners();
  }

  void _initController() {
    final allControllers = widget.data['allControllers']
            as Map<String, TextEditingController>? ??
        const {};

    _controller = widget.data['controller'] as TextEditingController? ??
        allControllers[widget.component.id] ??
        TextEditingController();

    if (_controller.text.isEmpty && widget.component.initialValue.isNotEmpty) {
      // Handle initial value interpolation if necessary
      final variables =
          allControllers.map((key, value) => MapEntry(key, value.text));
      final interpolated =
          widget.component.initialValue.interpolateJavascript(variables);
      if (interpolated.isNotEmpty) {
        _controller.text = interpolated;
      }
    }
  }

  void _setupListeners() {
    final allControllers = widget.data['allControllers']
            as Map<String, TextEditingController>? ??
        const {};
    for (final depId in widget.component.dependsOn) {
      final depCtrl = allControllers[depId];
      if (depCtrl != null) {
        depCtrl.addListener(_onDependencyChanged);
      }
    }
  }

  void _onDependencyChanged() {
    if (mounted) {
      // Reset the date picker value when dependency changes
      if (_controller.text.isNotEmpty) {
        setState(() {
          _controller.text = '';
        });

        // Also notify row change if inside a table
        final onRowChanged = widget.data['onRowChanged'];
        if (onRowChanged is Function) {
          final row =
              Map<String, dynamic>.from(widget.data['row'] as Map? ?? {});
          final targetField =
              widget.data['columnBody']?.toString() ?? widget.component.id;
          if (row[targetField] != '') {
            row[targetField] = '';
            onRowChanged(row);
          }
        }
      } else {
        // Even if empty, we might need to rebuild because min/max dates might have changed
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    final allControllers = widget.data['allControllers']
            as Map<String, TextEditingController>? ??
        const {};
    for (final depId in widget.component.dependsOn) {
      final depCtrl = allControllers[depId];
      if (depCtrl != null) {
        depCtrl.removeListener(_onDependencyChanged);
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allControllers = widget.data['allControllers']
            as Map<String, TextEditingController>? ??
        const {};
    final variables =
        allControllers.map((key, value) => MapEntry(key, value.text));

    // Handle initial date (for the picker UI)
    final String interpolatedInitial =
        widget.component.initialValue.interpolateJavascript(variables);
    final initialDate = DateTime.tryParse(interpolatedInitial) ??
        DateTime.tryParse(_controller.text);

    // Handle min date
    DateTime? min;
    if (widget.component.minDate != null &&
        widget.component.minDate!.isNotEmpty) {
      final String interpolatedMin =
          widget.component.minDate!.interpolateJavascript(variables);
      min = DateTime.tryParse(interpolatedMin);
    }

    // Handle max date
    DateTime? max;
    if (widget.component.maxDate != null &&
        widget.component.maxDate!.isNotEmpty) {
      final String interpolatedMax =
          widget.component.maxDate!.interpolateJavascript(variables);
      max = DateTime.tryParse(interpolatedMax);
    }

    return FieldDatePicker(
      controller: _controller,
      labelText: widget.component.label,
      initialSelectedDate: initialDate,
      minDate: min,
      maxDate: max,
      dateFormat: widget.component.dateFormat,
      enabled: widget.component.enabled,
      validator: widget.component.required
          ? (value) {
              if (value == null) {
                return '${widget.component.label} is required';
              }
              return null;
            }
          : null,
    );
  }
}
