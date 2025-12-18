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
      onChanged: (value) {
        if (value != null) {
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
  List<Map<String, String>> _options = [];
  bool _isLoading = true;
  String? _error;
  String? _value;

  @override
  void initState() {
    super.initState();
    _fetchOptions();
  }

  Future<void> _fetchOptions() async {
    try {
      final httpData = widget.component.httpData!;
      // Filter out TextEditingControllers and internal keys to avoid JSON serialization errors
      final requestData = Map<String, dynamic>.from(widget.data)
        ..removeWhere((key, value) =>
            value is TextEditingController ||
            key == 'controller' ||
            key == 'allControllers');
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

          return {'key': key, 'label': label};
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

    return FDropDownSearch<Map<String, String>>(
      items: _options,
      initialValue: _value != null
          ? _options.firstWhere(
              (element) => element['key'] == _value,
              orElse: () => {},
            )
          : null,
      labelText: widget.component.label,
      itemAsString: (item) => item['label'] ?? '',
      onChanged: (val) {
        setState(() {
          _value = val?['key'];
        });
        if (_value != null) {
          _updateController(_value!);
          _handleActions(_value!);
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

  void _handleActions(String value) {
    print('AsyncDropdown onChange: $value');
    if (widget.component.onChangeActions.isEmpty) {
      print('No actions configured');
      return;
    }

    final allControllers =
        widget.data['allControllers'] as Map<String, TextEditingController>? ??
            {};

    print('Available controllers: ${allControllers.keys.join(', ')}');

    for (final action in widget.component.onChangeActions) {
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
  }
}
