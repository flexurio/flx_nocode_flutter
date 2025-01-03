import 'package:flexurio_chiron_business_trip/src/app/bloc/fuel_query/fuel_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/view/page/fuel_create/fuel_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FuelCreateButton extends StatelessWidget {
  const FuelCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.fuelCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<FuelQueryBloc>();
        final success = await Navigator.push(
          context,
          FuelCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const FuelQueryEvent.fetchCurrentPeriod());
        }
      },
    );
  }
}
