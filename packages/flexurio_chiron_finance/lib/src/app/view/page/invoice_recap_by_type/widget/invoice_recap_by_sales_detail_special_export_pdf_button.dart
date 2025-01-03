import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_recap_by_sales_detail_special_query/invoice_recap_by_sales_detail_special_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_recap_by_type/util/pdf_invoice_recap_by_sales_detail_special.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceRecapBySalesDetailSpecialExportPdfButton extends StatefulWidget {
  const InvoiceRecapBySalesDetailSpecialExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => InvoiceRecapBySalesDetailSpecialQueryBloc(),
      child: const InvoiceRecapBySalesDetailSpecialExportPdfButton(),
    );
  }

  @override
  State<InvoiceRecapBySalesDetailSpecialExportPdfButton> createState() =>
      _InvoiceRecapBySalesDetailSpecialExportPdfButtonState();
}

class _InvoiceRecapBySalesDetailSpecialExportPdfButtonState
    extends State<InvoiceRecapBySalesDetailSpecialExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InvoiceRecapBySalesDetailSpecialQueryBloc>();

    return BlocListener<InvoiceRecapBySalesDetailSpecialQueryBloc,
        InvoiceRecapBySalesDetailSpecialQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfInvoiceRecapBySalesDetailSpecial(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Invoice-Recap-By-Sales-Detail-Special-Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<InvoiceRecapBySalesDetailSpecialQueryBloc,
          InvoiceRecapBySalesDetailSpecialQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            title: 'sales_detail_special'.tr(),
            permission:
                PermissionFinance.invoiceRecapBySalesDetailSpecialExportPdf,
            onPressed: () {
              bloc.add(
                InvoiceRecapBySalesDetailSpecialQueryEvent.fetch(
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
