import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_journal_depreciation/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AssetJournalDepreciationPage extends StatelessWidget {
  const AssetJournalDepreciationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.assetJournalDepreciation),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AssetJournalDepreciationDataTable.prepare(),
        ),
      ],
    );
  }
}
