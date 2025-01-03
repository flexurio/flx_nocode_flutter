import 'package:flexurio_chiron_accounting/src/app/bloc/list_transaction/list_transaction_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment/payment_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_query/transaction_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/transactions_data.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PaymentCreateTransactionsForm extends StatefulWidget {
  const PaymentCreateTransactionsForm({
    required this.onNext,
    required this.transactionType,
    this.customer,
    super.key,
  });

  final void Function() onNext;
  final TransactionJournalType transactionType;
  final Customer? customer;

  static Widget prepare({
    required void Function() onNext,
    required TransactionJournalType transactionType,
    Customer? customer,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListTransactionBloc()),
        BlocProvider(create: (context) => TransactionQueryBloc()),
      ],
      child: PaymentCreateTransactionsForm(
        onNext: onNext,
        transactionType: transactionType,
        customer: customer,
      ),
    );
  }

  @override
  State<PaymentCreateTransactionsForm> createState() =>
      _PaymentCreateTransactionsFormState();
}

class _PaymentCreateTransactionsFormState
    extends State<PaymentCreateTransactionsForm> {
  final _formKey = GlobalKey<FormState>();
  Customer? _customer;

  @override
  void initState() {
    _customer = widget.customer;
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        BlocBuilder<ListTransactionBloc, List<Transaction>>(
          builder: (context, state) {
            return Button(
              permission: null,
              action: DataAction.next,
              onPressed: state.isEmpty ? null : () => _submit(state, context),
            );
          },
        ),
      ],
      children: [
        FDropDownSearchCustomer(
          initialValue: _customer,
          onChanged: (customer) {
            _customer = customer;
            context.read<ListTransactionBloc>().add([]);
            setState(() {});
          },
        ),
        const Gap(24),
        if (_customer != null)
          TransactionsData(
            type: widget.transactionType,
            customer: _customer!,
          ),
      ],
    );
  }

  void _submit(List<Transaction> _transactions, BuildContext context) {
    context.read<PaymentBloc>().add(
          PaymentEvent.createFormTransaction(_transactions, _customer!.id),
        );
    widget.onNext();
  }
}
