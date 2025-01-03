import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_global_invoice_date.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfDebtBalanceGlobalInvoiceDate({
  required List<DebtBalanceGlobalInvoiceDate> data,
  required bool isDueDate,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: isDueDate
        ? 'REKAPITULASI PENDING PER KODE OBAT by TGL JATUH TEMPO'
        : 'REKAPITULASI SALDO HUTANG GLOBAL by TGL FAKTUR', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<DebtBalanceGlobalInvoiceDate>(
          data: data,
          columns: [
            PColumn(
              title: 'name'.tr() + 'supplier'.tr(),
              contentBuilder: (data, index) => data.supplierName,
            ),
            PColumn(
              title: '${'total'.tr()} (Rp.)',
              contentBuilder: (data, index) => data.accountValue.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
