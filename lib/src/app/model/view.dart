import 'package:flexurio_no_code/src/app/model/entity.dart';
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flexurio_no_code/src/app/view/widget/entity_home.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart' as core;
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
    return filters;
  }

  Widget button(BuildContext context, Map<String, dynamic> data) {
    return FutureBuilder<EntityCustom?>(
        future: EntityCustom.getEntity(entity),
        builder: (context, snapshot) {
          final entity = snapshot.data;

          return core.LightButton(
            action: core.DataAction.view,
            title: label,
            permission: null,
            onPressed: entity == null
                ? null
                : () async {
                    core.MenuBloc.instance.add(
                      core.Menu3Selected(
                        home: MenuCustom(
                          entityId: entity.id,
                          initialFilters: _filters(entity, data),
                        ),
                        label: entity.label,
                      ),
                    );
                  },
          );
        });
  }
}
