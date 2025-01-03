import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_detail.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> exportDeliveryOrder(
  SalesOrder salesOrder,
  List<SalesOrderDetail> salesOrderDetail,
) async {
  final font = await PdfGoogleFonts.nunitoRegular();
  final printBy = UserRepositoryApp.instance.userApp!.name;
  final children = <TableRow>[];

  return MultiPage(
    pageFormat: const PdfPageFormat(
      17 * PdfPageFormat.cm,
      22.5 * PdfPageFormat.cm,
      marginAll: 1 * PdfPageFormat.cm,
    ),
    margin: const EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
    build: (Context context) {
      List.generate(
        salesOrderDetail.length,
        (index) {
          return children.add(
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    salesOrderDetail[index].quantity.format(0) +
                        " " +
                        salesOrderDetail[index].unitId,
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    salesOrderDetail[index].product!.name,
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    salesOrderDetail[index].batchNoId,
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    DateFormat('MMM yyyy')
                        .format(salesOrderDetail[index].batchNo.expirationDate),
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );

      Widget buildCustomerInformation() {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      salesOrder.productRequest!.customer.name,
                      style: TextStyle(
                        fontSize: 11,
                        font: font,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                salesOrder.productRequest!.deliveryAddress.address,
                style: TextStyle(
                  fontSize: 11,
                  font: font,
                ),
              ),
            ],
          ),
        );
      }

      Widget buildInvoiceInformation() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48),
            Row(
              children: [
                SizedBox(width: 10),
                SizedBox(
                  child: Text(
                    'NoSP : ${salesOrder.productRequest!.purchaseOrderDistributor}',
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                SizedBox(width: 10),
                SizedBox(
                  child: Text(
                    'NoSJ : ${salesOrder.deliveryOrderId}',
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                SizedBox(width: 10),
                SizedBox(
                  child: Text(
                    'No Faktur : ${salesOrder.invoiceId}',
                    style: TextStyle(
                      fontSize: 11,
                      font: font,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        );
      }

      return [
        SizedBox(height: 60),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildInvoiceInformation(),
            SizedBox(
              width: 250,
              child: buildCustomerInformation(),
            ),
          ],
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(2.05),
              1: FlexColumnWidth(6.8),
              2: FlexColumnWidth(2.2),
              3: FlexColumnWidth(1.4),
            },
            children: children,
          ),
        ),
      ];
    },
    footer: (Context context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Print By : $printBy',
                      style: TextStyle(
                        font: font,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      salesOrder.deliveryDate == null
                          ? DateTime.now().yMMMdHm
                          : salesOrder.deliveryDate!.yMMMdHm,
                      style: TextStyle(
                        font: font,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'F-IK-C.4.2-002-2 (18-10-2023)',
                  style: TextStyle(
                    font: font,
                    fontSize: 6,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Page 1 of 1',
                  style: TextStyle(
                    font: font,
                    fontSize: 6,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
