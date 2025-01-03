import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_mutation_report_invoice_due_date.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfDebtMutationReportDueDate({
  required List<DebtMutationReportInvoiceDueDate> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'LAPORAN MUTASI HUTANG USAHA by TGL JATUH TEMPO', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<DebtMutationReportInvoiceDueDate>(
          data: data,
          columns: [
            PColumn(
              title: 'supplier'.tr(),
              contentBuilder: (data, index) => data.supplierName,
            ),
            PColumn(
              title: 'beginning_balance'.tr(),
              contentBuilder: (data, index) => data.beginningBalance.format(),
            ),
            PColumn(
              title: 'debit'.tr(),
              contentBuilder: (data, index) => data.debit.format(),
            ),
            PColumn(
              title: 'credit'.tr(),
              contentBuilder: (data, index) => data.credit.format(),
            ),
            PColumn(
              title: 'ending_balance'.tr(),
              contentBuilder: (data, index) => data.endingBalance.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
