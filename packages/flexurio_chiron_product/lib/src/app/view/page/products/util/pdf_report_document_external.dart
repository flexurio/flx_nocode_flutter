import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> pdfProductReportDocument(
  List<Product> products,
) async {
  final logo = await rootBundle.load('asset/image/logo-company-01.png');
  final companyLogo = logo.buffer.asUint8List();
  final name = await rootBundle.load('asset/image/logo-name-company-01.png');
  final companyName = name.buffer.asUint8List();
  return MultiPage(
    margin: const EdgeInsets.all(18),
    pageFormat: PdfPageFormat.a4,
    header: (context) {
      return Column(
        children: [
          _buildHeader(companyLogo, companyName),
          SizedBox(height: 20),
        ],
      );
    },
    build: (context) {
      return [
        _buildContent(products),
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
          height: 80,
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
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Center(
            child: Text(
              'DAFTAR INDUK DOKUMEN EKSTERNAL',
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
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    'No. Form : F-I.1.1-004',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    'No Revisi : 01.07.2017',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    'Issue Date : ',
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Container(
                width: 140,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    'Tanggal Update : ',
                    style: const TextStyle(fontSize: 7),
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

Widget _buildContent(List<Product> products) {
  const fontSize = 9.0;
  final tableRow = <TableRow>[
    TableRow(
      verticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'No',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Document No',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Document Title',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Revision No',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Publisher',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
        ),
      ],
    ),
  ];

  for (var i = 0; i < products.length; i++) {
    final product = products[i];
    tableRow.add(
      TableRow(
        verticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                (i + 1).toString(),
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.nie ?? '-',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.name,
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.nieExpiredDate.yMMMMd,
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              product.nie != null && product.nie!.isNotEmpty ? 'BPOM' : '-',
              style: const TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }

  return Table(
    border: TableBorder.all(),
    children: tableRow,
  );
}

Widget _buildFooter() {
  const fontSize = 9.0;
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          height: 90,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Catatan :',
              style: const TextStyle(fontSize: fontSize),
            ),
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
                'Dibuat Oleh',
                style: const TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: 3),
              Divider(),
              SizedBox(height: 25),
              Divider(),
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
                'Diperiksa Oleh',
                style: const TextStyle(fontSize: fontSize),
              ),
              SizedBox(height: 3),
              Divider(),
              SizedBox(height: 25),
              Divider(),
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
              SizedBox(height: 25),
              Divider(),
            ],
          ),
        ),
      ],
    ),
  );
}
