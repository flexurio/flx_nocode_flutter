import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';

class ProductionStageProcessDetail {
  ProductionStageProcessDetail({
    required this.id,
    required this.leadTime,
    required this.machine,
    required this.stage,
    required this.subStage,
    required this.order,
  });

  final int id;
  final double leadTime;
  final int order;
  final ProductionMachine machine;
  final ProductionStage stage;
  final ProductionSubStage subStage;
}
