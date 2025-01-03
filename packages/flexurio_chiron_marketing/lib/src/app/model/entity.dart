import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class EntityMarketing extends EntityY {
  const EntityMarketing({
    required super.titleX,
    required super.subtitleX,
    required super.iconPath,
  });

  static Entity get runningRateVersusTarget => const Entity(
        titleX: 'running_rate_versus_target',
        subtitleX: 'running_rate_versus_target',
        iconPath: 'area-chart',
      );

  static Entity get summaryFieldForce => const Entity(
        titleX: 'summary_field_force',
        subtitleX: 'summary_field_force',
        iconPath: 'chart',
      );
}
