import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_query/chart_of_account_number_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_non_order/transaction_non_order_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_non_order_create/widget/add_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/widget/drop_down_items/chart_of_account_number.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class TransactionNonOrderCreatePage extends StatefulWidget {
  const TransactionNonOrderCreatePage({super.key});

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TransactionNonOrderBloc()),
          BlocProvider(
            create: (context) => ChartOfAccountNumberQueryBloc()
              ..add(ChartOfAccountNumberQueryEvent.fetch()),
          ),
        ],
        child: const TransactionNonOrderCreatePage(),
      ),
    );
  }

  @override
  State<TransactionNonOrderCreatePage> createState() =>
      _TransactionNonOrderCreatePageState();
}

class _TransactionNonOrderCreatePageState
    extends State<TransactionNonOrderCreatePage> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final List<TextEditingController> _coaNameControllers = [];
  final List<TextEditingController> _valueControllers = [];
  final List<TransactionNonOrderTableWidget> _table = [];
  final List<ChartOfAccountNumber> _coaNumber = [];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      for (var i = 0; i < _table.length; i++) {
        context.read<TransactionNonOrderBloc>().add(
              TransactionNonOrderEvent.create(
                name: _nameController.text,
                value: _valueControllers[i].text,
                coaNumber: _coaNumber[i],
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.transactionNonOrder;
    const action = DataAction.create;
    return BlocListener<TransactionNonOrderBloc, TransactionNonOrderState>(
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
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<TransactionNonOrderBloc, TransactionNonOrderState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TransactionNonOrderAddButton(
                  onAdd: () {
                    setState(() {
                      _coaNameControllers.add(TextEditingController());
                      _valueControllers.add(TextEditingController());
                      final table = TransactionNonOrderTableWidget(
                        coaNumberController: _coaNameControllers.last,
                        valueController: _valueControllers.last,
                      );
                      _table.add(table);
                    });
                  },
                ),
              ],
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            YuhuTable<TransactionNonOrderTableWidget>(
              width: 1150,
              rowHeight: 60,
              columns: [
                TableColumn(
                  width: 150,
                  title: 'Name',
                  builder: (coaNumber, index) {
                    return Text(
                      index < _coaNameControllers.length
                          ? _coaNameControllers[index].text
                          : '-',
                    );
                  },
                ),
                TableColumn(
                  width: 100,
                  title: 'Code',
                  builder: (coaNumber, _) {
                    return const Text('GMB');
                  },
                ),
                TableColumn(
                  width: 400,
                  title: 'Chart Of Account Number',
                  builder: (coaNumber, index) {
                    return FDropDownSearchChartOfAccountNumber(
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _coaNumber.add(value);
                            _coaNameControllers[index].text = value.name;
                          });
                        }
                      },
                    );
                  },
                ),
                TableColumn(
                  width: 200,
                  title: 'Unique',
                  builder: (coaNumber, _) {
                    return const Text('Penerimaan Bank GE');
                  },
                ),
                TableColumn(
                  width: 300,
                  title: 'Value',
                  alignment: Alignment.centerRight,
                  builder: (coaNumber, index) {
                    return FTextFormField(
                      controller: index < _valueControllers.length
                          ? _valueControllers[index]
                          : null,
                    );
                  },
                ),
              ],
              data: _table,
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionNonOrderTableWidget {
  TransactionNonOrderTableWidget({
    required this.coaNumberController,
    required this.valueController,
  });
  final TextEditingController coaNumberController;
  final TextEditingController valueController;

  String get coaNumber => coaNumberController.text;
}
