import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionMachineDataTable extends StatelessWidget {
  const ProductionMachineDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionMachineQueryBloc()
            ..add(const ProductionMachineQueryEvent.get()),
        ),
      ],
      child: const ProductionMachineDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductionMachineQueryBloc, ProductionMachineQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductionMachine>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<ProductionMachineQueryBloc>()
                .add(const ProductionMachineQueryEvent.get()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context.read<ProductionMachineQueryBloc>().add(
                    ProductionMachineQueryEvent.get(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              refreshButton,
              const ProductionMachineCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (productionMachine) => DataCell(
                  Text(productionMachine.id.toString()).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'name',
                  label: 'name'.tr(),
                ),
                body: (productionMachine) => DataCell(
                  Text(productionMachine.name),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'asset_no',
                  label: 'asset_no'.tr(),
                ),
                body: (productionMachine) => DataCell(
                  Text(productionMachine.assetNumber ?? ''),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (productionMachine) => DataCell(
                  Text(productionMachine.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                  numeric: true,
                ),
                body: (productionMachine) => DataCell(
                  Text(
                    productionMachine.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (productionMachine) => DataCell(
                  Row(
                    children: [
                      ProductionMachineUpdateButton(
                        productionMachine: productionMachine,
                      ),
                      ProductionMachineDeleteButton.prepare(
                        id: productionMachine.id,
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
