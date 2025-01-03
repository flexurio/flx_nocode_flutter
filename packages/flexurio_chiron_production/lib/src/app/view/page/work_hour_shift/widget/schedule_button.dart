import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ScheduleButton extends StatelessWidget {
  const ScheduleButton({required this.workHourShift, required this.isExternal, super.key,
  });
  final bool isExternal;  

  final WorkHourShift workHourShift;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.scheduleEdit(isExternal: isExternal),
      action: DataAction.showWorkHour,
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusPopup),
              ),
              scrollable: true,
              content: SingleChildScrollView(
                child: ScheduleForm.prepare(shiftId: workHourShift.id),
              ),
            );
          },
        );
      },
    );
  }
}
