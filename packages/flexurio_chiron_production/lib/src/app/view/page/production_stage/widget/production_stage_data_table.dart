import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionStageDataTable extends StatelessWidget {
  const ProductionStageDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionStageQueryBloc()
            ..add(const ProductionStageQueryEvent.fetch()),
        ),
      ],
      child: const ProductionStageDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductionStageQueryBloc, ProductionStageQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductionStage>(
            onChanged: (pageOptions) {
              context.read<ProductionStageQueryBloc>().add(
                    ProductionStageQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            key: ValueKey(state.hashCode),
            onRefresh: () => context
                .read<ProductionStageQueryBloc>()
                .add(const ProductionStageQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (pageOptions) => pageOptions,
              loading: (pageOptions) => pageOptions,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              loaded: (_) => Status.loaded,
              loading: (_) => Status.progress,
              orElse: () => Status.error,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const ProductionStageCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (productionStage) => DataCell(
                  Text(productionStage.id.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  backendColumn: 'name',
                  label: 'name'.tr(),
                ),
                body: (productionStage) => DataCell(
                  Text(productionStage.name),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                ),
                body: (productionStage) => DataCell(
                  Text(
                    productionStage.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                ),
                body: (productionStage) => DataCell(
                  Text(
                    productionStage.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: null,
                  label: 'actions'.tr(),
                ),
                body: (productionStage) => DataCell(
                  Row(
                    children: [
                      ProductionStageDetailButton(
                        productionStage: productionStage,
                      ),
                      ProductionStageUpdateButton(
                          productionStage: productionStage,),
                      ProductionStageDeleteButton.prepare(
                          id: productionStage.id,),
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
