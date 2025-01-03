import 'dart:typed_data';

import 'package:flexurio_chiron_material_stock/src/app/bloc/material_issue_detail_report_query/material_issue_detail_report_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue_detail_report.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_issue/util/pdf_material_issue_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MaterialIssueDetailPrintButton extends StatelessWidget {
  const MaterialIssueDetailPrintButton({
    required this.materialIssue,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;
  final MaterialIssue materialIssue;

  static Widget prepare({
    required MaterialIssue materialIssue,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialIssueDetailReportQueryBloc(
            isExternal: isExternal,
          ),
        ),
      ],
      child: MaterialIssueDetailPrintButton(
        materialIssue: materialIssue,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialIssueDetailReportQueryBloc>();
    return BlocListener<MaterialIssueDetailReportQueryBloc,
        MaterialIssueDetailReportQueryState>(
      bloc: queryBloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) async {
            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title: 'Product_Bon_Penyerahan_Bahan_${materialIssue.id}.pdf',
              )..addPage(
                  await Future.delayed(const Duration(milliseconds: 1500), () {
                    final materialIssues =
                        List<MaterialIssuesDetailReport>.from(data)
                            .where((item) => item.quantity != 0)
                            .toList();
                    // final materialIssues = List.generate(100, (index) => data.first);
                    return pdfMaterialIssueDetail(
                      materialIssue: materialIssue,
                      materialIssues: materialIssues,
                    );
                  }),
                );

              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a4.portrait,
              onLayout: (format) => generatePdf(),
              name: 'Product_Bon_Penyerahan_Bahan_${materialIssue.id}.pdf',
            );
            // final pdf = pw.Document()..addPage(
            //   await pdfMaterialIssueDetail(
            //     materialIssue: materialIssue,
            //     data: data,
            //   ),
            // );
            // await Printing.sharePdf(
            //   bytes: await pdf.save(),
            //   filename: 'Product_Bon_Penyerahan_Bahan_
            //   ${materialIssue.id}.pdf',
            // );
          },
        );
      },
      child: IconButtonSmall(
        action: DataAction.printPDF,
        permission: null,
        onPressed: () async {
          queryBloc.add(
            MaterialIssueDetailReportQueryEvent.fetch(materialIssue),
          );
        },
      ),
    );
  }
}
