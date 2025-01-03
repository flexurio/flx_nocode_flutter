import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductReturnPage extends StatelessWidget {
  const ProductReturnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productReturn),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductReturnDataTable.prepare(),
        ),
      ],
    );
  }
}
