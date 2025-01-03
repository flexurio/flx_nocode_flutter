import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_outstanding_report.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);
final format = NumberFormat('#,##0.00', 'en_US');

Future<Page> pdfProductReturnOutstandingReport({
  required List<ProductReturnOutstandingReport> data,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  final companyLogo = await getCompanyLogoPdf();
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  final children = <Widget>[];

  final header = Padding(
    padding: const EdgeInsets.only(left: 36, right: 36, top: 12),
    child: tableHeader(
      hasChildren: true,
      columns: [
        PColumnHeader(
          title: 'Tgl SRP',
        ),
        PColumnHeader(
          title: 'No.SRP',
        ),
        PColumnHeader(
          title: 'No.SJP',
        ),
        PColumnHeader(
          title: 'invoice_no'.tr(),
        ),
        PColumnHeader(
          title: 'customer_name'.tr(),
        ),
        PColumnHeader(
          title: 'reference_no'.tr(),
        ),
        PColumnHeader(
          title: 'Type Retur',
        ),
        PColumnHeader(
          title: 'period',
        ),
        PColumnHeader(
          title: 'product_name'.tr(),
        ),
        PColumnHeader(
          title: 'product_id'.tr(),
        ),
        PColumnHeader(
          title: 'Qty Cek Hasil QA',
        ),
        PColumnHeader(
          title: 'qty'.tr(),
        ),
        PColumnHeader(
          title: 'unit'.tr(),
        ),
        PColumnHeader(
          title: 'Harsat',
        ),
        PColumnHeader(
          title: 'quantity'.tr(),
        ),
        PColumnHeader(
          title: 'batch_no'.tr(),
        ),
        PColumnHeader(
          title: 'expired_date'.tr(),
        ),
        PColumnHeader(
          title: 'Status QA',
        ),
        PColumnHeader(
          title: 'Tgl Hasil',
        ),
        PColumnHeader(
          title: 'NoSJ',
        ),
        PColumnHeader(
          title: 'Tgl SGR',
        ),
        PColumnHeader(
          title: 'total_leadtime'.tr(),
        ),
        PColumnHeader(
          title: 'keterangan_leadtime'.tr(),
        ),
        PColumnHeader(
          title: 'status'.tr(),
        ),
      ],
    ),
  );

  children.add(
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: tableBody<ProductReturnOutstandingReport>(
        data: data,
        columns: [
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.createdAt.yyyyMMdd,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.transactionNo,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.deliveryOrderId,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.taxInvoiceNo ?? '-',
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.customerName,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.referenceNo,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.transactionTypeId,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.createdAt.yyyyMMdd,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.productName,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.productId,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.quantityCheck.format(),
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.qty,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.unitId.format(),
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.price.format(),
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.qty,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.batchNoId,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.expirationDate.yyyyMMdd,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) => data.status,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) =>
                data.qualityAssuranceCheckDate.yyyyMMdd,
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) =>
                data.productReturnDeliveryOrderId ?? '-',
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) =>
                data.productReturnDeliveryOrderDate?.yyyyMMdd ?? '-',
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) {
              Duration difference =
                  data.createdAt.difference(data.confirmMarketingAt);
              return difference.inMinutes.toString();
            },
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) {
              Duration difference =
                  data.createdAt.difference(data.confirmMarketingAt);
              if (difference.inMinutes <= 2400) {
                return 'OK';
              } else {
                return 'NOT OK';
              }
            },
          ),
          PColumnBody(
            flex: 2,
            contentBuilder: (data, index) {
              return data.productReturnDeliveryOrderId != null
                  ? 'CLOSE'
                  : 'OPEN';
            },
          ),
        ],
      ),
    ),
  );

  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'LAPORAN PENERIMAAN RETUR',
    headerChild: header,
    orientation: PageOrientation.landscape,
    pageFormat:
        PdfPageFormat.a3.landscape.copyWith(width: 50 * PdfPageFormat.cm),
    build: (context) => children,  
  );
}
