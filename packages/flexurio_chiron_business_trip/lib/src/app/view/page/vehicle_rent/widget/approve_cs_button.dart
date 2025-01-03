import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleRentApproveCsButton extends StatelessWidget {
  const VehicleRentApproveCsButton._({
    required this.vehicleRent,
  });

  static Widget prepare({
    required VehicleRent vehicleRent,
  }) {
    return BlocProvider(
      create: (context) => VehicleRentBloc(),
      child: VehicleRentApproveCsButton._(
        vehicleRent: vehicleRent,
      ),
    );
  }

  final VehicleRent vehicleRent;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentApproveCs,
      action: DataAction.approveCs,
      onPressed: () async {
        final bloc = context.read<VehicleRentBloc>();
        final queryBloc = context.read<VehicleRentQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(VehicleRentQueryEvent.fetch(
              status: VehicleRentStatus.approveManager.label));
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
              return SimpleDialog(
                backgroundColor: Colors.transparent,
                children: [
                  ApproveCsFormPage.prepare(
                      vehicleRent: vehicleRent, VehicleRentBloc: bloc),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
