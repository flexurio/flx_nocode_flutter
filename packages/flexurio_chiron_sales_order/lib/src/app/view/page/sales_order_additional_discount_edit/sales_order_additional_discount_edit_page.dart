import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_sales_order/flexurio_chiron_sales_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';

class SalesOrderAdditionDiscountEditPage extends StatefulWidget {
  const SalesOrderAdditionDiscountEditPage({
    required this.salesOrderId,
    super.key,
  });

  final String salesOrderId;

  static Route<bool?> route({
    required String salesOrderId,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SalesOrderBloc(),
          ),
        ],
        child: SalesOrderAdditionDiscountEditPage(
          salesOrderId: salesOrderId,
        ),
      ),
    );
  }

  @override
  State<SalesOrderAdditionDiscountEditPage> createState() =>
      _SalesOrderAdditionDiscountEditPageState();
}

class _SalesOrderAdditionDiscountEditPageState
    extends State<SalesOrderAdditionDiscountEditPage> {
  final _typeController = TextEditingController();
  final _termOfPaymentController = TextEditingController(text: '7');
  final _discountPercentController = TextEditingController(text: '3');
  var _isAdditionalDiscount = false;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<SalesOrderBloc>().add(
            SalesOrderEvent.editAdditionalDiscount(
              salesOrderId: widget.salesOrderId,
              type: _typeController.text,
              termOfPayment: int.parse(_termOfPaymentController.text),
              discountPercent: _isAdditionalDiscount
                  ? stringDecimalToDouble(_discountPercentController.text)
                  : null,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.salesOrder;
    final action = DataAction.edit;

    return BlocListener<SalesOrderBloc, SalesOrderState>(
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
          suffixText: 'Additional Discount',
          actions: [
            BlocBuilder<SalesOrderBloc, SalesOrderState>(
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
            _buildFieldType(),
            Gap(24),
            _buildFieldTermOfPayment(),
            Gap(24),
            _buildFieldDiscountPercent(),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldType() {
    return SelectChipField<String>(
      validator: requiredValidator.call,
      label: 'type'.tr(),
      controller: _typeController,
      getLabel: (type) => type,
      options: const [
        'ADDITIONAL DISCOUNT',
        'TERM OF PAYMENT',
      ],
      onChanged: (value) {
        _typeController.text = value;
        _isAdditionalDiscount = value == 'ADDITIONAL DISCOUNT';
        setState(() {});
      },
    );
  }

  Widget _buildFieldTermOfPayment() {
    return FTextFormField(
      labelText: 'term_of_payment'.tr(),
      controller: _termOfPaymentController,
      validator: requiredValidator.call,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }

  Widget _buildFieldDiscountPercent() {
    if (_isAdditionalDiscount) {
      return FTextFormField.decimal(
        labelText: 'discount_percent'.tr(),
        validator: requiredValidator.call,
        controller: _discountPercentController,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
