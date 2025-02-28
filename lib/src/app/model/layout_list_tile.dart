import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class LayoutListTile {
  String? title;
  String? subtitle;
  String? trailing;

  LayoutListTile({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  Widget build({
    required VoidCallback onTap,
    required Map<String, dynamic> data,
  }) {
    return ListTileItem(
      onTap: onTap,
      title: title == null
          ? null
          : Text(
              data[title],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      subtitle: subtitle == null ? null : Text(data[subtitle]),
      trailing: trailing == null ? null : Text(data[trailing]),
    );
  }

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
