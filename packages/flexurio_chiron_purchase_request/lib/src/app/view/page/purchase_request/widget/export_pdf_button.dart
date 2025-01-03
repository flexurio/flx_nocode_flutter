import 'dart:typed_data';

import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request/material_request_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/util/pdf_material_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPdfButton extends StatefulWidget {
  const ExportPdfButton._({
    required this.materialRequest,
    required this.status,
  });

  static Widget prepare(
    MaterialRequest materialRequest,
    PurchaseRequestStatus? status,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
        BlocProvider(create: (context) => MaterialRequestBloc()),
        BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
      ],
      child:
          ExportPdfButton._(materialRequest: materialRequest, status: status!),
    );
  }

  final MaterialRequest materialRequest;
  final PurchaseRequestStatus status;

  @override
  State<ExportPdfButton> createState() => _ExportPdfButtonState();
}

class _ExportPdfButtonState extends State<ExportPdfButton> {
  var _purchases = <PurchaseOrderDetail>[];
  late bool _isProgress;

  @override
  void initState() {
    _isProgress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialRequestDetailQueryBloc,
        MaterialRequestDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () {
            _isProgress = true;
            return const Center(child: CupertinoActivityIndicator());
          },
          error: (error) {
            _isProgress = false;
            Toast(context).fail(error);
          },
          orElse: () {},
          loaded: (materialRequestDetails) async {
            _isProgress = false;
            var materialRequestDetail = <PurchaseRequestDetail>[];

            if (materialRequestDetails.isEmpty) {
              materialRequestDetail.add(
                PurchaseRequestDetail(
                  id: 0,
                  status: PurchaseRequestDetailStatus.empty,
                  unit: MaterialUnit.empty(),
                  dueDate: DateTime.now(),
                  materialRequestFormId: '',
                  createdAt: DateTime.now(),
                  confirmAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  closeRequestFormAt: DateTime.now(),
                  createdById: 0,
                  updatedById: 0,
                  confirmById: 0,
                  closeRequestFormById: 0,
                ),
              );
            } else {
              materialRequestDetail = materialRequestDetails;
            }

            context.read<MaterialRequestBloc>().add(
                  MaterialRequestEvent.print(
                    materialRequest: widget.materialRequest,
                  ),
                );
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

            context.read<PurchaseOrderDetailQueryBloc>().add(
                  PurchaseOrderDetailQueryEvent.fetchAll(
                    materials: materialRequestDetails
                        .map((e) => e.material ?? model.Material.empty())
                        .toList(),
                    products: materialRequestDetails
                        .map((e) => e.product ?? Product.empty())
                        .toList(),
                  ),
                );

            Future<Uint8List> generatePdf() async {
              final pdf = pw.Document(
                title: 'Purchase_Request_${widget.materialRequest.id}.pdf'
                    .replaceAll('/', '-'),
              );
              if (materialRequestDetails.length > 3) {
                final chunkedData = chunkList(materialRequestDetails, 3);
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfMaterialRequest(
                          widget.materialRequest,
                          chunkedData[i],
                          _purchases,
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
                      return pdfMaterialRequest(
                        widget.materialRequest,
                        materialRequestDetails,
                        _purchases,
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
              format: PdfPageFormat.a5.landscape,
              onLayout: (format) => generatePdf(),
              name: 'Purchase_Request_${widget.materialRequest.id}.pdf'
                  .replaceAll('/', '-'),
            );
          },
        );
      },
      child: BlocBuilder<PurchaseOrderDetailQueryBloc,
          PurchaseOrderDetailQueryState>(
        builder: (context, state) {
          final purchases = state.maybeWhen(
            orElse: () => <PurchaseOrderDetail>[],
            loaded: (details) => details,
          );
          _purchases = List.from(purchases);
          return BlocBuilder<MaterialRequestDetailQueryBloc,
              MaterialRequestDetailQueryState>(
            builder: (context, state) {
              return _isProgress
                  ? const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: CupertinoActivityIndicator(color: Colors.red),
                    )
                  : IconButtonSmall(
                      permission: Permission.purchaseRequestExportPdf,
                      tooltipMessage: DataAction.exportPdf.title,
                      action: DataAction.exportPdf,
                      onPressed: () async {
                        _purchases.clear();
                        context.read<MaterialRequestDetailQueryBloc>().add(
                              MaterialRequestDetailQueryEvent.fetch(
                                materialRequest: widget.materialRequest,
                              ),
                            );
                      },
                    );
            },
          );
        },
      ),
    );
  }
}
