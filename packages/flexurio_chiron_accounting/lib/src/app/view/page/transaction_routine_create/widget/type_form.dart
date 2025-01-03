import 'package:appointment/constant/example_transaction_code.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TransactionRoutineTypeForm extends StatefulWidget {
  const TransactionRoutineTypeForm._({
    required this.onNext,
    required this.bloc,
  });

  final void Function() onNext;
  final TransactionRoutineBloc bloc;

  static Widget prepare({
    required void Function() onNext,
    required TransactionRoutineBloc bloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bloc,
        ),
        BlocProvider(
          create: (context) => DepartmentQueryBloc()
            ..add(
              DepartmentQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: TransactionRoutineTypeForm._(
        bloc: bloc,
        onNext: onNext,
      ),
    );
  }

  @override
  State<TransactionRoutineTypeForm> createState() =>
      _TransactionRoutineTypeFormState();
}

class _TransactionRoutineTypeFormState
    extends State<TransactionRoutineTypeForm> {
  final _formKey = GlobalKey<FormState>();
  var _isAuto = false;
  final _titleController = TextEditingController();
  final _codeController = TextEditingController();
  final _monthController = TextEditingController();
  final _dayMonthController = TextEditingController();
  final _dayWeekController = TextEditingController();
  final _referenceController = TextEditingController();
  late Department _department;

  @override
  Widget build(BuildContext context) {
    late Widget submitButton;
    submitButton = Button(
      permission: null,
      action: DataAction.next,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          widget.bloc.add(
            TransactionRoutineEvent.createHeader(
              transactionRoutineHeader: TransactionRoutineHeader(
                title: _titleController.text,
                code: _codeController.text,
                isActive: _isAuto,
                date: _dayMonthController.text,
                month: _monthController.text,
                week: _dayWeekController.text,
                department: _department,
                reference: _referenceController.text,
              ),
            ),
          );
          widget.onNext();
        }
      },
    );

    return FormAction(
      formKey: _formKey,
      actions: [submitButton],
      children: [
        RowFields(
          children: [
            FTextFormField(
              labelText: 'Name',
              controller: _titleController,
              validator: requiredValidator.call,
            ),
            FDropDownSearch<String>(
              labelText: 'Code',
              items: transactionCode,
              onChanged: (value) {
                if (value != null) {
                  _codeController.text = value;
                }
              },
              itemAsString: (item) => item,
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            BlocBuilder<DepartmentQueryBloc, DepartmentQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Department>(
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: (_) => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  validator: requiredObjectValidator.call,
                  labelText: 'Department',
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (departments) => departments.data,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _department = value;
                    }
                  },
                  itemAsString: (department) => department.name,
                );
              },
            ),
            FTextFormField(
              labelText: 'Reference',
              maxLength: 100,
              controller: _referenceController,
              validator: requiredValidator.call,
            ),
          ],
        ),
        const Gap(24),
        CheckboxWithText(
          initialValue: _isAuto,
          text: 'Auto',
          onChanged: (value) {
            _isAuto = value;
          },
        ),
        const Gap(24),
        RowFields(
          children: [
            Column(
              children: [
                FDropDownSearch<String>(
                  labelText: 'date'.tr(),
                  items: const [
                    '*',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12',
                    '13',
                    '14',
                    '15',
                    '16',
                    '17',
                    '18',
                    '19',
                    '20',
                    '21',
                    '22',
                    '23',
                    '24',
                    '25',
                    '26',
                    '27',
                    '28',
                    '29',
                    '30',
                    '31',
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _dayMonthController.text = value;
                    }
                  },
                  itemAsString: (item) => item,
                ),
              ],
            ),
            Column(
              children: [
                FDropDownSearch<String>(
                  labelText: 'Week',
                  items: const [
                    '*',
                    '0',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _dayWeekController.text = value;
                    }
                  },
                  itemAsString: (item) => item,
                ),
              ],
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            Column(
              children: [
                FDropDownSearch<String>(
                  labelText: 'Month',
                  items: const [
                    '*',
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '10',
                    '11',
                    '12',
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      _monthController.text = value;
                    }
                  },
                  itemAsString: (item) => item,
                ),
              ],
            ),
            const Column(),
          ],
        ),
      ],
    );
  }
}
