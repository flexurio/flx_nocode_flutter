import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal/util/pdf_journal_accounting.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TransactionJournalAccountingExportPdfButton extends StatefulWidget {
  const TransactionJournalAccountingExportPdfButton({
    required this.transactionJournalAccounting,
    super.key,
  });

  final TransactionJournalAccounting transactionJournalAccounting;

  static Widget prepare({
    required TransactionJournalAccounting transactionJournalAccounting,
  }) {
    return BlocProvider(
      create: (context) => TransactionJournalAccountingQueryBloc(),
      child: TransactionJournalAccountingExportPdfButton(
        transactionJournalAccounting: transactionJournalAccounting,
      ),
    );
  }

  @override
  State<TransactionJournalAccountingExportPdfButton> createState() =>
      _TransactionJournalAccountingExportPdfButtonState();
}

class _TransactionJournalAccountingExportPdfButtonState
    extends State<TransactionJournalAccountingExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TransactionJournalAccountingQueryBloc>();

    return BlocListener<TransactionJournalAccountingQueryBloc,
        TransactionJournalAccountingQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfTransactionJournalAccounting(data: pageOptions.data),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Journal-voucher-memorial.pdf',
            );
          },
        );
      },
      child: BlocBuilder<TransactionJournalAccountingQueryBloc,
          TransactionJournalAccountingQueryState>(
        builder: (context, state) {
          return LightButton(
            action: DataAction.printPDF,
            permission:
                PermissionAccounting.transactionJournalAccountingExportPdf,
            onPressed: () {
              bloc.add(
                TransactionJournalAccountingQueryEvent.fetch(
                  generals: false,
                  transactionNoEq:
                      widget.transactionJournalAccounting.transactionNo,
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
