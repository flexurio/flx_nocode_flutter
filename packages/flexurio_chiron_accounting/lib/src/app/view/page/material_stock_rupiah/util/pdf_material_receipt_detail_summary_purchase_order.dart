import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_receipt_detail_summary_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialReceiptDetailSummaryByPurchaseOrder({
  required List<MaterialReceiptDetailSummaryPurchaseOrder> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'LAPORAN PENERIMAAN MATERIAL BANTU', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<MaterialReceiptDetailSummaryPurchaseOrder>(
          data: data,
          columns: [
            PColumn(
              title: 'No. BPB',
              contentBuilder: (data, index) => data.transactionId,
            ),
            PColumn(
              title: 'Tgl BPB',
              contentBuilder: (data, index) {
                return DateFormat('dd/MM/yyyy').format(
                  data.transactionName,
                );
              },
            ),
            PColumn(
              title: 'Supplier',
              contentBuilder: (data, index) => data.supplierName,
            ),
            PColumn(
              title: 'Material',
              contentBuilder: (data, index) => data.materialName,
            ),
            PColumn(
              title: 'Nomor',
              contentBuilder: (data, index) => data.purchaseOrderId,
            ),
            PColumn(
              title: 'Curr',
              contentBuilder: (data, index) => data.purchaseOrderCurrencyId,
            ),
            PColumn(
              title: 'Rate',
              contentBuilder: (data, index) => data.purchaseOrderRate.format(),
            ),
            PColumn(
              title: 'Qty',
              contentBuilder: (data, index) => data.quantityPo.format(),
            ),
            PColumn(
              title: 'Harga',
              contentBuilder: (data, index) => data.price.format(),
            ),
            PColumn(
              title: 'Qty',
              contentBuilder: (data, index) => data.quantityReceived.format(),
            ),
            PColumn(
              title: 'Harsat',
              contentBuilder: (data, index) => '',
            ),
            PColumn(
              title: 'Jumlah',
              contentBuilder: (data, index) => data.total.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
