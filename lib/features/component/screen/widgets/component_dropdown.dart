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

    return FDropDownSearch<String>(
      items: items,
      initialValue: initial,
      itemAsString: (item) => item,
      labelText: label,
      onChanged: (value) {},
    );
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
      final result = await httpData.execute(widget.data);
      if (result.isSuccess && result.data is Map) {
        final list = (result.data as Map)['data'] as List;
        final mapped = list.map((item) {
          // context for interpolation
          final context = <String, dynamic>{
            'item': item,
            ...widget.data, // parent data
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
      return Text('Error: $_error', style: const TextStyle(color: Colors.red));
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
      },
    );
  }
}
