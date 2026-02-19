import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

class ComponentDatePicker extends Component {
  final String label;
  final String initialValue;
  final String? minDate;
  final String? maxDate;
  final bool required;
  final String? widthMode; // 'fill', 'hug', 'fixed'
  final double? width;
  final int? flex;
  final String? dateFormat;

  ComponentDatePicker({
    required super.id,
    required this.label,
    required this.initialValue,
    this.minDate,
    this.maxDate,
    this.required = false,
    this.dateFormat,
    this.widthMode,
    this.width,
    this.flex,
    super.visibilityCondition,
    super.events = const {},
  }) : super(type: componentId);

  static const String componentId = 'date_picker';

  factory ComponentDatePicker.empty(String id) {
    return ComponentDatePicker(
      id: id,
      label: 'Date Picker',
      initialValue: '',
      required: false,
      widthMode: 'hug',
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
    final dateFormat = map['dateFormat']?.toString();

    return ComponentDatePicker(
      id: id,
      label: label,
      initialValue: initialValue,
      minDate: minDate,
      maxDate: maxDate,
      required: required,
      dateFormat: dateFormat,
      widthMode: map['widthMode']?.toString(),
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
        'label': label,
        'initialValue': initialValue,
        'minDate': minDate,
        'maxDate': maxDate,
        'required': required,
        'dateFormat': dateFormat,
        'widthMode': widthMode,
        'width': width,
        'flex': flex,
      };
}
