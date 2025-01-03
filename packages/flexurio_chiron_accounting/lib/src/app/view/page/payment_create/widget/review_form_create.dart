import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_other_cost_query/payment_other_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment/payment_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_other_costs_table.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_table_create.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentCreateReviewForm extends StatefulWidget {
  const PaymentCreateReviewForm({
    this.onPrevious,
    super.key,
    this.payment,
    this.transactionPayment,
  });

  final void Function()? onPrevious;
  final Payment? payment;
  final TransactionPayment? transactionPayment;

  @override
  State<PaymentCreateReviewForm> createState() =>
      _PaymentCreateReviewFormState();
}

class _PaymentCreateReviewFormState extends State<PaymentCreateReviewForm> {
  Payment? _payment;
  ChartOfAccountNumber? _chartOfAccount;
  Department? _department;
  List<Transaction> _transactions = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        state.maybeWhen(
          initial: (transactions, payment, chartOfAccount, department) {
            if (transactions != null) {
              _transactions = transactions;
            }

            if (payment != null) {
              _payment = payment;
            }

            if (department != null) {
              _department = department;
            }

            if (chartOfAccount != null) {
              _chartOfAccount = chartOfAccount;
            }
          },
          orElse: () {},
        );

        if (_payment == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        final isProgress = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        final pettyCashBloc = context.read<PaymentBloc>();

        return FormAction(
          isProgress: isProgress,
          actions: widget.onPrevious == null
              ? null
              : _buildActions(isProgress, pettyCashBloc),
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'delivery_date'.tr(),
                  child: Text(_payment!.date.yMMMMd),
                ),
                TileDataVertical(
                  label: 'department'.tr(),
                  child: Text(_department?.name ?? ''),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'description'.tr(),
                  child: Text(_payment!.remark),
                ),
                TileDataVertical(
                  label: 'chart_of_account'.tr(),
                  child: Text(_chartOfAccount?.name ?? ''),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'payment_type'.tr(),
                  child: ChipType(_payment!.type),
                ),
                TileDataVertical(
                  label: 'rate'.tr(),
                  child: Text(_payment!.rate.toString()),
                ),
              ],
            ),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Order ID'.tr(),
                  child: Text(widget.transactionPayment?.orderId ?? '-'),
                ),
                _buildDataTotal(),
              ],
            ),
            const Gap(24),
            const Divider(),
            const Gap(12),
            RowFields(
              children: [
                _buildTableTransactions(),
                _buildTableOtherCosts(),
              ],
            ),
            const Gap(48),
          ],
        );
      },
    );
  }

  Widget _buildDataTotal() {
    return BlocBuilder<PaymentOtherCostQueryBloc, PaymentOtherCostQueryState>(
      builder: (context, state) {
        final transactionTotal = _calculateTransactionTotal();
        final otherCostTotal = _calculateOtherCostTotal(state);
        final total = transactionTotal + otherCostTotal;

        return TileDataVertical(
          label: 'total'.tr(),
          child: Text(total.format()),
        );
      },
    );
  }

  double _calculateTransactionTotal() {
    return _transactions.fold<double>(
        0, (total, transaction) => total + transaction.total);
  }

  double _calculateOtherCostTotal(PaymentOtherCostQueryState state) {
    return state.maybeWhen(
      loaded: (pageOptions) => pageOptions.data
          .fold<double>(0, (total, otherCost) => total + otherCost.amount),
      orElse: () => 0,
    );
  }

  Widget _buildTableOtherCosts() {
    return Column(
      children: [
        Text(
          'other_costs'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(12),
        BlocBuilder<PaymentOtherCostQueryBloc, PaymentOtherCostQueryState>(
          builder: (context, state) {
            return ReviewFormOtherCostsTable(
              otherCosts: state.maybeWhen(
                loaded: (pageOptions) => pageOptions.data,
                orElse: () => [],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTableTransactions() {
    return Column(
      children: [
        Text(
          'transactions'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(12),
        ReviewFormTransactionsTableCreate(
          transactions: _transactions,
        ),
      ],
    );
  }

  List<Widget> _buildActions(
    bool isLoading,
    PaymentBloc pettyCashBloc,
  ) {
    return [
      Button(
        permission: null,
        isSecondary: true,
        isInProgress: isLoading,
        action: DataAction.back,
        onPressed: widget.onPrevious,
      ),
      const Gap(12),
      Button(
        permission: null,
        isInProgress: isLoading,
        action: DataAction.finish,
        onPressed: () {
          _submit(context);
        },
      ),
    ];
  }

  void _submit(BuildContext context) {
    final bloc = context.read<PaymentBloc>();
    const action = DataAction.create;
    showDialog<String?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PaymentBloc, PaymentState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (id) async {
                Navigator.pop(context, id);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PaymentBloc, PaymentState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: EntityAccounting.payment,
                label: _payment!.date.yMMMMd,
                onConfirm: () {
                  bloc.add(
                    PaymentEvent.submit(
                      transactionPayment: widget.transactionPayment,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        showSuccessWithId(
          context: context,
          entity: EntityAccounting.transactionJournal,
          id: value,
        );
      }
    });
  }
}
