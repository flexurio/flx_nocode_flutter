import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_data/widget/asset_data_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AssetDataPage extends StatelessWidget {
  const AssetDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: EntityAccounting.assetData),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AssetDataDataTable.prepare(),
        ),
      ],
    );
  }
}
