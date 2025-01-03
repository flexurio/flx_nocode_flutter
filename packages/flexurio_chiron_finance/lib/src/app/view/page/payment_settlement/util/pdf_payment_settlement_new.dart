import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/payment_settlement_new.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfPaymentSettlementNew({
  required List<PaymentSettlementNew> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByNote = groupBy<PaymentSettlementNew>(
    data,
    (element) => element.remark,
  ).entries;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'payment_settlement_new'.tr(),
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          children: groupByNote.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: PdfColors.blueGrey200),
                Text(
                  data.value.first.customerName,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: PdfColor.fromInt(flavorConfig.color.value),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  data.value.first.remark,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                simpleTablePdf<PaymentSettlementNew>(
                  data: data.value,
                  columns: [
                    PColumn(
                      flex: 3,
                      primary: true,
                      title: 'description'.tr(),
                      contentBuilder: (data, index) => data.description ?? '-',
                    ),
                    PColumn(
                      flex: 1,
                      title: 'date'.tr(),
                      contentBuilder: (data, index) => data.transactionDate,
                    ),
                    PColumn(
                      flex: 1,
                      numeric: true,
                      title: 'amount'.tr(),
                      contentBuilder: (data, index) => data.value.format(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 320),
                    Expanded(
                      child: Column(
                        children: [
                          tileDataHorizontal(
                            label: 'subtotal'.tr(),
                            child: Text(
                              data.value.first.valueTransaction.format(),
                            ),
                          ),
                          tileDataHorizontal(
                            label: 'ku_cost'.tr(),
                            child: Text(data.value.first.kuCost.format()),
                          ),
                          tileDataHorizontal(
                            label: 'stamp_cost'.tr(),
                            child: Text(data.value.first.stampCost.format()),
                          ),
                          tileDataHorizontal(
                            label: 'rounding_cost'.tr(),
                            child: Text(data.value.first.rounding.format()),
                          ),
                          tileDataHorizontal(
                            label: 'PPH',
                            child: Text(''),
                          ),
                          tileDataHorizontal(
                            label: 'other_costs'.tr(),
                            child: Text(data.value.first.otherCost.format()),
                          ),
                          Divider(),
                          tileDataHorizontal(
                            label: 'total'.tr(),
                            child: Text(
                              data.value.first.total.format(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }).toList(),
        ),
      ),
    ],

    // child: simpleTablePdf<PaymentSettlementNew>(
    //   data: data,
    //   columns: [
    //     PColumn(
    //       title: 'invoice'.tr(),
    //       primary: true,
    //       contentBuilder: (data, index) => data.invoiceId,
    //     ),
    //     PColumn(
    //       title: 'batch'.tr(),
    //       contentBuilder: (data, index) => data.batchNoId,
    //     ),
    //     PColumn(
    //       title: 'tax_invoice_number'.tr(),
    //       contentBuilder: (data, index) => data.taxInvoiceNo,
    //     ),
    //     PColumn(
    //       title: 'customer_id'.tr(),
    //       contentBuilder: (data, index) => data.customerId,
    //     ),
    //     PColumn(
    //       title: 'product'.tr(),
    //       contentBuilder: (data, index) => data.productName,
    //     ),
    //     PColumn(
    //       title: 'price'.tr(),
    //       contentBuilder: (data, index) => data.price.toString(),
    //     ),
    //     PColumn(
    //       title: 'quantity'.tr(),
    //       contentBuilder: (data, index) => data.quantity.toString(),
    //     ),
    //     PColumn(
    //       title: 'discount'.tr(),
    //       contentBuilder: (data, index) => data.discountPercent.toString(),
    //     ),
    //   ],
    // ),
  );
}
