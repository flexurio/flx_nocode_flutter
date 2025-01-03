import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ExportPdfProductReturnPrintSrpButton extends StatefulWidget {
  const ExportPdfProductReturnPrintSrpButton._(
      {required this.productReturn,
      required this.productReturnDetailQueryBloc});

  static Widget prepare({
    required ProductReturn productReturn,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnCheckQueryBloc(),
        ),
        BlocProvider(
          create: (context) => productReturnDetailQueryBloc,
        ),
      ],
      child: ExportPdfProductReturnPrintSrpButton._(
          productReturn: productReturn,
          productReturnDetailQueryBloc: productReturnDetailQueryBloc),
    );
  }

  final ProductReturn productReturn;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  @override
  State<ExportPdfProductReturnPrintSrpButton> createState() =>
      _ExportPdfProductReturnPrintSrpButtonState();
}

class _ExportPdfProductReturnPrintSrpButtonState
    extends State<ExportPdfProductReturnPrintSrpButton> {
  late bool _isProgress;

  @override
  void initState() {
    _isProgress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductReturnCheckQueryBloc, ProductReturnCheckQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loading: (_) => _isProgress = true,
              loaded: (ProductReturnCheck) async {
                print('Total data: ${ProductReturnCheck.data.length}');
                _isProgress = false;

                List<List<T>> chunkList<T>(List<T> list, int chunkSize) {
                  final result = <List<T>>[];
                  for (var i = 0; i < list.length; i += chunkSize) {
                    result.add(
                      list.sublist(
                        i,
                        i + chunkSize > list.length
                            ? list.length
                            : i + chunkSize,
                      ),
                    );
                  }
                  return result;
                }

                Future<Uint8List> generatePdf() async {
                  final pdf = pw.Document(
                    title: 'report_srp_${widget.productReturn.id}.pdf',
                  );
                  if (ProductReturnCheck.data.length > 0) {
                    final chunkedData = chunkList(ProductReturnCheck.data,
                        ProductReturnCheck.data.length);
                    for (var i = 0; i < chunkedData.length; i++) {
                      try {
                        pdf.addPage(
                          await Future.delayed(
                              const Duration(milliseconds: 1500), () {
                            return pdfReportProductReturnDelivery(
                              widget.productReturn,
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
                          return pdfReportProductReturnDelivery(
                            widget.productReturn,
                            ProductReturnCheck.data,
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
                  name: 'report_srp_${widget.productReturn.id}.pdf',
                );
              },
            );
          },
        ),
      ],
      child: BlocBuilder<ProductReturnDetailQueryBloc,
              ProductReturnDetailQueryState>(
          bloc: widget.productReturnDetailQueryBloc,
          builder: (context, state) {
            var qtyCheckCount = state.maybeWhen(
              orElse: () => 0,
              loaded: (ProductReturnDetail) {
                if (ProductReturnDetail.data.isEmpty) {
                  return 0;
                } else {
                  return ProductReturnDetail.data
                      .map((data) => data.quantityCheck)
                      .reduce((value, element) => value + element);
                }
              },
            );
            return BlocBuilder<ProductReturnCheckQueryBloc,
                ProductReturnCheckQueryState>(
              builder: (context, state) {
                return _isProgress
                    ? const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: CupertinoActivityIndicator(color: Colors.red),
                      )
                    : LightButton(
                        action: DataAction.printPDF,
                        title: 'print_srp'.tr(),
                        permission:
                            PermissionProductStock.productReturnSrpExportPdf,
                        onPressed: () {
                          if (qtyCheckCount == 0) {
                            Toast(context).fail('error.not_checked_by'.tr(
                                namedArgs: {'first': 'SRP', 'second': 'QA'}));
                          } else {
                            context.read<ProductReturnCheckQueryBloc>().add(
                                  ProductReturnCheckQueryEvent.fetch(
                                    productReturnId: widget.productReturn.id,
                                    pageOptions: PageOptions.emptyNoLimit(),
                                  ),
                                );
                          }
                        },
                      );
              },
            );
          }),
    );
  }
}
