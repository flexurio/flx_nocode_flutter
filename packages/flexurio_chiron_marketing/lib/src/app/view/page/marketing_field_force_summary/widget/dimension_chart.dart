import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_detail_query/field_force_summary_detail_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_query/field_force_summary_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_widget/field_force_summary_widget_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/card_tab.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/chart_tables.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/summary_tables_per_month.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class DimensionChart extends StatefulWidget {
  const DimensionChart._({
    required this.areaCode,
    required this.periodStart,
    required this.periodEnd,
    required this.bloc,
    required this.title,
    required this.index,
    required this.filter,
    required this.flag,
    this.sales = const [],
    this.estimation = const [],
    this.target = const [],
    this.call = const [],
  });

  final List<FieldForceSummary> sales;
  final List<FieldForceSummary> estimation;
  final List<FieldForceSummary> target;
  final List<FieldForceSummary> call;

  final String areaCode;
  final DateTime periodStart;
  final DateTime periodEnd;
  final FieldForceSummaryQueryBloc bloc;
  final String title;
  final int index;
  final FieldForceSummaryFilter filter;
  final FieldForceSummaryFlag flag;

  static Widget prepare({
    required FieldForceSummaryQueryBloc bloc,
    required String areaCode,
    required DateTime periodStart,
    required DateTime periodEnd,
    required String title,
    required int index,
    required FieldForceSummaryCategorySub categorySub,
    required FieldForceSummaryFlag flag,
  }) {
    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        return SizedBox(
          height: screenIdentifier.conditions(md: 460, sm: 350),
          child: BlocBuilder<FieldForceSummaryQueryBloc,
              FieldForceSummaryQueryState>(
            bloc: bloc,
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (sales, target, estimation, call, filter) {
                  return DimensionChart._(
                    sales: sales,
                    target: target,
                    call: call,
                    estimation: estimation,
                    filter: filter,
                    areaCode: areaCode,
                    periodStart: periodStart,
                    periodEnd: periodEnd,
                    bloc: bloc,
                    title: title,
                    index: index,
                    flag: flag,
                  );
                },
                error: (error) => const SomethingWrong(),
                orElse: () => const Center(child: CupertinoActivityIndicator()),
              );
            },
          ),
        );
      },
    );
  }

  @override
  State<DimensionChart> createState() => _DimensionChartState();
}

class _DimensionChartState extends State<DimensionChart> {
  bool _showEstimation = true;
  bool _showTarget = true;
  bool _showCall = true;
  bool _showSales = true;

  @override
  void initState() {
    super.initState();
  }

  void _onPointTap(
    ChartPointDetails details,
    FieldForceSummaryCategory category,
    FieldForceSummaryFilter filter,
  ) {
    final summary = widget.sales[details.pointIndex!];
    final detailBloc = FieldForceSummaryDetailQueryBloc()
      ..add(
        FieldForceSummaryDetailQueryEvent.fetch(
          areaCode: summary.areaCode,
          period: summary.dateTime,
          category: category,
          filter: filter,
        ),
      );

    final period = DateTime(summary.year, summary.month);
    final cardItem = CardTabItem(
      name: '${category.en} | ${period.yMMMM}',
      child: (onSelectedRow) {
        return Column(
          children: [
            SummaryTablesPerMonth(
              onSelectedRow: (summary, flag) {
                final (outletId, _) = summary.outlet;
                final (productId, _) = summary.product;
                final (customerId, _) = summary.customer;

                if (outletId != null &&
                    productId != null &&
                    customerId != null) {
                  Toast(context).notify('reached_limit'.tr());
                  return;
                }

                final bloc = FFSWB(
                  categorySub: summary.categorySub,
                  title: summary.flag1Desc,
                  index: 1,
                  areaCode: widget.areaCode,
                  flag: flag,
                  bloc: FieldForceSummaryQueryBloc()
                    ..add(FieldForceSummaryQueryEvent.addFilter(data: summary))
                    ..add(
                      FieldForceSummaryQueryEvent.fetch(
                        periodEnd: widget.periodEnd,
                        periodStart: widget.periodStart,
                        areaCode: widget.areaCode,
                        filter: filter.copyWith(
                          product: productId,
                          outlet: outletId,
                          customer: customerId,
                        ),
                      ),
                    ),
                  periodEnd: widget.periodEnd,
                  periodStart: widget.periodStart,
                );

                onSelectedRow(
                  CardTab(
                    initialPage: 0,
                    items: [
                      CardTabItem(
                        name: summary.flag1Desc,
                        child: (onSelectedRow) {
                          return BlocProvider(
                            create: (context) => bloc,
                            child: ChartTables(bloc: bloc),
                          );
                        },
                      ),
                    ],
                    onPageAdded: (page) {},
                    onPageChanged: (page) {
                      final event = FFSWE.switchPageSub(page);
                      context.read<FFSWB>().add(event);
                    },
                    onPageRemoved: (page) {
                      final event = FFSWE.removeSub(page);
                      context.read<FFSWB>().add(event);
                    },
                  ),
                );
              },
              bloc: detailBloc,
              areaCode: widget.areaCode,
              periodStart: period,
              periodEnd: period,
              category: category,
            ),
          ],
        );
      },
    );
    context.read<FFSWB>().add(FFSWE.add(cardItem));
  }

  Widget _tooltipBuilder(
    dynamic data,
    dynamic point,
    dynamic series,
    int pointIndex,
    int seriesIndex,
  ) {
    final summaryFf = data as FieldForceSummary;
    final amount = summaryFf.amount;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        [FieldForceSummaryCategory.call].contains(summaryFf.category)
            ? amount
            : double.parse(amount).idr,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FCard(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenIdentifierBuilder(
            builder: (context, screenIdentifier) {
              return screenIdentifier.conditions(
                xs: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(12),
                    _buildTitle(widget.title, widget.flag),
                    Row(children: [const Spacer(), _legends()]),
                  ],
                ),
                sm: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(child: _buildTitle(widget.title, widget.flag)),
                      _legends(),
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ScreenIdentifierBuilder(
                    builder: (context, screenIdentifier) {
                      return SfCartesianChart(
                        enableAxisAnimation: true,
                        primaryXAxis: const CategoryAxis(),
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          builder: _tooltipBuilder,
                        ),
                        onSelectionChanged: (selectionArgs) {},
                        series: [
                          if (_showSales)
                            _buildData(
                              widget.sales,
                              FieldForceSummaryCategory.sales,
                              widget.filter,
                              screenIdentifier,
                            ),
                          if (_showEstimation)
                            _buildData(
                              widget.estimation,
                              FieldForceSummaryCategory.estimation,
                              widget.filter,
                              screenIdentifier,
                            ),
                          if (_showTarget)
                            _buildData(
                              widget.target,
                              FieldForceSummaryCategory.target,
                              widget.filter,
                              screenIdentifier,
                            ),
                          if (_showCall)
                            _buildData(
                              widget.call,
                              FieldForceSummaryCategory.call,
                              widget.filter,
                              screenIdentifier,
                            ),
                        ],
                      );
                    },
                  ),
                ),
                const Gap(12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _legends() {
    return Row(
      children: [
        ToggleDimension(
          category: FieldForceSummaryCategory.estimation,
          active: _showEstimation,
          onTap: () {
            setState(() => _showEstimation = !_showEstimation);
          },
        ),
        const Gap(12),
        ToggleDimension(
          category: FieldForceSummaryCategory.sales,
          active: _showSales,
          onTap: () => setState(() => _showSales = !_showSales),
        ),
        const Gap(12),
        ToggleDimension(
          category: FieldForceSummaryCategory.target,
          active: _showTarget,
          onTap: () => setState(() => _showTarget = !_showTarget),
        ),
        const Gap(12),
        ToggleDimension(
          category: FieldForceSummaryCategory.call,
          active: _showCall,
          onTap: () => setState(() => _showCall = !_showCall),
        ),
      ],
    );
  }

  LineSeries<FieldForceSummary, String> _buildData(
    List<FieldForceSummary> data,
    FieldForceSummaryCategory category,
    FieldForceSummaryFilter filter,
    ScreenIdentifier screenIdentifier,
  ) {
    return LineSeries<FieldForceSummary, String>(
      dataSource: data,
      onPointTap: (details) => _onPointTap(details, category, filter),
      markerSettings: const MarkerSettings(isVisible: true),
      color: category.color,
      xValueMapper: (data, _) {
        final dateFormat = screenIdentifier.conditions(
          md: DateFormat('MMMM yyyy'),
          sm: DateFormat('MMM yyyy'),
          xs: DateFormat('MMM yy'),
        );
        final label = dateFormat.format(data.dateTime);
        return label;
      },
      yValueMapper: (data, _) => data.scale,
    );
  }
}

Widget _buildTitle(String title, FieldForceSummaryFlag? flag) {
  return Row(
    children: [
      if (flag != null)
        Padding(padding: const EdgeInsets.only(right: 24), child: flag.icon),
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ],
  );
}

class ToggleDimension extends StatelessWidget {
  const ToggleDimension({
    required this.category,
    required this.onTap,
    required this.active,
    this.small = false,
    super.key,
  });

  final FieldForceSummaryCategory category;
  final void Function() onTap;
  final bool active;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: small ? 3 : 14,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: active ? category.color : Colors.grey.shade300,
              width: 3,
            ),
          ),
        ),
        child: Text(category.en),
      ),
    );
  }
}
