import 'package:flx_nocode_flutter/src/app/model/entity.dart';

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
      final index = entity.fields.indexWhere((e) => e.reference == key);
      if (index != -1) {
        final label = entity.fields[index].label;
        labels.add(label);
      } else {
        labels.add(key);
      }
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

extension FilterList on List<Filter> {
  Map<String, String> toMap() => Map.fromEntries(
        map(
          (e) => MapEntry(e.reference, e.value),
        ),
      );
}
