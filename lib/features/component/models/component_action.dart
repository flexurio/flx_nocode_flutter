class ComponentAction {
  final String type;
  final String targetId;
  final String? value;

  ComponentAction({
    required this.type,
    required this.targetId,
    this.value,
  });

  factory ComponentAction.fromMap(Map<String, dynamic> map) {
    return ComponentAction(
      type: map['type'] ?? '',
      targetId: map['targetId'] ?? '',
      value: map['value']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'targetId': targetId,
      'value': value,
    };
  }
}
