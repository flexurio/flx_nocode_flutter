class ComponentAction {
  final String type;
  final String targetId;
  final String? value;
  final Map<String, String>? mappings;

  ComponentAction({
    required this.type,
    required this.targetId,
    this.value,
    this.reference,
    this.mappings,
  });

  factory ComponentAction.fromMap(Map<String, dynamic> map) {
    return ComponentAction(
      type: map['type'] ?? '',
      targetId: (map['target_id'] ?? map['targetId'] ?? '').toString(),
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
      'target_id': targetId,
      'value': value,
      'reference': reference,
      'mappings': mappings,
    };
  }

  final String? reference;
}
