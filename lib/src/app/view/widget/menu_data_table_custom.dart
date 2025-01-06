import 'package:appointment/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/src/app/model/configuration.dart' as configuration;

class MenuDataTableCustom extends StatefulWidget {
  const MenuDataTableCustom._({
    super.key,
    required this.entity,
  });

  static Widget prepare({
    required configuration.Entity entity,
  }) {
    return BlocProvider(
      create: (_) => EntityCustomQueryBloc(entity),
      child: MenuDataTableCustom._(entity: entity),
    );
  }

  final configuration.Entity entity;

  @override
  State<MenuDataTableCustom> createState() => _MenuDataTableCustomState();
}

class _MenuDataTableCustomState extends State<MenuDataTableCustom> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Map>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context.read<EntityCustomQueryBloc>().add(
                  EntityCustomQueryEvent.fetch(),
                ),
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
              context.read<EntityCustomQueryBloc>().add(
                    EntityCustomQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            actionLeft: [],
            actionRight: (refreshButton) => [
              refreshButton,
            ],
            columns: [
              ...(widget.entity.fields.map(
                (e) => DTColumn(
                  widthFlex: 10,
                  head: DTHead(
                    backendColumn: e.reference,
                    label: e.label,
                  ),
                  body: (entity) => DataCell(Text(entity[e.reference])),
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
