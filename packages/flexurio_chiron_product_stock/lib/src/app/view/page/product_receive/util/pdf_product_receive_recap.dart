import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfProductReceiveRecap({
  required List<ProductReceiveRecap> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  List<Widget> children = [];
  final groupByProduct = groupBy<ProductReceiveRecap>(
    data,
    (element) => element.product.id,
  ).entries;

  for (var data in groupByProduct) {
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Divider(color: PdfColors.blueGrey200),
        ]),
      ),
    );

    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${data.value.first.product.id} - ${data.value.first.product.name} - ${data.value.first.status}',
            style: TextStyle(
              fontSize: 8,
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 12),
        ]),
      ),
    );

    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${data.value.first.batchNo.id} Tanggal Release : ${DateFormat('dd MMM yyyy').format(data.value.first.releaseAt)}',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );

    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 6),
        ]),
      ),
    );

    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: simpleTablePdf<ProductReceiveRecap>(
          data: data.value,
          columns: [
            PColumn(
              flex: 3,
              primary: true,
              title: 'product'.tr(),
              contentBuilder: (data, index) {
                return '${data.productReceive.id} - ${data.productReceive.status == ProductReceiveStatus.empty ? '_' : data.productReceive.status.id}';
              },
            ),
            PColumn(
              flex: 1,
              title: 'expired_date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('dd MMM yyyy').format(data.expiredDate);
              },
            ),
            PColumn(
              flex: 1,
              numeric: true,
              title: 'qty'.tr(),
              contentBuilder: (data, index) {
                return data.qty.format();
              },
            ),
            PColumn(
              flex: 1,
              numeric: true,
              title: 'unit'.tr(),
              contentBuilder: (data, index) {
                return data.unit.id;
              },
            ),
          ],
        ),
      ),
    );

    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              SizedBox(width: 320),
              Expanded(
                child: Column(
                  children: [
                    tileDataHorizontal(
                      label: 'subtotal'.tr(),
                      child: Text(
                        '${data.value.first.qty.format()} ${data.value.first.unit.id}',
                      ),
                    ),
                    Divider(),
                    tileDataHorizontal(
                      label: 'total'.tr(),
                      child: Text(
                        '${data.value.first.qty.format()} ${data.value.first.unit.id}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN PENERIMAAN PRODUK JADI',
    headerChild: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        'Periode : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
      ),
    ),
    build: (context) => children,
  );
}
