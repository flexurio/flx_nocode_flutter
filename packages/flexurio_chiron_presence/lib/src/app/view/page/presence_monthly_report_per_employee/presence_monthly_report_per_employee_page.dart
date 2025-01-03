import 'package:flexurio_chiron_presence/src/app/bloc/presence_monthly_per_employee_query/presence_monthly_per_employee_query_bloc.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/widget/export_excel_button.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/widget/export_pdf_button.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/widget/filter_form.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/widget/table.dart';

import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MonthlyPresenceReportPerEmployeePage extends StatelessWidget {
  const MonthlyPresenceReportPerEmployeePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PresenceMonthlyPerEmployeeQueryBloc(),
        ),
      ],
      child: const MonthlyPresenceReportPerEmployeePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContentWithRightPanel(
      rightPanel: Column(
        children: [
          const Gap(12),
          FilterForm.prepare(),
          const Divider(),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ExportPdfButton(),
              Gap(12),
              ExportExcelButton(),
            ],
          ),
        ],
      ),
      child: BlocBuilder<PresenceMonthlyPerEmployeeQueryBloc,
          PresenceMonthlyPerEmployeeQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (presences, dateTime, employee) {
              return FCard(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    _LabelValue('NIP', ': ${employee.nip}'),
                    _LabelValue('Name', ': ${employee.name}'),
                    const _LabelValue('Department', ': -'),
                    const _LabelValue('Position', ': -'),
                    const Gap(24),
                    Expanded(
                      child: TablePresence(
                        presences: presences,
                        dateTime: dateTime,
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: Container.new,
          );
        },
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  const _LabelValue(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
