import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_stock_rupiah.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialStockInRupiah({
  required List<MaterialStockRupiah> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'material_stock_in_rupiah'.tr(), 
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<MaterialStockRupiah>(
          data: data,
          columns: [
            PColumn(
              title: 'material_name'.tr(),
              contentBuilder: (data, index) => data.materialName,
            ),
            PColumn(
              title: 'initial_quantity'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'B'
                  ? data.quantity.format()
                  : '0.00000';
              },
            ),
            PColumn(
              title: 'initial_value'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'B'
                    ? data.value.format()
                    : '0.00';
              },
            ),
            PColumn(
              title: 'qty_in'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'D'
                  ? data.value.format()
                  : '0.00000';
              },
            ),
            PColumn(
              title: 'entry_value'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'D'
                  ? data.value.format()
                  : '0.00';
              },
            ),
            PColumn(
              title: 'qty_out'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'C'
                  ? data.quantity.format()
                  : '0.00000';
              },
            ),
            PColumn(
              title: 'outgoing_value'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'C'
                  ? data.value.format()
                  : '0.00';
              },
            ),
            PColumn(
              title: 'remaining_qty'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'E'
                  ? data.quantity.format()
                  : '0.00000';
              },
            ),
            PColumn(
              title: 'residual_value'.tr(),
              contentBuilder: (data, index) {
                return data.dk == 'E'
                  ? data.value.format()
                  : '0.00';
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
