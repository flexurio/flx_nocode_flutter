import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_recap_by_sales_global_query/invoice_recap_by_sales_global_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_recap_by_type/util/pdf_invoice_recap_by_sales_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceRecapBySalesGlobalExportPdfButton extends StatefulWidget {
  const InvoiceRecapBySalesGlobalExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceRecapBySalesGlobalQueryBloc(),
      child: const InvoiceRecapBySalesGlobalExportPdfButton(),
    );
  }

  @override
  State<InvoiceRecapBySalesGlobalExportPdfButton> createState() =>
      _InvoiceRecapBySalesGlobalExportPdfButtonState();
}

class _InvoiceRecapBySalesGlobalExportPdfButtonState
    extends State<InvoiceRecapBySalesGlobalExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceRecapBySalesGlobalQueryBloc>();

    return BlocListener<InvoiceRecapBySalesGlobalQueryBloc,
        InvoiceRecapBySalesGlobalQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceRecapBySalesGlobal(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Invoice-Recap-By-Sales-Global-Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceRecapBySalesGlobalQueryBloc,
          InvoiceRecapBySalesGlobalQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            title: 'sales_global'.tr(),
            permission: PermissionFinance.invoiceRecapBySalesGlobalExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceRecapBySalesGlobalQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(
                    sortBy: 'transaction_name',
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
