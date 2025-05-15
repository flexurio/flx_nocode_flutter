import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flutter/material.dart';

class View {
  final String label;
  final String entity;
  final Map<String, String> filter;

  View({required this.label, required this.entity, required this.filter});

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      label: json['label'],
      entity: json['entity'],
      filter: Map<String, String>.from(json['filter']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'entity': entity,
      'filter': filter,
    };
  }

  List<Filter> _filters(EntityCustom entity, Map<String, dynamic> data) {
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
    EntityCustom entity,
    bool embedded,
  ) {
    return ActionButtonItem(
      color: DataAction.view.color,
      icon: DataAction.view.icon,
      label: '${DataAction.view.title} $label',
      onPressed: () async {
        if (embedded) {
          Future.delayed(const Duration(milliseconds: 200), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuCustom(
                  embedded: true,
                  entityId: this.entity,
                  initialFilters: _filters(entity, data),
                ),
              ),
            );
          });
        } else {
          MenuBloc.instance.add(
            Menu3Selected(
              home: MenuCustom(
                entityId: entity.id,
                initialFilters: _filters(entity, data),
              ),
              label: entity.label,
            ),
          );
        }
      },
    );
  }
}
