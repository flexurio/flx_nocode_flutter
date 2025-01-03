import 'package:flexurio_chiron_business_trip/src/app/bloc/vehicle/vehicle_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehicleActiveDeActiveButton extends StatefulWidget {
  const VehicleActiveDeActiveButton._({
    required this.vehicle,
  });

  final Vehicle vehicle;

  static Widget prepare({
    required Vehicle vehicle,
  }) {
    return BlocProvider(
      create: (context) => VehicleBloc(),
      child: VehicleActiveDeActiveButton._(
        vehicle: vehicle,
      ),
    );
  }

  @override
  State<VehicleActiveDeActiveButton> createState() =>
      _VehicleActiveDeActiveButtonState();
}

class _VehicleActiveDeActiveButtonState
    extends State<VehicleActiveDeActiveButton> {
  late bool _isActive;

  @override
  void initState() {
    _isActive = widget.vehicle.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget isActive;
    if (UserRepositoryApp.instance.permissions
        .contains(Permission.vehicleActive)) {
      isActive = CupertinoSwitch(
        value: _isActive,
        onChanged: (_) async {
          final vehicleBloc = context.read<VehicleBloc>();
          final action =
              _isActive ? DataAction.deactivate : DataAction.activate;
          await _showConfirmationDialog(context, vehicleBloc, action);
        },
      );
    } else {
      isActive = BoolIcon(widget.vehicle.isActive);
    }
    return isActive;
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    VehicleBloc vehicleBloc,
    DataAction action,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<VehicleBloc, VehicleState>(
          bloc: vehicleBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.vehicle);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<VehicleBloc, VehicleState>(
            bloc: vehicleBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.material,
                label: widget.vehicle.vehicleRegistrationNumber,
                onConfirm: () {
                  if (action == DataAction.activate) {
                    setState(() {
                      _isActive = true;
                    });
                    vehicleBloc.add(
                      VehicleEvent.active(
                        widget.vehicle,
                      ),
                    );
                  } else if (action == DataAction.deactivate) {
                    setState(() {
                      _isActive = false;
                    });
                    vehicleBloc.add(
                      VehicleEvent.deActive(
                        widget.vehicle,
                      ),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
