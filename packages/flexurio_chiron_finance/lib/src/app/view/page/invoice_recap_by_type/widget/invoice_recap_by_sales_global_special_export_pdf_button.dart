import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_recap_by_sales_global_special_query/invoice_recap_by_sales_global_special_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_recap_by_type/util/pdf_invoice_recap_by_sales_global_special.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceRecapBySalesGlobalSpecialExportPdfButton extends StatefulWidget {
  const InvoiceRecapBySalesGlobalSpecialExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceRecapBySalesGlobalSpecialQueryBloc(),
      child: const InvoiceRecapBySalesGlobalSpecialExportPdfButton(),
    );
  }

  @override
  State<InvoiceRecapBySalesGlobalSpecialExportPdfButton> createState() =>
      _InvoiceRecapBySalesGlobalSpecialExportPdfButtonState();
}

class _InvoiceRecapBySalesGlobalSpecialExportPdfButtonState
    extends State<InvoiceRecapBySalesGlobalSpecialExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceRecapBySalesGlobalSpecialQueryBloc>();

    return BlocListener<InvoiceRecapBySalesGlobalSpecialQueryBloc,
        InvoiceRecapBySalesGlobalSpecialQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceRecapBySalesGlobalSpecial(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Invoice-Recap-By-Sales-Global-Special-Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceRecapBySalesGlobalSpecialQueryBloc,
          InvoiceRecapBySalesGlobalSpecialQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            title: 'sales_global_special'.tr(),
            permission:
                PermissionFinance.invoiceRecapBySalesGlobalSpecialExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceRecapBySalesGlobalSpecialQueryEvent.fetch(
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
