import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/model/accounts_payable_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfAccountPayablePayment({
  required List<AccountsPayablePayment> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByProduct = groupBy(data, (data) => data.supplierName ?? '').entries;
  final totalSupplier = data.first.totalSupplier;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: EntityAccounting.accountsPayablePayment.title,
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupByProduct.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.value.first.supplierName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                simpleTablePdf<AccountsPayablePayment>(
                  data: data.value,
                  columns: [
                    PColumn(
                      primary: true,
                      title: 'date'.tr(),
                      contentBuilder: (data, index) => data.transactionDate.ddMMyyyy,
                      footer: 'subtotal'.tr(),
                    ),
                    PColumn(
                      title: 'invoice'.tr(),
                      contentBuilder: (data, index) => data.invoiceNo,
                    ),
                    PColumn(
                      title: 'description'.tr(),
                      contentBuilder: (data, index) => data.remark ?? '-',
                    ),
                    PColumn(
                      title: 'ppn'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.ppnValue.format(),
                    ),
                    PColumn(
                      title: 'pph'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.taxValue.format(),
                    ),
                    PColumn(
                      title: 'subtotal'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.subtotalValue.format(),
                    ),
                    PColumn(
                      title: 'total'.tr(),
                      numeric: true,
                      contentBuilder: (data, index) => data.totalValue.format(),
                      footer:  totalSupplier?.format() ?? '0',
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
