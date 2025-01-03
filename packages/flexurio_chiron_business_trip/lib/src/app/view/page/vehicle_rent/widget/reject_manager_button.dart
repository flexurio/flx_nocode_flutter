import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentRejectManagerButton extends StatelessWidget {
  const VehicleRentRejectManagerButton._({
    required this.vehicleRent,
  });

  static Widget prepare({
    required VehicleRent vehicleRent,
  }) {
    return BlocProvider(
      create: (context) => VehicleRentBloc(),
      child: VehicleRentRejectManagerButton._(
        vehicleRent: vehicleRent,
      ),
    );
  }

  final VehicleRent vehicleRent;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentRejectManager,
      action: DataAction.rejectManager,
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
        const action = DataAction.rejectManager;
        return BlocListener<VehicleRentBloc, VehicleRentState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .success(Message.successUpdated(Entity.vehicleRent));
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
              return CardConfirmationWithExplanation(
                isProgress: isInProgress,
                action: action,
                data: Entity.vehicleRent,
                label: vehicleRent.id,
                onConfirm: (explanation) {
                  bloc.add(
                    VehicleRentEvent.rejectManager(
                      vehicleRent: vehicleRent,
                      reason: explanation,
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
