import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/entity.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_recap_by_sales_detail_special.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfInvoiceRecapBySalesDetailSpecial({
  required List<InvoiceRecapBySalesDetailSpecial> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final groupByCustomer = groupBy(data, (data) => data.customer).entries;
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle:
        '${EntityFinance.invoiceRecapByType.title} - ${'sales_detail_special'.tr()}',
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupByCustomer.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.value.first.customer,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                simpleTablePdf<InvoiceRecapBySalesDetailSpecial>(
                  data: data.value,
                  columns: [
                    PColumn(
                      primary: true,
                      title: 'invoice'.tr(),
                      contentBuilder: (data, index) => data.transactionNo,
                      footer: 'subtotal'.tr(),
                    ),
                    PColumn(
                      title: 'date'.tr(),
                      contentBuilder: (data, index) =>
                          data.transactionDate.yMMMMd,
                    ),
                    PColumn(
                      title: 'sale'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) =>
                          data.subtotalCustomer.format(),
                      footer: data.value.first.subtotalCustomer.format(),
                    ),
                    PColumn(
                      title: 'discount'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) =>
                          data.discountValueCustomer.format(),
                      footer: data.value.first.discountValueSummary.format(),
                    ),
                    PColumn(
                      title: 'additional_discount'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) =>
                          data.additionalDiscountValueCustomer.format(),
                      footer: data.value.first.additionalDiscountValueSummary
                          .format(),
                    ),
                    PColumn(
                      title: 'ppn'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) =>
                          data.ppnValueCustomer.format(),
                      footer: data.value.first.ppnValueSummary.format(),
                    ),
                    PColumn(
                      title: 'receivables'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.total.format(),
                      footer: data.value.first.totalSummary.format(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            );
          }).toList(),
        ),
      ),
    ],
  );
}
