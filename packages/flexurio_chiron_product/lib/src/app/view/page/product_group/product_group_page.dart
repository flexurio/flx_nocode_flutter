import 'package:flexurio_chiron_product/src/app/view/page/product_group/widget/product_group_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductGroupPage extends StatelessWidget {
  const ProductGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productGroup),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductGroupDataTable.prepare(),
        ),
      ],
    );
  }
}
