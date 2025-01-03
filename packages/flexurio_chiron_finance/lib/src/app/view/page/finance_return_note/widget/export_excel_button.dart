import 'package:flexurio_chiron_finance/src/app/bloc/finance_return_note/finance_return_note_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/util/excel_finance_return_note.dart';
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
    return BlocBuilder<FinanceReturnNoteQueryBloc, FinanceReturnNoteQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loaded: (
            returnNotes,
            company,
            customer,
            periodStart,
            periodEnd,
            srpNo,
          ) {
            return Visibility(
              visible: returnNotes.isNotEmpty,
              child: Button(
                permission: Permission.financeReturnNoteExportExcel,
                action: DataAction.exportExcel,
                onPressed: () async {
                  final bytes = excelReturnNote(returnNotes);
                  final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
                  final start = format.format(periodStart);
                  final end = format.format(periodEnd);
                  saveFile(
                    bytes,
                    'Return_Note_${company.name}_${srpNo}_${start}_$end.xlsx'
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
