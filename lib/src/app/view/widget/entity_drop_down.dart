import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field_options_source.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

class FDropDownSearchEntity extends StatefulWidget
    implements DropDownObject<MapEntry> {
  const FDropDownSearchEntity({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    required this.label,
    this.enabled = true,
    this.items,
    required this.itemAsString,
    required this.entityField,
  });

  @override
  final MapEntry? initialValue;

  @override
  final void Function(MapEntry?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  final List<MapEntry>? items;

  final EntityField entityField;

  final String Function(dynamic id, dynamic label) itemAsString;

  @override
  State<FDropDownSearchEntity> createState() => _FDropDownSearchEntityState();
}

class _FDropDownSearchEntityState extends State<FDropDownSearchEntity> {
  Map<dynamic, dynamic> _options = {};
  String? _errorMessage;
  var _loading = true;

  @override
  void initState() {
    super.initState();
    () async {
      try {
        _options =
            await OptionsSource(optionsSource: widget.entityField.optionsSource)
                .options();
        _loading = false;
        print('[FDropDownSearchEntity] newValue');
        setState(() {});
      } catch (e, s) {
        _loading = false;
        if (e is ArgumentError) {
          _errorMessage = 'DropDown Argument Error: ${e.message}';
        } else {
          _errorMessage = 'DropDown Error: $e';
        }
        setState(() {});
      }
    }();
  }

  MapEntry? _getInitialValue() {
    if (widget.initialValue == null) {
      return null;
    }

    final keys = _options.keys.toList();
    final indexKey = keys.indexWhere(
      (e) => e.toString() == widget.initialValue!.key.toString(),
    );
    if (indexKey != -1) {
      final label = _options[keys[indexKey]];
      final key = widget.initialValue!.key;
      print('[FDropDownSearchEntity] initialValue, key: $key, label: $label');
      return MapEntry(
        key,
        label,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return NoCodeError(_errorMessage!);
    }

    String? Function(MapEntry?)? validator;
    if (widget.isRequired) {
      validator = requiredObjectValidator.call;
    }

    print('[FDropDownSearchEntity] initialValue ${widget.initialValue}');
    return FDropDownSearch<MapEntry>(
      key: ValueKey(_options.length),
      enabled: widget.enabled,
      labelText: widget.label ?? '(none)',
      onChanged: widget.onChanged,
      initialValue: _getInitialValue(),
      validator: validator,
      itemAsString: (data) => widget.itemAsString(data.key, data.value),
      items: _options.entries.toList(),
      status: _loading
          ? Status.progress
          : (_errorMessage != null ? Status.error : Status.loaded),
    );
  }
}
