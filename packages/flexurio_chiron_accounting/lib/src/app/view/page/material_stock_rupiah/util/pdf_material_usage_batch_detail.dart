import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_batch_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';

Future<Page> pdfMaterialUsageBatchDetail({
  required List<MaterialUsageBatchDetail> data,
  DateTime? startDate,
  DateTime? endDate,
  ProductionOrder? batch,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByMatGrup = groupBy<MaterialUsageBatchDetail>(
    data.map((element) {
      if (element.materialGroupId == "BAKU" || element.materialGroupId == "BANTU") {
        return element.copyWith(materialGroupId: "BAKU / BANTU");
      }
      return element;
    }).toList(),
    (element) => element.materialGroupId,
  ).entries;

  final totalJumlahAll = data.fold<double>(
    0, (sum, item) => sum + (item.quantity * item.price),
  );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'PEMAKAIAN MATERIAL PER BATCH DETAIL',
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    headerChild: Padding(
      padding: const EdgeInsets.only(left: 36, right: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PERIODE : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
          ),
          SizedBox(height: 20),
          Text('No.Batch : ${batch?.product.name ?? '-'} - ${batch?.id ?? '-' }'),
          SizedBox(height: 10),
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
                  0, (sum, item) => sum + (item.quantity * item.price),
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: PdfColors.blueGrey200),
                    tableHeader(
                      hasChildren: true,
                      columns: [
                        PColumnHeader(
                          title: 'NO TRANS'.tr(),
                          primary: true,
                        ),
                        PColumnHeader(
                          title: 'MATERIAL NAME '.tr(),
                        ),
                        PColumnHeader(
                          title: 'TYPE'.tr(),
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
                      return tableBody<MaterialUsageBatchDetail>(
                        data: data.value.sublist(0, 1).toList(),
                        columns: [
                          PColumnBody(
                            contentBuilder: (data, index) => data.transactionNo,
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.materialName,
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.transactionTypeName,
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => '${data.quantity.format()} ${data.unit}',
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.price.format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.totalPrice.format(),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          flex: 5,
                          footer: 'SUB TOTAL :'
                        ),
                        PColumnFooter(
                          footer: totalJumlah.format(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          flex: 1,
                          footer: 'TOTAL :'
                        ),
                        PColumnFooter(
                          footer: totalJumlahAll.format(),
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
                          title: 'NO TRANS'.tr(),
                          primary: true,
                        ),
                        PColumnHeader(
                          title: 'MATERIAL NAME '.tr(),
                        ),
                        PColumnHeader(
                          title: 'TYPE'.tr(),
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
                          flex: 5,
                          footer: 'SUB TOTAL :'
                        ),
                        PColumnFooter(
                          footer: '',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          flex: 1,
                          footer: 'TOTAL :'
                        ),
                        PColumnFooter(
                          footer: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ]
        ),
      ) 
    ],
  );
}

