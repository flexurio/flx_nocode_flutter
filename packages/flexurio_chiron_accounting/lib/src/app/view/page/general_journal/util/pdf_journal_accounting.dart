import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';

const paddingRow = EdgeInsets.symmetric(vertical: 6, horizontal: 6);

Future<Page> pdfTransactionJournalAccounting({
  required List<TransactionJournalAccounting> data,
}) async {
  final printedBy = UserRepositoryApp.instance.userApp?.name ?? '';
  return pdfTemplate(
    printedBy: printedBy,
    headerTitle: 'Journal Voucher\nMemorial',
    build: (context) => [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: simpleTablePdf<TransactionJournalAccounting>(
          data: data,
          columns: [
            PColumn(
              title: 'no_perkiraan'.tr(),
              contentBuilder: (data, index) => data.chartOfAccountId,
              footer: 'Total',
              primary: true,
            ),
            PColumn(
              title: 'description'.tr(),
              contentBuilder: (data, index) => data.description,
            ),
            PColumn(
              title: 'debit'.tr(),
              footer: data.isEmpty
                  ? null
                  : data
                      .map((e) => e.debit)
                      .reduce((value, element) => value + element)
                      .format(),
              numeric: true,
              contentBuilder: (data, index) => data.debit.format(),
            ),
            PColumn(
              title: 'credit'.tr(),
              footer: data.isEmpty
                  ? null
                  : data
                      .map((e) => e.credit)
                      .reduce((value, element) => value + element)
                      .format(),
              numeric: true,
              contentBuilder: (data, index) => data.credit.format(),
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Dibuat Oleh,', style: TextStyle(fontSize: 8)),
                SizedBox(height: 40),
                Text('(                           )',
                    style: TextStyle(fontSize: 8)),
                SizedBox(height: 5),
                SizedBox(
                  width: 100,
                  child: Divider(
                    // height: 1,
                    thickness: 1,
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(width: 40),
            Column(
              children: [
                Text('Diperiksa Oleh,', style: TextStyle(fontSize: 8)),
                SizedBox(height: 40),
                Text('(                           )',
                    style: TextStyle(fontSize: 8)),
                SizedBox(height: 5),
                SizedBox(
                  width: 100,
                  child: Divider(
                    // height: 1,
                    thickness: 1,
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(width: 40),
            Column(
              children: [
                Text('Disahkan Oleh,', style: TextStyle(fontSize: 8)),
                SizedBox(height: 40),
                Text('(                           )',
                    style: TextStyle(fontSize: 8)),
                SizedBox(height: 5),
                SizedBox(
                  width: 100,
                  child: Divider(
                    // height: 1,
                    thickness: 1,
                    color: PdfColor.fromHex('#000000'),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
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
                  'No : F-G.5.1-002',
                  style: TextStyle(
                    fontSize: 8,
                  ),
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
                  'Revision Date : 00',
                  style: TextStyle(
                    fontSize: 8,
                  ),
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
                  'Issued Date : 01 Oct 2020',
                  style: TextStyle(
                    fontSize: 8,
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
