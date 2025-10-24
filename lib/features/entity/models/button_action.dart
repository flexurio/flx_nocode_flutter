class ButtonAction {
  final String kind; // e.g. "request"
  final String method; // e.g. "POST"
  final String url; // e.g. "{backend_host}/banks/export"
  final String? contentType; // e.g. "multipart/form-data"
  final Map<String, dynamic>? payload;

  ButtonAction({
    required this.kind,
    required this.method,
    required this.url,
    this.contentType,
    this.payload,
  });

  factory ButtonAction.fromJson(Map<String, dynamic> json) {
    return ButtonAction(
      kind: json['kind'] ?? '',
      method: json['method'] ?? '',
      url: json['url'] ?? '',
      contentType: json['content_type'],
      payload: json['payload'] != null
          ? Map<String, dynamic>.from(json['payload'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'method': method,
        'url': url,
        if (contentType != null) 'content_type': contentType,
        if (payload != null) 'payload': payload,
      };
}

/// Represents a button definition on a layout (e.g. in layout_form).
class LayoutButton {
  final String id;
  final String label;
  final ButtonAction action;

  LayoutButton({
    required this.id,
    required this.label,
    required this.action,
  });

  factory LayoutButton.fromJson(Map<String, dynamic> json) {
    return LayoutButton(
      id: json['id'] ?? '',
      label: json['label'] ?? '',
      action: ButtonAction.fromJson(json['action']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'action': action.toJson(),
      };
}
