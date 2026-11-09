import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

/// A generic, reusable card/grid view for displaying entity data as KPI/metric
/// cards and key-value text tiles instead of a full data table.
///
/// Particularly suitable for entities that return aggregated summary data
/// (e.g., single row monthly trend summaries).
class EntityCardGridView extends StatefulWidget {
  const EntityCardGridView({
    super.key,
    required this.entity,
    required this.initialFilters,
    required this.parentData,
    this.onRefresh,
  });

  final EntityCustom entity;
  final List<Filter> initialFilters;
  final List<Map<String, dynamic>> parentData;
  final VoidCallback? onRefresh;

  /// Convenience factory to load the entity definition asynchronously by its [entityId]
  /// and render the [EntityCardGridView] wrapped in its [EntityCustomQueryBloc].
  static Widget fromId({
    required String entityId,
    required List<Filter> initialFilters,
    required List<Map<String, dynamic>> parentData,
    VoidCallback? onRefresh,
  }) {
    return FutureBuilder<EntityCustom?>(
      future: EntityCustom.getEntity(entityId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: NoCodeError('${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.done ||
            snapshot.hasData) {
          final entity = snapshot.data;
          if (entity == null) {
            return Center(
              child: NoCodeError('Entity not found! Id: $entityId'),
            );
          }
          return EntityCardGridView.prepare(
            entity: entity,
            initialFilters: initialFilters,
            parentData: parentData,
            onRefresh: onRefresh,
          );
        }
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  /// Wraps [EntityCardGridView] in a dedicated [EntityCustomQueryBloc].
  static Widget prepare({
    required EntityCustom entity,
    required List<Filter> initialFilters,
    required List<Map<String, dynamic>> parentData,
    VoidCallback? onRefresh,
  }) {
    return BlocProvider(
      create: (_) => EntityCustomQueryBloc(),
      child: EntityCardGridView(
        entity: entity,
        initialFilters: initialFilters,
        parentData: parentData,
        onRefresh: onRefresh,
      ),
    );
  }

  @override
  State<EntityCardGridView> createState() => _EntityCardGridViewState();
}

class _EntityCardGridViewState extends State<EntityCardGridView> {
  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    final readAll = widget.entity.backend.readAll;
    if (readAll == null) return;

    context.read<EntityCustomQueryBloc>().add(
          EntityCustomQueryEvent.fetch(
            cachedDurationSeconds: null,
            filters: widget.initialFilters,
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
    final theme = Theme.of(context);

    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          ),
          loading: (_) => const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error) => Center(
            child: NoCodeError(error),
          ),
          loaded: (pageOptions) {
            final dataList = pageOptions.data;
            if (dataList.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    'no_data'.tr(),
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < dataList.length; i++) ...[
                  if (i > 0) const SizedBox(height: 20),
                  _buildDataRowCards(
                    context: context,
                    row: dataList[i],
                    theme: theme,
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildDataRowCards({
    required BuildContext context,
    required Map<String, dynamic> row,
    required ThemeData theme,
  }) {
    final metricFields = <EntityField>[];
    final contextFields = <EntityField>[];

    for (final field in widget.entity.fields) {
      if (field.isNumber || field.action != null) {
        metricFields.add(field);
      } else {
        contextFields.add(field);
      }
    }

    final cardsToRender =
        metricFields.isNotEmpty ? metricFields : widget.entity.fields;
    final badgesToRender =
        metricFields.isNotEmpty ? contextFields : <EntityField>[];

    final isNarrow = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (badgesToRender.isNotEmpty) ...[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (final f in badgesToRender)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x06020617),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 13,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${f.label}: ${row[f.reference] ?? '-'}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF334155),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
        if (isNarrow)
          Column(
            children: [
              for (int i = 0; i < cardsToRender.length; i++) ...[
                if (i > 0) const SizedBox(height: 12),
                _buildMetricCard(
                  context: context,
                  field: cardsToRender[i],
                  row: row,
                  theme: theme,
                ),
              ],
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < cardsToRender.length; i++) ...[
                if (i > 0) const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    context: context,
                    field: cardsToRender[i],
                    row: row,
                    theme: theme,
                  ),
                ),
              ],
            ],
          ),
      ],
    );
  }

  Widget _buildMetricCard({
    required BuildContext context,
    required EntityField field,
    required Map<String, dynamic> row,
    required ThemeData theme,
  }) {
    final rawVal = row[field.reference];
    final formattedVal = _formatValue(rawVal, field, context);
    final isClickable = field.action != null;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isClickable
              ? theme.colorScheme.primary.withValues(alpha: 0.25)
              : const Color(0xFFE2E8F0),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A020617),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          hoverColor: theme.colorScheme.primary.withValues(alpha: 0.03),
          onTap: isClickable
              ? () async {
                  await field.action!.executeSingle(
                    entity: widget.entity,
                    context: context,
                    data: row,
                    parentData: [...widget.parentData, row],
                    onSuccessCallback: () {
                      _fetch();
                      widget.onRefresh?.call();
                    },
                  );
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        field.label,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF64748B),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isClickable)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color:
                              theme.colorScheme.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          size: 13,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  formattedVal,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isClickable) ...[
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lihat Detail',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 15,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatValue(dynamic val, EntityField field, BuildContext context) {
    if (val == null) return '-';
    if (val is num) {
      try {
        final locale = context.locale.toString();
        return NumberFormat.decimalPattern(locale).format(val);
      } catch (_) {
        return NumberFormat('#,##0.##').format(val);
      }
    }
    final str = val.toString();
    final parsed = num.tryParse(str);
    if (parsed != null && field.isNumber) {
      try {
        final locale = context.locale.toString();
        return NumberFormat.decimalPattern(locale).format(parsed);
      } catch (_) {
        return NumberFormat('#,##0.##').format(parsed);
      }
    }
    return str.isEmpty ? '-' : str;
  }
}
