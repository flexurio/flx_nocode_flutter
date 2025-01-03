import 'package:appointment/constant/company.dart';
import 'package:appointment/constant/finance_customer.dart';
import 'package:flexurio_chiron_finance/src/app/model/finance_return_note.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/finance_return_note/widget/table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfReturnNote({
  required List<FinanceReturnNote> data,
  required DateTime periodStart,
  required DateTime periodEnd,
  required FinanceCustomer customer,
  required String srpNo,
  required Company company,
}) async {
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final textStyle = TextStyle(font: font);

  return MultiPage(
    pageTheme: PageTheme(
      pageFormat: const PdfPageFormat(
        30 * PdfPageFormat.cm,
        90 * PdfPageFormat.cm,
        marginAll: 1 * PdfPageFormat.cm,
      ).landscape,
    ),
    build: (Context context) {
      final dateFormat = DateFormat.yMMMd();
      final start = dateFormat.format(periodStart);
      final end = dateFormat.format(periodEnd);

      List<Widget> buildRowBody(FinanceReturnNote item) {
        return [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.cnjNo, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.srpNo, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.returnNote, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.deliveryNo, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(dateFormat.format(item.deliveryDate), style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.taxInvoiceNo, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.customer, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.referenceNo, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.division, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.product, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              item.quantity.toString(),
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.unit, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              item.unitPrice.idr,
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              item.price.idr,
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              item.discountPercent.toStringAsFixed(2),
              style: textStyle,
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.dpp.idr, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.ppn.toStringAsFixed(2), style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.total.idr, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              dateFormat.format(item.expiredDate),
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(item.batch, style: textStyle),
          ),
        ];
      }

      return [
        Text(
          'Return Note: $srpNo',
          style: TextStyle(
            font: font,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 6),
        Text(company.name, style: textStyle),
        Text('$start - $end', style: textStyle),
        SizedBox(height: 24),
        Table(
          border: TableBorder.all(color: PdfColors.grey300),
          columnWidths: {
            0: const FixedColumnWidth(120),
            1: const FixedColumnWidth(120),
            2: const FixedColumnWidth(100),
            3: const FixedColumnWidth(150),
            4: const FixedColumnWidth(90),
            5: const FixedColumnWidth(150),
            6: const FixedColumnWidth(150),
            7: const FixedColumnWidth(120),
            8: const FixedColumnWidth(180),
            9: const FixedColumnWidth(120),
            10: const FixedColumnWidth(70),
            11: const FixedColumnWidth(80),
            12: const FixedColumnWidth(100),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: PdfColor.fromHex('#7fd101')),
              children: financeReturnHeaders
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.white,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ...List.generate(
              data.length,
              (index) => TableRow(children: buildRowBody(data[index])),
            ),
          ],
        ),
      ];
    },
  );
}
