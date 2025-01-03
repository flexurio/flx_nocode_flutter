import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfMaterialReceiveReport({
  required List<MaterialReceiveReport> data,
  required MaterialReceiveReportType type,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupById = groupBy(data, (data) => data.id).entries;
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'Material Receive Report - ${type.label.tr()}',
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupById.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.value.first.id} - ${data.value.first.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                simpleTablePdf<MaterialReceiveReport>(
                  data: data.value,
                  columns: [
                    PColumn(
                      flex: 5,
                      title: 'transaction'.tr(),
                      contentBuilder: (data, index) => data.title,
                    ),
                    PColumn(
                      title: 'quantity'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.qty.format(),
                      footer: data.value
                          .fold<int>(
                            0,
                            (previousValue, element) =>
                                previousValue + element.qty,
                          )
                          .format(),
                    ),
                    PColumn(
                      title: 'unit'.tr(),
                      contentBuilder: (data, index) => data.unit,
                      footer: data.value.first.unit,
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
