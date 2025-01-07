import 'package:appointment/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:appointment/src/app/model/entity_field.dart';
import 'package:appointment/src/app/view/widget/entity_create_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/src/app/model/configuration.dart' as configuration;

class MenuDataTableCustom extends StatefulWidget {
  const MenuDataTableCustom._({
    required this.entity,
  });

  static Widget prepare({
    required configuration.Entity entity,
  }) {
    return BlocProvider(
      create: (_) =>
          EntityCustomQueryBloc(entity)..add(EntityCustomQueryEvent.fetch()),
      child: MenuDataTableCustom._(entity: entity),
    );
  }

  final configuration.Entity entity;

  @override
  State<MenuDataTableCustom> createState() => _MenuDataTableCustomState();
}

class _MenuDataTableCustomState extends State<MenuDataTableCustom> {
  void _fetch({
    PageOptions<Map<dynamic, dynamic>>? pageOptions,
  }) {
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetch(
            pageOptions: pageOptions,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Map>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => _fetch(),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => Status.error,
              loaded: (materials) => Status.loaded,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              _fetch(pageOptions: pageOptions);
            },
            actionLeft: [],
            actionRight: (refreshButton) => [
              refreshButton,
              if (widget.entity.allowCreate)
                EntityCreateButton(
                  entity: widget.entity,
                  onSuccess: () {
                    _fetch();
                  },
                ),
            ],
            columns: [
              ...(widget.entity.fields.map(
                (e) => DTColumn(
                  widthFlex: 10,
                  head: DTHead(
                    backendColumn: e.reference,
                    label: e.label,
                  ),
                  body: (entity) => DataCell(
                    EntityField.buildDisplay(
                      widget.entity,
                      e.reference,
                      entity[e.reference],
                    ),
                  ),
                ),
              )),
              DTColumn(
                widthFlex: 13,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (material) => DataCell(
                  Row(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
