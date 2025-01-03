import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDiscountDeleteButton extends StatelessWidget {
  const CustomerDiscountDeleteButton._({
    required this.customerDiscount,
  });

  final CustomerDiscount customerDiscount;

  static Widget prepare({
    required CustomerDiscount customerDiscount,
  }) {
    return BlocProvider(
      create: (context) => CustomerDiscountBloc(),
      child: CustomerDiscountDeleteButton._(
        customerDiscount: customerDiscount,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.customerDiscountDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<CustomerDiscountBloc>();
        final queryBloc = context.read<CustomerDiscountQueryBloc>();
        final success = await _showDeleteDialog(
          bloc: bloc,
          context: context,
          customerDiscount: customerDiscount,
        );
        if (success ?? false) {
          queryBloc.add(
            CustomerDiscountQueryEvent.fetch(
              customer: customerDiscount.customer,
            ),
          );
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required CustomerDiscountBloc bloc,
    required CustomerDiscount customerDiscount,
  }) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final entity = Entity.customerDiscount;

        return BlocListener<CustomerDiscountBloc, CustomerDiscountState>(
          bloc: bloc,
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
          child: BlocBuilder<CustomerDiscountBloc, CustomerDiscountState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: customerDiscount.id.toString(),
                onConfirm: () {
                  bloc.add(
                    CustomerDiscountEvent.delete(
                      customerDiscount: customerDiscount,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
