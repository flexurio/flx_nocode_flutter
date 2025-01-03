import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class CustomerDiscountCreatePage extends StatefulWidget {
  const CustomerDiscountCreatePage._({required this.customer});

  final Customer customer;

  static Route<bool?> route({required Customer customer}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CustomerDiscountBloc()),
        ],
        child: CustomerDiscountCreatePage._(customer: customer),
      ),
    );
  }

  @override
  State<CustomerDiscountCreatePage> createState() =>
      _CustomerNieCreatePageState();
}

class _CustomerNieCreatePageState extends State<CustomerDiscountCreatePage> {
  late DateTime _startDate;

  final _formKey = GlobalKey<FormState>();
  final _customerDiscountController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = CustomerDiscountEvent.create(
        discount: stringDecimalToDouble(_customerDiscountController.text),
        customer: widget.customer,
        startDate: _startDate,
      );
      context.read<CustomerDiscountBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.customerDiscount;
    return BlocListener<CustomerDiscountBloc, CustomerDiscountState>(
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
          actions: [
            BlocBuilder<CustomerDiscountBloc, CustomerDiscountState>(
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
          formKey: _formKey,
          action: action,
          entity: entity,
          children: [
            Column(
              children: [
                FieldDatePicker(
                  labelText: 'Start Date',
                  controller: TextEditingController(),
                  onChanged: (value) => _startDate = value,
                  validator: requiredObjectValidator.call,
                ),
                const Gap(24),
                FTextFormField(
                  labelText: 'Discount',
                  controller: _customerDiscountController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsFormatter(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
