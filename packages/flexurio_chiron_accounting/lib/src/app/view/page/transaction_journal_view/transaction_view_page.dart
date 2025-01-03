import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';

class TransactionViewPage extends StatelessWidget {
  const TransactionViewPage._(this.payment, this.viewTransactionJournal);

  static Route<bool?> route({
    required TransactionPayment payment,
    bool? viewTransactionJournal = false,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransactionJournalAccountingQueryBloc()
              ..add(
                TransactionJournalAccountingQueryEvent.fetch(
                  generals: false,
                  transactionNoEq: viewTransactionJournal == true
                      ? payment.paymentId
                      : payment.transactionNo,
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: TransactionViewPage._(payment, viewTransactionJournal),
      ),
    );
  }

  final TransactionPayment payment;
  final bool? viewTransactionJournal;

  @override
  Widget build(BuildContext context) {
    final action = viewTransactionJournal == true
        ? DataAction.viewTransactionJournal
        : DataAction.viewJournal;
    final entity = Entity.none;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        action: action,
        entity: entity,
        size: SingleFormPanelSize.large,
        children: [
          TransactionCreateReviewForm(
            payment: payment,
            viewTransactionJournal: viewTransactionJournal,
          ),
        ],
      ),
    );
  }
}
