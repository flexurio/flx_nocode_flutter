import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Future<Page> reportPettyCash({
  required DateTime startDate,
  required DateTime endDate,
  required List<PettyCashDetail> pettyCashDetails,
}) async {
  final pettyCashGroups = groupByPettyCashGroups(pettyCashDetails);

  return MultiPage(
    pageFormat: PdfPageFormat.a4.portrait,
    margin: const EdgeInsets.all(15),
    header: (context) => buildReportHeader(startDate, endDate),
    build: (context) => buildReportContent(pettyCashGroups),
  );
}

Map<String, List<MapEntry<String, List<PettyCashDetail>>>>
    groupByPettyCashGroups(List<PettyCashDetail> pettyCashDetails) {
  final pettyCashes =
      groupBy(pettyCashDetails, (e) => e.pettyCash.id).entries.toList();
  return groupBy(pettyCashes, (e) => e.value.first.material.materialGroup.id);
}

Widget buildReportHeader(DateTime startDate, DateTime endDate) {
  return Column(
    children: [
      Text(
        'LAPORAN PENGELUARAN KAS PT. METISKA FARMA',
        style: const TextStyle(fontSize: 14),
      ),
      SizedBox(height: 10),
      Text(
        'Tanggal ${startDate.ddMMyyyy} s/d ${endDate.ddMMyyyy}',
        style: const TextStyle(fontSize: 13),
      ),
      SizedBox(height: 15),
      buildTableHeader(),
    ],
  );
}

Table buildTableHeader() {
  return Table(
    columnWidths: _getColumnWidths(),
    border: TableBorder.all(),
    children: [
      TableRow(
        children: [
          buildHeaderCell('TGL'),
          buildHeaderCell('NO', center: true),
          buildHeaderCell('Keterangan'),
          buildHeaderCell('Dept', center: true),
          buildHeaderCell('Nilai'),
          buildHeaderCell('Jumlah'),
        ],
      ),
    ],
  );
}

Widget buildHeaderCell(String text, {bool center = false}) {
  return Padding(
    padding: const EdgeInsets.all(6),
    child: center
        ? Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            ),
          )
        : Text(
            text,
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          ),
  );
}

Map<int, TableColumnWidth> _getColumnWidths() {
  return {
    0: const FlexColumnWidth(25),
    1: const FlexColumnWidth(12),
    2: const FlexColumnWidth(90),
    3: const FlexColumnWidth(13),
    4: const FlexColumnWidth(35),
    5: const FlexColumnWidth(35),
  };
}

List<Widget> buildReportContent(
    Map<String, List<MapEntry<String, List<PettyCashDetail>>>>
        pettyCashGroups) {
  final content = <Widget>[];
  var total = 0.0;

  for (var pettyCashGroup in pettyCashGroups.entries) {
    final rows = buildRows(pettyCashGroup);
    content.add(
      Table(
        columnWidths: _getColumnWidths(),
        border: TableBorder(
          left: BorderSide(),
          right: BorderSide(),
          verticalInside: BorderSide(),
        ),
        children: rows,
      ),
    );

    content.add(
      buildSubtotalRow(
        pettyCashGroup.key,
        calculateTotalRealization(pettyCashGroup.value),
      ),
    );
    total += calculateTotalRealization(pettyCashGroup.value);
  }

  content.add(buildSubtotalRow('KESELURUHAN', total));

  return content;
}

double calculateTotalRealization(
    List<MapEntry<String, List<PettyCashDetail>>> pettyCashEntries) {
  return pettyCashEntries.fold(
      0.0, (sum, entry) => sum + entry.value.first.pettyCash.realizationAmount);
}

Widget buildSubtotalRow(String groupKey, double totalRealization) {
  return Table(
    columnWidths: {
      0: const FlexColumnWidth(25 + 12 + 90 + 13 + 35),
      1: const FlexColumnWidth(35),
    },
    border: TableBorder(
      left: BorderSide(),
      right: BorderSide(),
      verticalInside: BorderSide(),
      bottom: BorderSide(),
      top: BorderSide(),
    ),
    children: [
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              'TOTAL $groupKey',
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalRealization.format(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

List<TableRow> buildRows(
  MapEntry<String, List<MapEntry<String, List<PettyCashDetail>>>>
      pettyCashGroup,
) {
  final rows = <TableRow>[];
  final dates = <DateTime>[];
  var no = 1;

  for (final pettyCashMap in pettyCashGroup.value) {
    final pettyCash = pettyCashMap.value.first.pettyCash;

    var date = pettyCash.documentReceiveAt?.startOfDay;
    if (date != null && dates.contains(date)) {
      date = null;
    } else {
      dates.add(date!);
    }

    rows.add(
      buildRowPettyCash(
        title:
            'Pembayaran Atas: ${pettyCash.purchaseOrder.id} (${pettyCash.id} - ${pettyCash.realizationNo})',
        pettyCash: pettyCash,
        date: date,
        amount: null,
        amountTotal: pettyCash.realizationAmount,
        no: no++,
      ),
    );

    for (final detail in pettyCashMap.value) {
      rows.add(
        buildRowPettyCash(
          title: detail.material.name,
          pettyCash: pettyCash,
          amount: detail.subtotal,
          isSubtitle: true,
        ),
      );
    }

    rows.addAll(buildAdditionalRows(pettyCash));
  }

  return rows;
}

List<TableRow> buildAdditionalRows(PettyCash pettyCash) {
  return [
    if (pettyCash.discountAmount != 0)
      buildRowPettyCash(
        title: 'Discount',
        pettyCash: pettyCash,
        amount: pettyCash.discountAmount * -1,
        isSubtitle: true,
      ),
    if (pettyCash.shippingCost != 0)
      buildRowPettyCash(
        title: 'Shipping Cost',
        pettyCash: pettyCash,
        amount: pettyCash.shippingCost,
        isSubtitle: true,
      ),
    if (pettyCash.ppnAmount != 0)
      buildRowPettyCash(
        title: 'PPN',
        pettyCash: pettyCash,
        amount: pettyCash.ppnAmount,
        isSubtitle: true,
      ),
    if (pettyCash.pphAmount != 0)
      buildRowPettyCash(
        title: 'PPH',
        pettyCash: pettyCash,
        amount: pettyCash.pphAmount * -1,
        isSubtitle: true,
      ),
  ];
}

TableRow buildRowPettyCash({
  required String title,
  required PettyCash pettyCash,
  double? amount,
  double? amountTotal,
  DateTime? date,
  int? no,
  bool isSubtitle = false,
}) {
  return TableRow(
    children: [
      buildTableCell(date != null ? date.yyyyMMdd : ''),
      buildTableCell(no?.toString() ?? '', center: true),
      buildTableCell(title, isSubtitle: isSubtitle),
      buildTableCell(isSubtitle ? '' : pettyCash.department.id, center: true),
      buildTableCell(
        amount?.format() ?? '',
        alignRight: true,
        isSubtitle: isSubtitle,
      ),
      buildTableCell(amountTotal?.format() ?? '', alignRight: true),
    ],
  );
}

Widget buildTableCell(
  String value, {
  bool alignRight = false,
  bool center = false,
  bool isSubtitle = false,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: 3, horizontal: isSubtitle && !alignRight ? 24 : 6),
    child: alignRight
        ? Align(
            alignment: Alignment.centerRight,
            child: Text(value, style: TextStyle(fontSize: 9)),
          )
        : (center
            ? Center(child: Text(value, style: TextStyle(fontSize: 9)))
            : Text(value, style: TextStyle(fontSize: 9))),
  );
}
