import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductReturnReceiveReport({
  required List<ProductReturnReceiveReport> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupByProductReturn = groupBy(data, (data) => data.productReturn.id).entries;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN PENERIMAAN RETUR',
    pageFormat: PdfPageFormat.a3.portrait.copyWith(width: 50 * PdfPageFormat.cm),
    headerChild: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        'Periode : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
      ),
    ),
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupByProductReturn.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Tgl Terima: ${DateFormat('dd/MM/yyyy').format(data.value.first.productReturn.confirmMarketingAt!)}- Tgl Confirm PPIC: ${DateFormat('dd/MM/yyyy').format(data.value.first.productReturn.confirmPpicAt!)} - NO. SRP: ${data.value.first.productReturn.id} - NoRef: ${data.value.first.productReturn.referenceNo} - NamaReturn: ${data.value.first.productReturn.transactionType.name} - Status: ${data.value.first.status} - Tgl Keluar: ${data.value.first.qualityAssuranceCheckDate}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: PdfColor.fromInt(flavorConfig.color.value),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                  data.value.first.productReturn.customer.id,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: PdfColor.fromInt(flavorConfig.color.value),
                    ),
                  ),
                ),
                Divider(),
                simpleTablePdf<ProductReturnReceiveReport>(
                  data: data.value,
                  columns: [
                    PColumn(
                      primary: true,
                      title: 'Tanggal / Nomor Surat Terima Dari Nama Obat',
                      contentBuilder: (data, index) {
                        return '# ${data.productId.name}';
                        // return 'Tgl Terima: ${DateFormat('dd/MM/yyyy').format(data.productReturn.confirmMarketingAt!)}- Tgl Confirm PPIC: ${DateFormat('dd/MM/yyyy').format(data.productReturn.confirmPpicAt!)} - NO. SRP: ${data.productReturn.id} - NoRef: ${data.productReturn.referenceNo} - NamaReturn: ${data.productReturn.transactionType.name} - Status: ${data.status} - Tgl Keluar: ${DateFormat('dd/MM/yyyy').format(data.qualityAssuranceCheckDate)}';
                      },
                    ),
                    PColumn(
                      title: 'Jumlah Barang Satuan',
                      contentBuilder: (data, index) {
                        return '${data.quantity.format()} ${data.unitId}';
                      },
                    ),
                    PColumn(
                      title: 'No. Batch',
                      contentBuilder: (data, index) {
                        return data.batchNo;
                      },
                      footer: 'subtotal'.tr(),
                    ),
                    PColumn(
                      title: 'Keterangan',
                      contentBuilder: (data, index) {
                        return data.expirationDate != null
                        ? data.expirationDate!.yMMMM
                        : '-';
                      },
                    ),
                    PColumn(
                      title: 'Nilai',
                      contentBuilder: (data, index) {
                        return  (data.productPrice * data.quantity).format();
                      },
                      footer: data.value.fold<double>(
                        0, (sum, item) => sum + (item.productPrice),
                      ).format(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    ],
  );
}
