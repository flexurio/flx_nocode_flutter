import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/util/pdf_report_document_external.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductReportDocumentButton extends StatelessWidget {
  const ProductReportDocumentButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => ProductQueryBloc(isExternal: false),
      child: const ProductReportDocumentButton(),
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
              ..addPage(await pdfProductReportDocument(product.data));
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Product_Report_Document_External.pdf',
            );
          },
        );
      },
      child: BlocBuilder<ProductQueryBloc, ProductQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportDocument,
            title: 'nie'.tr(),
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
