import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_query/transaction_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../bloc/list_transaction/list_transaction_bloc.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList();

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  var _transactions = <Transaction>[];
  var _customAmount = <String, double>{};
  var _search = '';

  List<Transaction> _getTransactions() {
    var result = <Transaction>[];
    for (var transaction in _transactions) {
      final double total = _customAmount.containsKey(transaction.id)
          ? _customAmount[transaction.id]!
          : transaction.total;
      final isOver = total > transaction.total;
      if (isOver) {
        return [];
      }

      result.add(
        transaction.copyWith(
          total: total,
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionQueryBloc, TransactionQueryState>(
      builder: (context, state) {
        final transactions = state.maybeWhen(
          loaded: (data) => data.data,
          orElse: () => <Transaction>[],
        );
        transactions.sort((a, b) => a.dueDate.compareTo(b.dueDate));
        final data = transactions
            .where((element) =>
                element.id.toLowerCase().contains(_search.toLowerCase()))
            .toList();

        return Column(
          children: [
            SizedBox(
              width: 300,
              child: SearchBoxX(
                onChanged: (value) {
                  setState(() {
                    _search = value;
                  });
                },
              ),
            ).pullRight(),
            Gap(24),
            YuhuTable<Transaction>(
              rowHeight: 80,
              onSelectChanged: (transactions) {
                _transactions = transactions;
                context.read<ListTransactionBloc>().add(
                      _getTransactions(),
                    );
              },
              data: data,
              status: state.maybeWhen(
                loaded: (_) => Status.loaded,
                loading: (_) => Status.progress,
                orElse: () => Status.error,
              ),
              columns: [
                TableColumn(
                  title: 'id'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.id);
                  },
                ),
                TableColumn(
                  title: 'amount'.tr(),
                  alignment: Alignment.centerRight,
                  builder: (transaction, _) {
                    return BlocBuilder<ListTransactionBloc, List<Transaction>>(
                      builder: (context, state) {
                        final value = _customAmount.containsKey(transaction.id)
                            ? _customAmount[transaction.id]!
                            : transaction.total;
                        final isOver = value > transaction.total;
                        return Text(
                          transaction.total.format(),
                          style: isOver ? TextStyle(color: Colors.red) : null,
                        );
                      },
                    );
                  },
                ),
                TableColumn(
                  title: 'payment'.tr(),
                  alignment: Alignment.centerRight,
                  builder: (transaction, _) {
                    final selected = _transactions.contains(transaction);
                    if (!selected) {
                      return Container();
                    }

                    final value = _customAmount.containsKey(transaction.id)
                        ? _customAmount[transaction.id]!
                        : transaction.total;
                    final controller =
                        TextEditingController(text: value.format());
                    return FTextFormField(
                      labelText: 'payment'.tr(),
                      validator: requiredValidator.call,
                      controller: controller,
                      inputFormatters: [currencyFormatter],
                      onChanged: (value) {
                        _customAmount[transaction.id] =
                            stringDecimalToDouble(value);
                        context.read<ListTransactionBloc>().add(
                              _getTransactions(),
                            );
                        // widget.onChanged(_getTransactions());
                        // setState(() {});
                      },
                    );
                  },
                ),
                TableColumn(
                  title: 'due_date'.tr(),
                  builder: (transaction, _) {
                    return Text(transaction.dueDate.yMMMd);
                  },
                ),
              ],
            ),
            TileDataHorizontal(
              label: 'grand_total'.tr(),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              child: BlocBuilder<ListTransactionBloc, List<Transaction>>(
                builder: (context, state) {
                  return Text(
                    state
                        .fold<double>(
                          0,
                          (total, transaction) => total + transaction.total,
                        )
                        .format(),
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
