import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.workHourShiftCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<WorkHourShiftQueryBloc>();
        final success = await Navigator.push(
          context,
          WorkHourShiftCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const WorkHourShiftQueryEvent.get());
        }
      },
    );
  }
}
