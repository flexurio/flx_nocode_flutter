import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_status_rupiah_quarantine.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfMaterialStatusRupiahQuarantine({
  required List<MaterialStatusRupiahQuarantine> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'REKAP KARANTINA MATERIAL BAKU',
    headerChild: Padding(
      padding: const EdgeInsets.only(left: 36, right: 36, top: 12),
      child: Column(
        children: [
          Text(
            'PERIODE : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
          ),
          tableHeader(
            hasChildren: true,
            columns: [
              PColumnHeader(
                flex: 2,
                primary: true,
                title: 'NO. BPB'.tr(),
              ),
              PColumnHeader(
                title: 'TGL. BPB'.tr(),
              ),
              PColumnHeader(
                flex: 0.5,
                title: 'SUPPLIER'.tr(),
                numeric: true,
              ),
              PColumnHeader(
                title: 'NAMA MATERIAL'.tr(),
              ),
              PColumnHeader(
                title: 'NA. QC'.tr(),
              ),
              PColumnHeader(
                title: '(Rp.) KARANTINA'.tr(),
              ),
            ],
          ),
        ]
      ),
    ),
    orientation: PageOrientation.landscape,
    pageFormat: PdfPageFormat.a3.landscape.copyWith(width: 50 * PdfPageFormat.cm),
    build: (context) => [
      ...List.generate(data.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: tableBody<MaterialStatusRupiahQuarantine>(
            data: [data[index]],
            columns: [
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => data.transactionId,
              ),
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => DateFormat('dd/MM/yyyy').format(data.transactionDate),
              ),
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => data.supplierName,
              ),
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => data.materialName,
              ),
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => data.na,
              ),
              PColumnBody(
                flex: 2,
                contentBuilder: (data, index) => data.quantityQuarantine.format(),
                // "vat_total": null,
                // "price": null,
                // "quantity_quarantine": 8,
                // "value_quarantine": 41950720,
                // "value_quarantine_summary": 74174307
              ),
            ],
          ),
        );
      }),
      // tableFooter(
      //   columns: [
      //     PColumnFooter(footer: 'TOTAL :', flex: 14),
      //     PColumnFooter(borderTransparent: true),
      //     PColumnFooter(
      //       footer: data.isNotEmpty ? data.last.valueReleaseSummary.format() : '0',
      //     ),
      //     PColumnFooter(borderTransparent: true),
      //     PColumnFooter(
      //       footer: data.isNotEmpty ? data.last.valueRejectSummary.format() : '0',
      //     ),
      //   ],
      // ),
    ],
  );
}
