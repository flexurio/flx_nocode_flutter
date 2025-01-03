import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_loans_borrowings.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialLoansBorrowings({
  required List<MaterialLoansBorrowings> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'LAPORAN PENERIMAAN MATERIAL KEMASAN', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<MaterialLoansBorrowings>(
          data: data,
          columns: [
            PColumn(
              title: 'material_name'.tr(),
              contentBuilder: (data, index) => data.materialIssueTypeName ?? '-',
            ),
            PColumn(
              title: 'quantity'.tr(),
              contentBuilder: (data, index) => (data.value ?? 0).format(),
            ),
            PColumn(
              title: 'amount'.tr(),
              contentBuilder: (data, index) => data.valueSummary.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
