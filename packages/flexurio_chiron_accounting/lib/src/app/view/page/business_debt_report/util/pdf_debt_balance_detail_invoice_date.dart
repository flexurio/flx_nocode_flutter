import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/debt_balance_detail_invoice_date.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfDebtBalanceDetailInvoiceDate({
  required List<DebtBalanceDetailInvoiceDate> data,
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
        ? 'FAKTUR-FAKTUR PEMBELIAN YANG BELUM LUNAS by TGL JATUH TEMPO'
        : 'FAKTUR-FAKTUR PEMBELIAN YANG BELUM LUNAS by TGL FAKTUR', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<DebtBalanceDetailInvoiceDate>(
          data: data,
          columns: [
            PColumn(
              title: 'description'.tr(),
              contentBuilder: (data, index) => data.transactionId,
            ),
            PColumn(
              title: 'date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('d MMM yyyy').format(data.transactionDate);
              },
            ),
            PColumn(
              title: 'due_date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('d MMM yyyy').format(data.dueDate);
              },
            ),
            PColumn(
              title: 'currency'.tr(),
              contentBuilder: (data, index) => data.currencyId,
            ),
            PColumn(
              title: 'rate'.tr(),
              contentBuilder: (data, index) => data.rate.format(),
            ),
            PColumn(
              title: 'total'.tr(),
              contentBuilder: (data, index) => data.accountValue.format(),
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
