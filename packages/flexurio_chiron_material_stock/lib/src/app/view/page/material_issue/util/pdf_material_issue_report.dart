import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_issue_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfMaterialIssueReport({
  required List<MaterialIssueReport> data,
  required MaterialIssueReportType type,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupById = groupBy(data, (data) => data.id).entries;
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'Material Issue Report - ${type.label.tr()}',
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupById.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.value.first.id} - ${data.value.first.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                simpleTablePdf<MaterialIssueReport>(
                  data: data.value,
                  columns: [
                    PColumn(
                      primary: true,
                      flex: 3,
                      title: 'description'.tr(),
                      contentBuilder: (data, index) => data.description,
                      footer: 'total'.tr(),
                    ),
                    PColumn(
                      title: 'expired_date'.tr(),
                      contentBuilder: (data, index) => data.expiredDate,
                    ),
                    PColumn(
                      title: 'quantity'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.quantity.format(),
                      footer: data.value
                          .fold<double>(
                            0,
                            (previousValue, element) =>
                                previousValue + element.quantity,
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
