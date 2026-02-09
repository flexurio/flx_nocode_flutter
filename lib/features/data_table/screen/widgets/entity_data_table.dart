import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

import '../../../../src/app/view/widget/error.dart';
import 'menu_data_table_actions.dart';
import 'menu_data_table_custom_table_view.dart';

class MenuDataTableCustom extends StatefulWidget {
  const MenuDataTableCustom._({
    required this.entity,
    required this.embedded,
    required this.initialFilters,
    required this.bypassPermission,
    required this.parentData,
  });

  static Widget prepare({
    required bool embedded,
    required EntityCustom entity,
    required bool bypassPermission,
    required List<Map<String, dynamic>> parentData,
    List<Filter> initialFilters = const [],
  }) {
    return BlocProvider(
      create: (_) => EntityCustomQueryBloc(),
      child: MenuDataTableCustom._(
        parentData: parentData,
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
  final List<Map<String, dynamic>> parentData;

  @override
  State<MenuDataTableCustom> createState() => _MenuDataTableCustomState();
}

class _MenuDataTableCustomState extends State<MenuDataTableCustom> {
  var _filters = <Filter>[];
  late final PageOptions<Map<String, dynamic>> _initialPageOptions;

  @override
  void initState() {
    super.initState();
    _filters.addAll(widget.initialFilters);
    _initialPageOptions = PageOptions<Map<String, dynamic>>.empty(
      sortBy: widget.entity.paginationOption.sortBy,
      ascending: widget.entity.paginationOption.ascending,
    );
    _fetch(_initialPageOptions);
  }

  void _fetch([PageOptions<Map<String, dynamic>>? pageOptions]) {
    final readAll = widget.entity.backend.readAll;
    if (readAll == null) return;

    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetch(
            cachedDurationSeconds: null,
            pageOptions: pageOptions,
            filters: _filters,
            method: readAll.method,
            url: readAll.url,
            mockEnabled: readAll.mockEnabled,
            mockData: readAll.mockData,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      builder: (context, state) {
        final status = state.map(
          initial: (_) => Status.progress,
          loading: (_) => Status.progress,
          loaded: (_) => Status.loaded,
          error: (_) => Status.error,
        );

        final pageOptions = state.maybeWhen(
          loaded: (data) => data,
          loading: (data) => data,
          orElse: PageOptions<Map<String, dynamic>>.empty,
        );

        return ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return screenIdentifier.conditions(
              md: MenuDataTableCustomTableView(
                entity: widget.entity,
                status: status,
                pageOptions: pageOptions,
                embedded: widget.embedded,
                parentData: widget.parentData,
                bypassPermission: widget.bypassPermission,
                filtersMap: _filters.toMap(),
                actionLeft: _buildActionLeft(),
                actionRightBuilder: _buildActionRight,
                onChanged: _fetch,
                onRefresh: _fetch,
              ),
              sm: _buildListView(
                parentData: widget.parentData,
                status: status,
                pageOptions: pageOptions,
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
    required List<Map<String, dynamic>> parentData,
  }) {
    return DataListView(
      actionLeft: _buildActionLeft(),
      actionRight: _buildActionRight,
      onChanged: _fetch,
      onRefresh: _fetch,
      status: status,
      pageOptions: pageOptions,
      builder: (data) {
        final layoutListTile = widget.entity.layoutListTile;
        if (layoutListTile == null) {
          return NoCodeError('layout_list_tile is null');
        }
        return layoutListTile.build(
          entity: widget.entity,
          data: data,
          onTap: () => _handleItemTap(data, parentData),
        );
      },
    );
  }

  Future<void> _handleItemTap(
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) async {
    final actionPrimary = widget.entity.actionPrimary;

    if (actionPrimary != null) {
      await actionPrimary.executeSingle(
        entity: widget.entity,
        context: context,
        data: data,
        parentData: parentData,
        onSuccessCallback: () => _fetch(),
      );
      return;
    }

    await Navigator.push(
      context,
      EntityViewPage.route(
        parentData: parentData,
        embedded: true,
        entity: widget.entity,
        data: data,
        filters: _filters.toMap(),
      ),
    );
    _fetch();
  }

  List<Widget> _buildActionLeft() {
    if (_filters.isEmpty) return const <Widget>[];
    return [
      _buildFilterInformation(Theme.of(context).colorScheme.primary),
    ];
  }

  List<Widget> _buildActionRight(Widget refreshButton) {
    return [
      MenuDataTableActions(
        entity: widget.entity,
        parentData: widget.parentData,
        embedded: widget.embedded,
        bypassPermission: widget.bypassPermission,
        filters: _filters,
        refreshButton: refreshButton,
        onFilterChanged: (filters) {
          _filters = filters;
          _fetch();
        },
        onRefresh: _fetch,
      ),
    ];
  }

  Widget _buildFilterInformation(Color primaryColor) {
    if (_filters.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 12,
      children: _filters.map((filter) {
        final label = filter.getLabel(widget.entity);
        return Chip(
          side: BorderSide.none,
          backgroundColor: primaryColor,
          label: Text(
            '$label: ${filter.value}',
            style: const TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          onDeleted: () {
            setState(() => _filters.remove(filter));
            _fetch();
          },
        );
      }).toList(),
    );
  }
}
