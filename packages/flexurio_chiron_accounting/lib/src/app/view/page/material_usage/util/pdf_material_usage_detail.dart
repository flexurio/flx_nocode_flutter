import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_usage_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialUsageDetail({
  required List<MaterialUsageDetail> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'REKAPITULASI PEMAKAIAN MATERIAL - BAKU', 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<MaterialUsageDetail>(
          data: data,
          columns: [
            PColumn(
              title: 'description_usage'.tr(),
              contentBuilder: (data, index) {
                return '${data.description} ${data.materialName}';
              },
            ),
            PColumn(
              title: 'quantity'.tr(),
              contentBuilder: (data, index) => data.quantity.format(),
            ),
            PColumn(
              title: 'price'.tr() + 'unit'.tr(),
              contentBuilder: (data, index) => data.price.format(),
            ),
            PColumn(
              title: 'total'.tr(),
              contentBuilder: (data, index) => data.totalPrice.format(),
            ),
          ],
        ),
      ]; // Center
    },
  );
}
