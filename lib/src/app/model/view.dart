import 'package:hive_ce/hive.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_home.dart';
import 'package:flutter/material.dart';

class DView extends HiveObject {
  final String label;
  final String entity;
  final Map<String, String> filter;

  DView({required this.label, required this.entity, required this.filter});

  factory DView.fromJson(Map<String, dynamic> json) {
    return DView(
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
                builder: (context) => MenuCustom.fromId(
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
              home: MenuCustom.fromId(
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

  Widget buttonLarge(BuildContext context, Map<String, dynamic> data) {
    return FutureBuilder<EntityCustom?>(
      future: EntityCustom.getEntity(entity),
      builder: (context, snapshot) {
        final entity = snapshot.data;

        return LightButton(
          action: DataAction.view,
          title: label,
          permission: null,
          onPressed: entity == null
              ? null
              : () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuCustom.fromId(
                        breadcrumbList: [entity.label],
                        entityId: this.entity,
                        initialFilters: _filters(entity, data),
                      ),
                    ),
                  );
                  // MenuBloc.instance.add(
                  //   Menu3Selected(
                  //     home: MenuCustom.fromId(
                  //       entityId: entity.id,
                  //       initialFilters: _filters(entity, data),
                  //     ),
                  //     label: entity.label,
                  //   ),
                  // );
                },
        );
      },
    );
  }
}
