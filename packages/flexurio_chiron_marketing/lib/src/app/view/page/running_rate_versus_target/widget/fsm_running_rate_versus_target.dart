import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/summary_field_force_2_query_bloc/summary_field_force_2_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/running_rate_versus_target_detail/running_rate_versus_target_detail_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FsmRateVersusTarget extends StatefulWidget {
  const FsmRateVersusTarget._(
    this.category,
    this.categorySub,
    this.position,
    this.chartHeight,
  );

  static Widget prepare({
    required FieldForceSummaryCategory category,
    required FieldForceSummaryCategorySub categorySub,
    required MarketingPositionE position,
    required double chartHeight,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SummaryFieldForce2QueryBloc(),
          child: Container(),
        ),
      ],
      child:
          FsmRateVersusTarget._(category, categorySub, position, chartHeight),
    );
  }

  final FieldForceSummaryCategory category;
  final FieldForceSummaryCategorySub categorySub;
  final MarketingPositionE position;
  final double chartHeight;

  @override
  State<FsmRateVersusTarget> createState() => _FsmRateVersusTargetState();
}

class _FsmRateVersusTargetState extends State<FsmRateVersusTarget> {
  DateTime _date = DateTime(0);

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _fetchData();
  }

  void _fetchData() {
    context.read<SummaryFieldForce2QueryBloc>().add(
          SummaryFieldForce2QueryEvent.fetch(
            category: widget.category,
            categorySub: widget.categorySub,
            position: widget.position,
            dateStart: _date,
            dateEnd: _date,
          ),
        );
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
                  'running_rate_versus_target_title'
                      .tr(namedArgs: {'section': widget.position.id}),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
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
          SizedBox(
            height: widget.chartHeight,
            child: Center(child: _buildChart()),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    return BlocBuilder<SummaryFieldForce2QueryBloc,
        SummaryFieldForce2QueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final list = List<FieldForceSummary>.from(data)
              ..sort(
                (a, b) =>
                    double.parse(b.amount).compareTo(double.parse(a.amount)),
              );
            return SfCartesianChart(
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: _tooltipBuilder,
              ),
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.compactCurrency(symbol: 'IDR '),
              ),
              series: <BarSeries<FieldForceSummary, String>>[
                BarSeries(
                  onPointTap: (details) {
                    final areaCode = list[details.pointIndex!].areaCode;
                    Navigator.push(
                      context,
                      RunningRateVersusTargetPage.route(
                        date: _date,
                        areaCode: areaCode,
                      ),
                    );
                  },
                  dataSource: list,
                  xValueMapper: (data, _) => data.areaCode,
                  yValueMapper: (data, _) => double.parse(data.amount),
                  color: Colors.blue,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            summaryFf.areaCode,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            double.parse(summaryFf.amount).idr,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
