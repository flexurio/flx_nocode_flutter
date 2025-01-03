import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfInvoice({
  required List<AccountsReceivableGroup> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final format = NumberFormat('#,##0.00', 'en_US');

  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    margin: const EdgeInsets.all(24),
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'unpaid_invoices'.tr(),
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<AccountsReceivableGroup>(
          data: data,
          columns: [
            PColumn(
              title: 'invoice_number'.tr(),
              contentBuilder: (data, index) => data.id,
            ),
            PColumn(
              title: 'address'.tr(),
              contentBuilder: (data, index) => data.cityDeliveryAddress ?? '-',
            ),
            PColumn(
              title: 'invoice_date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('dd MMMM yyyy').format(
                  data.date,
                );
              },
            ),
            PColumn(
              title: 'due_date'.tr(),
              contentBuilder: (data, index) {
                return DateFormat('dd MMMM yyyy').format(
                  data.dueDate,
                );
              },
            ),
            PColumn(
              title: 'quantity'.tr(),
              contentBuilder: (data, index) {
                return data.paymentAmount == 0
                    ? '0'
                    : format.format(data.paymentAmount);
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
