import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:hive/hive.dart';

typedef JsonMap = Map<String, dynamic>;

enum FormType {
  view,
  create,
  update;

  factory FormType.fromString(String? s) {
    if (s == null) return FormType.create;
    try {
      return FormType.values.byName(s);
    } catch (_) {
      throw ArgumentError('Invalid FormType: $s');
    }
  }
}

class LayoutForm extends HiveObject {
  final String label;
  final String type;
  final List<GroupLayout> groups;

  FormType get formType => FormType.fromString(type);

  LayoutForm({
    required this.label,
    required this.type,
    required this.groups,
  })  : assert(label != ''),
        assert(type != ''),
        assert(groups != const []);

  factory LayoutForm.fromMap(JsonMap map) {
    final name = (map['name'] ?? '').toString().trim();
    if (name.isEmpty) {
      throw const FormatException('Action "name" is required');
    }
    final gs = map['groups'];
    if (gs is! List) {
      throw const FormatException('"groups" must be an array');
    }
    return LayoutForm(
      label: name,
      type: name,
      groups: gs.map((e) => GroupLayout.fromMap(e as JsonMap)).toList(),
    );
  }

  JsonMap toMap() => {
        'label': label,
        'type': type,
        'groups': groups.map((e) => e.toMap()).toList(),
      };

  LayoutForm copyWith(
          {String? label, String? type, List<GroupLayout>? groups}) =>
      LayoutForm(
        label: label ?? this.label,
        type: type ?? this.type,
        groups: groups ?? this.groups,
      );

  (List<String> usedFields, List<String> availableFields) getFieldByStatus(
      List<EntityField> fields) {
    final usedFields = <String>[];
    final availableFields = <String>[];
    for (final group in groups) {
      usedFields.addAll(group.usedFields());
    }
    for (final field in fields) {
      if (!usedFields.contains(field.reference)) {
        availableFields.add(field.reference);
      }
    }
    return (usedFields, availableFields);
  }
}

extension LayoutFormListExtension on List<LayoutForm> {
  List<LayoutForm> get updateForms {
    return where((element) => element.formType == FormType.update).toList();
  }

  LayoutForm? getByType(FormType type) {
    final index = indexWhere((e) => e.type == type.name);
    if (index > -1) {
      return this[index];
    }
    return null;
  }

  int getTypeIndex(FormType type) {
    final index = indexWhere((e) => e.type == type.name);
    return index == -1 ? 0 : index;
  }
}
