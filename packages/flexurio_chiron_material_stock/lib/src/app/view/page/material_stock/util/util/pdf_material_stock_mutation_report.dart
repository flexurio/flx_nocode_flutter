import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock_mutation_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfMaterialStockMutationReport({
  required List<MaterialStockMutationReport> data,
  required DateTime startDate,
  required DateTime endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final children = <Widget>[];

  children.add(
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: tableHeader(
        columns: [
          PColumnHeader(
            primary: true,
            title: 'no'.tr(),
          ),
          PColumnHeader(
            title: 'material'.tr(),
          ),
          PColumnHeader(
            title: 'unit'.tr(),
          ),
          PColumnHeader(
            title: 'quantity'.tr(),
          ),
          PColumnHeader(
            title: 'quantity_in'.tr(),
          ),
          PColumnHeader(
            title: 'quantity_out'.tr(),
          ),
          PColumnHeader(
            title: 'quantity_remaining'.tr(),
          ),
        ],
      ),
    ),
  );
  children.addAll(
    List.generate(data.length, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: tableBody<MaterialStockMutationReport>(
          data: [data[index]],
          columns: [
            PColumnBody(
              contentBuilder: (data, index) => (index + 1).toString(),
            ),
            PColumnBody(
              contentBuilder: (data, index) => data.material,
            ),
            PColumnBody(
              contentBuilder: (data, index) => data.materialUnit,
            ),
            PColumnBody(
              contentBuilder: (data, index) => data.quantity.toString(),
              numeric: true,
            ),
            PColumnBody(
              contentBuilder: (data, index) => data.quantityIn.toString(),
              numeric: true,
            ),
            PColumnBody(
              contentBuilder: (data, index) => data.quantityOut.toString(),
              numeric: true,
            ),
            PColumnBody(
              contentBuilder: (data, index) => data.quantityEnd.toString(),
              numeric: true,
            ),
          ],
        ),
      );
    }),
  );
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle:
        'REKAP MUTASI STOK MATERIAL \nPERIODE : ${DateFormat('dd/MM/yyyy').format(startDate)} S/D ${DateFormat('dd/MM/yyyy').format(endDate)}',
    build: (context) => children,
  );
}
