import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/sales_return_replacement_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfSalesReturnReplacementReport({
  required List<SalesReturnReplacementReport> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';

  final groupByProductReturn = groupBy<SalesReturnReplacementReport>(
    data,
    (element) => element.productReturn.id,
  ).entries;

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN PENGGANTIAN SALES RETUR',
    headerChild: Text(
      'Periode : ${DateFormat('dd/MM/yyyy').format(startDate ?? DateTime.now())} S/D ${DateFormat('dd/MM/yyyy').format(endDate ?? DateTime.now())}',
    ),
    orientation: PageOrientation.landscape,
    pageFormat: PdfPageFormat.a3.landscape.copyWith(
      width: 50 * PdfPageFormat.cm,
    ),
    build: (context) => [
      Column(
        children: groupByProductReturn.map((data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: PdfColors.blueGrey200),
              tableHeader(
                hasChildren: true,
                columns: [
                  PColumnHeader(
                    flex: 2,
                    primary: true,
                    title: 'Nomor Surat \nNama Barang Jadi',
                  ),
                  PColumnHeader(
                    title: 'unit'.tr(),
                  ),
                  PColumnHeader(
                    flex: 4,
                    title: 'PENERIMAAN RETUR',
                    children: [
                      PColumnHeader(title: 'Qty', numeric: true),
                      PColumnHeader(title: '(Rp.)', numeric: true),
                    ],
                  ),
                  PColumnHeader(
                    flex: 4,
                    title: 'PENGGANTIAN RETUR',
                    children: [
                      PColumnHeader(title: 'Qty', numeric: true),
                      PColumnHeader(title: '(Rp.) ', numeric: true),
                    ],
                  ),
                ],
              ),
              ...List.generate(data.value.length, (index) {
                return tableBody<SalesReturnReplacementReport>(
                  data: data.value.sublist(0, 1).toList(),
                  // data: data.value,
                  columns: [
                    PColumnBody(
                      flex: 0.8,
                      contentBuilder: (data, index) =>
                          '${data.productReturn.id} \n${data.product.id}/${data.product.name}',
                    ),
                    PColumnBody(
                      flex: 0.4,
                      contentBuilder: (data, index) => data.unitId,
                    ),
                    PColumnBody(
                      flex: 0.8,
                      contentBuilder: (data, index) => data.quantity.format(),
                      numeric: true,
                    ),
                    PColumnBody(
                      flex: 0.8,
                      contentBuilder: (data, index) =>
                          data.productPrice.format(),
                      numeric: true,
                    ),
                    PColumnBody(
                      flex: 0.8,
                      contentBuilder: (data, index) {
                        return data.productIssueQuantity.format();
                      },
                      numeric: true,
                    ),
                    PColumnBody(
                      flex: 0.8,
                      contentBuilder: (data, index) {
                        return data.productIssueProductPrice.format();
                      },
                      numeric: true,
                    ),
                  ],
                );
              }),
              Row(
                children: [
                  SizedBox(width: 1060),
                  Expanded(
                    child: Column(
                      children: [
                        tileDataHorizontal(
                          label: 'total'.tr(),
                          child: Text(
                            'total'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(),
                        tileDataHorizontal(
                          label: data.value.first.productPrice.format(),
                          child: Text(
                            data.value.first.productIssueProductPrice.format(),
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
    ],
  );
}
