import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDatePicker extends ComponentInputBase {
  final String initialValue;
  final String? minDate;
  final String? maxDate;
  final String? dateFormat;

  ComponentDatePicker({
    required super.id,
    required super.label,
    required this.initialValue,
    this.minDate,
    this.maxDate,
    super.required,
    super.enabled = true,
    this.dateFormat,
    super.widthMode,
    super.width,
    super.flex,
    super.visibilityCondition,
    super.events,
  }) : super(type: componentId);

  static const String componentId = 'date_picker';

  factory ComponentDatePicker.empty(String id) {
    return ComponentDatePicker(
      id: id,
      label: 'Date Picker',
      initialValue: '',
      required: false,
      enabled: true,
      widthMode: ComponentSizeMode.fill,
    );
  }

  factory ComponentDatePicker.fromMap(Map<String, dynamic> map) {
    final id = map['id']?.toString().trim();
    if (id == null || id.isEmpty) {
      throw const FormatException('Component "id" is required');
    }
    final label = map['label']?.toString().trim() ?? 'Date Picker';
    final initialValue = map['initialValue']?.toString().trim() ?? '';
    final minDate = map['minDate']?.toString();
    final maxDate = map['maxDate']?.toString();
    final required = map['required'] == true;
    final enabledRaw = map['enabled'];
    final enabled = () {
      if (enabledRaw == null) return true;
      if (enabledRaw is bool) return enabledRaw;
      final str = enabledRaw.toString().toLowerCase().trim();
      if (str == 'false' || str == '0') return false;
      if (str == 'true' || str == '1') return true;
      return true;
    }();
    final dateFormat = map['dateFormat']?.toString();

    return ComponentDatePicker(
      id: id,
      label: label,
      initialValue: initialValue,
      minDate: minDate,
      maxDate: maxDate,
      required: required,
      enabled: enabled,
      dateFormat: dateFormat,
      widthMode: ComponentSizeMode.fromString(map['widthMode']?.toString()),
      width: map['width'] != null
          ? double.tryParse(map['width'].toString())
          : null,
      flex: map['flex'] != null ? int.tryParse(map['flex'].toString()) : null,
      visibilityCondition: map['visibilityCondition']?.toString(),
      events: map['events'] as Map<String, dynamic>? ?? const {},
    );
  }

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'initialValue': initialValue,
        'minDate': minDate,
        'maxDate': maxDate,
        'dateFormat': dateFormat,
      };
}
