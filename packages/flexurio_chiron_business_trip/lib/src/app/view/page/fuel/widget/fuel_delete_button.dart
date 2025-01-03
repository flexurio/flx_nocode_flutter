import 'package:flexurio_chiron_business_trip/src/app/bloc/fuel/fuel_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/bloc/fuel_query/fuel_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/fuel.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FuelDeleteButton extends StatelessWidget {
  const FuelDeleteButton._({
    required this.fuel,
  });

  static Widget prepare({
    required Fuel fuel,
  }) {
    return BlocProvider(
      create: (context) => FuelBloc(),
      child: FuelDeleteButton._(
        fuel: fuel,
      ),
    );
  }

  final Fuel fuel;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.fuelDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<FuelBloc>();
        final queryBloc = context.read<FuelQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const FuelQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    FuelBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<FuelBloc, FuelState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).success(Message.successDeleted(Entity.fuel));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<FuelBloc, FuelState>(
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
                label: fuel.name,
                onConfirm: () {
                  bloc.add(FuelEvent.delete(fuel));
                },
              );
            },
          ),
        );
      },
    );
  }
}
