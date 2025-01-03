import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerCreateButton extends StatelessWidget {
  const CustomerCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.customerCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<CustomerQueryBloc>();
        final success = await Navigator.push(
          context,
          CustomerCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const CustomerQueryEvent.fetch());
        }
      },
    );
  }
}
