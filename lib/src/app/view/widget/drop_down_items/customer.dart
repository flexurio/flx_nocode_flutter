import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchCustomer extends StatelessWidget
    implements DropDownObject<Customer> {
  const FDropDownSearchCustomer({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.itemAsString,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Customer? initialValue;

  @override
  final void Function(Customer?) onChanged;

  final String Function(Customer?)? itemAsString;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(Customer?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
      builder: (context, state) {
        return FDropDownSearch<Customer>(
          enabled: enabled,
          labelText: label ?? Entity.customer.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (customer) => customer.data,
          ),
          itemAsString:
              itemAsString ?? (customer) => '${customer.id} - ${customer.name}',
        );
      },
    );
  }
}

class FDropDownSearchSmallCustomer extends StatelessWidget
    implements DropDownObject<Customer> {
  const FDropDownSearchSmallCustomer({
    required this.onChanged,
    required this.width,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final Customer? initialValue;

  @override
  final void Function(Customer?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
      builder: (context, state) {
        return FDropDownSearchSmall<Customer>(
          width: width,
          labelText: label ?? Entity.customer.title,
          onChanged: onChanged,
          iconField: Icons.business_rounded,
          initialValue: initialValue,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (customer) => customer.data,
          ),
          itemAsString: (customer) => '${customer.id} - ${customer.name}',
        );
      },
    );
  }
}
