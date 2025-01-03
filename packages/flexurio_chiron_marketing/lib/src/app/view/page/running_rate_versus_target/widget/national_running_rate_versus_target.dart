import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/national_sales_versus_target_query_bloc/national_sales_versus_target_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NationalRunningRateVersusTarget extends StatefulWidget {
  const NationalRunningRateVersusTarget._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NationalSalesVersusTargetBloc(),
          child: Container(),
        ),
      ],
      child: const NationalRunningRateVersusTarget._(),
    );
  }

  @override
  State<NationalRunningRateVersusTarget> createState() =>
      _NationalRunningRateVersusTargetState();
}

class _NationalRunningRateVersusTargetState
    extends State<NationalRunningRateVersusTarget> {
  DateTime _date = DateTime(0);
  bool _accumulation = true;
  bool _showSales = true;
  bool _showTarget = true;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _fetchData();
  }

  void _fetchData() {
    context
        .read<NationalSalesVersusTargetBloc>()
        .add(NationalSalesVersusTargetEvent.fetch(date: _date));
  }

  @override
  Widget build(BuildContext context) {
    return FCard(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'running_rate_versus_target'
                      .tr(namedArgs: {'section': 'national'.tr()}),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  ToggleDimension(
                    category: FieldForceSummaryCategory.sales,
                    active: _showSales,
                    onTap: () => setState(() => _showSales = !_showSales),
                    small: true,
                  ),
                  const Gap(12),
                  ToggleDimension(
                    category: FieldForceSummaryCategory.target,
                    active: _showTarget,
                    onTap: () => setState(() => _showTarget = !_showTarget),
                    small: true,
                  ),
                ],
              ),
              const Gap(48),
              DropDownSmallYearMonth(
                initialValue: _date,
                maxDate: DateTime.now(),
                labelText: 'period'.tr(),
                onChanged: (DateTime date) {
                  _date = date;
                  _fetchData();
                },
              ),
            ],
          ),
          const Gap(24),
          CheckboxWithText(
            initialValue: true,
            text: 'accumulation'.tr(),
            onChanged: (value) {
              setState(() {
                _accumulation = value;
              });
            },
          ),
          const Gap(24),
          SizedBox(height: 300, child: Center(child: _buildChart())),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return BlocBuilder<NationalSalesVersusTargetBloc,
        NationalTargetVersusSalesQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (sales, target) {
            sales = List.from(sales)..sort((a, b) => a.date.compareTo(b.date));
            target = List.from(target)
              ..sort((a, b) => a.date.compareTo(b.date));

            if (_accumulation) {
              var salesAmount = 0.0;
              for (var i = 0; i < sales.length; i++) {
                salesAmount += double.parse(sales[i].amount);
                sales[i] = sales[i].copyWith(amount: salesAmount.toString());
              }

              var targetAmount = 0.0;
              for (var i = 0; i < target.length; i++) {
                targetAmount += double.parse(target[i].amount);
                target[i] = target[i].copyWith(amount: targetAmount.toString());
              }
            }

            return SfCartesianChart(
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.compactCurrency(symbol: 'IDR '),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: _tooltipBuilder,
              ),
              primaryXAxis: CategoryAxis(
                axisLabelFormatter: (axis) {
                  final date =
                      DateTime(_date.year, _date.month, int.parse(axis.text));
                  final isWeekend = date.weekday == DateTime.saturday ||
                      date.weekday == DateTime.sunday;
                  return ChartAxisLabel(
                    axis.text,
                    TextStyle(color: isWeekend ? Colors.red : Colors.black),
                  );
                },
              ),
              series: <SplineAreaSeries<FieldForceSummary, int>>[
                if (_showTarget)
                  SplineAreaSeries(
                    dataSource: target,
                    xValueMapper: (data, _) => data.date,
                    yValueMapper: (data, _) => double.parse(data.amount),
                    markerSettings: const MarkerSettings(isVisible: true),
                    borderColor: FieldForceSummaryCategory.target.color,
                    color:
                        FieldForceSummaryCategory.target.color.withOpacity(0.4),
                  ),
                if (_showSales)
                  SplineAreaSeries(
                    dataSource: sales,
                    xValueMapper: (data, _) => data.date,
                    yValueMapper: (data, _) => double.parse(data.amount),
                    markerSettings: const MarkerSettings(isVisible: true),
                    borderColor: FieldForceSummaryCategory.sales.color,
                    color:
                        FieldForceSummaryCategory.sales.color.withOpacity(0.4),
                  ),
              ],
            );
          },
          loading: CupertinoActivityIndicator.new,
          orElse: SomethingWrong.new,
        );
      },
    );
  }

  Widget _tooltipBuilder(
    dynamic data,
    dynamic point,
    dynamic series,
    int pointIndex,
    int seriesIndex,
  ) {
    final summaryFf = data as FieldForceSummary;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        double.parse(summaryFf.amount).idr,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
