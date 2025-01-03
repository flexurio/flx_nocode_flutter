import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_recap_by_sales_detail_query/invoice_recap_by_sales_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_recap_by_type/util/pdf_invoice_recap_by_sales_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceRecapBySalesDetailExportPdfButton extends StatefulWidget {
  const InvoiceRecapBySalesDetailExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceRecapBySalesDetailQueryBloc(),
      child: const InvoiceRecapBySalesDetailExportPdfButton(),
    );
  }

  @override
  State<InvoiceRecapBySalesDetailExportPdfButton> createState() =>
      _InvoiceRecapBySalesDetailExportPdfButtonState();
}

class _InvoiceRecapBySalesDetailExportPdfButtonState
    extends State<InvoiceRecapBySalesDetailExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceRecapBySalesDetailQueryBloc>();

    return BlocListener<InvoiceRecapBySalesDetailQueryBloc,
        InvoiceRecapBySalesDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceRecapBySalesDetail(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Invoice-Recap-By-Sales-Detail-Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceRecapBySalesDetailQueryBloc,
          InvoiceRecapBySalesDetailQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            title: 'sales_detail'.tr(),
            permission: PermissionFinance.invoiceRecapBySalesDetailExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceRecapBySalesDetailQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(
                    sortBy: 'customer',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
