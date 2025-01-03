import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionLineDataTable extends StatelessWidget {
  const ProductionLineDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionLineQueryBloc()
            ..add(const ProductionLineQueryEvent.get()),
        ),
      ],
      child: const ProductionLineDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductionLineQueryBloc, ProductionLineQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductionLine>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<ProductionLineQueryBloc>()
                .add(const ProductionLineQueryEvent.get()),
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
              context
                  .read<ProductionLineQueryBloc>()
                  .add(const ProductionLineQueryEvent.get());
            },
            actionRight: (refreshButton) => [
              refreshButton,
              const ProductionLineCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (productionLine) => DataCell(
                  Text(productionLine.id.toString()).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'name',
                  label: 'name'.tr(),
                ),
                body: (productionLine) => DataCell(
                  Text(productionLine.name),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (productionLine) => DataCell(
                  Text(productionLine.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                  numeric: true,
                ),
                body: (productionLine) => DataCell(
                  Text(
                    productionLine.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (productionLine) => DataCell(
                  Row(
                    children: [
                      ProductionLineUpdateButton(
                        productionLine: productionLine,
                      ),
                      ProductionLineDeleteButton.prepare(id: productionLine.id),
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
