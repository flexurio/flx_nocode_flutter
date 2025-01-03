import 'package:flexurio_chiron_finance/src/app/model/finance_return_note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('FinanceReturnNote.fromJson', () {
    test('normal', () {
      final data = {
        'no_cnj': 'CNJ/02/23020006',
        'no_srp': 'SRP/02/23010006',
        'nota_return': 'BR23020337',
        'no_sj': 'SJO/02/20010004',
        'tgl_no_sj': '2020-01-07T00:00:00Z',
        'no_faktur_pajak': '003-20.05646367',
        'nama_customer': 'AMS-PT. ANTARMITRA SEMBADA',
        'no_ref': 'RS22110243',
        'divisi_name': 'PT. TEGUHSINDO LESTARITAMA',
        'product_name': 'Venaron Catch Cover',
        'qty': 2,
        'unit': 'BOX',
        'harsat': 62000,
        'harga': 124000,
        'persen_disc': 10,
        'dpp': 117800,
        'ppn': 10,
        'total': 118770,
        'ex_date': '2022-11-30T00:00:00Z',
        'no_batch': 'T390461101',
      };
      final returnNote = FinanceReturnNote.fromJson(data);
      expect(returnNote.cnjNo, 'CNJ/02/23020006');
      expect(returnNote.cnjNo, 'CNJ/02/23020006');
      expect(returnNote.srpNo, 'SRP/02/23010006');
      expect(returnNote.returnNote, 'BR23020337');
      expect(returnNote.deliveryNo, 'SJO/02/20010004');
      expect(returnNote.taxInvoiceNo, '003-20.05646367');
      expect(returnNote.customer, 'AMS-PT. ANTARMITRA SEMBADA');
      expect(returnNote.referenceNo, 'RS22110243');
      expect(returnNote.division, 'PT. TEGUHSINDO LESTARITAMA');
      expect(returnNote.product, 'Venaron Catch Cover');
      expect(returnNote.quantity, 2);
      expect(returnNote.unit, 'BOX');
      expect(returnNote.unitPrice, 62000.0);
      expect(returnNote.price, 124000.0);
      expect(returnNote.discountPercent, 10.0);
      expect(returnNote.dpp, 117800.0);
      expect(returnNote.ppn, 10.0);
      expect(returnNote.total, 118770.0);
      expect(returnNote.batch, 'T390461101');

      expect(
        DateFormat().format(returnNote.deliveryDate),
        'January 7, 2020 7:00:00 AM',
      );
      expect(
        DateFormat().format(returnNote.expiredDate),
        'November 30, 2022 7:00:00 AM',
      );
    });
  });
}
