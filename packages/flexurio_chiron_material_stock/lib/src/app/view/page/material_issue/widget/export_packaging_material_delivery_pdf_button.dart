import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_issue/util/pdf_packaging_material_delivery.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPackagingMaterialDeliveryPdfButton extends StatelessWidget {
  ExportPackagingMaterialDeliveryPdfButton({
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
          create: (context) => MaterialIssueDetailQueryBloc(
            isExternal: isExternal,
          ),
        ),
      ],
      child: ExportPackagingMaterialDeliveryPdfButton(
        materialIssue: materialIssue,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialIssueDetailQueryBloc>();
    return BlocListener<MaterialIssueDetailQueryBloc,
        MaterialIssueDetailQueryState>(
      bloc: queryBloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (data) async {
            List<List<T>> chunkList<T>(List<T> list, int chunkSize) {
              final result = <List<T>>[];
              for (var i = 0; i < list.length; i += chunkSize) {
                result.add(
                  list.sublist(
                    i,
                    i + chunkSize > list.length ? list.length : i + chunkSize,
                  ),
                );
              }
              return result;
            }

            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title: 'Label_Penyerahan_Bahan_Pengemas_${materialIssue.id}.pdf'
                    .replaceAll('/', '-'),
              );
              final sortData = List<MaterialIssueDetail>.from(
                data.data,
              ).where((item) => item.quantity != 0).toList()
                ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

              print('Total data: ${sortData.length}');
              if (sortData.length > 0) {
                final chunkedData = chunkList(sortData, 1);
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfPackagingMaterialDelivery(
                          // widget.materialReceiveDetail,
                          chunkedData[i][0],
                          chunkedData[i],
                          chunkIndex: i + 1,
                        );
                      }),
                    );
                  } catch (e) {
                    rethrow;
                  }
                }
              } else {
                Toast(context).fail('error.quantity_not_available'
                    .tr(namedArgs: {'data': 'Material'}));
              }

              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a5.landscape,
              onLayout: (format) => generatePdf(),
              name: 'Label_Penyerahan_Bahan_Pengemas_${materialIssue.id}.pdf'
                  .replaceAll('/', '-'),
            );
          },
        );
      },
      child: IconButtonSmall(
        action: DataAction.print,
        tooltipMessage: 'Label Penyerahan Bahan Pengemas',
        permission:
            PermissionMaterialStock.packagingMaterialDeliveryLabelExportPdf,
        onPressed: () async {
          queryBloc.add(
            MaterialIssueDetailQueryEvent.fetch(materialIssue: materialIssue),
          );
        },
      ),
    );
  }
}
