// TODO(umar): refactor
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_detail_query/sales_order_detail_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../util/pdf_report_sales_order.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';

class ExportPdfSalesOrderButton extends StatefulWidget {
  const ExportPdfSalesOrderButton._({required this.salesOrder});

  static Widget prepare({required SalesOrder salesOrder}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SalesOrderDetailQueryBloc(),
        ),
      ],
      child: ExportPdfSalesOrderButton._(salesOrder: salesOrder),
    );
  }

  final SalesOrder salesOrder;

  @override
  State<ExportPdfSalesOrderButton> createState() =>
      _ExportPdfSalesOrderButtonState();
}

class _ExportPdfSalesOrderButtonState extends State<ExportPdfSalesOrderButton> {
  bool _isProgress =false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SalesOrderDetailQueryBloc, SalesOrderDetailQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (salesOrderDetail) async {
            await _exportSalesOrderAsPdf(salesOrderDetail);
          },
        );
      },
      child: BlocBuilder<SalesOrderDetailQueryBloc, SalesOrderDetailQueryState>(
        builder: (context, state) {
          return _isProgress
              ? _buildLoadingIndicator()
              : _buildExportButton(context);
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CupertinoActivityIndicator(color: Colors.red),
    );
  }

  Widget _buildExportButton(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProductStock.reportSalesOrderExportPdf,
      tooltipMessage: 'print_sales_order'.tr(),
      action: DataAction.exportPdf,
      onPressed: () {
        setState(() => _isProgress = true);
        context.read<SalesOrderDetailQueryBloc>().add(
              SalesOrderDetailQueryEvent.fetch(widget.salesOrder),
            );
      },
    );
  }

  Future<void> _exportSalesOrderAsPdf(
      List<SalesOrderDetail> salesOrderDetail) async {
    try {
      final title = 'bon_permintaan_barang_jadi_${widget.salesOrder.id}.pdf';
      final pdfData = await _generatePdf(salesOrderDetail,title);
      await Printing.layoutPdf(
        format: PdfPageFormat.a5.portrait,
        onLayout: (_) => pdfData,
        name: title,
      );
    } catch (e) {
      // Handle errors if necessary
    } finally {
      setState(() => _isProgress = false);
    }
  }

  Future<Uint8List> _generatePdf(
      List<SalesOrderDetail> salesOrderDetail, String title) async {
    final pdf = pw.Document(
        title: title);
    final chunks = _chunkList(salesOrderDetail,
        salesOrderDetail.length > 0 ? salesOrderDetail.length : 1);

    for (var i = 0; i < chunks.length; i++) {
      pdf.addPage(await _buildPdfPage(chunks[i], i));
    }
    return pdf.save();
  }

  Future<pw.Page> _buildPdfPage(
      List<SalesOrderDetail> data, int chunkIndex) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return pdfReportSalesOder(widget.salesOrder, data, chunkIndex: chunkIndex);
  }

  List<List<T>> _chunkList<T>(List<T> list, int chunkSize) {
    return List.generate(
      (list.length / chunkSize).ceil(),
      (i) => list.sublist(
          i * chunkSize,
          (i + 1) * chunkSize > list.length
              ? list.length
              : (i + 1) * chunkSize),
    );
  }
}
