import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialIssueBom({
  required List<MaterialIssueBom> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(24),
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'REPORT BOM VS MI BAKU / BANTU',
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<MaterialIssueBom>(
          data: data,
          columns: [
            PColumn(
              title: 'code'.tr(),
              contentBuilder: (data, index) => data.materialId,
            ),
            PColumn(
              title: 'material'.tr(),
              contentBuilder: (data, index) => data.materialName,
            ),
            PColumn(
              title: 'unit'.tr(),
              contentBuilder: (data, index) => data.unitId,
            ),
            PColumn(
              title: 'bom'.tr(),
              contentBuilder: (data, index) => data.quantityFormulation == 0
                  ? '0'
                  : format.format(data.quantityFormulation),
            ),
            PColumn(
              title: 'mi'.tr(),
              contentBuilder: (data, index) =>
                  '${data.quantityMaterialIssue - data.quantityMaterialReturn}',
            ),
            PColumn(
              title: 'difference'.tr(),
              contentBuilder: (data, index) =>
                  '${data.quantityFormulation - (data.quantityMaterialIssue - data.quantityMaterialReturn)}',
            ),
          ],
        ),
      ]; // Center
    },
  );
}
