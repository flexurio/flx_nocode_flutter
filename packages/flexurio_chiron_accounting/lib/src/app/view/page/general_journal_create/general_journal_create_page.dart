import 'package:flexurio_chiron_accounting/src/app/bloc/general_journal/transaction_journal_accounting_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal_create/widget/form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TransactionJournalAccountingCreatePage extends StatefulWidget {
  const TransactionJournalAccountingCreatePage({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TransactionJournalAccountingBloc()),
      ],
      child: const TransactionJournalAccountingCreatePage(),
    );
  }

  @override
  State<TransactionJournalAccountingCreatePage> createState() =>
      _TransactionJournalAccountingCreatePageState();
}

class _TransactionJournalAccountingCreatePageState
    extends State<TransactionJournalAccountingCreatePage> {
  final _transactions = <TransactionJournalAccounting>[];

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.transactionJournalAccounting;
    final debt = _transactions.fold<double>(
      0,
      (sum, item) => sum + item.debit - item.credit,
    );
    return BlocListener<TransactionJournalAccountingBloc,
        TransactionJournalAccountingState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<TransactionJournalAccountingBloc,
                TransactionJournalAccountingState>(
              builder: (context, state) {
                return Button(
                  action: action,
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _transactions.isNotEmpty && debt == 0
                      ? () {
                          context.read<TransactionJournalAccountingBloc>().add(
                                TransactionJournalAccountingEvent.create(
                                  transactionJournalAccounting: _transactions,
                                ),
                              );
                        }
                      : null,
                );
              },
            ),
          ],
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildAddButton(context),
              ],
            ),
            const Gap(24),
            _buildTable(),
            if (debt != 0)
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: BlockNote(
                  color: Colors.red,
                  title: 'Warning',
                  subtitle: '${'debt'.tr()} ${debt.format()}',
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.transactionJournalAccounting,
      onPressed: () async {
        final transaction = await showDialog<TransactionJournalAccounting?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                TransactionJournalAccountingForm.prepare(temporaryOnly: true),
              ],
            );
          },
        );
        if (transaction != null) {
          _transactions.add(transaction);
          setState(() {});
        }
      },
    );
  }

  YuhuTable<TransactionJournalAccounting> _buildTable() {
    return YuhuTable<TransactionJournalAccounting>(
      width: 1400,
      data: _transactions,
      columns: [
        TableColumn(
          title: 'date'.tr(),
          builder: (transaction, _) {
            return Text(
              transaction.transactionDate.yMMMMd,
            );
          },
        ),
        TableColumn(
          title: 'department'.tr(),
          builder: (transaction, _) {
            return Text(transaction.department.name);
          },
        ),
        TableColumn(
          title: 'Chart of Account',
          builder: (transaction, _) {
            return Text(
              transaction.chartOfAccountName,
            );
          },
        ),
        TableColumn(
          title: 'description'.tr(),
          builder: (transaction, _) {
            return Text(
              transaction.description,
            );
          },
        ),
        TableColumn(
          title: 'debt'.tr(),
          builder: (transaction, _) {
            return Text(
              transaction.debit.format(),
            );
          },
        ),
        TableColumn(
          title: 'credit'.tr(),
          builder: (transaction, _) {
            return Text(
              transaction.credit.format(),
            );
          },
        ),
        TableColumn(
          title: 'reference'.tr(),
          builder: (transaction, _) {
            return Text(
              transaction.reference,
            );
          },
        ),
        TableColumn(
          title: 'budget_type'.tr(),
          builder: (transaction, _) {
            return Text(
              transaction.budgetType.toString(),
            );
          },
        ),
        TableColumn(
          title: 'actions'.tr(),
          builder: (_, index) {
            return IconButtonSmall(
              permission: null,
              action: DataAction.delete,
              onPressed: () async {
                _transactions.removeAt(index);
                setState(() {});
              },
            );
          },
        ),
      ],
    );
  }
}
