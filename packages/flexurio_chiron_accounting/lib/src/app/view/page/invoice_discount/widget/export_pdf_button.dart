import 'package:flexurio_chiron_accounting/src/app/bloc/invoice_discount_query/invoice_discount_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/invoice_discount/util/pdf_invoice_discount.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceDiscountExportPdfButton extends StatefulWidget {
  const InvoiceDiscountExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceDiscountQueryBloc(),
      child: const InvoiceDiscountExportPdfButton(),
    );
  }

  @override
  State<InvoiceDiscountExportPdfButton> createState() =>
      _InvoiceDiscountExportPdfButtonState();
}

class _InvoiceDiscountExportPdfButtonState
    extends State<InvoiceDiscountExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceDiscountQueryBloc>();

    return BlocListener<InvoiceDiscountQueryBloc, InvoiceDiscountQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceDiscount(data: pageOptions.data),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Invoice-Discount.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceDiscountQueryBloc, InvoiceDiscountQueryState>(
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
                InvoiceDiscountQueryEvent.fetch(
                  pageOptions:
                      PageOptions.emptyNoLimit(sortBy: 'transaction_id'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
