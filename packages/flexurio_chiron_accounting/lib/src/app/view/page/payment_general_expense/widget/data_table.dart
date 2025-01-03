import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_general_expense_query/payment_general_expense_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_general_expense.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_general_expense/widget/payment_view_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_general_expense/widget/transaction_view_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_journal/widget/transaction_payment_create_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PaymentGeneralExpenseDataTable extends StatefulWidget {
  const PaymentGeneralExpenseDataTable({super.key});

  @override
  State<PaymentGeneralExpenseDataTable> createState() =>
      _PaymentGeneralExpenseDataTableState();
}

class _PaymentGeneralExpenseDataTableState
    extends State<PaymentGeneralExpenseDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<PaymentGeneralExpenseQueryBloc>();
    return BlocBuilder<PaymentGeneralExpenseQueryBloc,
        PaymentGeneralExpenseQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<PaymentGeneralExpense>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () =>
                queryBloc.add(const PaymentGeneralExpenseQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<PaymentGeneralExpenseQueryBloc>().add(
                    PaymentGeneralExpenseQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [refreshButton],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  backendColumn: 'transaction_no',
                  label: 'Transaction No.',
                ),
                body: (payment) =>
                    DataCell(Text(payment.transactionNo).canCopy()),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'transaction_date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (payment) =>
                    DataCell(Text(payment.transactionDate.yMMMd)),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'period'.tr(),
                  backendColumn: 'period',
                ),
                body: (payment) => DataCell(Text(payment.period)),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'supplier'.tr(),
                  backendColumn: 'supplier',
                ),
                body: (payment) => DataCell(Text(payment.supplier)),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  numeric: true,
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (payment) => DataCell(Text(payment.total.format())),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'payment_no'.tr(),
                  backendColumn: 'payment_id',
                ),
                body: (payment) => DataCell(Text(payment.paymentNo)),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'payment_date'.tr(),
                  backendColumn: 'payment_date',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentDate?.yMMMd ?? '-')),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  numeric: true,
                  label: 'payment_total'.tr(),
                  backendColumn: 'payment_total',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentTotal.format())),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  numeric: true,
                  label: 'payment_remaining'.tr(),
                  backendColumn: 'payment_remaining',
                ),
                body: (payment) =>
                    DataCell(Text(payment.paymentRemaining.format())),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (payment) => DataCell(
                  Row(
                    children: [
                      TransactionViewButton(
                          payment: payment.toTransactionPayment()),
                      PaymentViewButton(
                          payment: payment.toTransactionPayment()),
                      if (payment.paymentRemaining != 0)
                        TransactionPaymentCreateButton(
                          paymentType: PaymentType.current,
                          payment: payment.toTransactionPayment(),
                          onSuccess: () {
                            queryBloc.add(
                              const PaymentGeneralExpenseQueryEvent.fetch(),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
