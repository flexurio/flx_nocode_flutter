import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_query/chart_of_account_number_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart'
    as model;
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_number/widget/chart_of_account_number_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_number/widget/chart_of_account_number_delete_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_number/widget/chart_of_account_number_edit_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_number/widget/chart_of_account_number_excel_button.dart';

import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountNumberDataTable extends StatelessWidget {
  const ChartOfAccountNumberDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChartOfAccountNumberQueryBloc()
            ..add(ChartOfAccountNumberQueryEvent.fetch()),
        ),
      ],
      child: const ChartOfAccountNumberDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartOfAccountNumberQueryBloc,
        ChartOfAccountNumberQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.ChartOfAccountNumber>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<ChartOfAccountNumberQueryBloc>()
                .add(ChartOfAccountNumberQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              const ChartOfAccountNumberExportExcelButton(),
              refreshButton,
              const ChartOfAccountNumberCreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<ChartOfAccountNumberQueryBloc>().add(
                    ChartOfAccountNumberQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 14,
                head: const DTHead(
                  label: 'Name',
                  backendColumn: 'chart_of_accounts.name',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  Text(chartOfAccountNumber.name).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'COA',
                  backendColumn: 'chart_of_accounts.id',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  Text(chartOfAccountNumber.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Group Name',
                  backendColumn: 'BalanceGroup.name',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  Text(
                    chartOfAccountNumber.chartOfAccountGroup.balanceGroup.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'chart_of_accounts.status',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  ChipType(chartOfAccountNumber.status),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Factory Overhead',
                  backendColumn: 'chart_of_accounts.is_factory_overhead',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  BoolIcon(chartOfAccountNumber.isFactoryOverhead),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'chart_of_accounts.created_by_id',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  GetNameUser(userId: chartOfAccountNumber.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  Text(chartOfAccountNumber.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated By',
                  backendColumn: 'chart_of_accounts.updated_by_id',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  GetNameUser(userId: chartOfAccountNumber.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'updated_at',
                ),
                body: (chartOfAccountNumber) => DataCell(
                  Text(chartOfAccountNumber.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: null,
                ),
                body: (chartOfAccountNumber) => DataCell(
                  Row(
                    children: [
                      ChartOfAccountNumberEditButton(
                        chartOfAccountNumber: chartOfAccountNumber,
                      ),
                      ChartOfAccountNumberDeleteButton.prepare(
                        chartOfAccountNumber: chartOfAccountNumber,
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
