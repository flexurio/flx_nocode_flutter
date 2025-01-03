import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch_global.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

Future<Page> pdfMaterialUsageBatchGlobal({
  required List<MaterialUsageBatchGlobal> data,
  DateTime? startDate,
  DateTime? endDate,
  ProductionOrder? batch,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final totalAll = data.fold<double>(
    0, (sum, item) => sum + item.total,
  );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'PEMAKAIAN MATERIAL PER BATCH',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          'PERIODE : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
        ),
      ),
    ),
    orientation: PageOrientation.landscape,
    build: (context) => [
            Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            simpleTablePdf<MaterialUsageBatchGlobal>(
              data: data,
              columns: [
                PColumn(
                  title: 'NO. BATCH'.tr(),
                  contentBuilder: (data, index) => data.batchNo ?? '-',
                  footer: 'TOTAL :'
                ),
                PColumn(
                  title: 'NAMA PRODUCT'.tr(),
                  contentBuilder: (data, index) {
                    return data.productName ?? '-';
                  },
                ),
                PColumn(
                  title: 'JUMLAH'.tr(),
                  contentBuilder: (data, index) {
                    return data.total.format();
                  },
                  footer: totalAll.format(),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
