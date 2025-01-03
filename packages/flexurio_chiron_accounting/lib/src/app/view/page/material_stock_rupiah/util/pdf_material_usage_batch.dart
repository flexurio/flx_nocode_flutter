import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

Future<Page> pdfMaterialUsageBatch({
  required List<MaterialUsageBatch> data,
  DateTime? startDate,
  DateTime? endDate,
  ProductionOrder? batch,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByMatGrup = groupBy<MaterialUsageBatch>(
    data.map((element) {
      if (element.materialGroupId == "BAKU" || element.materialGroupId == "BANTU") {
        return element.copyWith(materialGroupId: "BAKU / BANTU");
      }
      return element;
    }).toList(),
    (element) => element.materialGroupId ?? '',
  ).entries;

  final totalJumlahAll = data.fold<double>(
    0, (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)),
  );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'PEMAKAIAN MATERIAL PER BATCH',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('No.Batch : ${batch?.id ?? '-'} - ${batch?.product.name ?? '-'}'),
          SizedBox(height: 10),
          Text(
            'PERIODE : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
    orientation: PageOrientation.landscape,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupByMatGrup.isNotEmpty
            ? groupByMatGrup.map((data) {
                final totalJumlah = data.value.fold<double>(
                  0, (sum, item) => sum + ((item.quantity ?? 0) * (item.price ?? 0)),
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(data.value.first.materialGroupId ?? '-'),
                    SizedBox(height: 5),
                    Divider(color: PdfColors.blueGrey200),
                    tableHeader(
                      hasChildren: true,
                      columns: [
                        PColumnHeader(
                          title: 'MATERIAL NAME'.tr(),
                          primary: true,
                        ),
                        PColumnHeader(
                          title: 'JUMLAH'.tr(),
                        ),
                        PColumnHeader(
                          title: 'HARSAT'.tr(),
                        ),
                        PColumnHeader(
                          title: 'JUMLAH'.tr(),
                        ),
                      ],
                    ),
                    ...List.generate(data.value.length, (index) {
                      return tableBody<MaterialUsageBatch>(
                        data: data.value.sublist(0, 1).toList(),
                        columns: [
                          PColumnBody(
                            contentBuilder: (data, index) => data.materialName ?? '-',
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => '${(data.quantity ?? 0).format()} ${data.unit ?? '-'}',
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => (data.price ?? 0).format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => ((data.quantity ?? 0) * (data.price ?? 0)).format(),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          flex: 3,
                          footer: 'SUB TOTAL :'
                        ),
                        PColumnFooter(
                          footer: totalJumlah.format(),
                        ),
                      ],
                    ),
                  ],
                );
              }).toList()
            : [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: PdfColors.blueGrey200),
                    tableHeader(
                      hasChildren: true,
                      columns: [
                        PColumnHeader(
                          title: 'MATERIAL NAME'.tr(),
                          primary: true,
                        ),
                        PColumnHeader(
                          title: 'JUMLAH'.tr(),
                        ),
                        PColumnHeader(
                          title: 'HARSAT'.tr(),
                        ),
                        PColumnHeader(
                          title: 'JUMLAH'.tr(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          flex: 3,
                          footer: 'SUB TOTAL :'
                        ),
                        PColumnFooter(
                          footer: '',
                        ),
                      ],
                    ),
                  ],
                )
              ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: [
            SizedBox(height: 10),
            tableFooter(
              columns: [
                PColumnFooter(
                  flex: 3,
                  footer: 'TOTAL :'
                ),
                PColumnFooter(
                  footer: groupByMatGrup.isNotEmpty ? totalJumlahAll.format() : '',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
