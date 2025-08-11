import 'package:flx_nocode_flutter/src/app/model/entity.dart';

class Features {
  final String title;
  final String subtitle;
  final String entity;
  final List<FeatureItem> items;

  Features({
    required this.title,
    required this.subtitle,
    required this.entity,
    required this.items,
  });

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        title: json['title'],
        subtitle: json['subtitle'],
        entity: json['entity'],
        items: List<FeatureItem>.from(
          json['items'].map(
            (x) => FeatureItem.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "entity": entity,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };

  Future<EntityCustom> getEntity() async {
    final e = await EntityCustom.getEntity(entity);
    if (e == null) {
      throw Exception('entity $entity not found');
    }
    return e;
  }
}

class FeatureItem {
  final String icon;
  final String title;
  final String description;
  final String color;

  FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  factory FeatureItem.fromJson(Map<String, dynamic> json) => FeatureItem(
        icon: json['icon'],
        title: json['title'],
        description: json['description'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "description": description,
        "color": color,
      };
}
