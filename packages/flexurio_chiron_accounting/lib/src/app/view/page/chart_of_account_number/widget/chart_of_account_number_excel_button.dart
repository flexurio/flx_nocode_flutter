import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartOfAccountNumberExportExcelButton extends StatelessWidget {
  const ChartOfAccountNumberExportExcelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartOfAccountNumberQueryBloc,
        ChartOfAccountNumberQueryState>(
      bloc: ChartOfAccountNumberQueryBloc()
        ..add(
          ChartOfAccountNumberQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
          ),
        ),
      builder: (context, state) {
        final status = state.maybeWhen(
          loading: (_) => Status.progress,
          loaded: (_) => Status.loaded,
          orElse: () => Status.error,
        );
        return LightButtonSmall(
          action: DataAction.exportExcel,
          permission: PermissionAccounting.chartOfAccountExportExcel,
          status: status,
          onPressed: () async {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (coaNumber) {
                final bytes = excelCoaNumber(coaNumber.data);
                saveFile(bytes, 'Chart_of_Account_Number_Report.xlsx');
              },
            );
          },
        );
      },
    );
  }
}
