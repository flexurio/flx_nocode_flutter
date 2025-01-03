import 'package:flexurio_chiron_accounting/src/app/bloc/budget_realization_query/budget_realization_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_realization.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeCostExportExcelButton extends StatelessWidget {
  const EmployeeCostExportExcelButton({required this.viewBy, super.key});

  final BudgetRealizationViewBy viewBy;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetRealizationQueryBloc, BudgetRealizationQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          loaded: (pageOptions) {
            return Visibility(
              visible: pageOptions.data.isNotEmpty,
              child: LightButtonSmall(
                action: DataAction.exportExcel,
                permission: Permission.budgetRealizationExportExcel,
                onPressed: () async {
                  final bytes = simpleExcel<BudgetRealization>(
                    context: context,
                    data: pageOptions.data,
                    columns: [
                      TColumn(
                        title: 'no'.tr(),
                        numeric: true,
                        builder: (data, index) => (index + 1).toString(),
                      ),
                      TColumn(
                        title: viewBy.id.tr(),
                        builder: (data, index) => data.assign(viewBy),
                      ),
                      for (var i = 0; i < 12; i++)
                        TColumn(
                          numeric: true,
                          title: DateFormat('MMMM').format(
                            DateTime(DateTime.now().year, i + 1),
                          ),
                          builder: (data, index) => data.months[i],
                        ),
                      TColumn(
                        numeric: true,
                        title: 'YTD'.tr(),
                        builder: (data, index) => data.yearToDate,
                      ),
                    ],
                  );
                  saveFile(bytes, 'Budget_Realization.xlsx');
                },
              ),
            );
          },
        );
      },
    );
  }
}
