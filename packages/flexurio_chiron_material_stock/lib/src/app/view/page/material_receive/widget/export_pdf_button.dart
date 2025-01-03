import 'dart:typed_data';

import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';

class ExportPdfButton extends StatefulWidget {
  const ExportPdfButton._({
    required this.materialReceiveDetail,
    required this.isExternal,
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
      child: ExportPdfButton._(
        materialReceiveDetail: materialReceiveDetail,
        isExternal: isExternal,
      ),
    );
  }

  final MaterialReceiveDetail materialReceiveDetail;
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
            final originalList = materialReceiveDetails.data;

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
              final chunks = <List<T>>[];
              for (var i = 0; i < list.length; i += chunkSize) {
                final end =
                    (i + chunkSize < list.length) ? i + chunkSize : list.length;
                chunks.add(list.sublist(i, end));
              }
              return chunks;
            }

            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title:
                    'Bon_Penerimaan_Bahan_${widget.materialReceiveDetail.materialReceive.materialGroup.id}.pdf'
                        .replaceAll('/', '-'),
              );

              final data = materialReceiveDetails.data;

              final uniqueData = data.fold<List<MaterialReceiveDetail>>([],
                  (previousValue, element) {
                if (!previousValue.any((e) => e.na == element.na)) {
                  previousValue.add(element);
                }
                return previousValue;
              });

              uniqueData.sort((a, b) => a.vatNo.compareTo(b.vatNo));

              final chunkedData = chunkList(uniqueData, 3);

              print('Total Chunks: ${chunkedData.length}');

              for (var i = 0; i < chunkedData.length; i++) {
                print('Chunk $i: ${chunkedData[i].length} items');
              }

              if (materialReceiveDetails.data.length > 3) {
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfMaterialReceive(
                          widget.materialReceiveDetail,
                          chunkedData[i],
                          originalList,
                        );
                      }),
                    );
                  } catch (e) {
                    print('Error adding page $i: $e');
                    rethrow;
                  }
                }
              } else {
                try {
                  pdf.addPage(
                    await Future.delayed(const Duration(milliseconds: 1500),
                        () {
                      final uniqueItem = materialReceiveDetails.data
                          .fold<List<MaterialReceiveDetail>>([],
                              (previousValue, element) {
                        if (!previousValue.any((e) => e.na == element.na)) {
                          previousValue.add(element);
                        }
                        return previousValue;
                      });

                      return pdfMaterialReceive(
                        widget.materialReceiveDetail,
                        uniqueItem,
                        originalList,
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
              name:
                  'Bon_Penerimaan_Bahan_${widget.materialReceiveDetail.materialReceive.materialGroup.id}.pdf'
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
              : IconButtonSmall(
                  permission:
                      PermissionMaterialStock.acceptanceReceiptExportPdf,
                  tooltipMessage: 'Print Bon Penerimaan',
                  action: DataAction.exportPdf,
                  onPressed: () async {
                    context.read<MaterialReceiveDetailQueryBloc>().add(
                          MaterialReceiveDetailQueryEvent.fetch(
                            materialReceive:
                                widget.materialReceiveDetail.materialReceive,
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
