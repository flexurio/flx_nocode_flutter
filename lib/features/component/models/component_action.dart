class ComponentAction {
  final String type;
  final String target_id;
  final String? value;
  final Map<String, String>? mappings;

  ComponentAction({
    required this.type,
    required this.target_id,
    this.value,
    this.reference,
    this.mappings,
  });

  factory ComponentAction.fromMap(Map<String, dynamic> map) {
    return ComponentAction(
      type: map['type'] ?? '',
      target_id: (map['target_id'] ?? map['targetId'] ?? '').toString(),
      value: map['value']?.toString(),
      reference: map['reference']?.toString(),
      mappings: map['mappings'] != null
          ? Map<String, String>.from(map['mappings'] as Map)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'target_id': target_id,
      'value': value,
      'reference': reference,
      'mappings': mappings,
    };
  }

  final String? reference;
}
