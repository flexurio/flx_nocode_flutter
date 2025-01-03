import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfMaterialStockReport({
  required List<MaterialStockReport> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final header = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 36),
    child: tableHeader(columns: [
      PColumnHeader(
        title: 'material_id'.tr(),
      ),
      PColumnHeader(
        flex: 3,
        title: 'material_name'.tr(),
      ),
      PColumnHeader(
        title: 'unit'.tr(),
      ),
      PColumnHeader(
        title: 'quantity'.tr(),
        numeric: true,
      ),
      PColumnHeader(
        title: 'na'.tr(),
      ),
      PColumnHeader(
        title: 'expired_date'.tr(),
      ),
    ]),
  );

  final body = data.map((data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: tableBody<MaterialStockReport>(
        data: [data],
        columns: [
          PColumnBody(
            contentBuilder: (data, index) => data.materialId,
          ),
          PColumnBody(
            flex: 3,
            contentBuilder: (data, index) => data.materialName,
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.materialUnitId,
          ),
          PColumnBody(
            numeric: true,
            contentBuilder: (data, index) => data.quantity.format(),
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.na,
          ),
          PColumnBody(
            contentBuilder: (data, index) => data.expiredDate.ddMMyyyy,
          ),
        ],
      ),
    );
  });

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'material_stock_report',
    headerChild: header,
    build: (context) => body.toList(),
  );
}
