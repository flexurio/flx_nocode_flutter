import 'package:flexurio_chiron_finance/src/app/bloc/bank_query/bank_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow/cash_flow_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/cash_flow_code_query/cash_flow_code_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/bank.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';

class CashFlowEditPage extends StatefulWidget {
  const CashFlowEditPage._(this.cashFlow);

  final CashFlow? cashFlow;

  static Route<bool?> route({CashFlow? cashFlow}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CashFlowBloc(),
          ),
          BlocProvider(
            create: (context) => CashFlowCodeQueryBloc()
              ..add(const CashFlowCodeQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) =>
                BankQueryBloc()..add(const BankQueryEvent.fetch()),
          ),
        ],
        child: CashFlowEditPage._(cashFlow),
      ),
    );
  }

  @override
  State<CashFlowEditPage> createState() => _CashFlowEditPageState();
}

class _CashFlowEditPageState extends State<CashFlowEditPage> {
  late DataAction action;
  String? _code;
  late DateTime _mutationDate;

  final _formKey = GlobalKey<FormState>();
  final _transactionNoController = TextEditingController();
  final _transferFee = TextEditingController();
  final _transferTotal = TextEditingController();
  String? _subCode;
  Bank? _bank;

  @override
  void initState() {
    super.initState();

    action = createOrEdit(widget.cashFlow);

    if (action.isEdit) {
      final cashFlow = widget.cashFlow!;
      _transactionNoController.text = cashFlow.noTransaction;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late final transferFee = int.parse(_transferFee.text);
      late final transferTotal = int.parse(_transferTotal.text);
      late final parseMutationDate =
          DateFormat('yyyy-MM-dd').format(_mutationDate);

      final event = CashFlowEvent.edit(
        transactionNo: _transactionNoController.text,
        code: _code!,
        subCode: _subCode!,
        mutationDate: parseMutationDate,
        transferFee: transferFee,
        totalTransferFee: transferTotal,
        bank: _bank!,
      );
      context.read<CashFlowBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.cashFlow;
    return BlocListener<CashFlowBloc, CashFlowState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          formKey: _formKey,
          action: action,
          entity: Entity.cashFlow,
          actions: [
            BlocBuilder<CashFlowBloc, CashFlowState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: action,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'No Transaction',
              controller: _transactionNoController,
              validator: requiredValidator.call,
              maxLength: 30,
            ),
            const Gap(12),
            FTextFormField(
              labelText: 'Transfer Fee',
              controller: _transferFee,
              validator: requiredValidator.call,
              maxLength: 30,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const Gap(12),
            FTextFormField(
              labelText: 'Transfer Total',
              controller: _transferTotal,
              validator: requiredValidator.call,
              maxLength: 30,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const Gap(12),
            FieldDatePicker(
              labelText: 'Mutation Date',
              controller: TextEditingController(),
              minDate: DateTime.now(),
              validator: requiredObjectValidator.call,
              onChanged: (value) => _mutationDate = value,
            ),
            const Gap(12),
            BlocBuilder<CashFlowCodeQueryBloc, CashFlowCodeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<String>(
                  validator: requiredObjectValidator.call,
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  labelText: 'Code',
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (codes) => codes.keys.toList(),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _code = value;
                      });
                    }
                  },
                  itemAsString: (code) => code,
                );
              },
            ),
            const Gap(12),
            BlocBuilder<CashFlowCodeQueryBloc, CashFlowCodeQueryState>(
              builder: (context, state) {
                return FDropDownSearch<String>(
                  validator: requiredObjectValidator.call,
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  labelText: 'Sub Code',
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (codes) => codes[_code] ?? [],
                  ),
                  onChanged: (value) {
                    _subCode = value;
                  },
                  itemAsString: (subCode) => subCode,
                );
              },
            ),
            const Gap(12),
            BlocBuilder<BankQueryBloc, BankQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Bank>(
                  validator: requiredObjectValidator.call,
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: () => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  labelText: 'Bank',
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (subCodes) => subCodes,
                  ),
                  onChanged: (value) {
                    _bank = value;
                  },
                  itemAsString: (bank) => bank.bank,
                );
              },
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
