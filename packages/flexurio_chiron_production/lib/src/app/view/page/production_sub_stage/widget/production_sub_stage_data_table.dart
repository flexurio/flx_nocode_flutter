import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage_query/production_sub_stage_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage/widget/activate_deactivate_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage/widget/production_sub_stage_create_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage/widget/production_sub_stage_delete_button.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_sub_stage/widget/production_sub_stage_update_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionSubStageDataTable extends StatelessWidget {
  const ProductionSubStageDataTable._(this.productionStage);

  final ProductionStage productionStage;

  static Widget prepare({
    required ProductionStage productionStage,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionSubStageQueryBloc()
            ..add(ProductionSubStageQueryEvent.fetch(stage: productionStage)),
        ),
      ],
      child: ProductionSubStageDataTable._(productionStage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductionSubStageQueryBloc,
        ProductionSubStageQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<ProductionSubStage>(
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            onRefresh: () {
              context.read<ProductionSubStageQueryBloc>().add(
                    ProductionSubStageQueryEvent.fetch(stage: productionStage),
                  );
            },
            key: ValueKey(state.hashCode),
            data: state.maybeWhen(
              loaded: (tickets) {
                return tickets;
              },
              orElse: () => [],
            ),
            title:
                '${Entity.productionSubStage.title} - ${productionStage.name}',
            search: (productionSubStage) => [
              productionSubStage.id.toString(),
              productionSubStage.name,
            ],
            actionRight: (refreshButton) => [
              refreshButton,
              ProductionSubStageCreateButton(
                productionStage: productionStage,
              ),
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('ID'),
                  sortNum: (productionSubStage) => productionSubStage.id,
                ),
                body: (productionSubStage) => DataCell(
                  Text(productionSubStage.id.toString()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('name'.tr()),
                  sortString: (productionSubStage) => productionSubStage.name,
                ),
                body: (productionSubStage) => DataCell(
                  Text(productionSubStage.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('active'.tr()),
                  sortString: (productionSubStage) =>
                      productionSubStage.isActive.toString(),
                ),
                body: (productionSubStage) => DataCell(
                  BoolIcon(productionSubStage.isActive),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (productionSubStage) =>
                      productionSubStage.createdAt.millisecond,
                ),
                body: (productionSubStage) => DataCell(
                  Text(
                    productionSubStage.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('updated_at'.tr()),
                  sortNum: (productionSubStage) =>
                      productionSubStage.updatedAt.millisecond,
                ),
                body: (productionSubStage) => DataCell(
                  Text(
                    productionSubStage.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('actions'.tr()),
                ),
                body: (productionSubStage) => DataCell(
                  Row(
                    children: [
                      ProductionSubStageActivateDeactivateButton.prepare(
                        productionSubStage,
                      ),
                      ProductionSubStageUpdateButton(
                        productionStage: productionStage,
                        productionSubStage: productionSubStage,
                      ),
                      ProductionSubStageDeleteButton.prepare(
                        id: productionSubStage.id,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
