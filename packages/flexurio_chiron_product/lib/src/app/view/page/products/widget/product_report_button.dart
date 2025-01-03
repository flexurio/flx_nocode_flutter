import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/util/pdf_product_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductReportPDFButton extends StatelessWidget {
  const ProductReportPDFButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => ProductQueryBloc(isExternal: false),
      child: const ProductReportPDFButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductQueryBloc, ProductQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (product) async {
            final pdf = pw.Document()
              ..addPage(await pdfProductReport(product.data));
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Product_Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<ProductQueryBloc, ProductQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.printPDF,
            title: 'product_list'.tr(),
            permission: PermissionProduct.productPrintDocumentExternal,
            onPressed: () {
              context.read<ProductQueryBloc>().add(
                    ProductQueryEvent.fetch(
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
