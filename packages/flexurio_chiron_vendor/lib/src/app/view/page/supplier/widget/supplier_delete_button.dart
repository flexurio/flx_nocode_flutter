import 'package:flexurio_chiron_vendor/src/app/bloc/supplier/supplier_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierDeleteButton extends StatelessWidget {
  const SupplierDeleteButton._({
    required this.supplier,
  });

  static Widget prepare({
    required Supplier supplier,
    required String id,
  }) {
    return BlocProvider(
      create: (context) => SupplierBloc(),
      child: SupplierDeleteButton._(
        supplier: supplier,
      ),
    );
  }

  final Supplier supplier;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.supplierDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<SupplierBloc>();
        final queryBloc = context.read<SupplierQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const SupplierQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    SupplierBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<SupplierBloc, SupplierState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).success(Message.successDeleted(Entity.supplier));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<SupplierBloc, SupplierState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.supplier,
                label: supplier.name,
                onConfirm: () {
                  bloc.add(SupplierEvent.delete(supplier.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
