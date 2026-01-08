import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';

extension ComponentDropdownWidgets on ComponentDropdown {
  Widget toWidget(JsonMap data) {
    if (httpData != null && httpData!.url.isNotEmpty) {
      return _AsyncDropdown(component: this, data: data);
    }

    final items = options.isNotEmpty ? options : const ['Option 1', 'Option 2'];
    final initial = initialValue.isNotEmpty && items.contains(initialValue)
        ? initialValue
        : (items.isNotEmpty ? items.first : null);

    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers'] as Map<String, TextEditingController>)[id]
            : null);

    return FDropDownSearch<String>(
      items: items,
      initialValue: initial,
      itemAsString: (item) => item,
      labelText: label,
      validator: this.required
          ? (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            }
          : null,
      onChanged: (value) {
        if (value != null) {
          print('Dropdown ($label) onChanged: $value');
          controller?.text = value;
          _handleActions(data, value);
        }
      },
    );
  }

  void _handleActions(JsonMap data, String value) {
    try {
      print('Dropdown onChange: $value');
      if (onChangeActions.isEmpty) {
        print('No actions configured');
        return;
      }

      final allControllers =
          data['allControllers'] as Map<String, TextEditingController>? ?? {};

      print('Available controllers: ${allControllers.keys.join(', ')}');

      for (final action in onChangeActions) {
        print('Processing action: ${action.type}, target: ${action.targetId}');
        if (action.type == 'set_value') {
          final targetId = action.targetId;
          final targetController = allControllers[targetId];
          if (targetController != null) {
            String newValue = action.value ?? '';
            // Simple interpolation for {{ value }}
            newValue = newValue.replaceAll('{{ value }}', value);
            newValue = newValue.replaceAll('{{value}}', value);
            print('Setting target $targetId to: $newValue');
            targetController.text = newValue;
          } else {
            print('Target controller $targetId not found');
          }
        }
      }
    } catch (e, stack) {
      print('Error in Dropdown _handleActions: $e\n$stack');
    }
  }
}

class _AsyncDropdown extends StatefulWidget {
  const _AsyncDropdown({
    required this.component,
    required this.data,
  });

  final ComponentDropdown component;
  final JsonMap data;

  @override
  State<_AsyncDropdown> createState() => _AsyncDropdownState();
}

class _AsyncDropdownState extends State<_AsyncDropdown> {
  List<Map<String, dynamic>> _options = [];
  bool _isLoading = true;
  String? _error;
  String? _value;

  @override
  void initState() {
    super.initState();
    _setupListeners();
    _fetchOptions();
  }

  @override
  void dispose() {
    _removeListeners();
    super.dispose();
  }

  void _setupListeners() {
    if (widget.component.dependsOn.isEmpty) return;

    final allControllers =
        widget.data['allControllers'] as Map<String, TextEditingController>? ??
            {};

    for (final depId in widget.component.dependsOn) {
      final controller = allControllers[depId];
      if (controller != null) {
        controller.addListener(_onDependencyChanged);
      }
    }
  }

  void _removeListeners() {
    if (widget.component.dependsOn.isEmpty) return;

    final allControllers =
        widget.data['allControllers'] as Map<String, TextEditingController>? ??
            {};

    for (final depId in widget.component.dependsOn) {
      final controller = allControllers[depId];
      if (controller != null) {
        controller.removeListener(_onDependencyChanged);
      }
    }
  }

  void _onDependencyChanged() {
    if (!mounted) return;
    setState(() {
      _value = null; // Reset value as options might change
      _isLoading = true;
      _error = null;
    });
    // Clear dependent value
    _updateController('');
    _fetchOptions();
  }

  Future<void> _fetchOptions() async {
    try {
      final httpData = widget.component.httpData!;

      final allControllers = widget.data['allControllers']
              as Map<String, TextEditingController>? ??
          {};

      // Filter out TextEditingControllers and internal keys to avoid JSON serialization errors
      final requestData = Map<String, dynamic>.from(widget.data)
        ..removeWhere((key, value) =>
            value is TextEditingController ||
            key == 'controller' ||
            key == 'allControllers');

      // Inject current values from controllers explicitly
      for (final entry in allControllers.entries) {
        requestData[entry.key] = entry.value.text;
      }

      final result = await httpData.execute(requestData);
      if (result.isSuccess && result.data is Map) {
        final list = (result.data as Map)['data'] as List;
        final mapped = list.map((item) {
          // context for interpolation
          final context = <String, dynamic>{
            'item': item,
            ...requestData, // parent data
          };

          // Resolve Label (from optionKey? usually key=value, value=label?
          // actually user said "insert key dan value".
          // In DropdownMenuItem: value is the ID/Key, child Text is the Label/Value.
          // ComponentDropdown model has optionKey and optionValue.
          // Let's assume optionKey -> ID/Value of dropdown item
          // optionValue -> Label/Text of dropdown item

          String key = item.toString();
          String label = item.toString();

          if (widget.component.optionKey != null &&
              widget.component.optionKey!.isNotEmpty) {
            key = widget.component.optionKey!.interpolateJavascript(context);
          }

          if (widget.component.optionLabel != null &&
              widget.component.optionLabel!.isNotEmpty) {
            label =
                widget.component.optionLabel!.interpolateJavascript(context);
          }

          return {'key': key, 'label': label, 'item': item};
        }).toList();

        if (mounted) {
          setState(() {
            _options = mapped;
            _isLoading = false;
            // Set initial value if matches or first
            if (widget.component.initialValue.isNotEmpty) {
              if (_options
                  .any((o) => o['key'] == widget.component.initialValue)) {
                _value = widget.component.initialValue;
              }
            } else if (_value != null) {
              // Verify if kept value is still valid
              if (!_options.any((o) => o['key'] == _value)) {
                _value = null;
              }
            }
          });
        }
      } else {
        if (mounted)
          setState(() {
            _error = 'Invalid data format';
            _isLoading = false;
          });
      }
    } catch (e) {
      if (mounted)
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: const LinearProgressIndicator(),
      );
    }

    if (_error != null) {
      return SelectableText('Error: $_error',
          style: const TextStyle(color: Colors.red));
    }

    return FDropDownSearch<Map<String, dynamic>>(
      items: _options,
      initialValue: _value != null
          ? _options.firstWhere(
              (element) => element['key'] == _value,
              orElse: () => {},
            )
          : null,
      labelText: widget.component.label,
      validator: widget.component.required
          ? (value) {
              if (value == null || value.isEmpty) {
                return '${widget.component.label} is required';
              }
              return null;
            }
          : null,
      itemAsString: (item) => item['label'] ?? '',
      onChanged: (val) {
        print('AsyncDropdown (${widget.component.label}) onChanged: $val');
        setState(() {
          _value = val?['key'];
        });
        if (_value != null && val != null) {
          _updateController(_value!);
          _handleActions(val);
        }
      },
    );
  }

  void _updateController(String value) {
    final data = widget.data;
    final controller = data['controller'] as TextEditingController? ??
        (data['allControllers'] != null
            ? (data['allControllers']
                as Map<String, TextEditingController>)[widget.component.id]
            : null);
    controller?.text = value;
  }

  void _handleActions(Map<String, dynamic> selection) {
    final value = selection['key']?.toString() ?? '';
    final item = selection['item'];
    print('AsyncDropdown onChange: $value');
    if (widget.component.onChangeActions.isEmpty) {
      print('No actions configured');
      return;
    }

    final allControllers =
        widget.data['allControllers'] as Map<String, TextEditingController>? ??
            {};

    print('Available controllers: ${allControllers.keys.join(', ')}');

    // Prepare context for interpolation
    // We need to filter requestData again or reuse it?
    // Easier to just construct it safely.
    // Actually we can just use the item.
    // And parent data?

    // Let's reconstruct requestData safe copy
    final requestData = Map<String, dynamic>.from(widget.data)
      ..removeWhere((key, value) =>
          value is TextEditingController ||
          key == 'controller' ||
          key == 'allControllers');

    // Inject current values from controllers
    for (final entry in allControllers.entries) {
      requestData[entry.key] = entry.value.text;
    }

    final context = <String, dynamic>{
      'item': item,
      'value': value,
      ...requestData,
    };

    for (final action in widget.component.onChangeActions) {
      print('Processing action: ${action.type}, target: ${action.targetId}');
      if (action.type == 'set_value') {
        final targetId = action.targetId;
        final targetController = allControllers[targetId];
        if (targetController != null) {
          String rawValue = action.value ?? '';
          String newValue = rawValue;

          // Try interpolate with context (supports item.field)
          try {
            newValue = rawValue.interpolateJavascript(context);
          } catch (e) {
            print('Interpolation failed: $e');
            // Fallback to simple replacement if needed, but interpolateJavascript usually returns string.
            // If rawValue didn't have {{}}, it returns rawValue.

            // Backwards compatibility for {{ value }} if interpolateJavascript doesn't handle single simple replacements without structure?
            // StringJsInterpolation usually expects {{ code }}.
          }

          print('Setting target $targetId to: $newValue');
          targetController.text = newValue;
        } else {
          print('Target controller $targetId not found');
        }
      }
    }
  }
}
