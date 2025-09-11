import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class LayoutListTile extends HiveObject {
  String? title;
  String? subtitle;
  String? trailing;

  LayoutListTile({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  Widget build({
    required EntityCustom entity,
    required VoidCallback onTap,
    required Map<String, dynamic> data,
  }) {
    return ListTileItem(
      onTap: onTap,
      title: title == null
          ? null
          : Text(
              getValue(data[title]),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      subtitle: subtitle == null ? null : Text(getValue(data[subtitle])),
      trailing: trailing == null
          ? null
          : Text(
              getValue(data[trailing]),
              style: TextStyle(fontSize: 14),
            ),
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

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'trailing': trailing,
      };

  static String getValue(dynamic value) {
    if (value == null) {
      return '-';
    }
    return value.toString();
  }
}
