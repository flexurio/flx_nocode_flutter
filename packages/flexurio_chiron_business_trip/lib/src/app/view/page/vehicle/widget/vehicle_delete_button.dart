import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle/vehicle_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle_query/vehicle_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleDeleteButton extends StatelessWidget {
  const VehicleDeleteButton._({
    required this.vehicle,
  });

  static Widget prepare({
    required Vehicle vehicle,
  }) {
    return BlocProvider(
      create: (context) => VehicleBloc(),
      child: VehicleDeleteButton._(
        vehicle: vehicle,
      ),
    );
  }

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<VehicleBloc>();
        final queryBloc = context.read<VehicleQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const VehicleQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    VehicleBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<VehicleBloc, VehicleState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).success(Message.successDeleted(Entity.vehicle));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<VehicleBloc, VehicleState>(
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
                label: vehicle.vehicleRegistrationNumber,
                onConfirm: () {
                  bloc.add(VehicleEvent.delete(vehicle));
                },
              );
            },
          ),
        );
      },
    );
  }
}
