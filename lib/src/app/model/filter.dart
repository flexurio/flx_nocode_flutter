import 'package:flexurio_no_code/src/app/model/configuration.dart';
import 'package:flexurio_no_code/src/app/model/entity.dart';

class Filter {
  final String reference;
  final String value;

  Filter({required this.reference, required this.value});

  Filter copyWith({
    String? reference,
    String? value,
  }) {
    return Filter(
      reference: reference ?? this.reference,
      value: value ?? this.value,
    );
  }

  String getLabel(EntityCustom entity) {
    final keys = reference.split('|');
    final labels = <String>[];
    for (final key in keys) {
      final label = entity.fields.firstWhere((e) => e.reference == key).label;
      labels.add(label);
    }
    return labels.join(' | ');
  }

  String getKeyBackend() {
    if (reference.contains('|')) {
      final keys = reference.split('|');
      return keys.map((e) => '$e.like').join('|');
    }
    return '$reference.eq';
  }
}
