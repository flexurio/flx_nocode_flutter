import 'dart:async';

import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/inline_filter.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:gap/gap.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  String? _activeLayoutKey;

  @override
  void initState() {
    super.initState();
    _filters.addAll(widget.initialFilters);
    for (final f in widget.entity.filters) {
      if (_filters.any((filter) => filter.reference == f.reference)) {
        continue;
      }
      final defaultValue = f.config['default']?.toString();
      if (defaultValue != null) {
        String? resolvedValue;
        if (defaultValue == 'now') {
          final field = widget.entity.getField(f.reference);
          final format = field?.dateTimeFormat ?? 'yyyy-MM';
          resolvedValue = DateFormat(format).format(DateTime.now());
        } else {
          resolvedValue = defaultValue;
        }
        if (resolvedValue != null) {
          _filters.add(
            Filter(
              reference: f.reference,
              value: resolvedValue,
              backendKey: f.config['backend_key']?.toString(),
            ),
          );
        }
      }
    }
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
            parentData: widget.parentData,
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

        final activeLayoutTable = _activeLayoutKey != null
            ? widget.entity.customeLayout
                .firstWhere((l) => l.key == _activeLayoutKey)
                .layoutTable
            : widget.entity.layoutTable;

        final activeEntity = widget.entity.copyWith(layoutTable: activeLayoutTable);

        return ScreenIdentifierBuilder(
          builder: (context, screenIdentifier) {
            return screenIdentifier.conditions(
              md: MenuDataTableCustomTableView(
                entity: activeEntity,
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
                activeEntity: activeEntity,
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
    required EntityCustom activeEntity,
  }) {
    return DataListView(
      actionLeft: _buildActionLeft(),
      actionRight: _buildActionRight,
      onChanged: _fetch,
      onRefresh: _fetch,
      status: status,
      pageOptions: pageOptions,
      builder: (data) {
        final layoutListTile = activeEntity.layoutListTile;
        if (layoutListTile == null) {
          return NoCodeError('layout_list_tile is null');
        }
        return layoutListTile.build(
          context: context,
          entity: activeEntity,
          data: data,
          onTap: () => _handleItemTap(data, parentData, activeEntity),
          parentData: parentData,
          onRefresh: (ctx) => _fetch(),
          filters: _filters.toMap(),
          bypassPermission: widget.bypassPermission,
        );
      },
    );
  }

  Future<void> _handleItemTap(
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
    EntityCustom activeEntity,
  ) async {
    final actionPrimary = activeEntity.actionPrimary;

    if (actionPrimary != null) {
      await actionPrimary.executeSingle(
        entity: activeEntity,
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
        entity: activeEntity,
        data: data,
        filters: _filters.toMap(),
      ),
    );
    _fetch();
  }

  Widget _buildLayoutSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.entity.customeLayout.map((layout) {
          final isSelected = _activeLayoutKey == layout.key;
          return InkWell(
            onTap: () {
              setState(() {
                if (isSelected) {
                  _activeLayoutKey = null;
                } else {
                  _activeLayoutKey = layout.key;
                }
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: isSelected,
                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (value) {
                    setState(() {
                      if (isSelected) {
                        _activeLayoutKey = null;
                      } else {
                        _activeLayoutKey = layout.key;
                      }
                    });
                  },
                ),
                const Gap(4),
                Text(
                  layout.label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _buildActionLeft() {
    final widgets = <Widget>[];
    final filterWidgets = <Widget>[];

    if (widget.entity.filters.isNotEmpty) {
      final activeFiltersMap = <String, dynamic>{};
      for (final filterItem in _filters) {
        activeFiltersMap[filterItem.reference] = filterItem.value;
      }
      final scopeList = <Map<String, dynamic>>[
        activeFiltersMap,
        ...widget.parentData,
      ];

      for (final f in widget.entity.filters) {
        final fieldRef = f.reference;
        final field = widget.entity.getField(fieldRef);
        if (field == null) continue;

        Filter? currentFilter;
        try {
          currentFilter = _filters.firstWhere((f) => f.reference == fieldRef);
        } catch (_) {}

        filterWidgets.add(
          InlineFilter(
            key: ValueKey('filter_$fieldRef'),
            field: field,
            config: f.config,
            parentData: scopeList,
            initialValue: currentFilter?.value,
            onChanged: (val) => _onInlineFilterChanged(
              fieldRef,
              val,
              backendKey: f.config['backend_key']?.toString(),
            ),
          ),
        );
        filterWidgets.add(const Gap(12));
      }
    }

    if (widget.entity.customeLayout.isNotEmpty) {
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (filterWidgets.isNotEmpty)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: filterWidgets,
              ),
            if (filterWidgets.isNotEmpty) const Gap(12),
            _buildLayoutSelector(),
          ],
        ),
      );
    } else {
      widgets.addAll(filterWidgets);
    }

    if (_filters.isNotEmpty) {
      widgets
          .add(_buildFilterInformation(Theme.of(context).colorScheme.primary));
    }

    return widgets;
  }

  void _onInlineFilterChanged(String ref, String? val, {String? backendKey}) {
    setState(() {
      _filters.removeWhere((f) => f.reference == ref);
      if (val != null && val.isNotEmpty) {
        _filters.add(Filter(reference: ref, value: val, backendKey: backendKey));
      }
    });
    _fetch();
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
        // Skip showing chips for inline filters to avoid duplication
        if (widget.entity.filters.any((e) => e.reference == filter.reference)) {
          return const SizedBox.shrink();
        }

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
