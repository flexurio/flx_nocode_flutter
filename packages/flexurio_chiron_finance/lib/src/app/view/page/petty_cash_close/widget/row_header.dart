part of '../petty_cash_close_page.dart';

class _RowHeader extends StatefulWidget {
  const _RowHeader._({
    Key? key,
    required this.name,
    required this.amount,
    required this.chartOfAccountId,
    required this.onChangeChartOfAccount,
    required this.onChangeBudgetType,
    required this.descriptionController,
  }) : super(key: key);

  final String name;
  final double amount;
  final TextEditingController? descriptionController;
  final List<String> chartOfAccountId;
  final void Function(ChartOfAccountNumber chartOfAccount)
      onChangeChartOfAccount;
  final void Function(BudgetType budgetType) onChangeBudgetType;

  static Widget prepare({
    required String name,
    required double amount,
    required List<String> chartOfAccountId,
    required void Function(ChartOfAccountNumber chartOfAccount)
        onChangeChartOfAccount,
    required void Function(BudgetType budgetType) onChangeBudgetType,
    required TextEditingController? descriptionController,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BudgetTypeQueryBloc()),
      ],
      child: _RowHeader._(
        name: name,
        amount: amount,
        chartOfAccountId: chartOfAccountId,
        onChangeChartOfAccount: onChangeChartOfAccount,
        onChangeBudgetType: onChangeBudgetType,
        descriptionController: descriptionController,
      ),
    );
  }

  @override
  State<_RowHeader> createState() => _RowHeaderState();
}

class _RowHeaderState extends State<_RowHeader> {
  @override
  void initState() {
    super.initState();
    if (widget.chartOfAccountId.length == 1) {
      context.read<BudgetTypeQueryBloc>().add(
            BudgetTypeQueryEvent.fetch(
              chartOfAccount: ChartOfAccountNumber.empty().copyWith(
                id: widget.chartOfAccountId.first,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableWithoutHeader<String>(
          rowHeight: 80,
          showBorder: false,
          data: const ['1'],
          columns: [
            BodyColumn(
              width: 100,
              builder: (pettyCashDetail, _) {
                return Text(widget.name);
              },
            ),
            BodyColumn(
              width: 100,
              alignment: Alignment.centerRight,
              builder: (pettyCashDetail, _) {
                return Text(
                  widget.amount.format(),
                );
              },
            ),
            BodyColumn(
              width: 450,
              builder: (pettyCashDetail, _) {
                return _buildFieldChartOfAccount();
              },
            ),
            BodyColumn(
              width: 300,
              builder: (pettyCashDetail, index) {
                return _buildFieldBudgetType();
              },
            ),
          ],
        ),
        if (widget.descriptionController != null)
          TableWithoutHeader<String>(
            rowHeight: 80,
            showBorder: false,
            data: const ['1'],
            columns: [
              BodyColumn(
                width: 100,
                builder: (pettyCashDetail, _) {
                  return SizedBox();
                },
              ),
              BodyColumn(
                width: 100,
                alignment: Alignment.centerRight,
                builder: (pettyCashDetail, _) {
                  return SizedBox();
                },
              ),
              BodyColumn(
                width: 450,
                builder: (pettyCashDetail, _) {
                  return FTextFormField(
                    controller: widget.descriptionController,
                    labelText: 'description'.tr(),
                  );
                },
              ),
              BodyColumn(
                width: 300,
                builder: (pettyCashDetail, index) {
                  return SizedBox();
                },
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildFieldChartOfAccount() {
    return BlocBuilder<ChartOfAccountNumberQueryBloc,
        ChartOfAccountNumberQueryState>(
      builder: (context, state) {
        return FDropDownSearchChartOfAccountNumber(
          enabled: widget.chartOfAccountId.length > 1,
          initialValue: widget.chartOfAccountId.length == 1
              ? state.maybeWhen(
                  orElse: () => null,
                  loaded: (chartOfAccount) => chartOfAccount.data
                      .where((e) => widget.chartOfAccountId.contains(e.id))
                      .first,
                )
              : null,
          onChanged: (chartOfAccount) {
            if (chartOfAccount != null) {
              widget.onChangeChartOfAccount(chartOfAccount);
              context.read<BudgetTypeQueryBloc>().add(
                    BudgetTypeQueryEvent.fetch(
                      chartOfAccount: chartOfAccount,
                    ),
                  );
            }
          },
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (chartOfAccount) => chartOfAccount.data
                .where(
                  (e) => widget.chartOfAccountId.contains(e.id),
                )
                .toSet()
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildFieldBudgetType() {
    return FDropDownSearchBudgetType(
      onChanged: (budgetType) {
        if (budgetType != null) {
          widget.onChangeBudgetType(budgetType);
        }
      },
    );
  }
}
