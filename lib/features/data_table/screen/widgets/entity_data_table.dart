import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_list_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_create_button.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

import '../../../../src/app/view/widget/error.dart';
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
            final status = state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            );

            final pageOptions = state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions<Map<String, dynamic>>.empty,
            );

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
                parentData: parentData,
                embedded: true,
                entity: widget.entity,
                data: data,
                filters: Map.fromEntries(
                  _filters.map((e) => MapEntry(e.reference, e.value)).toList(),
                ),
              ),
            ).then((value) => _fetch());
          },
        );
      },
    );
  }

  List<Widget> _buildActionLeft() {
    if (_filters.isEmpty) return const <Widget>[];
    return [
      _buildFilterInformation(Theme.of(context).colorScheme.primary),
    ];
  }

  List<Widget> _buildHomeActions() {
    final buttons = <Widget>[];
    final actions = widget.entity.layoutForm.homeActionForms;
    for (final action in actions) {
      buttons.add(
        LightButtonSmall(
          title: action.label,
          action: DataAction.reprocess,
          permissions: null,
          onPressed: () async {
            await Navigator.push(
              context,
              EntityCreatePage.route(
                layoutForm: action,
                entity: widget.entity,
                onSuccess: () => _fetch(),
                embedded: false,
                parentData: widget.parentData,
                filters: {},
              ),
            );
          },
        ),
      );
    }
    return buttons;
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
      ..._buildHomeActions(),
      refreshButton,
      if (widget.entity.allowCreate)
        EntityCreateButton(
          parentData: widget.parentData,
          layoutForm: widget.entity.layoutForm.getByType(FormType.create),
          embedded: widget.embedded,
          entity: widget.entity,
          filters: _filters.toMap(),
          bypassPermission: widget.bypassPermission,
          onSuccess: () => _fetch(),
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
