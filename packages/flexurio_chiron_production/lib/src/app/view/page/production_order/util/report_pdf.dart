import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> reportProductionOrder(
  List<ProductionOrder> productionOrders,
) async {
  return MultiPage(
    pageFormat: PdfPageFormat.a4,
    maxPages: 500,
    margin: EdgeInsets.zero,
    header: (context) {
      const fontSize = 9.0;
      return Column(
        children: [
          SizedBox(height: 30),
          Center(child: Text('BATCH BATAL')),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                DateTime.now().yMMMMd,
                style: const TextStyle(fontSize: 9),
              ),
            ],
          ),
          SizedBox(height: 4),
          Table(
            columnWidths: {
              0: const FlexColumnWidth(70),
              1: const FlexColumnWidth(70),
              2: const FlexColumnWidth(70),
              3: const FlexColumnWidth(70),
              4: const FlexColumnWidth(70),
              5: const FlexColumnWidth(70),
            },
            children: [
              TableRow(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(),
                  ),
                ),
                verticalAlignment: TableCellVerticalAlignment.full,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Product Code',
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Product Name',
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Batch Number',
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Expired Date',
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Description',
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Rework',
                        style: const TextStyle(fontSize: fontSize),
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
        _buildContent(productionOrders),
      ];
    },
  );
}

Widget _buildContent(
  List<ProductionOrder> data,
) {
  const fontSize = 9.0;
  final tableRow = <TableRow>[];

  for (var i = 0; i < data.length; i++) {
    final productionOrder = data[i];
    tableRow.add(
      TableRow(
        verticalAlignment: TableCellVerticalAlignment.full,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                productionOrder.product.id,
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                productionOrder.product.name,
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                productionOrder.id,
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                productionOrder.expirationDate.yMMMMd,
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                productionOrder.description,
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                productionOrder.isRework.toString(),
                style: const TextStyle(fontSize: fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }

  return Table(
    children: tableRow,
    columnWidths: {
      0: const FlexColumnWidth(70),
      1: const FlexColumnWidth(70),
      2: const FlexColumnWidth(70),
      3: const FlexColumnWidth(70),
      4: const FlexColumnWidth(70),
      5: const FlexColumnWidth(70),
    },
  );
}
