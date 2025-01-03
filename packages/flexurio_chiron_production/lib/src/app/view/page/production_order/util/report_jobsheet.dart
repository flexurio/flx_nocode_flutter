import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> reportJobsheetProductionOrder(
  ProductionOrder productionOrder,
) async {
  final logo = await rootBundle.load('asset/image/logo-company-01.png');
  final companyLogo = logo.buffer.asUint8List();
  final name = await rootBundle.load('asset/image/logo-name-company-01.png');
  final companyName = name.buffer.asUint8List();
  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: const EdgeInsets.all(16),
    build: (context) {
      return [
        // Title
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          child: Image(MemoryImage(companyLogo)),
                        ),
                        Container(
                          height: 35,
                          width: 70,
                          child: Image(MemoryImage(companyName)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 443,
                    height: 75,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        'FORM KELENGKAPAN JOBSHEET',
                        style: const TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Subtitle
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 125),
                  Text(
                    'Paraf Pemeriksa & Tgl :',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildSubtitle(
                title: 'Produk',
                value: productionOrder.product.name,
              ),
              _buildSubtitle(title: 'Batch', value: productionOrder.id),

              //Table
              SizedBox(height: 10),
              _buildTable(productionOrder),
            ],
          ),
        ),
        SizedBox(height: 40),
        _buildFooter(),
      ];
    },
  );
}

Widget _buildSubtitle({required String title, required String value}) {
  return Row(
    children: [
      SizedBox(width: 20),
      Container(
        width: 50,
        height: 25,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      Container(
        width: 20,
        height: 25,
        child: Text(
          ':',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      Container(
        height: 25,
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}

Widget _buildTable(ProductionOrder productionOrder) {
  final dateString = productionOrder.id.replaceAll(RegExp('[^0-9]'), '');
  final getYear = int.parse(dateString.substring(0, 2));
  final year = getYear - 20;
  final totalYear = 2000 + year;
  final month = int.parse(dateString.substring(5, 7));
  final date = DateTime(totalYear, month);
  final dateFormat = DateFormat.yMMMM();
  final formattedDate = dateFormat.format(date);
  final tableRows = <TableRow>[
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('No'),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Parameter'),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Ada'),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Tidak'),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('1'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Catatan Pengolahan Bets (..................s/d..................),rev.....',
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('2'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Line Clerance Penimbangan'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('3'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Catatan Pengemasan Bets (..................s/d..................),rev.....',
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('4'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Line Clerance Proses Produksi'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('5'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Line Clerance Pengemasan'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('6'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Form Pemeriksaan QC (..................s/d..................),rev.....',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('7'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Nomor Batch ( ${productionOrder.id} )',
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('8'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Expired Date (lihat daftar produk) ( ${productionOrder.expirationDate.yMMMM} )',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('9'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Manufacturing Date ( $formattedDate )'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('10'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Lampiran CC/NC : '),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('11'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Cap Controlled Copy',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('12'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Checklist Pelulusan Produk Jadi',
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
    TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('13'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child:
              Text('Kesesuaian warna map pada status produk (tulis warna map)'),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(''),
          ),
        ),
      ],
    ),
  ];
  return Table(
    columnWidths: {
      0: const FlexColumnWidth(10),
      1: const FlexColumnWidth(100),
      2: const FlexColumnWidth(20),
      3: const FlexColumnWidth(20),
    },
    children: tableRows,
    border: TableBorder.all(),
  );
}

Widget _buildFooter() {
  return Container(
    child: Padding(
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              child: Text(
                'Form No : F-SOP-S.7.5-004',
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              child: Text(
                'Rev. No  :  00',
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PdfColor.fromHex('#000000'),
                ),
              ),
              child: Text(
                'Issue Date : 21 Februari 2024',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
