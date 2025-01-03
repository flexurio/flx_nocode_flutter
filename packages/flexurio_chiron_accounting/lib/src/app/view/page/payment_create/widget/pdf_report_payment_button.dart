import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/pdf_report_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PaymentReportPrintButton extends StatelessWidget {
  const PaymentReportPrintButton({
    required this.payment,
    required this.transactionPayment,
    required this.paymentDetail,
    super.key,
  });

  final Payment payment;
  final TransactionPayment transactionPayment;
  final List<PaymentDetailReceivable> paymentDetail;

  @override
  Widget build(BuildContext context) {
    final fileName = 'Report_Payment_${payment.id}.pdf';
    return LightButton(
      action: DataAction.printPDF,
      permission: Permission.paymentExportPdf,
      title: 'settlement'.tr(),
      onPressed: () async {
        Future<Uint8List> generatePdf() async {
          final pdf = pw.Document(
            title: fileName,
          )..addPage(
              await Future.delayed(const Duration(milliseconds: 1500), () {
                return pdfReportPayment(
                  payment: payment,
                  transactionPayment: transactionPayment,
                  paymentDetail: paymentDetail,
                );
              }),
            );

          return pdf.save();
        }

        await Printing.layoutPdf(
          format: PdfPageFormat.a4.portrait,
          onLayout: (format) => generatePdf(),
          name: fileName,
        );
      },
    );
  }
}
