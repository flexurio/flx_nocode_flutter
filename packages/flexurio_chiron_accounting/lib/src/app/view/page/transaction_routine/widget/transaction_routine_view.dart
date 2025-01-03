import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine/transaction_routine_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class TransactionRoutineViewPage extends StatefulWidget {
  const TransactionRoutineViewPage._({
    required this.transactionRoutine,
  });

  final TransactionRoutine? transactionRoutine;

  static Route<bool?> route({TransactionRoutine? transactionRoutine}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransactionRoutineBloc(),
          ),
        ],
        child: TransactionRoutineViewPage._(
          transactionRoutine: transactionRoutine,
        ),
      ),
    );
  }

  @override
  State<TransactionRoutineViewPage> createState() => _TaxInvoiceNumberState();
}

class _TaxInvoiceNumberState extends State<TransactionRoutineViewPage> {
  var _isAuto = false;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _chartOfAccountController = TextEditingController();
  final _valueController = TextEditingController();
  final _codeController = TextEditingController();
  final _uniqueController = TextEditingController();
  final _dateController = TextEditingController();
  final _monthController = TextEditingController();
  final _dayWeekController = TextEditingController();
  final _categoryController = TextEditingController();
  final _departmentController = TextEditingController();
  final _referenceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.transactionRoutine != null) {
      _titleController.text = widget.transactionRoutine!.title;
      _chartOfAccountController.text =
          widget.transactionRoutine!.chartOfAccountNo;
      _valueController.text = widget.transactionRoutine!.value.toString();
      _codeController.text = widget.transactionRoutine!.code;
      _uniqueController.text = widget.transactionRoutine!.unique;
      _dateController.text = widget.transactionRoutine!.dayMonth;
      _monthController.text = widget.transactionRoutine!.month;
      _dayWeekController.text = widget.transactionRoutine!.dayWeek;
      _categoryController.text = widget.transactionRoutine!.dk.label;
      _departmentController.text = widget.transactionRoutine!.department.name;
      _referenceController.text = widget.transactionRoutine!.reference;
      _isAuto = widget.transactionRoutine!.isAuto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.transactionRoutine;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        size: SingleFormPanelSize.large,
        formKey: _formKey,
        action: DataAction.view,
        entity: entity,
        actions: const [],
        children: [
          RowFields(
            children: [
              FTextFormField(
                readOnly: true,
                labelText: 'Title',
                controller: _titleController,
                validator: requiredValidator.call,
              ),
              FTextFormField(
                readOnly: true,
                labelText: 'Code',
                controller: _codeController,
                validator: requiredValidator.call,
              ),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              FTextFormField(
                readOnly: true,
                labelText: 'Chart of Account No',
                controller: _chartOfAccountController,
                inputFormatters: [
                  ThousandsFormatter(),
                ],
                validator: requiredValidator.call,
              ),
              FTextFormField(
                readOnly: true,
                labelText: 'Unique',
                controller: _uniqueController,
                validator: requiredValidator.call,
              ),
            ],
          ),
          const Gap(24),
          RowFields(
            children: [
              FTextFormField(
                readOnly: true,
                labelText: 'Value',
                controller: _valueController,
                inputFormatters: [
                  ThousandsFormatter(),
                ],
                validator: requiredValidator.call,
              ),
              FTextFormField(
                readOnly: true,
                labelText: 'Category',
                controller: _categoryController,
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
                  FTextFormField(
                    readOnly: true,
                    labelText: 'date'.tr(),
                    controller: _dateController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: requiredValidatorDayMonth.call,
                  ),
                ],
              ),
              Column(
                children: [
                  FTextFormField(
                    readOnly: true,
                    labelText: 'Week',
                    controller: _dayWeekController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: requiredValidatorDayWeek.call,
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
                  FTextFormField(
                    readOnly: true,
                    labelText: 'Month',
                    controller: _monthController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: requiredValidatorMonth.call,
                  ),
                ],
              ),
              const Column(),
            ],
          ),
        ],
      ),
    );
  }
}
