import 'dart:typed_data';

import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail/sales_order_detail_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_print_invoice/sales_order_print_invoice_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:intl/intl.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../util/sales_order_invoice_pdf.dart';

class SalesOrderPrintInvoiceButton extends StatelessWidget {
  const SalesOrderPrintInvoiceButton._( this.salesOrder, this.onPrinted );

  final SalesOrder salesOrder;
  final void Function() onPrinted;

  static Widget prepare(
    SalesOrder salesOrder, {
    required void Function() onPrinted,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderDetailBloc()
            ..add(SalesOrderDetailEvent.fetch(salesOrder: salesOrder)),
        ),
      ],
      child: SalesOrderPrintInvoiceButton._( salesOrder, onPrinted ),
    );
  }

  Future<Uint8List> _generatePdf(
    Map<SalesOrderDetail, ProductStock?>? salesOrderDetails,
    String taxInvoiceNumber,
  ) async {
    final pdf = pw.Document()
      ..addPage(
        await printInvoiceSalesOrder(
          taxInvoiceNumber: taxInvoiceNumber,
          salesOrder: salesOrder,
          salesOrderDetail: salesOrderDetails!.keys.toList(),
        ),
      );
    return await pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderDetailBloc, SalesOrderDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: Container.new,
          initial: (_, salesOrderDetails) {
            return IconButtonSmall(
              action: DataAction.printInvoice,
              permission: PermissionProductStock.salesOrderPrintInvoice,
              onPressed: () async {
                showDialogViewPDF(
                  context: context,
                  pdfData: await _generatePdf(salesOrderDetails, "-"),
                  actions: [
                    _printButton(context, salesOrderDetails),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  String _generateFileName(SalesOrder salesOrder) {
    final now = DateTime.now();
    final month = DateFormat('MMM').format(now);
    final year = DateFormat('yy').format(now);
    final distributorId = salesOrder.productRequest?.customer.id ?? '';
    final extraDiscount =
        salesOrder.additionalDiscountValue > 0.0 ? ' (EX DISC)' : '';
    final code = salesOrder.invoiceId.split('/')[0];
    final serialNumber = salesOrder.invoiceId.substring(
        salesOrder.invoiceId.length - 4, salesOrder.invoiceId.length);
    return '$code $serialNumber - $month $year $distributorId$extraDiscount.pdf';
  }

  Widget _printButton(
    BuildContext context,
    Map<SalesOrderDetail, ProductStock?>? salesOrderDetails,
  ) {
    final salesOrderPrintInvoiceBloc = SalesOrderPrintInvoiceBloc();
    return BlocListener<SalesOrderPrintInvoiceBloc,
        SalesOrderPrintInvoiceState>(
      bloc: salesOrderPrintInvoiceBloc,
      listener: (context, state) {
        state.maybeWhen(
          success: (taxInvoiceNumber) async {
            Printing.sharePdf(
              bytes: await _generatePdf(salesOrderDetails, taxInvoiceNumber),
              filename: _generateFileName(salesOrder),
            );
            onPrinted();
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child:
          BlocBuilder<SalesOrderPrintInvoiceBloc, SalesOrderPrintInvoiceState>(
        bloc: salesOrderPrintInvoiceBloc,
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.printPDF,
            status: state.maybeWhen(
              loading: () => Status.progress,
              orElse: () => null,
            ),
            permission: null,
            onPressed: () {
              showDialog<bool?>(
                  context: context,
                  builder: (context) {
                    return CardConfirmation(
                      isProgress: false,
                      action: DataAction.printPDF,
                      data: Entity.salesOrder,
                      onConfirm: () {
                        print(_generateFileName(salesOrder));
                        salesOrderPrintInvoiceBloc.add(
                          SalesOrderPrintInvoiceEvent.printInvoice(salesOrder),
                        );
                        Navigator.pop(context);
                      },
                    );
                  });
            },
          );
        },
      ),
    );
  }
}

void showDialogViewPDF({
  required BuildContext context,
  required Uint8List pdfData,
  required List<Widget> actions,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              width: 1000,
              child: SfPdfViewer.memory(pdfData),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                color: const Color(0XFFEDE6F3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
