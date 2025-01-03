import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_global_report_query/product_issue_global_report_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/product_issue_global_export_pdf.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductIssueGlobalExportPdfButton extends StatefulWidget {
  const ProductIssueGlobalExportPdfButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => ProductIssueGlobalReportQueryBloc(),
      child: const ProductIssueGlobalExportPdfButton(),
    );
  }

  @override
  State<ProductIssueGlobalExportPdfButton> createState() =>
      _ProductIssueGlobalExportPdfButtonState();
}

class _ProductIssueGlobalExportPdfButtonState
    extends State<ProductIssueGlobalExportPdfButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductIssueGlobalReportQueryBloc>();

    return BlocListener<ProductIssueGlobalReportQueryBloc,
        ProductIssueGlobalReportQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfProductIssueGlobal(data: data),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Product-Issue-Global.pdf',
            );
          },
        );
      },
      child: BlocBuilder<ProductIssueGlobalReportQueryBloc,
          ProductIssueGlobalReportQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportPdf,
            title: 'product_issue_global'.tr(),
            status: state.maybeWhen(
              loading: () => Status.progress,
              orElse: () => null,
            ),
            permission: null,
            // permission: Permission.productIssueGlobalExportPdf,
            onPressed: () {
              bloc.add(
                ProductIssueGlobalReportQueryEvent.fetch(),
              );
            },
          );
        },
      ),
    );
  }
}
