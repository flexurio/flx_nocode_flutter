import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/purchase_summary_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfPurchaseSummaryDetail({
  required List<PurchaseSummaryDetail> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'REKAPITULASI PEMBELIAN DETAIL', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<PurchaseSummaryDetail>(
          data: data,
          columns: [
            PColumn(
              title: 'description'.tr(),
              contentBuilder: (data, index) => data.description,
            ),
            PColumn(
              title: 'unit'.tr(),
              contentBuilder: (data, index) {
                return data.unitId ?? '-';
              },
            ),
            PColumn(
              title: 'quantity'.tr(),
              contentBuilder: (data, index) {
                return (data.quantity ?? 0).format();
              },
            ),
            PColumn(
              title: 'price'.tr(),
              contentBuilder: (data, index) {
                return data.price.format();
              },
            ),
            PColumn(
              title: 'subtotal'.tr(),
              contentBuilder: (data, index) {
                return data.subtotal.format();
              },
            ),
            PColumn(
              title: 'ppn_value'.tr(),
              contentBuilder: (data, index) {
                return data.ppnValue.format();
              },
            ),
            PColumn(
              title: 'pph22_value'.tr(),
              contentBuilder: (data, index) {
                return data.pph22Value.format();
              },
            ),
            PColumn(
              title: 'total'.tr(),
              contentBuilder: (data, index) {
                return data.total.format();
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
