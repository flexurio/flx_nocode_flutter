import 'package:flexurio_chiron_accounting/src/app/bloc/general_journal_query/transaction_journal_accounting_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal_create/widget/form.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/payment_create/widget/review_form_transactions_table.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal/widget/export_pdf_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/general_journal_view/widget/delete_button.dart';

class TransactionJournalAccountingViewPage extends StatefulWidget {
  const TransactionJournalAccountingViewPage({
    required this.transactionJournalAccounting,
    super.key,
  });

  final TransactionJournalAccounting transactionJournalAccounting;

  static Route<bool?> route({
    required TransactionJournalAccounting transactionJournalAccounting,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TransactionJournalAccountingQueryBloc>(
            create: (context) => TransactionJournalAccountingQueryBloc(),
          )
        ],
        child: TransactionJournalAccountingViewPage(
          transactionJournalAccounting: transactionJournalAccounting,
        ),
      ),
    );
  }

  @override
  State<TransactionJournalAccountingViewPage> createState() =>
      _TransactionJournalAccountingViewPageState();
}

class _TransactionJournalAccountingViewPageState
    extends State<TransactionJournalAccountingViewPage> {
  void _generalJournalFetch() {
    final bloc = context.read<TransactionJournalAccountingQueryBloc>();
    bloc.add(
      TransactionJournalAccountingQueryEvent.fetch(
        generals: false,
        transactionNoEq: widget.transactionJournalAccounting.transactionNo,
        pageOptions: PageOptions.emptyNoLimit(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _generalJournalFetch();
  }

  TransactionJournalAccountingStatus _status =
      TransactionJournalAccountingStatus.empty;

  TransactionJournalAccountingStatus setStatus(double debit, double credit) {
    if (debit == credit) {
      _status = TransactionJournalAccountingStatus.balanced;
    } else if (debit > credit) {
      _status = TransactionJournalAccountingStatus.notBalanced;
    } else if (debit < credit) {
      _status = TransactionJournalAccountingStatus.notBalanced;
    } else {
      _status = TransactionJournalAccountingStatus.empty;
    }
    return _status;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        size: SingleFormPanelSize.large,
        action: DataAction.view,
        entity: Entity.transactionJournalAccounting,
        actions: _buildTransactionJournalAccountingActions(
            widget.transactionJournalAccounting, context),
        children: [
          FormAction(
            children: [
              RowFields(
                children: [
                  Column(
                    children: [
                      TileDataVertical(
                        label: 'Transaction Number',
                        child: Text(
                          widget.transactionJournalAccounting.transactionNo,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Debt',
                        child: Text(
                          widget.transactionJournalAccounting.debit.format(),
                        ),
                      ),
                      TileDataVertical(
                        label: 'Department',
                        child: Text(
                          widget.transactionJournalAccounting.department.name
                                  .isEmpty
                              ? '-'
                              : widget
                                  .transactionJournalAccounting.department.name,
                        ),
                      ),
                      TileDataVertical(
                        label: 'date'.tr(),
                        child: Text(
                          widget.transactionJournalAccounting.transactionDate
                              .yMMMdHm,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Description',
                        child: Text(
                          widget.transactionJournalAccounting.description,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TileDataVertical(
                        label: 'Reference',
                        child: Text(
                          widget.transactionJournalAccounting.reference,
                        ),
                      ),
                      TileDataVertical(
                        label: 'Credit',
                        child: Text(
                          widget.transactionJournalAccounting.credit.format(),
                        ),
                      ),
                      TileDataVertical(
                        label: 'Chart of Account',
                        child: Text(
                          '${widget.transactionJournalAccounting.chartOfAccountId} - ${widget.transactionJournalAccounting.chartOfAccountName}',
                        ),
                      ),
                      TileDataVertical(
                        label: 'budget_type'.tr(),
                        child: Text(
                          '${widget.transactionJournalAccounting.budgetType}',
                        ),
                      ),
                      _buildBalanceStatus(),
                    ],
                  ),
                ],
              ),
              Gap(48),
              _buildAddButton(context).pullRight(),
              Gap(12),
              Container(
                key: UniqueKey(),
                child: ReviewFormTransactionsTable.prepare(
                  transactionNo:
                      widget.transactionJournalAccounting.transactionNo,
                  action: (transaction) => GeneralJournalDeleteButton.prepare(
                    generalJournal: transaction,
                    onSuccess: () {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceStatus() {
    return BlocBuilder<TransactionJournalAccountingQueryBloc,
        TransactionJournalAccountingQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (pageOptions) {
            setStatus(
              pageOptions.data.map((e) => e.debit).reduce((a, b) => a + b),
              pageOptions.data.map((e) => e.credit).reduce((a, b) => a + b),
            );
            return TileDataVertical(
              label: 'balance_status'.tr(),
              child: Chip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                side: BorderSide.none,
                backgroundColor: _status.color.withOpacity(.1),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(radius: 4, backgroundColor: _status.color),
                    const Gap(6),
                    Text(
                      _status.label == ''
                          ? '-'
                          : _status.label.tr(namedArgs: {
                              'first': 'Credit',
                              'second': 'Debit'
                            }),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: _status.color),
                    ),
                  ],
                ),
              ),
            );
          },
          orElse: () {
            return Container();
          },
        );
      },
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.transactionJournalAccounting,
      onPressed: () {
        showDialog<TransactionJournalAccounting?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: Colors.transparent,
              children: [
                TransactionJournalAccountingForm.prepare(temporaryOnly: false),
              ],
            );
          },
        ).then((transaction) {
          if (transaction != null) {
            setState(() {});
          }
        });
      },
    );
  }
}

List<Widget> _buildTransactionJournalAccountingActions(
    TransactionJournalAccounting transactionJournalAccounting,
    BuildContext context) {
  return [
    TransactionJournalAccountingExportPdfButton.prepare(
      transactionJournalAccounting: transactionJournalAccounting,
    ),
  ];
}
