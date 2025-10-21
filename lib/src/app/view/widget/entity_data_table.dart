import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_create_button.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

import 'error.dart';

class MenuDataTableCustom extends StatefulWidget {
  const MenuDataTableCustom._({
    required this.entity,
    required this.embedded,
    required this.initialFilters,
    required this.bypassPermission,
  });

  static Widget prepare({
    required bool embedded,
    required EntityCustom entity,
    required bool bypassPermission,
    List<Filter> initialFilters = const [],
  }) {
    return BlocProvider(
      create: (_) => EntityCustomQueryBloc(),
      child: MenuDataTableCustom._(
        bypassPermission: bypassPermission,
        entity: entity,
        embedded: embedded,
        initialFilters: initialFilters,
      ),
    );
  }

  final EntityCustom entity;
  final bool embedded;
  final List<Filter> initialFilters;
  final bool bypassPermission;

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
    if (widget.entity.backend.readAll == null) return;
    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetch(
            cachedDurationSeconds: null,
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
    return DataListView(
      actionLeft: _buildActionLeft(),
      actionRight: _buildActionRight,
      onChanged: _fetch,
      onRefresh: _fetch,
      status: status,
      pageOptions: pageOptions,
      builder: (data) {
        if (widget.entity.layoutListTile == null) {
          return NoCodeError('layout_list_tile is null');
        }
        return widget.entity.layoutListTile!.build(
          entity: widget.entity,
          data: data,
          onTap: () async {
            Navigator.push(
              context,
              EntityViewPage.route(
                embedded: true,
                entity: widget.entity,
                data: data,
                filters: Map.fromEntries(_filters
                    .map((e) => MapEntry(e.reference, e.value))
                    .toList()),
              ),
            ).then((value) => _fetch());
          },
        );
      },
    );
  }

  Widget _buildTableView({
    required Status status,
    required PageOptions<Map<String, dynamic>> pageOptions,
  }) {
    final fields = widget.entity.layoutTable.keys.toList();
    final fieldsValue = widget.entity.layoutTable.values.toList();
    if (fields.isEmpty) {
      return NoCodeError('layout_table is empty');
    }

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
        actionLeft: _buildActionLeft(),
        actionRight: _buildActionRight,
        columns: [
          ...List.generate(
            fields.length,
            (index) {
              final field = widget.entity.getField(fields[index]);
              if (field == null) {
                return DTColumn(
                  widthFlex: 1,
                  head: DTHead(label: '<Unknown>', backendKeySort: ''),
                  body: (data) => DataCell(Text('<Unknown>')),
                );
              }

              final width = fieldsValue[index] as int?;
              return DTColumn(
                widthFlex: (width ?? 1).toDouble(),
                head: DTHead(
                  backendKeySort: field.reference,
                  label: field.label,
                  numeric: (field.isNumber) && index != 0,
                ),
                body: (entity) => DataCell(
                  EntityField.buildDisplay(
                    widget.entity,
                    field.reference,
                    entity[field.reference],
                    index != 0
                        ? null
                        : () async {
                            await Navigator.push(
                              context,
                              EntityViewPage.route(
                                embedded: widget.embedded,
                                entity: widget.entity,
                                data: entity,
                                filters: _filters.toMap(),
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
            head: DTHead(label: 'actions'.tr(), backendKeySort: null),
            body: (data) => DataCell(
              Row(
                children: [
                  ActionsButton(
                    children: EntityViewPage.actionsLarge(
                      context: context,
                      data: data,
                      filters: _filters.toMap(),
                      entity: widget.entity,
                      onRefresh: (context) => _fetch(),
                      bypassPermission: widget.bypassPermission,
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

  List<Widget> _buildActionLeft() {
    if (_filters.isEmpty) return const <Widget>[];
    return [
      _buildFilterInformation(Theme.of(context).colorScheme.primary),
    ];
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
          layoutForm: widget.entity.layoutForm.getByType(FormType.create),
          embedded: widget.embedded,
          entity: widget.entity,
          filters: _filters.toMap(),
          bypassPermission: widget.bypassPermission,
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
              onDeleted: () => setState(() => _filters.remove(e)),
            ),
          )
          .toList(),
    );
  }
}
