import 'package:flexurio_chiron_material_stock/src/app/bloc/material_rates_query/material_retest_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest/widget/material_retest_create_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest/widget/material_retest_update_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRetestsDataTable extends StatelessWidget {
  const MaterialRetestsDataTable({
    required this.materialRetestsBloc,
    super.key,
  });

  final MaterialRetestQueryBloc materialRetestsBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialRetestQueryBloc, MaterialRetestQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialRetest>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () {
              context
                  .read<MaterialRetestQueryBloc>()
                  .add(const MaterialRetestQueryEvent.fetch());
            },
            actionRight: (refreshButton) => [
              refreshButton,
              const MaterialRetestsCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Date In',
                  backendColumn: 'created_at',
                ),
                body: (materialRetests) => DataCell(
                  Text(materialRetests.createdAt.yMMMM),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Material Group',
                  backendColumn: 'material_group_id',
                ),
                body: (materialRetests) => DataCell(
                  Text(
                    materialRetests.materialGroup.id,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Material ID',
                  backendColumn: 'material_id',
                ),
                body: (materialRetests) => DataCell(
                  Text(
                    materialRetests.material.id,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'NA',
                  backendColumn: 'na',
                ),
                body: (materialRetests) => DataCell(
                  Text(
                    materialRetests.na,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  numeric: true,
                  label: 'Quantity',
                  backendColumn: 'quantity_retest',
                ),
                body: (materialRetests) => DataCell(
                  Text(
                    materialRetests.quantityRetest.toString(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'status',
                ),
                body: (materialRetests) =>
                    DataCell(ChipType(materialRetests.status)),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Expired Date',
                  backendColumn: 'expired_date',
                ),
                body: (materialRetests) => DataCell(
                  Text(
                    materialRetests.expiredDate.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Retest Date',
                  backendColumn: 'retest_date',
                ),
                body: (materialRetests) => DataCell(
                  Text(
                    materialRetests.retestDate.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: null,
                ),
                body: (materialRetests) => DataCell(
                  Row(
                    children: [
                      if (materialRetests.status == MaterialRetestStatus.retest)
                        MaterialRetestsUpdateButton(
                          materialRetests: materialRetests,
                        ),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (pageOptions) {
              context.read<MaterialRetestQueryBloc>().add(
                    MaterialRetestQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
          ),
        );
      },
    );
  }
}
