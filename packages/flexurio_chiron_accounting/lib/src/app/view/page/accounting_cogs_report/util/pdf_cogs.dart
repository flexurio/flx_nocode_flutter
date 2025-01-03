import 'package:appointment/constant/company.dart';
import 'package:appointment/constant/month.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfCogs(
  List<CogsGrade1> cogs,
  Company company,
  int year,
) async {
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final textStyle = TextStyle(font: font);

  Padding cellPadding(Widget cell) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: cell,
    );
  }

  Widget value(double value) {
    return cellPadding(
      Text(
        value.format(),
        style: textStyle,
        textAlign: TextAlign.right,
      ),
    );
  }

  return MultiPage(
    pageTheme: PageTheme(
      pageFormat: const PdfPageFormat(
        30 * PdfPageFormat.cm,
        90 * PdfPageFormat.cm,
        marginAll: 1 * PdfPageFormat.cm,
      ).landscape,
    ),
    build: (Context context) {
      final rows = <TableRow>[];
      for (final cogs1 in cogs) {
        rows.add(
          TableRow(
            children: [
              cellPadding(
                Text(
                  cogs1.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColors.blue700,
                  ),
                ),
              ),
              ...List.generate(
                months.length,
                (index) => value(cogs1.getValueByMonth(index + 1)),
              ),
            ],
          ),
        );

        for (final cogs2 in cogs1.children) {
          rows.add(
            TableRow(
              children: [
                cellPadding(
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(cogs2.name, style: textStyle),
                  ),
                ),
                ...List.generate(
                  months.length,
                  (index) => value(cogs2.getValueByMonth(index + 1)),
                ),
              ],
            ),
          );

          for (final cogs3 in cogs2.children) {
            rows.add(
              TableRow(
                children: [
                  cellPadding(
                    Padding(
                      padding: const EdgeInsets.only(left: 24 * 2),
                      child: Text(cogs3.name, style: textStyle),
                    ),
                  ),
                  ...List.generate(
                    months.length,
                    (index) => value(cogs3.getValueByMonth(index + 1)),
                  ),
                ],
              ),
            );

            for (final cogs4 in cogs3.children) {
              rows.add(
                TableRow(
                  children: [
                    cellPadding(
                      Padding(
                        padding: const EdgeInsets.only(left: 24 * 3),
                        child: Text(cogs4.name, style: textStyle),
                      ),
                    ),
                    ...List.generate(
                      months.length,
                      (index) => value(cogs4.getValueByMonth(index + 1)),
                    ),
                  ],
                ),
              );
            }
          }
        }
      }

      return [
        Text(
          'Cost of Good Sold Report',
          style: TextStyle(
            font: font,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 6),
        Text(company.name, style: textStyle),
        Text('$year', style: textStyle),
        SizedBox(height: 24),
        Table(
          border: const TableBorder(
            horizontalInside: BorderSide(color: PdfColors.grey300),
          ),
          children: [
            TableRow(
              decoration: BoxDecoration(color: PdfColor.fromHex('#7fd101')),
              children: [
                cellPadding(
                  Text(
                    'transaction'.tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: PdfColors.white,
                    ),
                  ),
                ),
                ...List.generate(
                  months.length,
                  (index) => cellPadding(
                    Text(
                      months[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: PdfColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            ...rows,
          ],
        ),
      ];
    },
  );
}
