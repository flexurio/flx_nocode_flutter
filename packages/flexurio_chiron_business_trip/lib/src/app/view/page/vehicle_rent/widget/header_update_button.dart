import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class VehicleRentHeaderUpdateButton extends StatelessWidget {
  const VehicleRentHeaderUpdateButton({
    required this.header,
    required this.bloc,
    required this.onSuccess,
    super.key,
  });

  final VehicleRentFormHeader header;
  final VehicleRentBloc bloc;
  final void Function() onSuccess;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.vehicleRentEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = bloc;
        final success = await Navigator.push(
          context,
          VehicleRentHeaderUpdateFormPage.route(header: header),
        );
        if (success ?? false) {
          onSuccess();
        }
      },
    );
  }
}
