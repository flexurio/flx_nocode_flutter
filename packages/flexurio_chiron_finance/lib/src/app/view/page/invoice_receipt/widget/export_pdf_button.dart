import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receipt_query/invoice_receipt_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receipt/util/pdf_invoice_receipt.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceReceiptExportPdfButton extends StatefulWidget {
  const InvoiceReceiptExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceReceiptQueryBloc(),
      child: const InvoiceReceiptExportPdfButton(),
    );
  }

  @override
  State<InvoiceReceiptExportPdfButton> createState() =>
      _InvoiceReceiptExportPdfButtonState();
}

class _InvoiceReceiptExportPdfButtonState
    extends State<InvoiceReceiptExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceReceiptQueryBloc>();

    return BlocListener<InvoiceReceiptQueryBloc, InvoiceReceiptQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceReceipt(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Product_Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceReceiptQueryBloc, InvoiceReceiptQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionFinance.invoiceReceiptExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceReceiptQueryEvent.fetch(
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
