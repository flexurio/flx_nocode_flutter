class LayoutListTile {
  String? title;
  String? subtitle;
  String? trailing;

  LayoutListTile({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  factory LayoutListTile.fromJson(Map<String, dynamic> json) {
    return LayoutListTile(
      title: json.containsKey('title') ? json['title'] as String : null,
      subtitle:
          json.containsKey('subtitle') ? json['subtitle'] as String : null,
      trailing:
          json.containsKey('trailing') ? json['trailing'] as String : null,
    );
  }
}
