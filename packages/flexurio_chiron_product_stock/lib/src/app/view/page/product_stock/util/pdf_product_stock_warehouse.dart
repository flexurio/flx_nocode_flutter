import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductStockWarehouse({
  required List<ProductStock> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByProduct = groupBy<ProductStock>(
    data,
    (element) => element.product.id,
  );
  final keys = groupByProduct.keys.toList();
  final children = <Widget>[];

  for (var i = 0; i < keys.length; i++) {
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: tableHeader(
          columns: [
            PColumnHeader(
              primary: true,
              title: 'product'.tr(),
            ),
            PColumnHeader(
              title: 'expired_date'.tr(),
            ),
            PColumnHeader(
              title: 'unit'.tr(),
            ),
            PColumnHeader(
              numeric: true,
              title: 'quantity'.tr(),
            ),
          ],
        ),
      ),
    );

    for (var j = 0; j < groupByProduct[keys[i]]!.length; j++) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: tableBody<ProductStock>(
            data: [groupByProduct[keys[i]]![j]],
            columns: [
              PColumnBody(
                contentBuilder: (data, index) {
                  return '${data.product.id} - ${data.product.name}';
                },
              ),
              PColumnBody(
                contentBuilder: (data, index) {
                  return data.expiredDate.yMMMd;
                },
              ),
              PColumnBody(
                contentBuilder: (data, index) {
                  return data.unit.id;
                },
              ),
              PColumnBody(
                numeric: true,
                contentBuilder: (data, index) {
                  return data.endingBalance.toString();
                },
              ),
            ],
          ),
        ),
      );
    }

    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: tableFooter(
          columns: [
            PColumnFooter(),
            PColumnFooter(),
            PColumnFooter(),
            PColumnFooter(
              numeric: true,
              footer: groupByProduct[keys[i]]!
                  .fold<double>(0, (sum, e) => sum + e.endingBalance)
                  .toInt()
                  .toString(),
            ),
          ],
        ),
      ),
    );
  }

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'warehouse'.tr(),
    build: (context) => children,
  );
}
