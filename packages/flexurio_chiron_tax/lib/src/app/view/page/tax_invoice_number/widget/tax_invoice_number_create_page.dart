import 'package:flexurio_chiron_tax/src/app/bloc/tax_invoice_number/tax_invoice_number_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

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

  String? _validateMaxValue(String? value) {
    final minValue = int.tryParse(_minValueController.text) ?? 0;
    final maxValue = int.tryParse(value!) ?? 0;

    if (value.isEmpty) {
      return 'Please fill in the maximum value';
    }

    if (maxValue <= minValue) {
      return 'The maximum value must be greater than the minimum value';
    }

    return null;
  }

  String? _validateMinValue(String? value) {
    if (value!.isEmpty) {
      return 'Please fill in the minimum value';
    }
    return null;
  }

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
              labelText: 'year'.tr(),
              controller: _yearController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: validateYear,
              maxLength: 4,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'prefix'.tr(),
              controller: _prefixController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'minimum_value'.tr(),
                  controller: _minValueController,
                  inputFormatters: [
                    ThousandsFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: _validateMinValue,
                ),
                FTextFormField(
                  labelText: 'maximum_value'.tr(),
                  controller: _maxValueController,
                  inputFormatters: [
                    ThousandsFormatter(),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: _validateMaxValue,
                ),
              ],
            ),
            const Gap(24),
            CheckboxWithText(
              initialValue: _isActive,
              text: 'active'.tr(),
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
