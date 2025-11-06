class ButtonAction {
  final String kind; // e.g. "request"
  final String method; // e.g. "POST"
  final String url; // e.g. "{backend_host}/banks/export"
  final String label;

  ButtonAction({
    required this.kind,
    required this.method,
    required this.url,
    required this.label,
  });

  factory ButtonAction.fromJson(Map<String, dynamic> json) {
    return ButtonAction(
      kind: json['kind'] ?? '',
      method: json['method'] ?? '',
      url: json['url'] ?? '',
      label: json['label'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'method': method,
        'url': url,
        'label': label,
      };
}
