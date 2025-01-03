import 'dart:typed_data';

import 'package:flexurio_chiron_material_stock/src/app/bloc/report_form_material_return_query/report_form_material_return_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/util/pdf_material_return_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialReturnDetailPrintButton extends StatelessWidget {
  const MaterialReturnDetailPrintButton({
    required this.materialReturn,
    required this.isExternal,
    super.key,
  });

  final MaterialReturn materialReturn;
  final bool isExternal;

  static Widget prepare(MaterialReturn materialReturn, bool isExternal) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportFormMaterialReturnQueryBloc(),
        ),
      ],
      child: MaterialReturnDetailPrintButton(
          materialReturn: materialReturn, isExternal: isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ReportFormMaterialReturnQueryBloc>();
    return BlocListener<ReportFormMaterialReturnQueryBloc,
        ReportFormMaterialReturnQueryState>(
      bloc: queryBloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) async {
            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title: 'Product_Bon_Penyerahan_Bahan_${materialReturn.id}.pdf',
              )..addPage(
                  await Future.delayed(const Duration(milliseconds: 1500), () {
                    final materialReturns = data;
                    // final materialReturns = List.generate(100, (index) => data.first);
                    return pdfMaterialReturnDetail(
                      materialReturn: materialReturn,
                      materialReturns: materialReturns,
                    );
                  }),
                );

              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a4.portrait,
              onLayout: (format) => generatePdf(),
              name: 'Product_Bon_Penyerahan_Bahan_${materialReturn.id}.pdf',
            );
            // final pdf = pw.Document()..addPage(
            //   await pdfMaterialReturnDetail(
            //     materialReturn: materialReturn,
            //     data: data,
            //   ),
            // );
            // await Printing.sharePdf(
            //   bytes: await pdf.save(),
            //   filename: 'Product_Bon_Penyerahan_Bahan_
            //   ${materialReturn.id}.pdf',
            // );
          },
        );
      },
      child: IconButtonSmall(
        action: DataAction.printPDF,
        permission: null,
        onPressed: () async {
          queryBloc.add(
            ReportFormMaterialReturnQueryEvent.fetch(
                materialReturn: materialReturn, isExternal: isExternal),
          );
        },
      ),
    );
  }
}
