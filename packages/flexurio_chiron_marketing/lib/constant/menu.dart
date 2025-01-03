import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_chiron_marketing/src/app/model/permission.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/running_rate_versus_target/running_rate_versus_target_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

final menu = [
  Menu1(
    label: 'Field Force',
    menu: [
      Menu2(
        label: 'report',
        icon: FontAwesomeIcons.briefcase,
        menu: [
          Menu3(
            label: 'Summary',
            home: MarketingFieldForceSummaryPage.prepare(),
            permission: PermissionMarketing.summaryFieldForceViewMenu,
            permissions: [PermissionMarketing.summaryFieldForceViewMenu],
          ),
          Menu3(
            label: 'running_rate_versus_target',
            home: RunningRateVersusTargetPage.prepare(),
            permission: PermissionMarketing.runningRateVersusTargetViewMenu,
            permissions: [PermissionMarketing.runningRateVersusTargetViewMenu],
          ),
        ],
      ),
    ],
  ),
];
