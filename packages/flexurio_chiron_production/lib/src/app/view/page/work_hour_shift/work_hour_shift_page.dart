import 'package:flexurio_chiron_production/src/app/view/page/work_hour_shift/widget/work_hour_shift_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class WorkHourShiftPage extends StatelessWidget {
  const WorkHourShiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        FCard(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: WorkHourShiftDataTable.prepare(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
