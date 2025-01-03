import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductReturnNoteRecap({
  required List<ProductReturnNoteRecap> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'Laporan Rekap Nota Retur', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<ProductReturnNoteRecap>(
          data: data,
          columns: [
            PColumn(
              title: 'customer_name'.tr(),
              contentBuilder: (data, index) => data.customer,
            ),
            PColumn(
              title: 'reference_no'.tr(),
              contentBuilder: (data, index) => data.referenceNo,
            ),
            PColumn(
              title: 'warehouse'.tr(),
              contentBuilder: (data, index) => data.warehouse,
            ),
            PColumn(
              title: 'division'.tr(),
              contentBuilder: (data, index) => 'PT. Metiska Farma',
            ),
            PColumn(
              title: 'product'.tr(),
              contentBuilder: (data, index) => data.product,
            ),
            PColumn(
              title: 'quantity'.tr(),
              contentBuilder: (data, index) => data.quantity.format(),
            ),
            PColumn(
              title: 'unit'.tr(),
              contentBuilder: (data, index) => data.unitId,
            ),
            PColumn(
              title: 'percent_discount'.tr(),
              contentBuilder: (data, index) => data.discountPercent.format(),
            ),
            PColumn(
              title: 'expired_date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('yyyyMM').format(
                  data.expirationDate,
                );
              },
            ),
            PColumn(
              title: 'batch_no'.tr(),
              contentBuilder: (data, index) => data.batchNo,
            ),
            PColumn(
              title: 'no_tax_invoice'.tr(),
              contentBuilder: (data, index) => data.taxInvoiceNo,
            ),
          ],
        ),
      ]; // Center
    },
  );
}
