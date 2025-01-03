import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfPurchaseSummaryGlobal({
  required List<PurchaseSummaryGlobal> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'REKAPITULASI PEMBELIAN', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<PurchaseSummaryGlobal>(
          data: data,
          columns: [
            PColumn(
              title: 'invoice_number'.tr(),
              contentBuilder: (data, index) => data.transactionId,
            ),
            PColumn(
              title: 'transaction_date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('dd MMMM yyyy').format(data.transactionDate);
              },
            ),
            PColumn(
              title: 'rate'.tr(),
              contentBuilder: (data, index) => data.currencyId,
            ),
            PColumn(
              title: 'rate'.tr(),
              contentBuilder: (data, index) => data.rate.toString(),
            ),
            PColumn(
              title: 'rpjk'.tr(),
              contentBuilder: (data, index) => data.rate.toString(),
            ),
            PColumn(
              title: 'subtotal'.tr(),
              contentBuilder: (data, index) => data.subtotal.format(),
            ),
            PColumn(
              title: 'ppn_value'.tr(),
              contentBuilder: (data, index) => data.ppnValue.format(),
            ),
            PColumn(
              title: 'total'.tr(),
              contentBuilder: (data, index) => data.total.format(),
            ),
            PColumn(
              title: '${'total'.tr()}(Rp.)',
              contentBuilder: (data, index) => data.total.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
