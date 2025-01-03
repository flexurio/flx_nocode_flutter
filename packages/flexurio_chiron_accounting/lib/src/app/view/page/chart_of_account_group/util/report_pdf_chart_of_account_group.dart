import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfCoaGroup(
  List<ChartOfAccountGroup> data,
) async {
  await initializeDateFormatting('id_ID');
  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: const EdgeInsets.all(18),
    header: (context) {
      const style = TextStyle(fontSize: 9);
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'KELOMPOK PERKIRAAN',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BarcodeWidget(
                      barcode: Barcode.qrCode(),
                      data: 'KELOMPOK PERKIRAAN',
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                DateFormat.yMMMMd('id_ID').format(DateTime.now()),
                style: style,
              ),
            ],
          ),
          SizedBox(height: 4),
          Table(
            border: TableBorder.all(),
            columnWidths: {
              0: const FlexColumnWidth(120),
              1: const FlexColumnWidth(60),
              2: const FlexColumnWidth(60),
              3: const FlexColumnWidth(40),
              4: const FlexColumnWidth(40),
            },
            children: [
              TableRow(
                verticalAlignment: TableCellVerticalAlignment.full,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Nama Kelompok',
                        style: style,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Kelompok Awal',
                        style: style,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Kelompok Perkiraan',
                        style: style,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Nilai',
                        style: style,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Status',
                        style: style,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    },
    build: (context) {
      return [
        _buildContent(data),
      ];
    },
  );
}

Widget _buildContent(
  List<ChartOfAccountGroup> data,
) {
  const style = TextStyle(fontSize: 9);
  final tables = <TableRow>[];
  for (var i = 0; i < data.length; i++) {
    final coaGroup = data[i];
    tables.add(
      TableRow(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(coaGroup.name, style: style),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(coaGroup.balanceGroup.id, style: style),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(coaGroup.forecastNumber, style: style),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(coaGroup.balanceGroup.type.label, style: style),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text('0', style: style),
          ),
        ],
      ),
    );
  }
  return Table(
    children: tables,
    border: TableBorder.all(),
    columnWidths: {
      0: const FlexColumnWidth(120),
      1: const FlexColumnWidth(60),
      2: const FlexColumnWidth(60),
      3: const FlexColumnWidth(40),
      4: const FlexColumnWidth(40),
    },
  );
}
