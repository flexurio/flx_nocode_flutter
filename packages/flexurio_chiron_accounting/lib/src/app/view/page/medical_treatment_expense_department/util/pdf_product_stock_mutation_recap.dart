import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_mutation_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductStockMutationRecap({
  required List<ProductStockMutationRecap> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'product_stock_mutation_recap'.tr(),
    build: (Context context) {
      return [
        simpleTablePdf<ProductStockMutationRecap>(
          data: data,
          columns: [
            PColumn(
              title: 'product_id'.tr(),
              contentBuilder: (data, index) => data.productId,
            ),
            PColumn(
              title: 'product_name'.tr(),
              contentBuilder: (data, index) => data.productName ?? '-',
            ),
            PColumn(
              title: 'unit_id'.tr(),
              contentBuilder: (data, index) => data.unitId,
            ),
            PColumn(
              title: 'beginning_balance'.tr(),
              contentBuilder: (data, index) => data.beginningBalance.format(),
            ),
            PColumn(
              title: 'quantity_in'.tr(),
              contentBuilder: (data, index) => data.quantityIn.format(),
            ),
            PColumn(
              title: 'quantity_out'.tr(),
              contentBuilder: (data, index) => data.quantityOut.format(),
            ),
            PColumn(
              title: 'total'.tr(),
              contentBuilder: (data, index) => data.total.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
