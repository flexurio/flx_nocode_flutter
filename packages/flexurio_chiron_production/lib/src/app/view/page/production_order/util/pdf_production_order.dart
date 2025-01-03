import 'dart:ui';

import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/src/app/model/production_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfProductionOrderBatch({
  required Color primaryColor,
  required DateTime startDate,
  required DateTime endDate,
  required List<ProductionOrder> data,
}) async {
  final (companyLogo, companyLogoNamed) = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(24),
    header: (context) => headerPdf(
      companyLogo: companyLogo,
      companyLogoNamed: companyLogoNamed,
      title: 'MASTER BATCH',
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<ProductionOrder>(
          data: data,
          columns: [
            PColumn(
              title: 'period'.tr(),
              contentBuilder: (data, index) => DateFormat('yyyyMM').format(
                data.createdAt,
              ),
            ),
            PColumn(
              title: 'product_code'.tr(),
              contentBuilder: (data, index) => data.product.id,
            ),
            PColumn(
              title: 'product_name'.tr(),
              contentBuilder: (data, index) => data.product.name,
            ),
            PColumn(
              title: 'batch'.tr(),
              contentBuilder: (data, index) => data.id,
            ),
            PColumn(
              title: 'batch_size'.tr(),
              contentBuilder: (data, index) => data.batchSize.toString(),
            ),
            PColumn(
              title: 'division'.tr(),
              contentBuilder: (data, index) => 'PT. Metiska Farma',
            ),
            PColumn(
              title: 'scale'.tr(),
              contentBuilder: (data, index) => data.scale.id,
            ),
          ],
        ),
      ]; // Center
    },
  );
}
