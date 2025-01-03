import 'package:flexurio_chiron_presence/src/app/model/presence_employee.dart';
import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report_per_employee/widget/table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_erp_employee/flexurio_erp_employee.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Page> pdfPresencePerEmployee({
  required Map<int, PresenceEmployee?> presences,
  required DateTime dateTime,
  required Employee employee,
}) async {
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final textStyle = TextStyle(font: font, fontSize: 10);

  return MultiPage(
    pageTheme: PageTheme(
      pageFormat: PdfPageFormat.a4.landscape,
    ),
    build: (Context context) {
      final start = DateFormat.yMMMM().format(dateTime);

      List<Widget> buildRowBody(PresenceEmployee? item, DateTime date) {
        final dateWidget = Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            DateFormat('yyyy/MM/dd, EEEE').format(date),
            style: textStyle,
          ),
        );
        if (item == null) {
          return [dateWidget];
        }

        PdfColor? outEarlyColor;
        if (item.isOutEarly != null) {
          outEarlyColor = item.isOutEarly! ? PdfColors.red : PdfColors.green;
        }

        return [
          dateWidget,
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(item.office.name, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('08:00-17:00', style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(item.inTime, style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(item.outTime ?? '--:--', style: textStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              item.inLate.toText,
              style: textStyle.copyWith(
                color: item.isInLate ? PdfColors.green : PdfColors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              item.outEarly?.toText ?? '--:--',
              style: textStyle.copyWith(
                color: outEarlyColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(item.total?.toText ?? '--:--', style: textStyle),
          ),
        ];
      }

      final keys = presences.keys.toList();
      final values = presences.values.toList();
      return [
        Text(
          'Monthly Presence Per Employee',
          style: TextStyle(
            font: font,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 6),
        Text(
          '${employee.name} (${employee.nip})',
          style: textStyle,
        ),
        Text(start, style: textStyle),
        SizedBox(height: 24),
        Table(
          border: TableBorder.all(color: PdfColors.grey300),
          columnWidths: {
            0: const FixedColumnWidth(200),
            1: const FixedColumnWidth(150),
            2: const FixedColumnWidth(120),
            3: const FixedColumnWidth(100),
            4: const FixedColumnWidth(100),
            5: const FixedColumnWidth(100),
            6: const FixedColumnWidth(100),
            7: const FixedColumnWidth(100),
            8: const FixedColumnWidth(100),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: PdfColor.fromHex('#7fd101')),
              verticalAlignment: TableCellVerticalAlignment.middle,
              children: presenceHeaders
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: PdfColors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            ...List.generate(
              keys.length,
              (index) {
                final date = DateTime(
                  dateTime.year,
                  dateTime.month,
                  keys[index],
                );
                return TableRow(
                  decoration: BoxDecoration(
                    color: date.isWeekend ? PdfColors.yellow50 : null,
                  ),
                  children: buildRowBody(
                    values[index],
                    date,
                  ),
                );
              },
            ),
          ],
        ),
      ];
    },
  );
}
