import 'dart:typed_data';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductReturnDetailPrintButton extends StatelessWidget {
  const ProductReturnDetailPrintButton({
    required this.productReturn,
    required this.productReturnDetail,
    required this.productReturnCheck,
    super.key,
  });

  final ProductReturn productReturn;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnCheck productReturnCheck;

  static Widget prepare(
    ProductReturn productReturn,
    ProductReturnDetail productReturnDetail,
    ProductReturnCheck productReturnCheck,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductIssueQueryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductReturnCheckBloc(),
        ),
      ],
      child: ProductReturnDetailPrintButton(
        productReturn: productReturn,
        productReturnDetail: productReturnDetail,
        productReturnCheck: productReturnCheck,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductIssueQueryBloc>();
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductReturnCheckBloc, ProductReturnCheckState>(
            listener: (context, state) {}),
        BlocListener<ProductIssueQueryBloc, ProductIssueQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loaded: (data) async {
                Future<Uint8List> generatePdf() async {
                  final pdf = pw.Document(
                    title: 'Report_SRP_${productReturn.id}.pdf',
                  )..addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        final productIssue = data;
                        return pdfProductReturnDetail(
                          productReturn: productReturn,
                          productReturnCheck: productReturnCheck,
                          productIssue: productIssue.data.isNotEmpty
                              ? productIssue.data.first
                              : ProductIssue.empty(),
                        );
                      }),
                    );

                  return pdf.save();
                }

                await Printing.layoutPdf(
                  format: PdfPageFormat.a4.portrait,
                  onLayout: (format) => generatePdf(),
                  name: 'Report_SRP_${productReturn.id}.pdf',
                );
              },
            );
          },
        ),
      ],
      child: LightButton(
        action: DataAction.printPDF,
        permission: PermissionProductStock.productReturnCheckExportPdf,
        onPressed: () async {
          context.read<ProductReturnCheckBloc>().add(
                ProductReturnCheckEvent.updateDelivery(
                    id: productReturnCheck.id),
              );
          queryBloc.add(ProductIssueQueryEvent.fetch(
              pageOptions: null,
              productReturnId: productReturn.id,
              remark: productReturnCheck.status.id));
        },
      ),
    );
  }
}
