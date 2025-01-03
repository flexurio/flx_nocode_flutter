import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductReport(
  List<Product> products,
) async {
  final logo = await rootBundle.load('asset/image/logo-company-01.png');
  final companyLogo = logo.buffer.asUint8List();
  final name = await rootBundle.load('asset/image/logo-name-company-01.png');
  final companyName = name.buffer.asUint8List();
  return MultiPage(
    margin: const EdgeInsets.all(18),
    pageFormat: PdfPageFormat.a4,
    header: (Context context) {
      return Column(
        children: [
          _buildHeader(companyLogo, companyName),
          SizedBox(height: 20),
        ],
      );
    },
    build: (Context context) {
      return [
        _buildTableContent(products, 9),
        SizedBox(height: 20),
        _buildFooter(),
      ];
    },
  );
}

Widget _buildHeader(Uint8List companyLogo, Uint8List companyName) {
  return Container(
    child: Row(
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
          width: 300,
          height: 75,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Center(
            child: Text(
              'DAFTAR PRODUK PT. METISKA FARMA',
              style: const TextStyle(
                fontSize: 13,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                width: 140,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 8),
                  child: Text(
                    'Tanggal :',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 8),
                  child: Text(
                    'No Revisi : ',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 8),
                  child: Text(
                    'Halaman :    dari    ',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildTableContent(List<Product> products, double fontSize) {
  final tableRows = <TableRow>[
    TableRow(
      verticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'No',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Kode Produk',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Nama Produk',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Batas Kadaluarsa',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Kemasan',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Nomor Izin Edar',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    ),
  ];

  for (var i = 0; i < products.length; i++) {
    final product = products[i];
    tableRows.add(
      TableRow(
        verticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          Center(
            child: Text(
              (i + 1).toString(),
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.id,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.name,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              '${product.expiryPeriod} Bulan',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              '1 Master Box @ ${product.quantityPack} ${product.unitPacking.id} @',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.nie ?? '-',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  return Table(
    border: TableBorder.all(),
    children: tableRows,
    columnWidths: {
      0: const FlexColumnWidth(10),
      1: const FlexColumnWidth(40),
      2: const FlexColumnWidth(50),
    },
  );
}

Widget _buildFooter() {
  const fontSize = 9.0;
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 90,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            children: [
              SizedBox(height: 7),
              Text(
                'Dibuat Oleh',
                style: const TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: 3),
              Divider(),
              SizedBox(height: 33),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Center(
                  child: Text(
                    'Staff QA-Analisa',
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 90,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Column(
            children: [
              SizedBox(height: 7),
              Text(
                'Disetujui Oleh',
                style: const TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: 3),
              Divider(),
              SizedBox(height: 33),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Center(
                  child: Text(
                    'Manager QA',
                    style: const TextStyle(fontSize: fontSize),
                  ),
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
