import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_mutation_loans_borrowings.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialMutationLoansBorrowings({
  required List<MaterialMutationLoansBorrowings> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'LAPORAN MUTASI PINJAM MEMINJAM KEMASAN',
      child: Padding(
        padding: const EdgeInsets.only(left: 36, right: 36, top: 12),
        child: Text(
          'Periode : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}'
              .toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            color: PdfColors.blueGrey800,
          ),
        ),
      ),
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdfX<MaterialMutationLoansBorrowings>(
          data: data,
          columns: [
            PGroup(
              children: [
                PColumn(
                  title: 'material_name'.tr(),
                  contentBuilder: (data, index) {
                    return data.materialName + data.materialId == ''
                        ? '-'
                        : data.materialName + data.materialId;
                  },
                ),
              ],
            ),
            PGroup(
              title: 'issue'.tr(),
              children: [
                PColumn(
                  title: 'quantity'.tr(),
                  contentBuilder: (data, index) => data.quantityCredit.format(),
                ),
                PColumn(
                  title: 'value'.tr(),
                  contentBuilder: (data, index) => data.valueCredit.format(),
                ),
              ],
            ),
            PGroup(
              title: 'receive'.tr(),
              children: [
                PColumn(
                  title: 'quantity'.tr(),
                  contentBuilder: (data, index) => data.quantityDebit.format(),
                ),
                PColumn(
                  title: 'value'.tr(),
                  contentBuilder: (data, index) => data.valueDebit.format(),
                ),
              ],
            ),
          ],
        ),
      ]; // Center
    },
  );
}
