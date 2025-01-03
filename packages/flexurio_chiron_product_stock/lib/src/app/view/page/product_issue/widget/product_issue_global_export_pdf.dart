import 'package:flexurio_chiron_product_stock/src/app/model/product_issue_global.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductIssueGlobal({
  required List<ProductIssueGlobal> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final header = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36),
    child: tableHeader(columns: [
      PColumnHeader(
        flex: 2,
        title: 'product_name'.tr(),
      ),
      PColumnHeader(
        title: 'product_code'.tr(),
      ),
      PColumnHeader(
        title: 'unit'.tr(),
      ),
      PColumnHeader(
        flex: 2,
        numeric: true,
        title: 'quantity'.tr(),
      ),
    ]),
  );

  final body = data.map((data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: tableBody<ProductIssueGlobal>(
        data: [data],
        columns: [
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.productName,
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.productId,
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.unitId,
          ),
          PColumnBody(
            flex: 2,
            numeric: true,
            contentBuilder: (data, index) => data.qty.format(),
          ),
        ],
      ),
    );
  });

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'recap_product_issue_global'.tr(),
    headerChild: header,
    build: (context) => body.toList(),
  );
}
