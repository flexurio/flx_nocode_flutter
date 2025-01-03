import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_mutation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfInvoice({
  required List<AccountsReceivableMutation> data,
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
      title: 'accounts_receivable_mutation_report'.tr(), 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<AccountsReceivableMutation>(
          data: data,
          columns: [
            PColumn(
              title: 'customer'.tr(),
              contentBuilder: (data, index) => data.customer,
            ),
            PColumn(
              title: 'beginning_balance'.tr(),
              contentBuilder: (data, index) {
                return data.beginningBalance == 0
                ? '0'
                : format.format(data.beginningBalance);
              },
            ),
            PColumn(
              title: 'debit'.tr(),
              contentBuilder: (data, index) {
                return data.debit == 0
                ? '0'
                : format.format(data.debit);
              },
            ),
            PColumn(
              title: 'credit'.tr(),
              contentBuilder: (data, index) {
                return data.credit == 0
                ? '0'
                : format.format(data.credit);
              },
            ),
            PColumn(
              title: 'ending_balance'.tr(),
              contentBuilder: (data, index) {
                return data.endingBalance == 0
                ? '0'
                : format.format(data.endingBalance);
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
