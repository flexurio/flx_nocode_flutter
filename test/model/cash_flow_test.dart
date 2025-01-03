import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('CashFlow.fromJson', () {
    test('normal', () {
      final data = {
        'date': '0001-01-01T00:00:00Z',
        'no_transaction': 'GMB/01/23060048',
        'invoice': '',
        'rec_from': '',
        'description': '',
        'amount': 0,
        'code': 'CF',
        'sub_code': 'CF',
        'mutation_date': '2023-06-22T00:00:00Z',
        'transfer_fee': 5000,
        'total_transfer': 5000,
        'bank': 'MANDIRI',
        'status': 'OPEN',
        'division': '',
      };
      final cashFlow = CashFlow.fromJson(data);
      expect(cashFlow.noTransaction, 'GMB/01/23060048');
      expect(
        DateFormat().format(cashFlow.mutationDate),
        'June 22, 2023 7:00:00 AM',
      );
    });
  });
}
