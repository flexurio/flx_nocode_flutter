import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleDetailCreateButton extends StatelessWidget {
  const ScheduleDetailCreateButton({
    required this.schedule,
    required this.isExternal, super.key,
    this.scheduleDetail,
  });
  final bool isExternal;

  final ScheduleDetail? scheduleDetail;
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission:
          PermissionProduction.scheduleDetailCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ScheduleDetailCreatePage.prepare(
              scheduleDetail: scheduleDetail,
              schedule: schedule,
              isExternal: isExternal,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<ScheduleDetailQueryBloc>().add(
                  ScheduleDetailQueryEvent.fetch(
                    schedule.id,
                  ),
                );
          }
        });
      },
    );
  }
}
