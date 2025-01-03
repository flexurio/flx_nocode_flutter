import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/pdf_product_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPdfButton extends StatefulWidget {
  const ExportPdfButton._({
    required this.productReceiveDetail,
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductReceiveDetailQueryBloc(isExternal: isExternal),
        ),
      ],
      child: ExportPdfButton._(
          productReceiveDetail: productReceiveDetail, isExternal: isExternal),
    );
  }

  final ProductReceiveDetail productReceiveDetail;

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
    bool isHandover =
        widget.productReceiveDetail.productReceive.id.substring(0, 3) == 'BPP';

    return BlocListener<ProductReceiveDetailQueryBloc,
        ProductReceiveDetailQueryState>(
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
          loaded: (productReceiveDetails) async {
            _isProgress = false;
            // var materialRequestDetail = <ProductReceiveDetail>[];

            // if (productReceiveDetails.data.isEmpty) {
            //   materialRequestDetail.add(
            //     ProductReceiveDetail(
            //       id: 0,
            //       createdAt: DateTime.now(),
            //       updatedAt: DateTime.now(),
            //       quantity: 0,
            //       createdById: 0,
            //       updatedById: 0,
            //       expiredDate: DateTime.now(),
            //       productReceive: ProductReceive.empty(),
            //       warehouse: Warehouse.unknown,
            //       unit: MaterialUnit.empty(),
            //       status: ProductReceiveDetailStatus.empty,
            //       product: Product.empty(),
            //       productionOrder: ProductionOrder.empty(),
            //     ),
            //   );
            // } else {
            //   materialRequestDetail = productReceiveDetails.data;
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
                title: isHandover
                    ? 'Bon_Serah_Terima_Produk_Jadi_${widget.productReceiveDetail.productReceive.id}.pdf'
                        .replaceAll('/', '-')
                    : 'Bon_Penerimaan_Produk_Jadi_${widget.productReceiveDetail.productReceive.id}.pdf'
                        .replaceAll('/', '-'),
              );
              if (productReceiveDetails.data.length > 3) {
                final chunkedData = chunkList(productReceiveDetails.data, 3);
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfProductReceive(
                          widget.productReceiveDetail,
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
                      return pdfProductReceive(
                        widget.productReceiveDetail,
                        productReceiveDetails.data,
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
              name: isHandover
                  ? 'Bon_Serah_Terima_Produk_Jadi_${widget.productReceiveDetail.productReceive.id}.pdf'
                      .replaceAll('/', '-')
                  : 'Bon_Penerimaan_Produk_Jadi_${widget.productReceiveDetail.productReceive.id}.pdf'
                      .replaceAll('/', '-'),
            );
          },
        );
      },
      child: BlocBuilder<ProductReceiveDetailQueryBloc,
          ProductReceiveDetailQueryState>(
        builder: (context, state) {
          return _isProgress
              ? const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: CupertinoActivityIndicator(color: Colors.red),
                )
              : IconButtonSmall(
                  // permission: Permission.productReceiveExportPdf,
                  permission: PermissionProductStock.productReceiveViewMenu(
                    isExternal: widget.isExternal,
                  ),
                  tooltipMessage:
                      '${isHandover ? 'handover' : 'product_receive'}_receipt'
                          .tr(),
                  action: DataAction.exportPdf,
                  onPressed: () async {
                    context.read<ProductReceiveDetailQueryBloc>().add(
                          ProductReceiveDetailQueryEvent.fetch(
                            pageOptions: PageOptions.emptyNoLimit(),
                            productReceive:
                                widget.productReceiveDetail.productReceive,
                          ),
                        );
                  },
                );
        },
      ),
    );
  }
}
