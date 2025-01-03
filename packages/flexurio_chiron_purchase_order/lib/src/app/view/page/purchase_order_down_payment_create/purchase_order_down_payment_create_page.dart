import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_down_payment/purchase_order_down_payment_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PurchaseOrderDownPaymentCreatePage extends StatefulWidget {
  const PurchaseOrderDownPaymentCreatePage._(this.purchaseOrderId);
  final String purchaseOrderId;

  static Route route({required String purchaseOrderId}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (_) => PurchaseOrderDownPaymentBloc(),
        child: PurchaseOrderDownPaymentCreatePage._(purchaseOrderId),
      ),
    );
  }

  @override
  State<PurchaseOrderDownPaymentCreatePage> createState() =>
      _PurchaseOrderDownPaymentCreatePageState();
}

class _PurchaseOrderDownPaymentCreatePageState
    extends State<PurchaseOrderDownPaymentCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  DateTime? _dueDate;

  @override
  void dispose() {
    _amountController.dispose();
    _dueDateController.dispose();
    _descriptionController.dispose();
    _accountNameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<PurchaseOrderDownPaymentBloc>().add(
            PurchaseOrderDownPaymentEvent.create(
              purchaseOrderId: widget.purchaseOrderId,
              amount: stringDecimalToDouble(_amountController.text),
              description: _descriptionController.text,
              dueDate: _dueDate!,
              accountName: _accountNameController.text,
              accountNumber: _accountNumberController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.add;
    return BlocListener<PurchaseOrderDownPaymentBloc,
        PurchaseOrderDownPaymentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, Entity.purchaseOrder);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: SingleFormPanel(
        actions: [_buildButtonCreate()],
        formKey: _formKey,
        action: action,
        entity: Entity.purchaseOrderDownPayment,
        children: [
          _buildFieldAmount(),
          const Gap(24),
          _buildFieldDeliveryDate(),
          const Gap(24),
          RowFields(
            children: [
              _buildFieldAccountNumber(),
              _buildFieldAccountName(),
            ],
          ),
          const Gap(24),
          _buildFieldDescription(),
        ],
      ),
    );
  }

  Widget _buildFieldAccountNumber() {
    return FTextFormField(
      labelText: 'account_number'.tr(),
      controller: _accountNumberController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget _buildFieldAccountName() {
    return FTextFormField(
      labelText: 'account_name'.tr(),
      controller: _accountNameController,
    );
  }

  Widget _buildFieldAmount() {
    return FTextFormField.decimal(
      labelText: 'amount'.tr(),
      controller: _amountController,
      validator: requiredValidator.call,
    );
  }

  Widget _buildFieldDeliveryDate() {
    return FieldDatePicker(
      labelText: 'due_date'.tr(),
      initialSelectedDate: _dueDate,
      controller: _dueDateController,
      validator: requiredObjectValidator.call,
      onChanged: (value) => _dueDate = value,
    );
  }

  Widget _buildFieldDescription() {
    return FTextFormField(
      controller: _descriptionController,
      validator: requiredValidator.call,
      labelText: 'description'.tr(),
    );
  }

  Widget _buildButtonCreate() {
    return BlocBuilder<PurchaseOrderDownPaymentBloc,
        PurchaseOrderDownPaymentState>(
      builder: (context, state) {
        return Button(
          permission: null,
          isInProgress: state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
          onPressed: _submit,
          action: DataAction.create,
        );
      },
    );
  }
}
