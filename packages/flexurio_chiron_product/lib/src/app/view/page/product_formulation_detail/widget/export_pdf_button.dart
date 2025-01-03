import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_detail/util/report_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductFormulationDetailExportPdfButton extends StatelessWidget {
  const ProductFormulationDetailExportPdfButton({
    required this.productFormulation,
    required this.isExternal,
    super.key,
  });
  final isExternal;
  final ProductFormulation productFormulation;

  static Widget prepare({
    required ProductFormulation productFormulation,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) =>
          ProductFormulationDetailQueryBloc(isExternal: isExternal),
      child: ProductFormulationDetailExportPdfButton(
        productFormulation: productFormulation,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductFormulationDetailQueryBloc,
        ProductFormulationDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (details) async {
            final sortedDetails = List<ProductFormulationDetail>.from(details)
              ..sort((a, b) {
                final compare = a.material.materialGroup.id
                    .compareTo(b.material.materialGroup.id);
                if (compare != 0) {
                  return compare;
                } else {
                  return a.material.name.compareTo(b.material.name);
                }
              });
            final pdf = pw.Document()
              ..addPage(
                await pdfDetailBillOfMaterial(
                  productFormulation,
                  sortedDetails,
                  context,
                  flavorConfig.companyName,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Bill_of_Material_Report.pdf',
            );
          },
        );
      },
      child: BlocBuilder<ProductFormulationDetailQueryBloc,
          ProductFormulationDetailQueryState>(
        builder: (context, state) {
          return Button(
            action: DataAction.printPDF,
            permission: null,
            isInProgress: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            onPressed: () {
              context.read<ProductFormulationDetailQueryBloc>().add(
                    ProductFormulationDetailQueryEvent.fetch(
                      scale: productFormulation.scale,
                      product: productFormulation.product,
                      isActive: true,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
