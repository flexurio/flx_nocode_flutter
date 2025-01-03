import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ScheduleDetailButton extends StatelessWidget {
  const ScheduleDetailButton({
    required this.schedule,
    required this.isExternal, super.key,
  });
  final bool isExternal;

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.viewDetail,
      onPressed: () async {
        await Navigator.push(
          context,
          ScheduleDetailPage.route(schedule: schedule, isExternal: isExternal),
        );
      },
    );
  }
}
