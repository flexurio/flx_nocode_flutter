import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/model/entity.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/running_rate_versus_target/widget/fsm_running_rate_versus_target.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/running_rate_versus_target/widget/national_running_rate_versus_target.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RunningRateVersusTargetPage extends StatelessWidget {
  const RunningRateVersusTargetPage._();

  static Widget prepare() {
    return const RunningRateVersusTargetPage._();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      children: [
        TitlePage(entity: EntityMarketing.runningRateVersusTarget),
        const Gap(24),
        NationalRunningRateVersusTarget.prepare(),
        const Gap(24),
        FsmRateVersusTarget.prepare(
          chartHeight: 300,
          category: FieldForceSummaryCategory.target,
          categorySub: FieldForceSummaryCategorySub.salesVersusTarget,
          position: MarketingPositionE.sm,
        ),
        const Gap(24),
        FsmRateVersusTarget.prepare(
          category: FieldForceSummaryCategory.target,
          categorySub: FieldForceSummaryCategorySub.salesVersusTarget,
          position: MarketingPositionE.am,
          chartHeight: 900,
        ),
      ],
    );
  }
}
