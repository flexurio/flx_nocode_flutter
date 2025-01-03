import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_query/chart_of_account_number_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/transaction_routine_create/widget/delete_button.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class TransactionRoutineTransactionForm extends StatefulWidget {
  const TransactionRoutineTransactionForm({
    required this.onNext,
    required this.onPrevious,
    required this.bloc,
    super.key,
  });

  final void Function() onNext;
  final void Function() onPrevious;
  final TransactionRoutineBloc bloc;

  static Widget prepare({
    required void Function() onNext,
    required void Function() onPrevious,
    required TransactionRoutineBloc bloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
        BlocProvider(
          create: (context) => ChartOfAccountNumberQueryBloc()
            ..add(
              ChartOfAccountNumberQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: TransactionRoutineTransactionForm(
        bloc: bloc,
        onNext: onNext,
        onPrevious: onPrevious,
      ),
    );
  }

  @override
  State<TransactionRoutineTransactionForm> createState() =>
      _TransactionRoutineTransactionFormState();
}

class _TransactionRoutineTransactionFormState
    extends State<TransactionRoutineTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  List<TransactionRoutineDetail>? _transactionRoutineDetail;
  final _uniqueController = TextEditingController();
  final _valueController = TextEditingController();
  final _descriptionController = TextEditingController();
  ChartOfAccountNumber? _chartOfAccountNumber;
  late TransactionRoutineDk _categoryController;
  late Material _material;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      widget.bloc.add(
        TransactionRoutineEvent.createDetail(
          newTransactionRoutineDetail: TransactionRoutineDetail(
            chartOfAccountNo: _chartOfAccountNumber!.id,
            unique: _uniqueController.text,
            value: stringDecimalToDouble(_valueController.text),
            category: _categoryController,
            description: _descriptionController.text,
            material: _material.id,
          ),
        ),
      );
      _uniqueController.text = '';
      _valueController.text = '';
      return;
    }
    Toast(context).fail('Please fill out all the data.');
  }

  void _next(BuildContext context) {
    if (_transactionRoutineDetail != null ||
        _transactionRoutineDetail!.isNotEmpty) {
      widget.onNext();
      return;
    } else if (_transactionRoutineDetail == null ||
        _transactionRoutineDetail!.isEmpty) {
      Toast(context).fail('You must complete the transaction data.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      actions: [
        Button(
          permission: null,
          isSecondary: true,
          action: DataAction.back,
          onPressed: () => widget.onPrevious(),
        ),
        const Gap(12),
        Button(
          permission: null,
          action: DataAction.next,
          onPressed: () => _next(context),
        ),
      ],
      children: [
        FormAction(
          formKey: _formKey,
          actions: [
            Button(
              permission: null,
              action: DataAction.add,
              onPressed: () => _submit(context),
            ),
          ],
          children: [
            RowFields(
              children: [
                BlocBuilder<ChartOfAccountNumberQueryBloc,
                    ChartOfAccountNumberQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<ChartOfAccountNumber>(
                      validator: requiredObjectValidator.call,
                      status: state.maybeWhen(
                        error: (_) => Status.error,
                        loading: (_) => Status.progress,
                        orElse: () => Status.loaded,
                      ),
                      labelText: 'Chart of Account',
                      items: state.maybeWhen(
                        orElse: () => [],
                        loaded: (subCodes) => subCodes.data,
                      ),
                      onChanged: (value) {
                        _chartOfAccountNumber = value;
                      },
                      itemAsString: (item) => item.id,
                    );
                  },
                ),
                FTextFormField(
                  labelText: 'Unique',
                  maxLength: 100,
                  controller: _uniqueController,
                  validator: requiredValidator.call,
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                Column(
                  children: [
                    FTextFormField(
                      labelText: 'Value',
                      controller: _valueController,
                      inputFormatters: [
                        ThousandsFormatter(),
                      ],
                      validator: requiredValidator.call,
                    ),
                  ],
                ),
                Column(
                  children: [
                    FDropDownSearch<TransactionRoutineDk>(
                      labelText: 'Category',
                      items: const [
                        TransactionRoutineDk.debit,
                        TransactionRoutineDk.kredit,
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          _categoryController = value;
                        }
                      },
                      itemAsString: (category) => category.label,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
                  builder: (context, state) {
                    return FDropDownSearch<Material>(
                      labelText: 'Cost',
                      itemAsString: (material) => material.name,
                      items: state.maybeWhen(
                        orElse: () => [],
                        loaded: (materials) => materials.data,
                      ),
                      onChanged: (material) {
                        if (material != null) {
                          _material = material;
                        }
                      },
                      validator: requiredObjectValidator.call,
                    );
                  },
                ),
                FTextFormField(
                  labelText: 'Description',
                  controller: _descriptionController,
                  validator: requiredValidator.call,
                ),
              ],
            ),
          ],
        ),
        const Gap(24),
        BlocBuilder<TransactionRoutineBloc, TransactionRoutineState>(
          builder: (context, state) {
            state.maybeWhen(
              initial: (transactionRoutineHeader, transactionRoutineDetail) {
                _transactionRoutineDetail = transactionRoutineDetail;
              },
              orElse: () => const Center(child: CupertinoActivityIndicator()),
            );

            if (_transactionRoutineDetail == null) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return YuhuTable<TransactionRoutineDetail>(
              rowHeight: 80,
              columns: [
                TableColumn(
                  title: 'Chart of Account',
                  builder: (item, _) {
                    final chartOfAccount = item.chartOfAccountNo;
                    return Text(
                      chartOfAccount ?? '',
                    );
                  },
                ),
                TableColumn(
                  title: 'Unique',
                  builder: (item, _) {
                    final unique = item.unique;
                    return Text(
                      unique ?? '',
                    );
                  },
                ),
                TableColumn(
                  title: 'Value',
                  builder: (item, _) {
                    final value = item.value ?? 0;
                    return Text(
                      value.idr,
                    );
                  },
                ),
                TableColumn(
                  title: 'Category',
                  builder: (item, _) {
                    return ChipType(item.category!);
                  },
                ),
                TableColumn(
                  title: 'Cost',
                  builder: (item, _) {
                    return Text(
                      item.material ?? '',
                    );
                  },
                ),
                TableColumn(
                  title: 'Description',
                  builder: (item, _) {
                    return Text(
                      item.description ?? '',
                    );
                  },
                ),
                TableColumn(
                  title: 'Action',
                  builder: (item, _) {
                    return Row(
                      children: [
                        TransactionRoutineDetailFromLocalDeleteButton(
                          detail: item,
                          bloc: widget.bloc,
                        ),
                      ],
                    );
                  },
                ),
              ],
              data: _transactionRoutineDetail!,
            );
          },
        ),
      ],
    );
  }
}
