import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_query/transaction_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/transactions_list.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';

class TransactionsData extends StatefulWidget {
  const TransactionsData({
    super.key,
    this.customer,
    this.supplier,
    required this.type,
  });

  final Customer? customer;
  final Supplier? supplier;
  final TransactionJournalType type;

  @override
  State<TransactionsData> createState() => _TransactionsDataState();
}

class _TransactionsDataState extends State<TransactionsData> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _endDate = DateTime.now();
    _startDate = DateTime.now().subtract(const Duration(days: 30 * 3));
    _filterTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowFields(
          children: [
            FieldDatePicker(
              labelText: 'start_date'.tr(),
              onChanged: (value) {
                _startDate = value;
                _filterTransactions();
              },
              initialSelectedDate: _startDate,
              controller: _startDateController,
            ),
            FieldDatePicker(
              labelText: 'end_date'.tr(),
              onChanged: (value) {
                _endDate = value;
                _filterTransactions();
              },
              initialSelectedDate: _endDate,
              controller: _endDateController,
            ),
          ],
        ),
        const Gap(24),
        TransactionsList(),
      ],
    );
  }

  void _filterTransactions() {
    context.read<TransactionQueryBloc>().add(
          TransactionQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
            type: widget.type,
            paymentRemainingGreaterThan: 0,
            dateGraterThanEqualTo: _startDate,
            dateLessThanEqualTo: _endDate,
            customer: widget.customer,
            supplier: widget.supplier,
          ),
        );
  }
}
