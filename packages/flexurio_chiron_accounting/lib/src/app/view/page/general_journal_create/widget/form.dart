import 'package:flexurio_chiron_accounting/src/app/bloc/general_journal/transaction_journal_accounting_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/budget_type_query/budget_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_query/chart_of_account_number_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/view/widget/drop_down_items/chart_of_account_number.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TransactionJournalAccountingForm extends StatefulWidget {
  const TransactionJournalAccountingForm._({
    required this.temporaryOnly,
  });

  final bool temporaryOnly;

  static Widget prepare({
    required bool temporaryOnly,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TransactionJournalAccountingBloc()),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(create: (context) => BudgetTypeQueryBloc()),
        BlocProvider(
          create: (context) => ChartOfAccountNumberQueryBloc()
            ..add(
              ChartOfAccountNumberQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: TransactionJournalAccountingForm._(temporaryOnly: temporaryOnly),
    );
  }

  @override
  State<TransactionJournalAccountingForm> createState() =>
      _TransactionJournalAccountingFormState();
}

class _TransactionJournalAccountingFormState
    extends State<TransactionJournalAccountingForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _debitController = TextEditingController(text: '0');
  final _creditController = TextEditingController(text: '0');
  final _referenceController = TextEditingController();

  ChartOfAccountNumber? _chartOfAccountNumber;
  late Department _department;
  late DateTime _transactionDate;
  BudgetType? _budgetType;

  @override
  void dispose() {
    _descriptionController.dispose();
    _debitController.dispose();
    _creditController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final transaction = TransactionJournalAccounting(
        id: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        department: _department,
        chartOfAccountId: _chartOfAccountNumber!.id,
        chartOfAccountName: _chartOfAccountNumber!.name,
        debit: stringDecimalToDouble(_debitController.text),
        credit: stringDecimalToDouble(_creditController.text),
        transactionNo: '',
        transactionDate: _transactionDate,
        reference: _referenceController.text,
        unique: '',
        value: '',
        username: '',
        description: _descriptionController.text,
        saveDate: DateTime(0),
        count: 0,
        journalName: '',
        trans: '',
        tb: false,
        budgetType: _budgetType?.id ?? 0,
        releaseDate: DateTime(0),
      );
      if (widget.temporaryOnly) {
        Navigator.pop(context, transaction);
      } else {
        context.read<TransactionJournalAccountingBloc>().add(
              TransactionJournalAccountingEvent.create(
                transactionJournalAccounting: [transaction],
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleFormPanel(
      actions: [
        BlocListener<TransactionJournalAccountingBloc,
            TransactionJournalAccountingState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                    DataAction.add, Entity.transactionJournalAccounting);
                Navigator.pop(context, TransactionJournalAccounting.empty());
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<TransactionJournalAccountingBloc,
              TransactionJournalAccountingState>(
            builder: (context, state) {
              return Button(
                isInProgress: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                action: DataAction.add,
                permission: null,
                onPressed: _submit,
              );
            },
          ),
        ),
      ],
      formKey: _formKey,
      action: DataAction.add,
      entity: Entity.transactionJournalAccounting,
      size: SingleFormPanelSize.large,
      children: [
        RowFields(
          children: [
            FieldDatePicker(
              labelText: 'date'.tr(),
              controller: TextEditingController(),
              onChanged: (value) => _transactionDate = value,
              validator: requiredObjectValidator.call,
            ),
            FDropDownSearch<String>(
              labelText: 'reference'.tr(),
              itemAsString: (value) => value,
              onChanged: (reference) {
                if (reference != null) {
                  _referenceController.text = reference;
                }
              },
              items: const [
                'ADJUSTMENT',
                'MEMORIAL',
                'UMUM',
              ],
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FDropDownSearchDepartment(
              onChanged: (department) {
                if (department != null) {
                  _department = department;
                }
              },
            ),
            FDropDownSearchChartOfAccountNumber(
              onChanged: (coaNumber) {
                if (coaNumber != null) {
                  _chartOfAccountNumber = coaNumber;
                  context.read<BudgetTypeQueryBloc>().add(
                        BudgetTypeQueryEvent.fetch(chartOfAccount: coaNumber),
                      );
                  setState(() {});
                }
              },
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FTextFormField.decimal(
              labelText: 'debt'.tr(),
              validator: requiredValidator.call,
              controller: _debitController,
            ),
            FTextFormField.decimal(
              labelText: 'credit'.tr(),
              validator: requiredValidator.call,
              controller: _creditController,
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FDropDownSearchBudgetType(
              key: ValueKey(_chartOfAccountNumber),
              isRequired: false,
              onChanged: (budgetType) {
                if (budgetType != null) {
                  _budgetType = budgetType;
                }
              },
            ),
            FTextFormField(
              labelText: 'description'.tr(),
              validator: requiredValidator.call,
              controller: _descriptionController,
              maxLines: 3,
            ),
          ],
        ),
      ],
    );
  }
}
