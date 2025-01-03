import 'package:flexurio_chiron_production/src/app/view/page/schedule/widget/schedule_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    required this.isExternal, super.key,
  });
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: Entity.schedule,
          suffixText: isExternal ? ' External' : null,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ScheduleDataTable.prepare(isExternal: isExternal),
        ),
      ],
    );
  }
}
