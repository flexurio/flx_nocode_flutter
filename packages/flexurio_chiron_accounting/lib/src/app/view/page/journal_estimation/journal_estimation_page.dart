import 'package:flexurio_chiron_accounting/src/app/view/page/journal_estimation/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class JournalEstimationPage extends StatelessWidget {
  const JournalEstimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.journalEstimation),
        const SizedBox(height: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: JournalEstimationDataTable.prepare(),
        ),
      ],
    );
  }
}
