import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_stage_process/widget/data_table_set_3.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageProcessDataTable extends StatelessWidget {
  const ProductionStageProcessDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionStageProcessQueryBloc()
            ..add(const ProductionStageProcessQueryEvent.fetch()),
        ),
      ],
      child: const ProductionStageProcessDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return BlocBuilder<ProductionStageProcessQueryBloc,
        ProductionStageProcessQueryState>(
      builder: (context, state) {
        final datas = state.maybeWhen(
          orElse: () => <ProductionStageProcessGroup>[],
          loaded: (data, group) => group,
        );
        final theme = Theme.of(context);
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet3<ProductionStageProcessGroup>(
            search: (data) => [
              data.line.name,
              data.product.name,
              data.product.productType.name,
            ],
            data: datas,
            status: state.maybeWhen(
              loaded: (_, __) => Status.loaded,
              loading: (_) => Status.progress,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<ProductionStageProcessQueryBloc>()
                .add(const ProductionStageProcessQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            title: 'Production Stage Process',
            actionRight: (refreshButton) => [
              refreshButton,
              const ProductionStageProcessCreateButton(),
            ],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  sortString: (data) => data.line.name,
                  label: Text(
                    'line'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                body: (stageProcess) => DataCell(
                  Text(stageProcess.line.name),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  sortString: (data) => data.product.name,
                  label: Text(
                    'product'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                body: (stageProcess) => DataCell(
                  Text(stageProcess.product.name),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  sortString: (data) => data.type.name,
                  label: Text(
                    'type'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                body: (stageProcess) => DataCell(
                  ChipType(stageProcess.type),
                ),
              ),
              // DTColumn(
              //   head: DTHead(
              //     label: const Text('Stage'),
              //     sortString: (stageProcess) =>
              //         stageProcess.createdAt.toString(),
              //   ),
              //   body: (stageProcess) => DataCell(
              //     Text(stageProcess.productionSubStage.id.toString()),
              //   ),
              // ),
              DTColumnX(
                head: DTHeadX(
                  label: Text(
                    'actions'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                body: (stageProcess) {
                  return DataCell(
                    Row(
                      children: [
                        ProductionStageProcessDetailButton(
                          stageProcessGroup: stageProcess,
                        ),
                        ProductionStageProcessEditButton(
                          stageProcess: stageProcess,
                        ),
                        // ProductionStageProcessDeleteButton.prepare(
                        //   stageProcess: stageProcessGroup,
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
