import 'package:appointment/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:appointment/src/app/model/entity_field.dart';
import 'package:appointment/src/app/model/filter.dart';
import 'package:appointment/src/app/view/page/entity_view/enitity_view_page.dart';
import 'package:appointment/src/app/view/widget/entity_create_button.dart';
import 'package:appointment/src/app/view/widget/filter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appointment/src/app/model/entity.dart' as configuration;

class MenuDataTableCustom extends StatefulWidget {
  const MenuDataTableCustom._({
    required this.entity,
    required this.initialFilters,
  });

  static Widget prepare({
    required configuration.EntityCustom entity,
    required List<Filter> initialFilters,
  }) {
    return BlocProvider(
      create: (_) => EntityCustomQueryBloc(entity),
      child: MenuDataTableCustom._(
        entity: entity,
        initialFilters: initialFilters,
      ),
    );
  }

  final configuration.EntityCustom entity;
  final List<Filter> initialFilters;

  @override
  State<MenuDataTableCustom> createState() => _MenuDataTableCustomState();
}

class _MenuDataTableCustomState extends State<MenuDataTableCustom> {
  var _filters = <Filter>[];

  @override
  void initState() {
    super.initState();
    _filters.addAll(widget.initialFilters);
    _fetch();
  }

  void _fetch({PageOptions<Map<String, dynamic>>? pageOptions}) {
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetch(
            pageOptions: pageOptions,
            filters: _filters,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Map<String, dynamic>>(
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
            actionLeft: [
              _buildFilterInformation(Theme.of(context).colorScheme.primary),
            ],
            actionRight: (refreshButton) => [
              FilterButton(
                fields: widget.entity.fields,
                currentFilters: _filters,
                onFilterChanged: (filters) {
                  _filters = filters;
                  _fetch();
                },
              ),
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
              ...List.generate(
                widget.entity.fields.length,
                (index) {
                  final e = widget.entity.fields.elementAt(index);
                  return DTColumn(
                    widthFlex: e.columnWidth ?? 5,
                    head: DTHead(backendColumn: e.reference, label: e.label),
                    body: (entity) => DataCell(
                      EntityField.buildDisplay(
                        widget.entity,
                        e.reference,
                        entity[e.reference],
                        index != 0
                            ? null
                            : () async {
                                await Navigator.push(
                                  context,
                                  EntityViewPage.route(
                                    entity: widget.entity,
                                    data: entity,
                                  ),
                                );
                                _fetch();
                              },
                      ),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (data) => DataCell(
                  Row(
                    children: [
                      ActionsButton(
                        children: EntityViewPage.actions(
                          context,
                          data,
                          widget.entity,
                          (context) => _fetch(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterInformation(Color primaryColor) {
    return Wrap(
      spacing: 12,
      children: _filters
          .map(
            (e) => Chip(
              side: BorderSide.none,
              backgroundColor: primaryColor,
              label: Text(
                '${e.getLabel(widget.entity)}: ${e.value}',
                style: const TextStyle(color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              onDeleted: () {
                setState(() {
                  _filters.remove(e);
                });
              },
            ),
          )
          .toList(),
    );
  }
}
