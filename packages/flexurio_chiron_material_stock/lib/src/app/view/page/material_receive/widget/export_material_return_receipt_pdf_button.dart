import 'dart:typed_data';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_stock/util/util/pdf_material_return_receipt.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportMaterialReturnReceiptPdfButton extends StatefulWidget {
  const ExportMaterialReturnReceiptPdfButton._({
    required this.materialReceiveDetail,
  });

  static Widget prepare({
    required MaterialReceiveDetail materialReceiveDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                MaterialReceiveDetailQueryBloc(isExternal: isExternal)),
      ],
      child: ExportMaterialReturnReceiptPdfButton._(
          materialReceiveDetail: materialReceiveDetail),
    );
  }

  final MaterialReceiveDetail materialReceiveDetail;

  @override
  State<ExportMaterialReturnReceiptPdfButton> createState() =>
      _ExportMaterialReturnReceiptPdfButtonState();
}

class _ExportMaterialReturnReceiptPdfButtonState
    extends State<ExportMaterialReturnReceiptPdfButton> {
  late bool _isProgress;

  @override
  void initState() {
    _isProgress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialReceiveDetailQueryBloc,
        MaterialReceiveDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: (loading) {
            _isProgress = true;
            return const Center(child: CupertinoActivityIndicator());
          },
          error: (error) {
            _isProgress = false;
            Toast(context).fail(error);
          },
          orElse: () {},
          loaded: (materialReceiveDetails) async {
            _isProgress = false;

            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title: 'Report_TandaTerimaRetur',
              );

              pdf.addPage(
                await Future.delayed(const Duration(milliseconds: 1500), () {
                  return pdfMaterialReturnReceipt(
                    widget.materialReceiveDetail,
                    materialReceiveDetails.data,
                  );
                }),
              );
              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a5.portrait,
              onLayout: (format) => generatePdf(),
              name: 'Report_TandaTerimaRetur.pdf',
            );
          },
        );
      },
      child: BlocBuilder<MaterialReceiveDetailQueryBloc,
          MaterialReceiveDetailQueryState>(
        builder: (context, state) {
          return _isProgress
              ? const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: CupertinoActivityIndicator(color: Colors.red),
                )
              : Visibility(
                  visible: widget.materialReceiveDetail.materialStatus.isReject,
                  child: IconButtonSmall(
                    permission:
                        PermissionMaterialStock.materialReturnReceiptExportPdf,
                    tooltipMessage: 'Material Return Receipt',
                    action: DataAction.exportPdf,
                    onPressed: () async {
                      context.read<MaterialReceiveDetailQueryBloc>().add(
                            MaterialReceiveDetailQueryEvent.fetch(
                              materialReceive:
                                  widget.materialReceiveDetail.materialReceive,
                              pageOptions: PageOptions.emptyNoLimit(
                                ascending: false,
                                sortBy: 'created_at',
                              ),
                              materialStatusQc: 'REJECT',
                            ),
                          );
                    },
                  ),
                );
        },
      ),
    );
  }
}
