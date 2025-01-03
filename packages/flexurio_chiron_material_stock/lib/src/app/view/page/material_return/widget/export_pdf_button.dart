import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/report_form_material_return_query/report_form_material_return_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return/util/pdf_adjustment_material.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';

class ExportPdfButton extends StatefulWidget {
  const ExportPdfButton._(
      {required this.materialReturn, required this.isExternal});

  static Widget prepare({
    required MaterialReturn materialReturn,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportFormMaterialReturnQueryBloc(),
        ),
      ],
      child: ExportPdfButton._(
          materialReturn: materialReturn, isExternal: isExternal),
    );
  }

  final MaterialReturn materialReturn;
  final bool isExternal;

  @override
  State<ExportPdfButton> createState() => _ExportPdfButtonState();
}

class _ExportPdfButtonState extends State<ExportPdfButton> {
  late bool _isProgress;

  @override
  void initState() {
    _isProgress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportFormMaterialReturnQueryBloc,
        ReportFormMaterialReturnQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (reportFormMaterialReturn) async {
            _isProgress = false;
            // var reportFormMaterialReturn = <ReportFormMaterialReturn>[];

            // if (reportFormMaterialReturn.isEmpty) {
            //   reportFormMaterialReturn = data;
            // } else {
            //   reportFormMaterialReturn = reportFormMaterialReturn;
            // }

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
                title: 'Adjustment_Material.pdf',
              );
              if (reportFormMaterialReturn.length > 3) {
                final chunkedData = chunkList(reportFormMaterialReturn, 3);
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfAdjustmentMaterial(
                          widget.materialReturn,
                          chunkedData[i],
                          chunkIndex: i,
                        );
                      }),
                    );
                  } catch (e) {
                    rethrow;
                  }
                }
              } else {
                try {
                  pdf.addPage(
                    await Future.delayed(const Duration(milliseconds: 1500),
                        () {
                      return pdfAdjustmentMaterial(
                        widget.materialReturn,
                        reportFormMaterialReturn,
                        chunkIndex: 0,
                      );
                    }),
                  );
                } catch (e) {
                  rethrow;
                }
              }

              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a5.portrait,
              onLayout: (format) => generatePdf(),
              name: 'Adjustment_Material.pdf',
            );
          },
        );
      },
      child: BlocBuilder<ReportFormMaterialReturnQueryBloc,
          ReportFormMaterialReturnQueryState>(
        builder: (context, state) {
          return _isProgress
              ? const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: CupertinoActivityIndicator(color: Colors.red),
                )
              : IconButtonSmall(
                  permission:
                      PermissionMaterialStock.reportAdjustmentMaterialExportPdf,
                  tooltipMessage: 'adjustment_material'.tr(),
                  action: DataAction.exportPdf,
                  onPressed: () async {
                    context.read<ReportFormMaterialReturnQueryBloc>().add(
                          ReportFormMaterialReturnQueryEvent.fetch(
                            materialReturn: widget.materialReturn,
                            isExternal: widget.isExternal,
                          ),
                        );
                  },
                );
        },
      ),
    );
  }
}
