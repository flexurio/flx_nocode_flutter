import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RunningRateVersusTargetPage extends StatelessWidget {
  const RunningRateVersusTargetPage._(this.date, this.areaCode);

  final DateTime date;
  final String areaCode;

  static Route<void> route({
    required DateTime date,
    required String areaCode,
  }) {
    return MaterialPageRoute(
      builder: (context) => RunningRateVersusTargetPage._(date, areaCode),
    );
  }

  @override
  Widget build(BuildContext context) {
    final summaryWidgetBloc = FFSWB(
      flag: FieldForceSummaryFlag.all,
      bloc: FieldForceSummaryQueryBloc()
        ..add(
          FieldForceSummaryQueryEvent.fetch(
            periodStart: DateTime(date.year),
            periodEnd: DateTime(date.year + 1).subtract(
              const Duration(milliseconds: 1),
            ),
            areaCode: areaCode,
            filter: FieldForceSummaryFilter(),
          ),
        ),
      areaCode: areaCode,
      title: areaCode,
      periodEnd: DateTime(date.year),
      periodStart: DateTime(date.year + 1).subtract(
        const Duration(milliseconds: 1),
      ),
      categorySub: FieldForceSummaryCategorySub.all,
      index: 0,
    );

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          BackButtonWithTitle(title: 'running_rate_versus_target'.tr()),
          const Gap(24),
          BlocProvider(
            create: (_) => summaryWidgetBloc,
            child: ChartTables(bloc: summaryWidgetBloc),
          ),
        ],
      ),
    );
  }
}
