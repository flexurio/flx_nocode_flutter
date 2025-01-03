import 'package:flexurio_chiron_presence/src/app/view/page/presence_monthly_report/presence_monthly_report_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Legends extends StatelessWidget {
  const Legends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingHorizontalPage),
      child: Row(
        children: [
          PresenceLegend(
            color: Colors.lightGreen.shade300,
            label: 'On Time',
          ),
          const Gap(24),
          PresenceLegend(
            color: Colors.blue.shade300,
            label: 'Holiday',
          ),
          const Gap(24),
          PresenceLegend(
            color: Colors.orange.shade300,
            label: 'Late',
          ),
          const Gap(24),
          const PresenceLegend(
            color: Colors.red,
            label: 'Absent',
          ),
          const Gap(24),
          PresenceLegend(
            color: Colors.deepPurple.shade300,
            label: 'Leave',
          ),
          const Gap(24),
          PresenceLegend(
            color: Colors.purpleAccent.shade200,
            label: 'Half-day leave',
          ),
          const Gap(24),
          const Spacer(),
          const Icon(Icons.schedule),
          const Gap(6),
          const Text('Work Hour: Monday - Friday (08:00 - 17:00)'),
        ],
      ),
    );
  }
}
