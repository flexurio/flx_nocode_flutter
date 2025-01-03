import 'package:flexurio_chiron_accounting/src/app/bloc/balance_group_query/balance_group_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/balance_group/widget/balance_group_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/balance_group/widget/balance_group_delete_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceGroupDataTable extends StatelessWidget {
  const BalanceGroupDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BalanceGroupQueryBloc()
            ..add(const BalanceGroupQueryEvent.fetch()),
        ),
      ],
      child: const BalanceGroupDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceGroupQueryBloc, BalanceGroupQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<BalanceGroup>(
            onRefresh: () => context
                .read<BalanceGroupQueryBloc>()
                .add(const BalanceGroupQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            data: state.maybeWhen(
              loaded: (balanceGroups) {
                return balanceGroups;
              },
              orElse: () => [],
            ),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            title: Entity.balanceGroup.title,
            search: (balanceGroup) => [
              balanceGroup.name,
              balanceGroup.id,
              balanceGroup.type.type,
              balanceGroup.profitAndLossBalance.label,
            ],
            actionRight: (refreshButton) => [
              refreshButton,
              const BalanceGroupCreateButton(),
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Group'),
                  sortString: (balanceGroup) => balanceGroup.name,
                ),
                body: (balanceGroup) => DataCell(
                  SizedText(balanceGroup.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Number'),
                  sortString: (balanceGroup) => balanceGroup.id,
                ),
                body: (balanceGroup) => DataCell(
                  SizedText(balanceGroup.id),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Type'),
                  sortString: (balanceGroup) => balanceGroup.type.type,
                ),
                body: (balanceGroup) => DataCell(
                  ChipType(balanceGroup.type),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Category'),
                  sortString: (balanceGroup) =>
                      balanceGroup.profitAndLossBalance.label,
                ),
                body: (balanceGroup) => DataCell(
                  ChipType(balanceGroup.profitAndLossBalance),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (balanceGroup) =>
                      balanceGroup.createdAt.millisecondsSinceEpoch,
                ),
                body: (balanceGroup) => DataCell(
                  Text(balanceGroup.createdAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: const DTHeadXX(
                  label: Text('Actions'),
                ),
                body: (balanceGroup) => DataCell(
                  Row(
                    children: [
                      BalanceGroupDeleteButton.prepare(
                        balanceGroup: balanceGroup,
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
