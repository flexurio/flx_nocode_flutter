import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_query/chart_of_account_number_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_other_cost_query/payment_other_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment/payment_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_create.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/step_2_payment_form.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/transactions_form.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PaymentCreatePage extends StatefulWidget {
  const PaymentCreatePage._({
    required this.transactionType,
    required this.payment,
    required this.paymentType,
    this.customer,
  });

  final TransactionJournalType transactionType;
  final TransactionPayment payment;
  final PaymentType? paymentType;
  final Customer? customer;

  static Route<bool?> route({
    required TransactionJournalType transactionType,
    required TransactionPayment payment,
    PaymentType? paymentType,
    Customer? customer,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PaymentBloc()),
          BlocProvider(create: (context) => PaymentOtherCostQueryBloc()),
          BlocProvider(
            create: (context) => DepartmentQueryBloc()
              ..add(
                DepartmentQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => CustomerQueryBloc()
              ..add(
                CustomerQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => SupplierQueryBloc()
              ..add(
                SupplierQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ChartOfAccountNumberQueryBloc()
              ..add(
                ChartOfAccountNumberQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                  statusNotEqual: 0,
                  chartOfAccountType: 'BANK',
                ),
              ),
          ),
          BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
        ],
        child: PaymentCreatePage._(
          transactionType: transactionType,
          payment: payment,
          paymentType: paymentType,
          customer: customer,
        ),
      ),
    );
  }

  @override
  State<PaymentCreatePage> createState() => _PaymentCreatePageState();
}

class _PaymentCreatePageState extends State<PaymentCreatePage> {
  var _page = 0;

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;

    Entity entity;
    if (widget.payment.isPayable) {
      entity = EntityAccounting.payment;
    } else if (widget.payment.isReceivable) {
      entity = Entity.sales;
    } else {
      entity = Entity.none;
    }

    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                if (widget.transactionType.isReceivable) 'transaction'.tr(),
                'cost'.tr(),
                'review'.tr(),
              ],
              children: [
                if (widget.transactionType.isReceivable)
                  PaymentCreateTransactionsForm.prepare(
                    onNext: _nextPage,
                    transactionType: widget.transactionType,
                    customer: widget.customer,
                  ),
                PaymentCreatePaymentForm.prepare(
                  onNext: _nextPage,
                  onPrevious: widget.transactionType.isReceivable
                      ? _previousPage
                      : null,
                  transactionType: widget.transactionType,
                  payment: widget.payment,
                  paymentType: widget.paymentType,
                ),
                PaymentCreateReviewForm(
                  onPrevious: _previousPage,
                  transactionPayment: widget.payment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
