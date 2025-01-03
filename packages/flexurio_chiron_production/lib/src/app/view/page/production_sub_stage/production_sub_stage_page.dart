import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage/widget/production_sub_stage_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductionSubStagePage extends StatelessWidget {
  const ProductionSubStagePage._({required this.productionStage});

  final ProductionStage productionStage;

  static Route<void> route({
    required ProductionStage productionStage,
  }) {
    return MaterialPageRoute(
      builder: (context) => ProductionSubStagePage._(
        productionStage: productionStage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          Row(
            children: [
              const BackButton(),
              const Gap(10),
              Text(
                '${Entity.productionSubStage.title} - ${productionStage.name}',
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ProductionSubStageDataTable.prepare(
              productionStage: productionStage,
            ),
          ),
        ],
      ),
    );
  }
}
