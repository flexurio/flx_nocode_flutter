import 'package:flexurio_chiron_accounting/src/app/view/widget/drop_down_items/chart_of_account_number.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/department.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment_other_cost_query/payment_other_cost_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/payment/payment_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment_other_cost.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_payment.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction.dart';
import 'package:flexurio_chiron_accounting/src/app/model/type_cost.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class PaymentCreatePaymentForm extends StatefulWidget {
  const PaymentCreatePaymentForm._({
    required this.onNext,
    required this.onPrevious,
    required this.transactionType,
    required this.payment,
    required this.paymentType,
  });

  final void Function() onNext;
  final void Function()? onPrevious;
  final TransactionJournalType transactionType;
  final TransactionPayment payment;
  final PaymentType? paymentType;

  static Widget prepare({
    required void Function() onNext,
    required void Function()? onPrevious,
    required TransactionJournalType transactionType,
    required TransactionPayment payment,
    required PaymentType? paymentType,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseRequestQueryBloc()
            ..add(
              const PurchaseRequestQueryEvent.fetch(
                status: PurchaseRequestStatus.inProgress,
                isOrder: false,
              ),
            ),
        ),
        BlocProvider(
          create: (context) => PettyCashQueryBloc()
            ..add(
              PettyCashQueryEvent.fetch(
                realizationNo: payment.transactionNo,
                type: PettyCashType.generalExpense.id,
              ),
            ),
        ),
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
        ),
      ],
      child: PaymentCreatePaymentForm._(
        onNext: onNext,
        transactionType: transactionType,
        payment: payment,
        paymentType: paymentType,
        onPrevious: onPrevious,
      ),
    );
  }

  @override
  State<PaymentCreatePaymentForm> createState() =>
      _PaymentCreatePaymentFormState();
}

class _PaymentCreatePaymentFormState extends State<PaymentCreatePaymentForm> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _rateController = TextEditingController();
  final _kuCostController = TextEditingController();
  final _paymentRemainingController = TextEditingController();
  final _stampCostController = TextEditingController();
  final _roundingCostController = TextEditingController();
  final _artCostController = TextEditingController();
  final _otherCostController = TextEditingController();
  final _rateGapController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _downPaymentController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  late Department _department;
  DateTime? _date;
  ChartOfAccountNumber? _chartOfAccountNumber;

  @override
  void initState() {
    super.initState();
    _paymentRemainingController.text = widget.payment.paymentRemaining.format();
    _rateController.text = '1.00';
    _kuCostController.text = '0.00';
    _stampCostController.text = '0.00';
    _roundingCostController.text = '0.00';
    _artCostController.text = '0.00';
    _otherCostController.text = '0.00';
    _rateGapController.text = '0.00';
    _downPaymentController.text = '0.00';

    if (widget.transactionType.isPayable) {
      _descriptionController.text = 'Pelunasan Atas ${widget.payment.transactionNo}';
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _rateController.dispose();
    _kuCostController.dispose();
    _paymentRemainingController.dispose();
    _stampCostController.dispose();
    _roundingCostController.dispose();
    _artCostController.dispose();
    _otherCostController.dispose();
    _rateGapController.dispose();
    _descriptionController.dispose();
    _downPaymentController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormAction(
      formKey: _formKey,
      actions: [
        if (widget.onPrevious != null) _buildButtonPrevious(),
        const Gap(12),
        _buildButtonSubmit(),
      ],
      children: [
        _buildFormTransactionDetails(),
        Divider(height: 48),
        _buildFormFinancialInformation(),
        Divider(height: 48),
        _buildFormAccount(),
        Divider(height: 48),
        _buildFormCostBreakdown(),
      ],
    );
  }

  Widget _buildButtonPrevious() {
    return Button(
      permission: null,
      isSecondary: true,
      action: DataAction.back,
      onPressed: () => widget.onPrevious!.call(),
    );
  }

  Widget _buildFormTransactionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'transaction_details'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(24),
        if (widget.transactionType.isPayable)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: RowFields(
              children: [
                FTextFormField(
                  enabled: false,
                  labelText: 'transaction_no'.tr(),
                  controller: TextEditingController(
                    text: widget.payment.transactionNo,
                  ),
                ),
                _buildFieldOrderId(),
              ],
            ),
          ),
        RowFields(
          children: [
            _buildFieldPaymentRemaining(),
            _buildFieldDepartment(),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FDropDownSearchChartOfAccountNumber(
              onChanged: (chartOfAccountNumber) {
                _chartOfAccountNumber = chartOfAccountNumber;
              },
              label: 'Chart Of Account Bank',
            ),
            FieldDatePicker(
              labelText: 'payment_date'.tr(),
              initialSelectedDate: _date,
              controller: _dateController,
              validator: requiredObjectValidator.call,
              onChanged: (value) => _date = value,
              maxDate: DateTime.now(),
            ),
          ],
        ),
        Gap(24),
        RowFields(
          children: [
            FTextFormField(
              labelText: 'description'.tr(),
              controller: _descriptionController,
              validator: requiredValidator.call,
              maxLines: 3,
            ),
            Container(),
          ],
        ),
      ],
    );
  }

  Widget _buildFieldDepartment() {
    return BuilderPettyCash(builder: (pettyCash) {
      final department = pettyCash?.purchaseOrder.department;
      if (department != null) {
        _department = department;
      }
      return FDropDownSearchDepartment(
        label: 'department'.tr(),
        initialValue: department,
        onChanged: (department) {
          if (department != null) {
            _department = department;
          }
        },
      );
    });
  }

  Widget _buildFieldOrderId() {
    return BuilderPettyCash(
      builder: (pettyCash) {
        return FTextFormField(
          enabled: false,
          labelText: 'order_id'.tr(),
          controller: TextEditingController(
            text: pettyCash?.purchaseOrder.id ?? widget.payment.orderId,
          ),
        );
      },
    );
  }

  Widget _buildFieldPaymentRemaining() {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        state.maybeWhen(
          initial: (transactions, _, __, ___) {
            _paymentRemainingController.text = transactions!
                .fold<double>(
                  0.0,
                  (previousValue, element) => previousValue + element.total,
                )
                .format();
          },
          orElse: () {},
        );
      },
      child: FTextFormField(
        labelText: 'payment_remaining'.tr(),
        controller: _paymentRemainingController,
        validator: requiredValidator.call,
        inputFormatters: [ThousandsFormatter()],
      ),
    );
  }

  Widget _buildFormFinancialInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'financial_information'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(24),
        RowFields(
          children: [
            FTextFormField(
              labelText: 'rate'.tr(),
              controller: _rateController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
            FTextFormField(
              labelText: 'rate_gap'.tr(),
              controller: _rateGapController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'account'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(24),
        RowFields(
          children: [
            FTextFormField(
              labelText: 'account_number'.tr(),
              controller: _accountNumberController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            FTextFormField(
              labelText: 'account_name'.tr(),
              controller: _accountNameController,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormCostBreakdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'cost_breakdown'.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Gap(24),
        RowFields(
          children: [
            FTextFormField(
              labelText: 'stamp_cost'.tr(),
              controller: _stampCostController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
            FTextFormField(
              labelText: 'rounding_cost'.tr(),
              controller: _roundingCostController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FTextFormField(
              labelText: 'art_cost'.tr(),
              controller: _artCostController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
            FTextFormField(
              labelText: 'other_costs'.tr(),
              controller: _otherCostController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
          ],
        ),
        const Gap(24),
        RowFields(
          children: [
            FTextFormField(
              labelText: 'ku_cost'.tr(),
              controller: _kuCostController,
              validator: requiredValidator.call,
              inputFormatters: [currencyFormatter],
            ),
            Container(),
          ],
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final payment = _getPayment();
      final otherCosts = _getOtherCosts(payment);

      if (widget.transactionType.isPayable) {
        context.read<PaymentBloc>().add(
              PaymentEvent.createFormTransaction(
                [
                  Transaction.empty().copyWith(
                    id: widget.payment.transactionNo,
                    total:
                        stringDecimalToDouble(_paymentRemainingController.text),
                  )
                ],
                widget.payment.supplierId,
              ),
            );
      }

      context.read<PaymentOtherCostQueryBloc>().add(
            PaymentOtherCostQueryEvent.setData(otherCosts: otherCosts),
          );

      context.read<PaymentBloc>().add(
            PaymentEvent.createFormPayment(
              payment: payment,
              chartOfAccountNumber: _chartOfAccountNumber!,
              department: _department,
            ),
          );

      widget.onNext();
    }
  }

  Payment _getPayment() {
    return Payment.empty().copyWith(
      remark: _descriptionController.text,
      downPayment: stringDecimalToDouble(_downPaymentController.text),
      date: _date!,
      type: _getPaymentType(),
      rate: stringDecimalToDouble(_rateController.text),
      kuCost: stringDecimalToDouble(_kuCostController.text),
      stampCost: stringDecimalToDouble(_stampCostController.text),
      artCost: stringDecimalToDouble(_artCostController.text),
      rounding: stringDecimalToDouble(_roundingCostController.text),
      otherCost: stringDecimalToDouble(_otherCostController.text),
      rateGap: stringDecimalToDouble(_rateGapController.text),
      accountName: _accountNameController.text,
      accountNumber: _accountNumberController.text,
    );
  }

  Widget _buildButtonSubmit() {
    return Button(
      permission: null,
      action: DataAction.next,
      onPressed: _submit,
    );
  }

  PaymentType _getPaymentType() {
    if (widget.paymentType != null) {
      return widget.paymentType!;
    } else {
      if (widget.payment.isPayable) {
        return PaymentType.transfer;
      } else if (widget.payment.isReceivable) {
        return PaymentType.sales;
      } else {
        return PaymentType.empty;
      }
    }
  }

  List<PaymentOtherCost> _getOtherCosts(Payment payment) {
    final otherCosts = <String, double>{
      'ku_cost': payment.kuCost,
      'stamp_cost': payment.stampCost,
      'art_cost': payment.artCost,
      'rounding_cost': payment.rounding,
      'rate_gap': payment.rateGap,
      'other_costs': payment.otherCost,
    };

    return otherCosts.entries.map((entry) {
      return PaymentOtherCost.empty().copyWith(
        typeCost: TypeCost.empty().copyWith(name: entry.key.tr()),
        amount: entry.value,
      );
    }).toList();
  }
}
