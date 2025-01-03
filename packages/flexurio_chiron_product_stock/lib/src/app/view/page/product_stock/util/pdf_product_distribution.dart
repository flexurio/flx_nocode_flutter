import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_distribution.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductDistribution({
  required List<ProductDistribution> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupById =
      groupBy(data, (data) => '${data.productId} - ${data.batchNoId}').entries;
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'product_distribution'.tr(),
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupById.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.value.first.productName} - ${data.value.first.batchNoId}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                tableFooter(
                  columns: [
                    PColumnFooter(flex: 5),
                    PColumnFooter(
                      flex: 2,
                      footer: 'opening_balance'.tr(),
                    ),
                    PColumnFooter(
                        numeric: true,
                        footer: data.value.first.beginningBalance.format()),
                  ],
                ),
                simpleTablePdf<ProductDistribution>(
                  data: data.value,
                  columns: [
                    PColumn(
                      title: 'customer_id'.tr(),
                      contentBuilder: (data, index) => data.customerId,
                    ),
                    PColumn(
                      flex: 4,
                      title: 'customer_name'.tr(),
                      contentBuilder: (data, index) => data.customerName,
                    ),
                    PColumn(
                      flex: 2,
                      title: 'batch'.tr(),
                      contentBuilder: (data, index) => data.batchNoId,
                      footer: 'ending_balance'.tr(),
                    ),
                    PColumn(
                      title: 'quantity'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.credit.format(),
                      footer: data.value
                          .fold<double>(
                            0,
                            (previousValue, element) =>
                                previousValue + element.credit,
                          )
                          .format(),
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
