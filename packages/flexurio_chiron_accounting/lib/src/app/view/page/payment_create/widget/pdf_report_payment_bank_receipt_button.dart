import 'dart:typed_data';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_detail_receivable.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/pdf_report_payment_bank_receipt.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PaymentBankReceiptPrintButton extends StatelessWidget {
  const PaymentBankReceiptPrintButton({
    required this.payment,
    required this.paymentDetail,
    required this.transactionPayment,
    super.key,
  });

  final Payment payment;
  final TransactionPayment transactionPayment;
  final List<PaymentDetailReceivable> paymentDetail;

  @override
  Widget build(BuildContext context) {
    final fileName = 'Payment_Bank_Receipt_${payment.id}.pdf';
    return LightButton(
      action: DataAction.printBankReceiptPDF,
      permission: Permission.paymentBankReceiptPdf,
      onPressed: () async {
        Future<Uint8List> generatePdf() async {
          final pdf = pw.Document(
            title: fileName,
          )..addPage(
              await Future.delayed(const Duration(milliseconds: 1500), () {
                return pdfReportPaymentBankReceipt(
                  payment: payment,
                  paymentDetail: paymentDetail,
                  transactionPayment: transactionPayment,
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
