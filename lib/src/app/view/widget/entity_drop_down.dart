import 'package:flx_nocode_flutter/src/app/model/entity.dart' as configuration;
import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field_options_source.dart';

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
        setState(() {});
      } catch (e) {
        _loading = false;
        if (e is ArgumentError) {
          _errorMessage = e.message;
        } else {
          _errorMessage = e.toString();
        }
        setState(() {});
      }
    }();
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    String? Function(MapEntry?)? validator;
    if (widget.isRequired) {
      validator = requiredObjectValidator.call;
    }

    return FDropDownSearch<MapEntry>(
      enabled: widget.enabled,
      labelText: widget.label ?? '(none)',
      onChanged: widget.onChanged,
      initialValue: widget.initialValue == null
          ? null
          : (_options.containsKey(widget.initialValue!.key)
              ? _options[widget.initialValue!.key]
              : null),
      validator: validator,
      itemAsString: (data) => widget.itemAsString(data.key, data.value),
      items: _options.entries.toList(),
      status: _loading
          ? Status.progress
          : (_errorMessage != null ? Status.error : Status.loaded),
    );
  }
}
