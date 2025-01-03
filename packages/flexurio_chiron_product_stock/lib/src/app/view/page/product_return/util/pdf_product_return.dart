import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductReturn(
  ProductReturn productReturn,
  List<ProductReturnDetail> detail,
) async {
  return MultiPage(
    margin: const EdgeInsets.all(14),
    pageFormat: PdfPageFormat.a5.portrait,
    build: (Context context) {
      return [
        SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(title: 'Nomor SJ'),
                SizedBox(height: 4),
                _buildTitle(title: 'Nomor SR'),
                SizedBox(height: 4),
                _buildTitle(title: 'Nomor REF'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(
                  title: detail.isEmpty ? ': ' : detail.first.deliveryOrderId,
                  width: 120,
                  showDot: false,
                ),
                SizedBox(height: 4),
                _buildTitle(
                  title: productReturn.id,
                  width: 120,
                  showDot: false,
                ),
                SizedBox(height: 4),
                _buildTitle(
                  title: productReturn.referenceNo,
                  width: 120,
                  softWrap: true,
                  showDot: false,
                ),
              ],
            ),
            Container(
              height: 100,
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PT. METISKA FARMA',
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'JL. RAYA KEBAYORAN LAMA 557 JAKARTA SELATAN',
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 14),
        for (var i = 0; i < detail.length; i++)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _bodyText(detail[i].quantity.toString()),
                  _bodyText(detail[i].unit.id),
                  _bodyText(detail[i].product.name),
                  _bodyText(detail[i].batchNo.id),
                  _bodyText(detail[i].expirationDate.yMMMM),
                ],
              ),
              SizedBox(height: 14),
            ],
          ),
      ];
    },
    footer: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bodyText(
            'Print By : ${UserRepositoryApp.instance.userApp?.name ?? '-'}',
          ),
          _bodyText(DateTime.now().yMMMdHm),
        ],
      );
    },
  );
}

Widget _bodyText(String value) {
  return Text(
    value,
    style: const TextStyle(
      fontSize: 11,
    ),
  );
}

Widget _buildTitle({
  required String title,
  double? width,
  bool? softWrap,
  bool? showDot,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: width ?? 60,
        child: Text(
          title,
          overflow: TextOverflow.clip,
          softWrap: softWrap ?? false,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ),
      if (showDot ?? true)
        Container(
          child: Text(':'),
        ),
    ],
  );
}
