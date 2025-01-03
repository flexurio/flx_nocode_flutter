import 'package:flexurio_chiron_accounting/src/app/bloc/accounting_cogs_report_query/accounting_cogs_report_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/accounting_cogs_report_data.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/export_excel_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/export_pdf_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/accounting_cogs_report/widget/filter_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AccountingCogsReportPage extends StatelessWidget {
  const AccountingCogsReportPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AccountingCogsReportQueryBloc()),
      ],
      child: const AccountingCogsReportPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<AccountingCogsReportQueryBloc,
                      AccountingCogsReportQueryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (cogs, division, year) {
                          return AccountingCogsReportData(
                            cogs: cogs,
                            division: division,
                            year: year,
                          );
                        },
                        orElse: () =>
                            const Center(child: CupertinoActivityIndicator()),
                      );
                    },
                  ),
                ),
                const Gap(24),
                const SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Gap(12),
                      FilterForm(),
                      Divider(),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: ExportPdfButton()),
                          Gap(12),
                          Expanded(child: ExportExcelButton()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
