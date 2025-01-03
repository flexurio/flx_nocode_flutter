import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfInvoice({
  required List<AccountsReceivableCustomer> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final format = NumberFormat('#,##0.00', 'en_US');

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(24),
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'accounts_receivable_card'.tr(),
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<AccountsReceivableCustomer>(
          data: data,
          columns: [
            PColumn(
              title: 'description'.tr(),
              contentBuilder: (data, index) => data.description,
            ),
            PColumn(
              title: 'transaction_number'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('dd MMMM yyyy').format(
                  data.transactionDate,
                );
              },
            ),
            PColumn(
              title: 'payment_no'.tr(),
              contentBuilder: (data, index) => data.paymentNo,
            ),
            PColumn(
              title: 'invoice'.tr(),
              contentBuilder: (data, index) => data.transactionNo,
            ),
            PColumn(
              title: 'debit'.tr(),
              contentBuilder: (data, index) {
                return data.debitBalance == 0
                    ? '0'
                    : format.format(data.debitBalance);
              },
            ),
            PColumn(
              title: 'credit'.tr(),
              contentBuilder: (data, index) {
                return data.creditBalance == 0
                    ? '0'
                    : format.format(data.creditBalance);
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
