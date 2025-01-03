import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_group_query/chart_of_account_group_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart'
    as model;
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_group/widget/chart_of_account_group_create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_group/widget/chart_of_account_group_delete_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_group/widget/chart_of_account_group_edit_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/chart_of_account_group/widget/chart_of_account_group_pdf_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ChartOfAccountGroupDataTable extends StatelessWidget {
  const ChartOfAccountGroupDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => ChartOfAccountGroupQueryBloc()
        ..add(ChartOfAccountGroupQueryEvent.fetch()),
      child: const ChartOfAccountGroupDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartOfAccountGroupQueryBloc,
        ChartOfAccountGroupQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<model.ChartOfAccountGroup>(
            onRefresh: () => context
                .read<ChartOfAccountGroupQueryBloc>()
                .add(ChartOfAccountGroupQueryEvent.fetch()),
            data: state.maybeWhen(
              orElse: () => [],
              loaded: (chartOfAccountGroups) {
                return chartOfAccountGroups;
              },
            ),
            title: Entity.chartOfAccountGroup.title,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            actionRight: (refreshButton) => [
              const ChartOfAccountGroupExportPDFButton(),
              refreshButton,
              const ChartOfAccountGroupCreateButton(),
            ],
            search: (chartOfAccountGroup) => [
              chartOfAccountGroup.name,
              chartOfAccountGroup.id,
              chartOfAccountGroup.balanceGroup.type.type,
              chartOfAccountGroup.forecastNumber,
              chartOfAccountGroup.balanceGroup.profitAndLossBalance.label,
              chartOfAccountGroup.balanceGroup.name,
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('name'.tr()),
                  sortString: (chartOfAccountGroup) => chartOfAccountGroup.name,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  Text(chartOfAccountGroup.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('number'.tr()),
                  sortString: (chartOfAccountGroup) => chartOfAccountGroup.id,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  Text(chartOfAccountGroup.id),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('account_number'.tr()),
                  sortString: (chartOfAccountGroup) =>
                      chartOfAccountGroup.forecastNumber,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  Text(chartOfAccountGroup.forecastNumber),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('type'.tr()),
                  sortString: (chartOfAccountGroup) =>
                      chartOfAccountGroup.balanceGroup.type.type,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  ChipType(chartOfAccountGroup.balanceGroup.type),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('category'.tr()),
                  sortString: (chartOfAccountGroup) => chartOfAccountGroup
                      .balanceGroup.profitAndLossBalance.label,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  ChipType(
                    chartOfAccountGroup.balanceGroup.profitAndLossBalance,
                  ),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('balance_group'.tr()),
                  sortString: (chartOfAccountGroup) =>
                      chartOfAccountGroup.balanceGroup.name,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  _ChipType(chartOfAccountGroup.balanceGroup.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_by'.tr()),
                  sortNum: (chartOfAccountGroup) =>
                      chartOfAccountGroup.createdById ?? 0,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  GetNameUser(userId: chartOfAccountGroup.createdById ?? 0),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('updated_by'.tr()),
                  sortNum: (chartOfAccountGroup) =>
                      chartOfAccountGroup.updateById ?? 0,
                ),
                body: (chartOfAccountGroup) => DataCell(
                  GetNameUser(userId: chartOfAccountGroup.updateById ?? 0),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('actions'.tr()),
                ),
                body: (chartOfAccountGroup) => DataCell(
                  Row(
                    children: [
                      ChartOfAccountGroupEditButton(
                        chartOfAccountGroup: chartOfAccountGroup,
                      ),
                      ChartOfAccountGroupDeleteButton.prepare(
                        chartOfAccountGroup: chartOfAccountGroup,
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

class _ChipType extends StatelessWidget {
  const _ChipType(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    late Color color;
    if (value == 'AKTIVA') {
      color = Colors.orange;
    } else if (value == 'COST OF GOODS SOLD') {
      color = Colors.green;
    } else if (value == 'EXPENSE') {
      color = Colors.blue;
    } else if (value == 'MODAL') {
      color = Colors.red;
    } else if (value == 'OTHER INCOME & EXPENSE') {
      color = Colors.teal;
    } else if (value == 'PASIVA') {
      color = Colors.deepPurple;
    } else if (value == 'SALES') {
      color = Colors.blueGrey;
    } else {
      color = Colors.indigo;
    }
    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      side: BorderSide.none,
      backgroundColor: color.withOpacity(.1),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 4, backgroundColor: color),
          const Gap(6),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
