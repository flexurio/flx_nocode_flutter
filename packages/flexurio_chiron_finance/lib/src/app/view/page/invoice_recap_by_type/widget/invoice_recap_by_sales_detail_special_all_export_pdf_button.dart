import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_recap_by_sales_global_special_all_query/invoice_recap_by_sales_global_special_all_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_recap_by_type/util/pdf_invoice_recap_by_sales_global_special_all.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceRecapBySalesGlobalSpecialAllExportPdfButton
    extends StatefulWidget {
  const InvoiceRecapBySalesGlobalSpecialAllExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceRecapBySalesGlobalSpecialAllQueryBloc(),
      child: const InvoiceRecapBySalesGlobalSpecialAllExportPdfButton(),
    );
  }

  @override
  State<InvoiceRecapBySalesGlobalSpecialAllExportPdfButton> createState() =>
      _InvoiceRecapBySalesGlobalSpecialAllExportPdfButtonState();
}

class _InvoiceRecapBySalesGlobalSpecialAllExportPdfButtonState
    extends State<InvoiceRecapBySalesGlobalSpecialAllExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceRecapBySalesGlobalSpecialAllQueryBloc>();

    return BlocListener<InvoiceRecapBySalesGlobalSpecialAllQueryBloc,
        InvoiceRecapBySalesGlobalSpecialAllQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceRecapBySalesGlobalSpecialAll(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Invoice-Recap-By-Sales-Global-Special-All-Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceRecapBySalesGlobalSpecialAllQueryBloc,
          InvoiceRecapBySalesGlobalSpecialAllQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            title: 'sales_global_special_all'.tr(),
            permission:
                PermissionFinance.invoiceRecapBySalesGlobalSpecialAllExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceRecapBySalesGlobalSpecialAllQueryEvent.fetch(
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
