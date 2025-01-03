import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfAgingScheduleAP({
  required List<AgingScheduleAP> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  // final totalJumlahAll = data.fold<double>(
  //   0, (sum, item) => sum + (item.quantity * item.price),
  // );

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
            'A/P AGING SCHEDULE -- PER : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())}',
            // : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
          ),
          // SizedBox(height: 20),
          // Text('No.Batch : ${batch?.product.name ?? '-'} - ${batch?.id ?? '-' }'),
          // SizedBox(height: 10),
        ],
      ),
    ),
    orientation: PageOrientation.landscape,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: PdfColors.blueGrey200),
                    tableHeader(
                      hasChildren: true,
                      columns: [
                        PColumnHeader(
                          title: 'Nama Supplier'.tr(),
                          primary: true,
                        ),
                        PColumnHeader(
                          title: 'Jumlah'.tr(),
                        ),
                        PColumnHeader(
                          title: 'Hari'.tr(),
                          children: [
                            PColumnHeader(
                              title: '0 - 15'.tr(),
                            ),
                            PColumnHeader(
                              title: '16 - 30'.tr(),
                            ),
                            PColumnHeader(
                              title: '31 - 45'.tr(),
                            ),
                            PColumnHeader(
                              title: '46 - 60'.tr(),
                            ),
                            PColumnHeader(
                              title: '+ 60'.tr(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ...List.generate(data.length, (index) {
                      return tableBody<AgingScheduleAP>(
                        data: data.sublist(0, 1).toList(),
                        columns: [
                          PColumnBody(
                            contentBuilder: (data, index) => data.supplierName,
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.remainingDebtAll.format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.remainingDebt15.format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.remainingDebt30.format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.remainingDebt45.format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.remainingDebt60.format(),
                          ),
                          PColumnBody(
                            contentBuilder: (data, index) => data.remainingDebt60Past.format(),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          footer: 'Total Rp.'
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebtAllSummary.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt15Summary.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt30Summary.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt45Summary.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt60Summary.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt60PastSummary.format(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          footer: 'Persentase (%)'
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebtAllPercent.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt15Percent.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt30Percent.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt45Percent.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt60Percent.format(),
                        ),
                        PColumnFooter(
                          footer: data.first.remainingDebt60PastPercent.format(),
                        ),
                      ],
                    ),
                  ],
                ),
      ) 
    ],
  );
}

