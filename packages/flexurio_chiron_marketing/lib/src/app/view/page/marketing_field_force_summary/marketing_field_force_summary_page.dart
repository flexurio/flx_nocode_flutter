import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_detail_query/field_force_summary_detail_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_query/field_force_summary_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_query_filter/field_force_summary_query_filter_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_widget/field_force_summary_widget_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/summary_field_force_report_ebitda_query/summary_field_force_report_ebitda_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/summary_field_force_report_query/summary_field_force_report_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/model/entity.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/chart_tables.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/filter_form.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/summary_field_force_report_data.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/summary_field_force_report_data_ebitda.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MarketingFieldForceSummaryPage extends StatefulWidget {
  const MarketingFieldForceSummaryPage._();

  static Widget prepare() {
    final now = DateTime.now();
    final periodStart = DateTime(now.year);
    final periodEnd = DateTime(now.year, now.month);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SummaryFieldForceReportQueryBloc()
            ..add(
              SummaryFieldForceReportQueryEvent.fetch(
                periodStart: int.parse(periodStart.formatPeriod),
                periodEnd: int.parse(periodEnd.formatPeriod),
                areaCode: 'BDGA1',
                jab: 'AM',
              ),
            ),
        ),
        BlocProvider(
          create: (context) => SummaryFieldForceReportEbitdaQueryBloc()
            ..add(
              SummaryFieldForceReportEbitdaQueryEvent.fetch(
                periodStart: int.parse(periodStart.formatPeriod),
                periodEnd: int.parse(periodEnd.formatPeriod),
                areaCode: 'BDGA1',
                jab: 'ASM',
              ),
            ),
        ),
        BlocProvider(
          create: (context) => FieldForceSummaryQueryBloc()
            ..add(
              FieldForceSummaryQueryEvent.fetch(
                  periodEnd: periodEnd,
                  periodStart: periodStart,
                  areaCode: 'BDGA1',
                  filter: FieldForceSummaryFilter(),),
            ),
        ),
        BlocProvider(
          create: (context) => FieldForceSummaryQueryFilterBloc(
            FieldForceSummaryQueryFilterState(
              areaCode: 'BDGA1',
              periodEnd: periodEnd,
              periodStart: periodStart,
            ),
          ),
        ),
        BlocProvider(create: (context) => FieldForceSummaryDetailQueryBloc()),
      ],
      child: const MarketingFieldForceSummaryPage._(),
    );
  }

  @override
  State<MarketingFieldForceSummaryPage> createState() =>
      _MarketingFieldForceSummaryPageState();
}

class _MarketingFieldForceSummaryPageState
    extends State<MarketingFieldForceSummaryPage> {
  @override
  Widget build(BuildContext context) {
    final summaryBloc = context.read<FieldForceSummaryQueryBloc>();
    final filterBloc = context.read<FieldForceSummaryQueryFilterBloc>();
    final summaryEbitda =
        context.read<SummaryFieldForceReportEbitdaQueryBloc>();
    final summaryYearBloc = context.read<SummaryFieldForceReportQueryBloc>();

    return ContentWithRightPanel(
      key: ValueKey(Entity.purchaseOrder.title),
      rightPanel: Padding(
        padding: const EdgeInsets.all(24),
        child: FilterForm.prepare(
          summaryBloc: summaryBloc,
          filterBloc: filterBloc,
          summaryEbitdaBloc: summaryEbitda,
          summaryYearBloc: summaryYearBloc,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          TitlePage(entity: EntityMarketing.summaryFieldForce),
          const Gap(12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: _buildContent(summaryBloc),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return const SizedBox(
      child: ContentTransaction(
        indicator: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _noDataAvailable() {
    return SizedBox(
      child: Column(
        children: [
          const ContentTransaction(),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: paddingHorizontalPage,
                  ),
                  alignment: Alignment.center,
                  child: const Row(
                    children: [
                      Text(
                        'No Data Available',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildContent(FieldForceSummaryQueryBloc summaryBloc) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        BlocBuilder<SummaryFieldForceReportQueryBloc,
            SummaryFieldForceReportQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (
                summaryFieldForce,
                periodStart,
                periodEnd,
                areaCode,
                jab,
              ) {
                return SummaryFieldForceReportData(
                  summaryFieldForces: summaryFieldForce,
                  periodStart: periodStart!,
                  periodEnd: periodEnd!,
                  areaCode: areaCode!,
                  jab: jab!,
                );
              },
              loading: _loading,
              orElse: _noDataAvailable,
            );
          },
        ),
        const Gap(20),
        BlocBuilder<SummaryFieldForceReportEbitdaQueryBloc,
            SummaryFieldForceReportEbitdaQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (
                summaryFieldForce,
                periodStart,
                periodEnd,
                areaCode,
                jab,
              ) {
                return SummaryFieldForceReportDataEbitda(
                  summaryFieldForces: summaryFieldForce,
                  periodStart: periodStart!,
                  periodEnd: periodEnd!,
                  areaCode: areaCode!,
                  jab: jab!,
                );
              },
              loading: _loading,
              orElse: _noDataAvailable,
            );
          },
        ),
        const Gap(20),
        BlocBuilder<FieldForceSummaryQueryFilterBloc,
            FieldForceSummaryQueryFilterState>(
          builder: (context, state) {
            final summaryWidgetBloc = FFSWB(
              bloc: summaryBloc,
              areaCode: state.areaCode,
              title: state.areaCode,
              periodEnd: state.periodEnd,
              periodStart: state.periodStart,
              categorySub: FieldForceSummaryCategorySub.all,
              flag: FieldForceSummaryFlag.all,
              index: 0,
            );
            return BlocProvider(
              create: (_) => summaryWidgetBloc,
              child: ChartTables(bloc: summaryWidgetBloc),
            );
          },
        ),
      ],
    );
  }
}

class SummaryFieldForceFlow extends StatelessWidget {
  const SummaryFieldForceFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ContentTransaction extends StatelessWidget {
  const ContentTransaction({
    this.indicator,
    super.key,
  });

  final CupertinoActivityIndicator? indicator;

  @override
  Widget build(BuildContext context) {
    return FCard(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 420,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 420,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                        right: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingHorizontalPage,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Text(
                          'Transactions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (indicator != null) const Gap(12),
                        if (indicator != null) indicator! else const Gap(10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
