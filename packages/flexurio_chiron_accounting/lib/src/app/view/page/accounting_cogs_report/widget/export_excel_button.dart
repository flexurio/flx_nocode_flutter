import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportExcelButton extends StatelessWidget {
  const ExportExcelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountingCogsReportQueryBloc,
        AccountingCogsReportQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (cogs, division, year) {
            return Visibility(
              visible: cogs.isNotEmpty,
              child: Button(
                permission:
                    PermissionAccounting.accountingCogsReportExportExcel,
                action: DataAction.exportExcel,
                onPressed: () async {
                  final bytes = excelCogs(cogs);
                  saveFile(bytes, 'COGS_${division}_$year.xlsx');
                },
              ),
            );
          },
        );
      },
    );
  }
}

class ExportCogsDetailExcelButton extends StatelessWidget {
  const ExportCogsDetailExcelButton({
    required this.excelCogsDetailValue,
    super.key,
  });
  final ExcelCogsDetailValue excelCogsDetailValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountingCogsDetailQueryBloc,
        AccountingCogsDetailQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (cogsDetails) {
            return Visibility(
              visible: cogsDetails.isNotEmpty,
              child: Button(
                permission:
                    PermissionAccounting.accountingCogsReportExportExcel,
                action: DataAction.exportExcel,
                onPressed: () async {
                  final bytes = excelCogsDetail(excelCogsDetailValue);
                  saveFile(
                    bytes,
                    'COGS_Detail_${excelCogsDetailValue.division}_'
                    '${excelCogsDetailValue.period}_'
                    '${excelCogsDetailValue.typeName}.xlsx',
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
