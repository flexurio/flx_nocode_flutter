import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_rupiah.dart';

Future<Page> pdfProductStockRupiah({
  required List<ProductStockRupiah> data,
  DateTime? startDate,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final totals = data.fold<double>(
    0, (sum, item) => sum + (item.qty * item.primaryPrice),
  );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN STOCK BARANG JADI (Rp.)',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TANGGAL : ${DateFormat('MM/dd/yyyy').format(startDate ?? DateTime.now())}',
          ),
          SizedBox(height: 20),
          Text(
            'PPIC',
          ),
          SizedBox(height: 5),
        ],
      ),
    ),
    orientation: PageOrientation.landscape,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Divider(color: PdfColors.blueGrey200),
              tableHeader(
                hasChildren: true,
                columns: [
                  PColumnHeader(
                    title: 'KODE PRODUK'.tr(),
                    primary: true,
                  ),
                  PColumnHeader(
                    title: 'NAMA PRODUK '.tr(),
                  ),
                  PColumnHeader(
                    title: 'UNIT'.tr(),
                  ),
                  PColumnHeader(
                    title: 'STOCK'.tr(),
                  ),
                  PColumnHeader(
                    title: 'HPP'.tr(),
                  ),
                  PColumnHeader(
                    title: 'JUMLAH'.tr(),
                  ),
                ],
              ),
              ...List.generate(data.length, (index) {
                return tableBody<ProductStockRupiah>(
                  data: data.sublist(0, 1).toList(),
                  columns: [
                    PColumnBody(
                      contentBuilder: (data, index) => data.productId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.productName,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.unitId,
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.qty.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => data.primaryPrice.format(),
                    ),
                    PColumnBody(
                      contentBuilder: (data, index) => (data.qty * data.primaryPrice).format(),
                    ),
                  ],
                );
              }),
              SizedBox(height: 10),
              tableFooter(
                columns: [
                  PColumnFooter(
                    flex: 5,
                    footer: 'TOTAL :'
                  ),
                  PColumnFooter(
                    footer: totals.format(),
                  ),
                ],
              ),
            ],
        ),
      ) 
    ],
  );
}

