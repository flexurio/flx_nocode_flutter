import 'package:appointment/src/app/view/widget/drop_down_items/budget_type.dart';
import 'package:appointment/src/app/view/widget/table_without_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash_close/widget/header_information.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

part 'widget/row_header.dart';

class PettyCashClosePage extends StatefulWidget {
  const PettyCashClosePage._(this.pettyCash);

  final PettyCash pettyCash;

  static Route<bool?> route({required PettyCash pettyCash}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PettyCashBloc()),
          BlocProvider(
            create: (context) => ChartOfAccountNumberQueryBloc()
              ..add(
                ChartOfAccountNumberQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => PettyCashDetailQueryBloc()
              ..add(PettyCashDetailQueryEvent.fetchByPettyCashId(
                  pettyCashId: pettyCash.id)),
          ),
        ],
        child: PettyCashClosePage._(pettyCash),
      ),
    );
  }

  @override
  State<PettyCashClosePage> createState() => _PettyCashClosePageState();
}

class _PettyCashClosePageState extends State<PettyCashClosePage> {
  var _pettyCashDetails = <PettyCashDetail>[];
  var _budgetTypeQueryBlocs = <BudgetTypeQueryBloc>[];
  final _headerAmount = <String, double>{};

  // Description Controllers
  final _headerDescriptionController = <String, TextEditingController>{};
  var _detailDescriptionController = <PettyCashDetail, TextEditingController>{};

  // Chart Of Accounts
  final _headerChartOfAccounts = <String, ChartOfAccountNumber>{};
  final _detailChartOfAccounts = <PettyCashDetail, ChartOfAccountNumber>{};

  // Budget Types
  final _detailBudgetType = <PettyCashDetail, BudgetType>{};
  final _headerBudgetType = <String, BudgetType?>{};

  final _action = DataAction.close;
  final _entity = Entity.pettyCash;

  @override
  void initState() {
    super.initState();

    _initializeChartOfAccounts();
    _initializeAmounts();
    _initializeDescriptionControllers();
    _initializeBudgetTypes();
  }

  void _initializeChartOfAccounts() {
    _headerChartOfAccounts.addAll({
      'Discount': ChartOfAccountNumber.empty().copyWith(id: '7010111'),
      'PPN': ChartOfAccountNumber.empty().copyWith(id: '1010603'),
      'PPH': ChartOfAccountNumber.empty().copyWith(id: '2010202'),
      'Shipping Cost': ChartOfAccountNumber.empty(),
      'Rounding': ChartOfAccountNumber.empty(),
    });
  }

  void _initializeAmounts() {
    _headerAmount.addAll({
      'Discount': widget.pettyCash.discountAmount,
      'PPN': widget.pettyCash.ppnAmount,
      'PPH': widget.pettyCash.pphAmount,
      'Shipping Cost': widget.pettyCash.shippingCost,
      'Rounding': widget.pettyCash.rounding,
    });
  }

  void _initializeDescriptionControllers() {
    final description = widget.pettyCash.description;
    final supplierName = widget.pettyCash.supplier?.name ?? '';

    _headerDescriptionController.addAll({
      'Discount':
          TextEditingController(text: 'Potongan Discount Atas : $description'),
      'PPN': TextEditingController(text: 'PPN Kepada $supplierName'),
      'PPH': TextEditingController(text: 'PPH Atas : $description'),
      'Shipping Cost': TextEditingController(),
      'Rounding': TextEditingController(),
    });
  }

  void _initializeBudgetTypes() {
    _headerBudgetType.addAll({
      'Discount': null,
      'PPN': null,
      'PPH': null,
      'Shipping Cost': null,
      'Rounding': null,
    });
  }

  @override
  Widget build(BuildContext context) {
    final pettyCash = widget.pettyCash;
    return BlocListener<PettyCashBloc, PettyCashState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, _entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: _action,
          entity: _entity,
          size: SingleFormPanelSize.extraLarge,
          actions: [_buildButtonSubmit()],
          children: [
            HeaderInformation(pettyCash: pettyCash),
            const Gap(24 * 2),
            _buildChartOfAccountDetail(),
            Column(
              children: [
                _buildRowHeader(
                  name: 'Discount',
                  amount: pettyCash.discountAmount,
                  chartOfAccountId: ['7010111'],
                ),
                Divider(),
                _buildRowHeader(
                  name: 'PPN',
                  amount: pettyCash.ppnAmount,
                  chartOfAccountId: ['1010603'],
                ),
                Divider(),
                _buildRowHeader(
                  name: 'PPH',
                  amount: pettyCash.pphAmount,
                  chartOfAccountId: ['2010202'],
                ),
                Divider(),
                _buildRowHeader(
                  name: 'Shipping Cost',
                  amount: pettyCash.shippingCost,
                  chartOfAccountId: [
                    '6020402',
                    '6020403',
                    '6020404',
                    '6020405'
                  ],
                ),
                Divider(),
                _buildRowHeader(
                  name: 'Rounding',
                  amount: pettyCash.rounding,
                  chartOfAccountId: [
                    '7010103',
                    '7010206',
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSubmit() {
    return BlocBuilder<PettyCashBloc, PettyCashState>(
      builder: (context, state) {
        return Button(
          permission: null,
          isInProgress: state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          action: _action,
          onPressed: () => _showDialogConfirmation(context),
        );
      },
    );
  }

  void _submit(PettyCashBloc bloc) {
    bloc.add(
      PettyCashEvent.close(
        pettyCash: widget.pettyCash,
        chartOfAccounts: _detailChartOfAccounts,
        budgetTypes: _detailBudgetType,
        headerChartOfAccounts: _headerChartOfAccounts,
        headerBudgetType: _headerBudgetType,
        descriptions: _detailDescriptionController,
        headerDescriptions: _headerDescriptionController,
        headerAmount: _headerAmount,
      ),
    );
  }

  void _showDialogConfirmation(BuildContext context) {
    if (_pettyCashDetails.isEmpty) {
      Toast(context)
          .fail('Please input at least one product to close Petty Cash');
      return;
    }

    if (_pettyCashDetails.length != _detailChartOfAccounts.length) {
      Toast(context)
          .fail('Please input all chart of accounts for each product');
      return;
    }

    for (final header in _headerChartOfAccounts.keys) {
      if (_headerAmount[header]! > 0 &&
          _headerChartOfAccounts[header]!.id.isEmpty) {
        Toast(context).fail(
            '$header chart of account is required. Please select a chart of account for $header');
        return;
      }
    }

    final bloc = context.read<PettyCashBloc>();
    final blocCOA = context.read<ChartOfAccountNumberQueryBloc>();
    final blocPettyCashDetailQueryBloc =
        context.read<PettyCashDetailQueryBloc>();
    const action = DataAction.close;
    showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PettyCashBloc, PettyCashState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.pettyCash);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PettyCashBloc, PettyCashState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return BlocBuilder<ChartOfAccountNumberQueryBloc,
                  ChartOfAccountNumberQueryState>(
                bloc: blocCOA,
                builder: (context, state) {
                  return state.maybeWhen(
                      orElse: () => SizedBox(),
                      loaded: (chartOfAccount) {
                        return BlocBuilder<PettyCashDetailQueryBloc,
                                PettyCashDetailQueryState>(
                            bloc: blocPettyCashDetailQueryBloc,
                            builder: (context, state) {
                              return state.maybeWhen(
                                loaded: (pettyCashDetailx) {
                                  return CardConfirmation(
                                    isProgress: isInProgress,
                                    action: action,
                                    data: Entity.pettyCash,
                                    label: widget.pettyCash.realizationNo,
                                    onConfirm: () {
                                      _submit(bloc);
                                    },
                                  );
                                },
                                orElse: () => SizedBox(),
                              );
                            });
                      });
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildRowHeader({
    required String name,
    required double amount,
    required List<String> chartOfAccountId,
  }) {
    return _RowHeader.prepare(
      name: name,
      amount: amount,
      chartOfAccountId: chartOfAccountId,
      descriptionController: widget.pettyCash.isGeneralExpense
          ? _headerDescriptionController[name]!
          : null,
      onChangeChartOfAccount: (chartOfAccount) {
        _headerChartOfAccounts[name] = chartOfAccount;
      },
      onChangeBudgetType: (budgetType) {
        _headerBudgetType[name] = budgetType;
      },
    );
  }

  Widget _buildChartOfAccountDetail() {
    return BlocBuilder<PettyCashDetailQueryBloc, PettyCashDetailQueryState>(
      builder: (context, state) {
        _pettyCashDetails = state.maybeWhen(
          loaded: (pageOption) => pageOption.data,
          orElse: () => <PettyCashDetail>[],
        );
        if (_budgetTypeQueryBlocs.isEmpty)
          _budgetTypeQueryBlocs = state.maybeWhen(
            loaded: (pageOption) =>
                pageOption.data.map((e) => BudgetTypeQueryBloc()).toList(),
            orElse: () => <BudgetTypeQueryBloc>[],
          );
        if (_detailDescriptionController.isEmpty)
          for (final pettyCashDetail in _pettyCashDetails) {
            _detailDescriptionController[pettyCashDetail] =
                TextEditingController(text: widget.pettyCash.description);
          }

        final status = state.maybeWhen(
          loaded: (_) => Status.loaded,
          loading: () => Status.progress,
          orElse: () => Status.error,
        );
        return YuhuTable<PettyCashDetail>(
          rowHeight: widget.pettyCash.isGeneralExpense ? 162 : 80,
          columns: [
            TableColumn(
              width: 100,
              title: 'name'.tr(),
              builder: (pettyCashDetail, _) {
                return Text(
                  pettyCashDetail.material.name == ''
                      ? pettyCashDetail.pettyCash.description ?? '-'
                      : pettyCashDetail.material.name,
                );
              },
            ),
            TableColumn(
              width: 100,
              title: 'subtotal'.tr(),
              alignment: Alignment.centerRight,
              builder: (pettyCashDetail, index) {
                return Text(pettyCashDetail.subtotal.format());
              },
            ),
            TableColumn(
              width: 450,
              title: 'chart_of_account'.tr(),
              builder: (pettyCashDetail, index) {
                return Column(children: [
                  Gap(18),
                  BlocBuilder<ChartOfAccountNumberQueryBloc,
                      ChartOfAccountNumberQueryState>(
                    builder: (context, state) {
                      return FDropDownSearchChartOfAccountNumber(
                        onChanged: (chartOfAccount) {
                          if (chartOfAccount != null) {
                            _detailChartOfAccounts[pettyCashDetail] =
                                chartOfAccount;
                            _budgetTypeQueryBlocs[index].add(
                              BudgetTypeQueryEvent.fetch(
                                chartOfAccount: chartOfAccount,
                              ),
                            );
                          }
                        },
                        items: state.maybeWhen(
                          orElse: () => [],
                          loaded: (chartOfAccountNumbers) =>
                              chartOfAccountNumbers.data,
                        ),
                      );
                    },
                  ),
                  if (widget.pettyCash.isGeneralExpense) ...[
                    Gap(30),
                    FTextFormField(
                      controller: _detailDescriptionController[pettyCashDetail],
                      labelText: 'description'.tr(),
                    )
                  ]
                ]);
              },
            ),
            TableColumn(
              width: 300,
              title: 'budget_type'.tr(),
              builder: (pettyCashDetail, index) {
                return Column(
                  children: [
                    Gap(18),
                    BlocProvider(
                      create: (_) => _budgetTypeQueryBlocs[index],
                      child: FDropDownSearchBudgetType(
                        onChanged: (budgetType) {
                          if (budgetType != null) {
                            _detailBudgetType[pettyCashDetail] = budgetType;
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
          status: status,
          data: _pettyCashDetails,
        );
      },
    );
  }
}
