import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerUpdateButton extends StatelessWidget {
  const CustomerUpdateButton({required this.customer, super.key});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.customerEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<CustomerQueryBloc>();
        final success = await Navigator.push(
          context,
          CustomerCreatePage.route(customer: customer),
        );
        if (success ?? false) {
          queryBloc.add(const CustomerQueryEvent.fetch());
        }
      },
    );
  }
}
