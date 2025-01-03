import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDeleteButton extends StatelessWidget {
  const CustomerDeleteButton._({
    required this.customer,
  });

  static Widget prepare({
    required Customer customer,
  }) {
    return BlocProvider(
      create: (context) => CustomerBloc(),
      child: CustomerDeleteButton._(
        customer: customer,
      ),
    );
  }

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.customerDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<CustomerBloc>();
        final queryBloc = context.read<CustomerQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const CustomerQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    CustomerBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<CustomerBloc, CustomerState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.customer);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<CustomerBloc, CustomerState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.customer,
                label: customer.name,
                onConfirm: () {
                  bloc.add(CustomerEvent.delete(customer));
                },
              );
            },
          ),
        );
      },
    );
  }
}
