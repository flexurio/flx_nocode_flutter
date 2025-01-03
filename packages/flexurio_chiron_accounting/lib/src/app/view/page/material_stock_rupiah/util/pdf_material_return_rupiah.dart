import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialReturnRupiah({
  required List<MaterialReturnRupiah> data,
  required DateTime startDate,
  required DateTime endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'REKAP PENGAMBALIAN MATERIAL (BANTU)',
    headerChild: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Text(
        'Periode : ${DateFormat('dd/MM/yyyy').format(startDate)} S/D ${DateFormat('dd/MM/yyyy').format(endDate)}',
      ),
    ),
    build: (Context context) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: simpleTablePdf<MaterialReturnRupiah>(
            data: data,
            columns: [
              PColumn(
                title: 'NO.',
                contentBuilder: (data, index) => (index + 1).toString(),
              ),
              PColumn(
                flex: 2,
                title: 'code'.tr(),
                contentBuilder: (data, index) => data.materialId,
              ),
              PColumn(
                flex: 3,
                title: 'material_name'.tr(),
                contentBuilder: (data, index) => data.materialName,
              ),
              PColumn(
                title: 'qty'.tr(),
                flex: 2,
                numeric: true,
                contentBuilder: (data, index) {
                  final qty =
                      '${data.quantity.format()} ${data.materialUnitId}';
                  return qty;
                },
              ),
              PColumn(
                flex: 2,
                title: 'price'.tr(),
                numeric: true,
                contentBuilder: (data, index) {
                  return data.price.format();
                },
              ),
              PColumn(
                flex: 2,
                title: 'amount'.tr(),
                numeric: true,
                contentBuilder: (data, index) {
                  final amount = data.quantity * data.price;
                  return amount.format();
                },
              ),
            ],
          ),
        )
      ];
    },
  );
}
