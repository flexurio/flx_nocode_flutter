import 'dart:ui';

import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/form_a1.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfFormA1({
  required DateTime startDate,
  required DateTime endDate,
  required List<FormA1> data,
  required Color primaryColor,
}) async {
  final (companyLogo, companyLogoNamed) = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final format = NumberFormat('#,##0.00', 'en_US');

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(24),
    header: (context) => headerPdf(
      companyLogo: companyLogo,
      companyLogoNamed: companyLogoNamed,
      title: 'TAMPILAN FORM A1',
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<FormA1>(
          data: data,
          columns: [
            PColumn(
              title: 'Tgl ${data.isNotEmpty ? data.first.type : '-'}',
              contentBuilder: (data, index) {
                return DateFormat('yyyy-MM-dd').format(data.date);
              },
            ),
            PColumn(
              title: 'PBF',
              contentBuilder: (data, index) => data.customer,
            ),
            PColumn(
              title: 'NPWP PBF',
              contentBuilder: (data, index) => data.npwp,
            ),
            PColumn(
              title: 'Seri Pjk',
              contentBuilder: (data, index) => data.taxInvoiceNo,
            ),
            PColumn(
              title: 'DPP',
              contentBuilder: (data, index) {
                return data.subAfterTax == 0
                    ? '0'
                    : format.format(data.subAfterTax);
              },
            ),
            PColumn(
              title: 'PPn',
              contentBuilder: (data, index) {
                return data.ppnValue == 0 ? '0' : format.format(data.ppnValue);
              },
            ),
            PColumn(
              title: 'PPH22',
              contentBuilder: (data, index) {
                return data.pph22Value == 0
                    ? '0'
                    : format.format(data.pph22Value);
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
