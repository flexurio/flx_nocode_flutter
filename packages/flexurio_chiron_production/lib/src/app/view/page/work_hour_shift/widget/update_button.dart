import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({required this.workHourShift, super.key});

  final WorkHourShift workHourShift;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.workHourShiftEdit,
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<WorkHourShiftQueryBloc>();
        final success = await Navigator.push(
          context,
          WorkHourShiftCreatePage.route(workHourShift: workHourShift),
        );
        if (success ?? false) {
          queryBloc.add(const WorkHourShiftQueryEvent.get());
        }
      },
    );
  }
}
