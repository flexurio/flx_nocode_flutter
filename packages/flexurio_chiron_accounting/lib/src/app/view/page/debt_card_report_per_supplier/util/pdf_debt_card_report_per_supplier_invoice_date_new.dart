import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_card_report_per_supplier_invoice_date_new.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfDebtCardReportPerSupplierInvoiceDateNew({
  required List<DebtCardReportPerSupplierInvoiceDateNew> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    orientation: PageOrientation.landscape,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'KARTU HUTANG by TGL FAKTUR NEW', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<DebtCardReportPerSupplierInvoiceDateNew>(
          data: data,
          columns: [
            PColumn(
              title: 'NoInvoice',
              contentBuilder: (data, index) => data.invoiceNo,
            ),
            PColumn(
              title: 'TglInvoice',
              contentBuilder: (data, index) {
                return DateFormat('dd/MM/yyyy').format(data.invoiceDate);
              },
            ),
            PColumn(
              title: 'TglTerimaInvoice',
              contentBuilder: (data, index) {
                return DateFormat('dd/MM/yyyy').format(data.invoiceReceiveDate);
              },
            ),
            PColumn(
              title: 'TglJT',
              contentBuilder: (data, index) {
                return DateFormat('dd/MM/yyyy').format(data.dueDate);
              },
            ),
            PColumn(
              title: 'NoVoucher',
              contentBuilder: (data, index) => data.paymentId,
            ),
            PColumn(
              title: 'Keterangan',
              contentBuilder: (data, index) => data.description ?? '-',
            ),
            PColumn(
              title: 'NoPO',
              contentBuilder: (data, index) => data.orderId,
            ),
            PColumn(
              title: 'NoSJ',
              contentBuilder: (data, index) {
                return data.deliveryOrderId == '' ? '-' : data.deliveryOrderId;
              },
            ),
            PColumn(
              title: 'TglTerimaBrg',
              contentBuilder: (data, index) {
                return data.receiveDate == null
                ? '-'
                : DateFormat('dd/MM/yyyy').format(data.receiveDate!);
              },
            ),
            PColumn(
              title: 'NoLPB',
              contentBuilder: (data, index) => data.transactionId,
            ),
            PColumn(
              title: 'Nominal',
              contentBuilder: (data, index) => data.paymentRemaining.format(),
            ),
            PColumn(
              title: 'Pelunasan',
              contentBuilder: (data, index) => data.paymentAmount.format(),
            ),
          ],
        ),
      ]; 
    },
  );
}
