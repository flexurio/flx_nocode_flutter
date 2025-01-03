import 'package:flexurio_chiron_finance/src/app/bloc/finance_return_note/finance_return_note_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/widget/export_excel_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/widget/export_pdf_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/widget/filter_form.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/widget/table.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FinanceReturnNotePage extends StatelessWidget {
  const FinanceReturnNotePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FinanceReturnNoteQueryBloc()),
      ],
      child: const FinanceReturnNotePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ContentWithRightPanel(
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
            child: BlocBuilder<FinanceReturnNoteQueryBloc,
                FinanceReturnNoteQueryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (
                    returnNotes,
                    company,
                    customer,
                    periodStart,
                    periodEnd,
                    srpNo,
                  ) {
                    return FCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.all(paddingHorizontalPage),
                            child: Text(
                              'return_note'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey.shade400),
                          Expanded(
                            child: TableFinanceReturn(items: returnNotes),
                          ),
                        ],
                      ),
                    );
                  },
                  initial: () => const Center(child: Text('No Filter')),
                  orElse: () =>
                      const Center(child: CupertinoActivityIndicator()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
