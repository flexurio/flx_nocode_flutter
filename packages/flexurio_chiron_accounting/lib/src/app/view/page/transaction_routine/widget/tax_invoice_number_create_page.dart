import 'package:flexurio_chiron_tax/src/app/bloc/tax_invoice_number/tax_invoice_number_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class TaxInvoiceNumberCreatePage extends StatefulWidget {
  const TaxInvoiceNumberCreatePage({super.key});

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: BlocProvider(
        create: (context) => TaxInvoiceNumberBloc(),
        child: const TaxInvoiceNumberCreatePage(),
      ),
    );
  }

  @override
  State<TaxInvoiceNumberCreatePage> createState() => _TaxInvoiceNumberState();
}

class _TaxInvoiceNumberState extends State<TaxInvoiceNumberCreatePage> {
  var _isActive = false;
  final _formKey = GlobalKey<FormState>();
  final _yearController = TextEditingController();
  final _prefixController = TextEditingController();
  final _minValueController = TextEditingController();
  final _maxValueController = TextEditingController();
  final _digitsOnly = [FilteringTextInputFormatter.digitsOnly];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<TaxInvoiceNumberBloc>().add(
            TaxInvoiceNumberEvent.create(
              year: _yearController.text,
              isActive: _isActive,
              prefix: _prefixController.text,
              minValue: int.parse(_minValueController.text),
              maxValue: int.parse(_maxValueController.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.taxInvoiceNumber;
    return BlocListener<TaxInvoiceNumberBloc, TaxInvoiceNumberState>(
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
            BlocBuilder<TaxInvoiceNumberBloc, TaxInvoiceNumberState>(
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
            FTextFormField(
              labelText: 'Year',
              controller: _yearController,
              inputFormatters: _digitsOnly,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Prefix',
              controller: _prefixController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Min Value',
              controller: _minValueController,
              inputFormatters: _digitsOnly,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Max Value',
              controller: _maxValueController,
              inputFormatters: _digitsOnly,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            CheckboxWithText(
              initialValue: _isActive,
              text: 'Active',
              onChanged: (value) {
                _isActive = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
