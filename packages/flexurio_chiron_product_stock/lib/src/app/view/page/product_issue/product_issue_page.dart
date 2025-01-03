import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/product_issue_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductIssuePage extends StatelessWidget {
  const ProductIssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productIssue),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductIssueDataTable.prepare(),
        ),
      ],
    );
  }
}
