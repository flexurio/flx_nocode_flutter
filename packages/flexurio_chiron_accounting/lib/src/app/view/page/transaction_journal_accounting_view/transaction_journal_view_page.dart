import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_transactions_table.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TransactionJournalAccountingViewPage2 extends StatelessWidget {
  const TransactionJournalAccountingViewPage2({
    required this.transactionNo,
    super.key,
  });

  final String transactionNo;

  static Route<bool?> route({required String transactionNo}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: TransactionJournalAccountingViewPage2(
        transactionNo: transactionNo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        size: SingleFormPanelSize.extraLarge,
        action: DataAction.view,
        entity: Entity.transactionJournalAccounting,
        children: [
          FormAction(
            children: [
              TileDataVertical(
                label: 'transaction_number'.tr(),
                child: Text(transactionNo).canCopy(),
              ),
              ReviewFormTransactionsTable.prepare(
                transactionNo: transactionNo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
