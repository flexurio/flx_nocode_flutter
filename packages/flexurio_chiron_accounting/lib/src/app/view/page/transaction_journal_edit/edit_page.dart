import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment/payment_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_other_cost_query/payment_other_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_query/transaction_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/transactions_data.dart';
import 'package:gap/gap.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';

import '../../../bloc/list_transaction/list_transaction_bloc.dart';

class TransactionJournalEditPage extends StatefulWidget {
  const TransactionJournalEditPage._(this.transactionPayment, this.payment);

  final TransactionPayment transactionPayment;
  final Payment payment;

  static Route route({
    required TransactionPayment transactionPayment,
    required Payment payment,
  }) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ListTransactionBloc()),
          BlocProvider(create: (context) => PaymentBloc()),
          BlocProvider(create: (context) => TransactionQueryBloc()),
          BlocProvider(
            create: (context) => PaymentOtherCostQueryBloc()
              ..add(
                PaymentOtherCostQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                  payment: Payment.empty()
                      .copyWith(id: transactionPayment.paymentId ?? '-'),
                ),
              ),
          ),
        ],
        child: TransactionJournalEditPage._(transactionPayment, payment),
      ),
    );
  }

  @override
  State<TransactionJournalEditPage> createState() =>
      _TransactionJournalEditPageState();
}

class _TransactionJournalEditPageState
    extends State<TransactionJournalEditPage> {

  final _rateController = TextEditingController(text: '0.00');
  final _kuCostController = TextEditingController(text: '0.00');
  final _rateGapController = TextEditingController(text: '0.00');
  final _artCostController = TextEditingController(text: '0.00');
  final _otherCostController = TextEditingController(text: '0.00');
  final _stampCostController = TextEditingController(text: '0.00');
  final _roundingCostController = TextEditingController(text: '0.00');

  @override
  void dispose() {
    _rateController.dispose();
    _kuCostController.dispose();
    _stampCostController.dispose();
    _roundingCostController.dispose();
    _artCostController.dispose();
    _otherCostController.dispose();
    _rateGapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = Entity.transactionJournalAccounting;

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
          size: SingleFormPanelSize.large,
          actions: [
            BlocBuilder<PaymentBloc, PaymentState>(
              builder: (context, state) {
                return BlocBuilder<ListTransactionBloc, List<Transaction>>(
                  builder: (context, transactions) {
                    return Button(
                      isInProgress: state.maybeWhen(
                        orElse: () => false,
                        loading: () => true,
                      ),
                      permission: null,
                      action: DataAction.edit,
                      onPressed: transactions.isEmpty
                          ? null
                          : () => _submit(transactions, context),
                    );
                  },
                );
              },
            )
          ],
          entity: entity,
          children: [
            _buildFormOtherCost(),
            Gap(24),
            Divider(),
            Gap(24),
            TransactionsData(
              customer: Customer.empty()
                  .copyWith(id: widget.transactionPayment.supplierId),
              type: TransactionJournalType.fromValue(
                widget.transactionPayment.isTypeTransaction,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit(List<Transaction> transactions, BuildContext context) {
    context.read<PaymentBloc>().add(
          PaymentEvent.edit(
            transactions: transactions,
            rate: stringDecimalToDouble(_rateController.text),
            kuCost: stringDecimalToDouble(_kuCostController.text),
            stampCost: stringDecimalToDouble(_stampCostController.text),
            roundingCost: stringDecimalToDouble(_roundingCostController.text),
            artCost: stringDecimalToDouble(_artCostController.text),
            otherCost: stringDecimalToDouble(_otherCostController.text),
            rateGap: stringDecimalToDouble(_rateGapController.text),
            chartOfAccountId: widget.payment.chartOfAccountRepayment ?? '',
            departmentId: widget.payment.department?.id ?? '',
            description: widget.payment.remark,
            paymentNo: widget.transactionPayment.paymentId ?? '',
          ),
        );
  }

  Widget _buildFormOtherCost() {
    return BlocListener<PaymentOtherCostQueryBloc, PaymentOtherCostQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            for (final otherCost in pageOptions.data) {
              if (otherCost.typeCost.name == 'Stamp Cost') {
                _stampCostController.text = otherCost.amount.format();
              } else if (otherCost.typeCost.name == 'Rounding Cost') {
                _roundingCostController.text = otherCost.amount.format();
              } else if (otherCost.typeCost.name == 'Art Cost') {
                _artCostController.text = otherCost.amount.format();
              } else if (otherCost.typeCost.name == 'Other Cost') {
                _otherCostController.text = otherCost.amount.format();
              } else if (otherCost.typeCost.name == 'KU Cost') {
                _kuCostController.text = otherCost.amount.format();
              }
            }
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowFields(
            children: [
              FTextFormField(
                labelText: 'stamp_cost'.tr(),
                controller: _stampCostController,
                validator: requiredValidator.call,
                inputFormatters: [currencyFormatter],
              ),
              FTextFormField(
                labelText: 'rounding_cost'.tr(),
                controller: _roundingCostController,
                validator: requiredValidator.call,
                inputFormatters: [currencyFormatter],
              ),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              FTextFormField(
                labelText: 'art_cost'.tr(),
                controller: _artCostController,
                validator: requiredValidator.call,
                inputFormatters: [currencyFormatter],
              ),
              FTextFormField(
                labelText: 'other_costs'.tr(),
                controller: _otherCostController,
                validator: requiredValidator.call,
                inputFormatters: [currencyFormatter],
              ),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              FTextFormField(
                labelText: 'ku_cost'.tr(),
                controller: _kuCostController,
                validator: requiredValidator.call,
                inputFormatters: [currencyFormatter],
              ),
              FTextFormField(
                labelText: 'rate_gap'.tr(),
                controller: _rateGapController,
                validator: requiredValidator.call,
                inputFormatters: [currencyFormatter],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
