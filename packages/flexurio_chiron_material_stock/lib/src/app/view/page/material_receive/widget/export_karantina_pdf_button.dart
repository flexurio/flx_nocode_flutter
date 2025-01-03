import 'dart:typed_data';

import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportKarantinaPdfButton extends StatefulWidget {
  const ExportKarantinaPdfButton._({
    required this.materialReceiveDetail,
  });

  static Widget prepare({
    required MaterialReceiveDetail materialReceiveDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReceiveDetailQueryBloc(
              pagination: false, isExternal: isExternal),
        ),
      ],
      child: ExportKarantinaPdfButton._(
        materialReceiveDetail: materialReceiveDetail,
      ),
    );
  }

  final MaterialReceiveDetail materialReceiveDetail;

  @override
  State<ExportKarantinaPdfButton> createState() =>
      _ExportKarantinaPdfButtonState();
}

class _ExportKarantinaPdfButtonState extends State<ExportKarantinaPdfButton> {
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
            var materialRequestDetail = <MaterialReceiveDetail>[];

            if (materialReceiveDetails.data.isEmpty) {
              materialRequestDetail.add(
                MaterialReceiveDetail(
                  id: 0,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  na: '',
                  materialReceive: MaterialReceive.empty(),
                  materialDesign: MaterialDesign.empty(),
                  material: model.Material.empty(),
                  materialUnit: MaterialUnit.empty(),
                  transactionDate: DateTime.now(),
                  batchNo: '',
                  barcodeNo: '',
                  vatNo: 0,
                  vatTotal: 0,
                  quantity: 0,
                  totalQuantity: 0,
                  price: 0,
                  materialStatus: MaterialReceiveDetailStatus.empty,
                ),
              );
            } else {
              materialRequestDetail = materialReceiveDetails.data;
            }

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
                title:
                    'Print_Label_Karantina_${widget.materialReceiveDetail.materialReceive.materialGroup.id}_${widget.materialReceiveDetail.materialReceive.id}.pdf'
                        .replaceAll('/', '-'),
              );

              if (materialReceiveDetails.data.length > 1) {
                final sortData = List<MaterialReceiveDetail>.from(
                  materialReceiveDetails.data,
                )..sort((a, b) => a.vatNo.compareTo(b.vatNo));
                final chunkedData = chunkList(sortData, 1);
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfKarantinaMaterialReceive(
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
                try {
                  pdf.addPage(
                    await Future.delayed(const Duration(milliseconds: 1500),
                        () {
                      return pdfKarantinaMaterialReceive(
                        widget.materialReceiveDetail,
                        materialReceiveDetails.data,
                        chunkIndex: 1,
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
              format: PdfPageFormat.a5.landscape,
              onLayout: (format) => generatePdf(),
              name:
                  'Print_Label_Karantina_${widget.materialReceiveDetail.materialReceive.materialGroup.id}_${widget.materialReceiveDetail.materialReceive.id}.pdf'
                      .replaceAll('/', '-'),
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
                  visible:
                      widget.materialReceiveDetail.materialStatus.isQuarantine,
                  child: IconButtonSmall(
                    permission:
                        PermissionMaterialStock.quarantineLabelExportPdf,
                    tooltipMessage: 'Export PDF Label Karantina',
                    action: DataAction.exportPdf,
                    onPressed: () async {
                      context.read<MaterialReceiveDetailQueryBloc>().add(
                            MaterialReceiveDetailQueryEvent.fetch(
                              materialReceive:
                                  widget.materialReceiveDetail.materialReceive,
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
