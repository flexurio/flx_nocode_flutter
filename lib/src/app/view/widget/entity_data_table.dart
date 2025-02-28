import 'package:flexurio_no_code/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flexurio_no_code/src/app/model/entity_field.dart';
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flexurio_no_code/src/app/view/page/entity_view/enitity_view_page.dart';
import 'package:flexurio_erp_core/src/app/view/widget/data_list_view.dart';
import 'package:flexurio_no_code/src/app/view/widget/entity_create_button.dart';
import 'package:flexurio_no_code/src/app/view/widget/filter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_no_code/src/app/model/entity.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

class MenuDataTableCustom extends StatefulWidget {
  const MenuDataTableCustom._({
    required this.entity,
    required this.initialFilters,
  });

  static Widget prepare({
    required EntityCustom entity,
    required List<Filter> initialFilters,
  }) {
    return BlocProvider(
      create: (_) => EntityCustomQueryBloc(),
      child: MenuDataTableCustom._(
        entity: entity,
        initialFilters: initialFilters,
      ),
    );
  }

  final EntityCustom entity;
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

  void _fetch([PageOptions<Map<String, dynamic>>? pageOptions]) {
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetch(
            pageOptions: pageOptions,
            filters: _filters,
            method: widget.entity.backend.readAll!.method,
            url: widget.entity.backend.readAll!.url,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      builder: (context, state) {
        return ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return screenIdentifier.conditions(
              md: _buildTableView(
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
              ),
              sm: _buildListView(
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
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildListView({
    required Status status,
    required PageOptions<Map<String, dynamic>> pageOptions,
  }) {
    if (widget.entity.layoutListTile == null) {
      return NoCodeError('layout_list_tile is null');
    }

    final key = widget.entity.layoutListTile!;

    return DataListView(
        actionLeft: [
          _buildFilterInformation(Theme.of(context).colorScheme.primary),
        ],
        actionRight: _buildActionRight,
        onChanged: _fetch,
        onRefresh: _fetch,
        status: status,
        pageOptions: pageOptions,
        builder: (data) {
          return ListTileItem(
            title: key.title == null
                ? null
                : Text(
                    data[key.title],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            subtitle: key.subtitle == null ? null : Text(data[key.subtitle]),
            trailing: key.trailing == null ? null : Text(data[key.trailing]),
          );
        });
  }

  Widget _buildTableView({
    required Status status,
    required PageOptions<Map<String, dynamic>> pageOptions,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DataTableBackend<Map<String, dynamic>>(
        freezeFirstColumn: true,
        freezeLastColumn: true,
        key: ValueKey(pageOptions.hashCode),
        status: status,
        pageOptions: pageOptions,
        onChanged: _fetch,
        onRefresh: _fetch,
        actionLeft: [
          _buildFilterInformation(Theme.of(context).colorScheme.primary),
        ],
        actionRight: _buildActionRight,
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
  }

  List<Widget> _buildActionRight(Widget refreshButton) {
    return [
      _buildButtonExports(),
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
    ];
  }

  Widget _buildButtonExports() {
    final exportButtons = widget.entity.exports
        .map((e) => e.buildButton(filters: _filters))
        .toList();
    if (exportButtons.isEmpty) return const SizedBox();
    return LightButtonSmallGroup(
      action: DataAction.export,
      childrenList: exportButtons,
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

class NoCodeError extends StatelessWidget {
  const NoCodeError(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.red, width: 6),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: Colors.red),
          Gap(6),
          Text(message, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
