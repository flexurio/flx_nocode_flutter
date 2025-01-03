import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/aging_schedule_ap_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfAgingScheduleAPDetail({
  required List<AgingScheduleAPDetail> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {

  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByMatGrup = groupBy<AgingScheduleAPDetail>(
    data,
    (element) => element.supplierName,
  ).entries;

  final remainingDebtAll = data.fold<double>(
    0,
    (sum, item) => sum + item.remainingDebtAll,
  );

  final remainingDebt15All = data.fold<double>(
    0,
    (sum, item) => sum + item.remainingDebt15,
  );

  final remainingDebt30All = data.fold<double>(
    0,
    (sum, item) => sum + item.remainingDebt30,
  );

  final remainingDebt45All = data.fold<double>(
    0,
    (sum, item) => sum + item.remainingDebt45,
  );

  final remainingDebt60All = data.fold<double>(
    0,
    (sum, item) => sum + item.remainingDebt60,
  );

  final remainingDebt60PastAll = data.fold<double>(
    0,
    (sum, item) => sum + item.remainingDebt60_past,
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
            'A/P AGING SCHEDULE DETAIL -- PER : ${DateFormat('yyyyMMdd').format(startDate ?? DateTime.now())}',
          ),
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

                final remainingDebtSub = data.value.fold<double>(
                  0,
                  (sum, item) => sum + item.remainingDebtAll,
                );

                final remainingDebt15Sub = data.value.fold<double>(
                  0,
                  (sum, item) => sum + item.remainingDebt15,
                );

                final remainingDebt30Sub = data.value.fold<double>(
                  0,
                  (sum, item) => sum + item.remainingDebt30,
                );

                final remainingDebt45Sub = data.value.fold<double>(
                  0,
                  (sum, item) => sum + item.remainingDebt45,
                );

                final remainingDebt60Sub = data.value.fold<double>(
                  0,
                  (sum, item) => sum + item.remainingDebt60,
                );

                final remainingDebt60PastSub = data.value.fold<double>(
                  0,
                  (sum, item) => sum + item.remainingDebt60_past,
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.value.first.supplierName),
                    SizedBox(height: 5),
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
                    ...List.generate(data.value.length, (index) {
                      return tableBody<AgingScheduleAPDetail>(
                        data: data.value.sublist(0, 1).toList(),
                        columns: [
                          PColumnBody(
                            contentBuilder: (data, index) => data.transactionNo,
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
                            contentBuilder: (data, index) => data.remainingDebt60_past.format(),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          footer: 'SubTotal'
                        ),
                        PColumnFooter(
                          footer: remainingDebtSub.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt15Sub.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt30Sub.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt45Sub.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt60Sub.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt60PastSub.format(),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    tableFooter(
                      columns: [
                        PColumnFooter(
                          footer: 'Total Rp.'
                        ),
                        PColumnFooter(
                          footer: remainingDebtAll.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt15All.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt30All.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt45All.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt60All.format(),
                        ),
                        PColumnFooter(
                          footer: remainingDebt60PastAll.format(),
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
                          footer: (remainingDebtAll / remainingDebtAll * 100).format(),
                        ),
                        PColumnFooter(
                          footer: (remainingDebt15All / remainingDebtAll * 100).format(),
                        ),
                        PColumnFooter(
                          footer: (remainingDebt30All / remainingDebtAll * 100).format(),
                        ),
                        PColumnFooter(
                          footer: (remainingDebt45All / remainingDebtAll * 100).format(),
                        ),
                        PColumnFooter(
                          footer: (remainingDebt60All / remainingDebtAll * 100).format(),
                        ),
                        PColumnFooter(
                          footer: (remainingDebt60PastAll / remainingDebtAll * 100).format(),
                        ),
                      ],
                    ),
                  ],
                );
              }).toList()
            : [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ]
        ),
      ) 
    ],
  );
}

