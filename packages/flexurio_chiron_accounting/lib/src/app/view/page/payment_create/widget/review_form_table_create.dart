import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ReviewFormTransactionsTableCreate extends StatelessWidget {
  const ReviewFormTransactionsTableCreate({
    required this.transactions,
    super.key,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YuhuTable<Transaction>(
          columns: [
            TableColumn(
              title: 'ID',
              builder: (transaction, _) {
                return Text(transaction.id);
              },
            ),
            TableColumn(
              title: 'amount'.tr(),
              alignment: Alignment.centerRight,
              builder: (transaction, _) {
                return Text(transaction.total.format());
              },
            ),
          ],
          data: transactions,
        ),
      ],
    );
  }
}
