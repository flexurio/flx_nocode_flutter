import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/material_stock_card_rupiah.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfMaterialStockCardRupiah({
  required List<MaterialStockCardRupiah> data,
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
      title: 'LAPORAN KARTU STOK MATERIAL',
      child: Text(
          "Periode Tanggal: ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} s/d ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())} \n Material : ALK - Alkohol",),
      companyLogoNamed: companyLogo.$2,
    ),
    footer: (context) => footerPdf(context: context, printedBy: printedBy),
    build: (Context context) {

      double totalQuantityDebitSummary = 0;
      double totalPriceDebitSummary = 0;
      double totalValueDebitSummary = 0;
      double totalQuantityCreditSummary = 0;
      double totalPriceCreditSummary = 0;
      double totalValueCreditSummary = 0;
      double totalQuantityBalanceSummary = 0;
      double totalPriceBalanceSummary = 0;
      double totalValueBalanceSummary = 0;

      for (var item in data) {
        totalQuantityDebitSummary += item.quantityDebitSummary;
        totalPriceDebitSummary += item.priceDebitSummary;
        totalValueDebitSummary += item.valueDebitSummary;
        totalQuantityCreditSummary += item.quantityCreditSummary;
        totalPriceCreditSummary += item.priceCreditSummary;
        totalValueCreditSummary += item.valueCreditSummary;
        totalQuantityBalanceSummary += item.quantityBalanceSummary ?? 0;
        totalPriceBalanceSummary += item.priceBalanceSummary ?? 0;
        totalValueBalanceSummary += item.valueBalanceSummary ?? 0;
      }

      return [
        simpleTablePdfX<MaterialStockCardRupiah>(
          data: data,
          columns: [
            PGroup(
              children: [
                PColumn(
                  title: 'description'.tr(),
                  contentBuilder: (data, index) {
                    return DateFormat('dd/MM/yyyy').format(data.materialDate) + data.transactionId + (data.na ?? '');
                  },
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
                  title: 'price'.tr(),
                  contentBuilder: (data, index) => data.priceDebit.format(),
                ),
                PColumn(
                  title: 'amount'.tr(),
                  contentBuilder: (data, index) => data.valueDebit.format(),
                ),
              ],
            ),
            PGroup(
              title: 'usage'.tr(),
              children: [
                PColumn(
                  title: 'quantity'.tr(),
                  contentBuilder: (data, index) => data.quantityCredit.format(),
                ),
                PColumn(
                  title: 'price'.tr(),
                  contentBuilder: (data, index) => data.priceCredit.format(),
                ),
                PColumn(
                  title: 'amount'.tr(),
                  contentBuilder: (data, index) => data.valueCredit.format(),
                ),
              ],
            ),
            PGroup(
              title: 'balance'.tr(),
              children: [
                PColumn(
                  title: 'quantity'.tr(),
                  contentBuilder: (data, index) {
                    return (data.quantityBalance ?? 0).format();
                  },
                ),
                PColumn(
                  title: 'price'.tr(),
                  contentBuilder: (data, index) {
                    return (data.priceBalance ?? 0).format();
                  },
                ),
                PColumn(
                  title: 'amount'.tr(),
                  contentBuilder: (data, index) {
                    return (data.valueBalance ?? 0).format();
                  },
                ),
              ],
            ),
          ],
          total: [
            'amount'.tr(),
            totalQuantityDebitSummary.format(),
            totalPriceDebitSummary.format(),
            totalValueDebitSummary.format(),
            totalQuantityCreditSummary.format(),
            totalPriceCreditSummary.format(),
            totalValueCreditSummary.format(),
            totalQuantityBalanceSummary.format(),
            totalPriceBalanceSummary.format(),
            totalValueBalanceSummary.format(),
          ],
        ),
      ]; // Center
    },
  );
}
