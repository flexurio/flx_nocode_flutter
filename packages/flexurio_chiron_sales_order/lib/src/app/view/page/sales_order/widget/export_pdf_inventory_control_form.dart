import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail_query/sales_order_detail_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../util/pdf_report_inventory_control_form.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';

class ExportPdfInventoryControlForm extends StatefulWidget {
  const ExportPdfInventoryControlForm._({required this.salesOrder});

  static Widget prepare({
    required SalesOrder salesOrder,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderDetailQueryBloc(),
        ),
      ],
      child: ExportPdfInventoryControlForm._(salesOrder: salesOrder),
    );
  }

  final SalesOrder salesOrder;

  @override
  State<ExportPdfInventoryControlForm> createState() =>
      _ExportPdfInventoryControlFormState();
}

class _ExportPdfInventoryControlFormState extends State<ExportPdfInventoryControlForm> {
  late bool _isProgress;

  @override
  void initState() {
    _isProgress = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesOrderDetailQueryBloc, SalesOrderDetailQueryState>(
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
                title: 'inventory_control_form_${widget.salesOrder.id}.pdf'
                    .replaceAll('/', '-'),
              );
              if (data.length > 0) {
                final chunkedData = chunkList(data, 1);
                for (var i = 0; i < chunkedData.length; i++) {
                  try {
                    pdf.addPage(
                      await Future.delayed(const Duration(milliseconds: 1500),
                          () {
                        return pdfReportInventoryControlForm(
                          // widget.materialReceiveDetail,
                          widget.salesOrder,
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
              }else {
                Toast(context).fail('error.quantity_not_available'
                    .tr(namedArgs: {'data': 'Material'}));
              }

              return pdf.save();
            }

            await Printing.layoutPdf(
              format: PdfPageFormat.a5.landscape,
              onLayout: (format) => generatePdf(),
              name: 'inventory_control_form_${widget.salesOrder.id}.pdf'
                  .replaceAll('/', '-'),
            );
          },
        );
      },
      child: BlocBuilder<SalesOrderDetailQueryBloc, SalesOrderDetailQueryState>(
        builder: (context, state) {
          return _isProgress
              ? const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: CupertinoActivityIndicator(color: Colors.red),
                )
              : IconButtonSmall(
                  permission: PermissionProductStock
                      .reportSalesOrderExportPdf,
                  tooltipMessage: 'print_inventory_control_form'.tr(),
                  action: DataAction.exportPdf,
                  onPressed: () async {
                    context.read<SalesOrderDetailQueryBloc>().add(
                          SalesOrderDetailQueryEvent.fetch(widget.salesOrder),
                        );
                  },
                );
        },
      ),
    );
  }
}
