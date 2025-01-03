import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_receive_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductReturnStockReport({
  required List<ProductReturnReceiveReport> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupByProduct = groupBy(data, (data) => data.productId.id).entries;
  final children = <Widget>[];

  groupByProduct.map((data) {
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(children: [
          Text(
            '${data.value.first.productId.id} - ${data.value.first.productId.name} | Satuan : ${data.value.first.unitId} | Unit/MB : ${data.value.first.productId.quantityPack.format()}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: PdfColor.fromInt(flavorConfig.color.value),
            ),
          ),
        ]),
      ),
    );
    children.add(
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              simpleTablePdf<ProductReturnReceiveReport>(
                data: data.value,
                columns: [
                  PColumn(
                    primary: true,
                    title: 'Produk / No Transaksi',
                    contentBuilder: (data, index) => data.productReturn.id,
                    footer: 'total'.tr(),
                  ),
                  PColumn(
                    title: 'Hasil Cek',
                    contentBuilder: (data, index) => data.status,
                  ),
                  PColumn(
                    title: 'Ex Date',
                    contentBuilder: (data, index) {
                      return data.expirationDate?.yMMMM ?? '-';
                    },
                  ),
                  PColumn(
                    title: 'Tanggal Masuk',
                    contentBuilder: (data, index) {
                      return DateFormat('dd/MM/yyyy')
                          .format(data.productReturn.createdAt);
                    },
                  ),
                  PColumn(
                    title: 'No Batch',
                    contentBuilder: (data, index) => data.batchNo,
                  ),
                  PColumn(
                    title: 'Unit',
                    contentBuilder: (data, index) => data.unitId,
                  ),
                  PColumn(
                    title: 'Sisa',
                    contentBuilder: (data, index) {
                      return data.quantityRemaining.format();
                    },
                    footer: '${data.value.fold<double>(
                          0,
                          (sum, item) => sum + (item.quantityRemaining),
                        ).format()} ${data.value.first.unitId}',
                  ),
                ],
              ),
              SizedBox(height: 12),
            ],
          )),
    );
    return children;
  });

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'SISA BARANG (FINISH GOODS)',
    pageFormat:
        PdfPageFormat.a3.landscape.copyWith(width: 50 * PdfPageFormat.cm),
    build: (context) => children,
  );
}
