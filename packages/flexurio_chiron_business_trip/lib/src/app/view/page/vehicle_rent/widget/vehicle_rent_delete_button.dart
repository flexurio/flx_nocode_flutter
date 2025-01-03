import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentDeleteButton extends StatelessWidget {
  const VehicleRentDeleteButton._({
    required this.vehicleRent,
  });

  static Widget prepare({
    required VehicleRent vehicleRent,
  }) {
    return BlocProvider(
      create: (context) => VehicleRentBloc(),
      child: VehicleRentDeleteButton._(
        vehicleRent: vehicleRent,
      ),
    );
  }

  final VehicleRent vehicleRent;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<VehicleRentBloc>();
        final queryBloc = context.read<VehicleRentQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(VehicleRentQueryEvent.fetch(
              status: VehicleRentStatus.input.label));
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    VehicleRentBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<VehicleRentBloc, VehicleRentState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .success(Message.successDeleted(Entity.vehicleRent));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<VehicleRentBloc, VehicleRentState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.vehicleRent,
                label: vehicleRent.id,
                onConfirm: () {
                  bloc.add(VehicleRentEvent.delete(vehicleRent));
                },
              );
            },
          ),
        );
      },
    );
  }
}
