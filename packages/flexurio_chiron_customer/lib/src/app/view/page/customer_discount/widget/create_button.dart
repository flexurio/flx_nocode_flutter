import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDiscountCreateButton extends StatelessWidget {
  const CustomerDiscountCreateButton({required this.customer, super.key});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.customerDiscountCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<CustomerDiscountQueryBloc>();
        final success = await Navigator.push(
          context,
          CustomerDiscountCreatePage.route(customer: customer),
        );
        if (success ?? false) {
          queryBloc.add(CustomerDiscountQueryEvent.fetch(customer: customer));
        }
      },
    );
  }
}
