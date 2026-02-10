import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flutter/material.dart';

class DView extends HiveObject {
  final String id;
  final String label;
  final String entity;
  final Map<String, String> filter;
  final Rule? rule;

  DView({
    required this.label,
    required this.entity,
    required this.filter,
    required this.id,
    this.rule,
  });

  factory DView.fromJson(Map<String, dynamic> json) {
    return DView(
      id: json['id'] ?? json['label'] ?? '',
      label: json['label'] ?? '',
      entity: json['entity'] ?? '',
      filter: (json['filter'] as Map?)
              ?.map((k, v) => MapEntry(k.toString(), v.toString())) ??
          {},
      rule: json['rule'] != null ? Rule.fromMap(json['rule']) : null,
    );
  }

  DView.empty()
      : id = '',
        label = '',
        entity = '',
        filter = {},
        rule = null;

  DView copyWith({
    String? id,
    String? label,
    String? entity,
    Map<String, String>? filter,
    Rule? rule,
    bool clearRule = false,
  }) {
    return DView(
      id: id ?? this.id,
      label: label ?? this.label,
      entity: entity ?? this.entity,
      filter: filter ?? this.filter,
      rule: clearRule ? null : (rule ?? this.rule),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'entity': entity,
      'filter': filter,
      if (rule != null) 'rule': rule!.toMap(),
    };
  }

  List<Filter> filters(EntityCustom entity, Map<String, dynamic> data) {
    final filters = <Filter>[];
    for (final key in filter.keys) {
      final value = data[filter[key]];
      if (value != null) {
        filters.add(
          Filter(
            reference: key,
            value: value.toString(),
          ),
        );
      }
    }
    print('[View] filters $filters');
    return filters;
  }

  ActionButtonItem button(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
    EntityCustom entity,
    bool embedded, {
    VoidCallback? onSuccess,
  }) {
    return ActionButtonItem(
      color: DataAction.view.color,
      icon: DataAction.view.icon,
      label: '${DataAction.view.title} $label',
      onPressed: () async {
        if (embedded) {
          await Future.delayed(const Duration(milliseconds: 200));
          if (context.mounted) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuCustom.fromId(
                  parentData: parentData,
                  embedded: true,
                  entityId: this.entity,
                  initialFilters: filters(entity, data),
                ),
              ),
            );
            onSuccess?.call();
          }
        } else {
          MenuBloc.instance.add(
            Menu3Selected(
              home: MenuCustom.fromId(
                parentData: parentData,
                entityId: entity.id,
                initialFilters: filters(entity, data),
              ),
              label: entity.label,
            ),
          );
        }
      },
    );
  }
}
