import 'package:flexurio_chiron_presence/src/app/bloc/presence_monthly_per_employee_query/presence_monthly_per_employee_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/util/excel.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ExportExcelButton extends StatelessWidget {
  const ExportExcelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresenceMonthlyPerEmployeeQueryBloc,
        PresenceMonthlyPerEmployeeQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (presences, dateTime, employee) {
            return Visibility(
              visible: presences.isNotEmpty,
              child: Button(
                permission:
                    Permission.presenceMonthlyReportPerEmployeeExportExcel,
                action: DataAction.exportExcel,
                onPressed: () async {
                  final bytes = excelPresencePerEmployee(
                    dateTime: dateTime,
                    employee: employee,
                    presences: presences,
                  );
                  final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
                  final date = format.format(dateTime);
                  saveFile(
                    bytes,
                    'Presence_${employee.name}_${employee.nip}_$date.xlsx'
                        .replaceAll('/', '-'),
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
