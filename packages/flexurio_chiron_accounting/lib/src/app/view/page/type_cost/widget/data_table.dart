import 'package:flexurio_chiron_accounting/src/app/bloc/type_cost_query/type_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/type_cost.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/type_cost/widget/create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/type_cost/widget/delete_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeCostDataTable extends StatelessWidget {
  const TypeCostDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) =>
          TypeCostQueryBloc()..add(const TypeCostQueryEvent.fetch()),
      child: const TypeCostDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeCostQueryBloc, TypeCostQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<TypeCost>(
            key: ValueKey(state.hashCode),
            title: Entity.typeCost.title,
            data: state.maybeWhen(
              orElse: () => [],
              loaded: (typeCosts) {
                return typeCosts;
              },
            ),
            status: state.maybeWhen(
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<TypeCostQueryBloc>()
                .add(const TypeCostQueryEvent.fetch()),
            search: (typeCost) => [
              typeCost.id.toString(),
              typeCost.name,
              typeCost.chartOfAccountNumber.name,
            ],
            actionRight: (refreshButton) => [
              refreshButton,
              const TypeCostCreateButton(),
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('ID'),
                  sortNum: (typeCost) => typeCost.id,
                ),
                body: (typeCost) => DataCell(
                  Text(typeCost.id.toString()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('name'.tr()),
                  sortString: (typeCost) => typeCost.name,
                ),
                body: (typeCost) => DataCell(
                  Text(typeCost.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('chart_of_account'.tr()),
                  sortString: (typeCost) => typeCost.chartOfAccountNumber.name,
                ),
                body: (typeCost) => DataCell(
                  Text(typeCost.chartOfAccountNumber.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (typeCost) =>
                      typeCost.createdAt.millisecondsSinceEpoch,
                ),
                body: (typeCost) => DataCell(
                  Text(typeCost.createdAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('updated_at'.tr()),
                  sortNum: (typeCost) =>
                      typeCost.updatedAt.millisecondsSinceEpoch,
                ),
                body: (typeCost) => DataCell(
                  Text(typeCost.updatedAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('actions'.tr()),
                ),
                body: (typeCost) => DataCell(
                  Row(
                    children: [
                      TypeCostDeleteButton.prepare(typeCost: typeCost),
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
