import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfAccountsPayablePaymentDetail({
  required List<AccountsPayablePaymentDetail> data,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  // TODO(putra): use pdfTemplate
  return MultiPage(
    theme: ThemeData(defaultTextStyle: TextStyle(font: font)),
    pageFormat: PdfPageFormat.a4,
    header: (context) => headerPdf(
      companyLogo: companyLogo.$1,
      title: 'REKAPITULASI PELUNASAN PBF',
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {
      return [
        simpleTablePdf<AccountsPayablePaymentDetail>(
          data: data,
          columns: [
            PColumn(
              title: 'description'.tr(),
              contentBuilder: (data, index) => data.remark,
            ),
            PColumn(
              title: 'date'.tr(),
              contentBuilder: (data, index) => data.transactionDate,
            ),
            PColumn(
              title: 'total'.tr(),
              contentBuilder: (data, index) {
                return (data.total ?? 0).format();
              },
            ),
          ],
        ),
      ]; // Center
    },
  );
}
