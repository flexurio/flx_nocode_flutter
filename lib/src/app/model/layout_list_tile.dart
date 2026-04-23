import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/entity_action_bottom_sheet.dart';
import 'package:flx_nocode_flutter/features/entity/screen/pages/enitity_view_page.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
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
    required BuildContext context,
    required EntityCustom entity,
    required VoidCallback onTap,
    required Map<String, dynamic> data,
    required List<Map<String, dynamic>> parentData,
    required Map<String, dynamic> filters,
    required void Function(BuildContext) onRefresh,
    required bool bypassPermission,
  }) {
    return ListTileItem(
      onTap: onTap,
      title: title == null
          ? null
          : Text(
              getValue(data[title]),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
      subtitle: subtitle == null ? null : Text(getValue(data[subtitle])),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) ...[
            Text(
              getValue(data[trailing]),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 8),
          ],
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              EntityActionBottomSheet.show(
                context: context,
                title: getValue(data[title]),
                actions: EntityViewPage.actionsLarge(
                  context: context,
                  data: data,
                  parentData: parentData,
                  filters: filters,
                  entity: entity,
                  onRefresh: onRefresh,
                  bypassPermission: bypassPermission,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  factory LayoutListTile.fromJson(Map<String, dynamic> json) {
    return LayoutListTile(
      title: json['title']?.toString(),
      subtitle: json['subtitle']?.toString(),
      trailing: json['trailing']?.toString(),
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
