import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfDebtCardReportPerSupplierInvoiceDate({
  required List<DebtCardReportPerSupplierInvoiceDate> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'KARTU HUTANG by TGL FAKTUR', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<DebtCardReportPerSupplierInvoiceDate>(
          data: data,
          columns: [
            PColumn(
              title: 'description'.tr(),
              contentBuilder: (data, index) => data.description ?? '-',
            ),
            PColumn(
              title: 'date_receive_goods'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('d MMM yyyy').format(
                  data.transactionDate,
                );
              },
            ),
            PColumn(
              title: 'transaction_no'.tr(),
              contentBuilder: (data, index) => data.transactionNo ?? '-',
            ),
            PColumn(
              title: 'invoice_no'.tr(),
              contentBuilder: (data, index) => data.paymentNo ?? '-',
            ),
            PColumn(
              title: 'debit'.tr(),
              contentBuilder: (data, index) => data.debitBalance.format(),
            ),
            PColumn(
              title: 'credit'.tr(),
              contentBuilder: (data, index) => data.creditBalance.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
