import 'package:easy_localization/easy_localization.dart';
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

  DateTime? _parseDate(String val) {
    final str = val.trim();
    if (str.isEmpty) return null;
    var parsed = DateTime.tryParse(str);
    if (parsed != null) return parsed;

    final fmt = widget.component.dateFormat;
    if (fmt != null && fmt.isNotEmpty) {
      try {
        parsed = DateFormat(fmt).parse(str);
        if (parsed != null) return parsed;
      } catch (_) {}
    }

    if (str.length == 8 && RegExp(r'^\d{8}$').hasMatch(str)) {
      try {
        final year = int.parse(str.substring(0, 4));
        final month = int.parse(str.substring(4, 6));
        final day = int.parse(str.substring(6, 8));
        return DateTime(year, month, day);
      } catch (_) {}
    }
    return null;
  }

  void _initController() {
    final allControllers = widget.data['allControllers']
            as Map<String, TextEditingController>? ??
        const {};

    _controller = widget.data['controller'] as TextEditingController? ??
        allControllers[widget.component.id] ??
        TextEditingController();

    if (_controller.text.isEmpty && widget.component.initialValue.isNotEmpty) {
      final variables =
          allControllers.map((key, value) => MapEntry(key, value.text));
      final interpolated =
          widget.component.initialValue.interpolateJavascript(variables);
      if (interpolated.isNotEmpty) {
        _controller.text = interpolated;
      }
    }

    if (_controller.text.isNotEmpty) {
      final parsed = _parseDate(_controller.text);
      if (parsed != null &&
          widget.component.dateFormat != null &&
          widget.component.dateFormat!.isNotEmpty) {
        _controller.text =
            DateFormat(widget.component.dateFormat!).format(parsed);
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
      if (_controller.text.isNotEmpty) {
        setState(() {
          _controller.text = '';
        });

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

    final String interpolatedInitial =
        widget.component.initialValue.interpolateJavascript(variables);
    final initialDate = _parseDate(interpolatedInitial) ??
        _parseDate(_controller.text);

    DateTime? min;
    if (widget.component.minDate != null &&
        widget.component.minDate!.isNotEmpty) {
      final String interpolatedMin =
          widget.component.minDate!.interpolateJavascript(variables);
      min = _parseDate(interpolatedMin);
    }

    DateTime? max;
    if (widget.component.maxDate != null &&
        widget.component.maxDate!.isNotEmpty) {
      final String interpolatedMax =
          widget.component.maxDate!.interpolateJavascript(variables);
      max = _parseDate(interpolatedMax);
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
