import 'package:flexurio_chiron_production/src/app/bloc/production_machine/production_machine_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_machine_query/production_machine_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionMachineDeleteButton extends StatelessWidget {
  const ProductionMachineDeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required int id,
  }) {
    return BlocProvider(
      create: (context) => ProductionMachineBloc(),
      child: ProductionMachineDeleteButton._(id: id),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionMachineDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductionMachineBloc>();
        final queryBloc = context.read<ProductionMachineQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const ProductionMachineQueryEvent.get());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductionMachineBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductionMachineBloc, ProductionMachineState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () => Navigator.pop(context, true),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductionMachineBloc, ProductionMachineState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productionMachine,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(ProductionMachineEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
