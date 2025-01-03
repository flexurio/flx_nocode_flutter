import 'package:flexurio_chiron_accounting/src/app/model/ebitda.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 12);

Future<Page> pdfEbitda(
  Map<String, List<Ebitda>> ebitdaPerArea,
  String period,
) async {
  final font = await PdfGoogleFonts.nunitoExtraLight();
  final marketingAreas = ebitdaPerArea.keys.toList();
  final marketingAreaValues = ebitdaPerArea.values.toList();
  return MultiPage(
    pageFormat: PdfPageFormat.a4,
    build: (Context context) {
      return [
        Text(
          'EBITDA Report Detailed By Area',
          style: TextStyle(
            font: font,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'PT. Metiska Farma',
          style: TextStyle(font: font),
        ),
        Text(
          periodText(period),
          style: TextStyle(font: font),
        ),
        ...List.generate(
          marketingAreas.length,
          (index) => DefaultTextStyle(
            style: TextStyle(font: font),
            child: _ebitdaPerMarketingArea(
              title: marketingAreas[index],
              data: marketingAreaValues[index],
            ),
          ),
        ),
      ]; // Center
    },
  );
}

String periodText(String period) {
  if (period.length == 6) {
    final pattern = RegExp(r'(\d{4})(\d{2})');
    final match = pattern.firstMatch(period);

    if (match == null || match.groupCount != 2) {
      throw ArgumentError();
    }

    final year = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final date = DateTime(year, month);
    return DateFormat('MMMM yyyy').format(date);
  } else {
    return period;
  }
}

Flex _ebitdaPerMarketingArea({
  required String title,
  required List<Ebitda> data,
}) {
  final ebitdaPerCoaGroup = groupBy(data, (ebitda) => ebitda.coaGroup);
  final ebitdaPerCoaGroupKeys = ebitdaPerCoaGroup.keys.toList();
  final ebitdaPerCoaGroupValues = ebitdaPerCoaGroup.values.toList();
  final total = data.fold<double>(
    0,
    (sum, item) => sum + (item.isSales ? item.value : -item.value),
  );
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 30),
      Padding(
        padding: paddingRow,
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Divider(
        height: 3,
        thickness: 3,
        color: PdfColor.fromHex('#7fd101'),
      ),
      ...List.generate(
        ebitdaPerCoaGroupKeys.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: _ebitdaPerCoaGroup(
            percentage: (amount) {
              if (amount == 0.0 || total == 0.0) {
                return 0.0;
              } else {
                return amount / total * 100;
              }
            },
            data: ebitdaPerCoaGroupValues[index],
            title: ebitdaPerCoaGroupKeys[index],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: paddingRow,
              color: PdfColor.fromHex('#7fd101'),
              child: Text(
                'Net Margin Before General & Adm. Expenses',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: PdfColors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: paddingRow,
              color: PdfColor.fromHex('#2ca11c'),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  total.idr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: PdfColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Flex _ebitdaPerCoaGroup({
  required double Function(double) percentage,
  required String title,
  required List<Ebitda> data,
}) {
  final dataSubTotal = data.fold<double>(
    0,
    (sum, item) => sum + (item.isSales ? item.value : -item.value),
  );

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: paddingRow,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            color: PdfColors.green700,
          ),
        ),
      ),
      ...List.generate(
        data.length,
        (index) => Container(
          // padding: paddingRow,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: PdfColors.grey300),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                child: Text(
                  data[index].coaNo,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              Expanded(
                child: Text(
                  data[index].coaName,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              Text(
                data[index].value.idr,
                style: const TextStyle(fontSize: 10),
              ),
              SizedBox(
                width: 55,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${percentage(data[index].value).toStringAsFixed(2)} %',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        padding: paddingRow,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: PdfColors.grey300),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Sub Total',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              dataSubTotal.idr,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 55,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${percentage(dataSubTotal).toStringAsFixed(2)} %',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
