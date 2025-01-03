import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_other_cost_query/payment_other_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_detail_query/payment_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/payment_detail_receivable_query/payment_detail_receivable_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';

class PaymentViewPage extends StatelessWidget {
  const PaymentViewPage._(this.payment);

  static Route<bool?> route({required TransactionPayment payment}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PaymentDetailQueryBloc()),
          BlocProvider(create: (context) => PaymentDetailReceivableQueryBloc()),
          BlocProvider(create: (context) => PaymentOtherCostQueryBloc()),
        ],
        child: PaymentViewPage._(payment),
      ),
    );
  }

  final TransactionPayment payment;

  void _fetch(BuildContext context) {
    final paymentData = Payment.empty().copyWith(id: payment.paymentId ?? '-');
    context.read<PaymentDetailQueryBloc>().add(
          PaymentDetailQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
            payment: paymentData,
          ),
        );
    context.read<PaymentDetailReceivableQueryBloc>().add(
          PaymentDetailReceivableQueryEvent.fetch(
            payment: paymentData,
          ),
        );
    context.read<PaymentOtherCostQueryBloc>().add(
          PaymentOtherCostQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
            payment: paymentData,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    _fetch(context);
    const action = DataAction.view;
    final entity = EntityAccounting.payment;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        action: action,
        entity: entity,
        size: SingleFormPanelSize.large,
        children: [
          PaymentReviewForm(
            onRefresh: () => _fetch(context),
            transactionPayment: payment,
          ),
        ],
      ),
    );
  }
}
