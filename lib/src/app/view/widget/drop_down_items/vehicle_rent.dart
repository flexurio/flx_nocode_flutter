import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchVehicleRent extends StatelessWidget
    implements DropDownObject<VehicleRent> {
  const FDropDownSearchVehicleRent({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });

  @override
  final VehicleRent? initialValue;

  @override
  final void Function(VehicleRent?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  @override
  Widget build(BuildContext context) {
    String? Function(VehicleRent?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<VehicleRentQueryBloc, VehicleRentQueryState>(
      builder: (context, state) {
        return FDropDownSearch<VehicleRent>(
          enabled: enabled,
          labelText: label ?? Entity.vehicleRent.title,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (_, vehicleRent) => vehicleRent.data,
          ),
          itemAsString: (vehicleRent) => vehicleRent.id,
        );
      },
    );
  }
}
