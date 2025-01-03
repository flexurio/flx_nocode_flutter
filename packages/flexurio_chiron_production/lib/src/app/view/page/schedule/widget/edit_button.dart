import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleEditButton extends StatelessWidget {
  const ScheduleEditButton({
    required this.schedule,
    required this.isExternal, super.key,
  });
  final bool isExternal;

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.scheduleEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ScheduleCreatePage.prepare(
              schedule: schedule,
              isExternal: isExternal,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ScheduleQueryBloc>()
                .add(const ScheduleQueryEvent.fetch());
          }
        });
      },
    );
  }
}
