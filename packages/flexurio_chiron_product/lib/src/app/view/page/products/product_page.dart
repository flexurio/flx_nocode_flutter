import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.isExternal});

  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: Entity.product,
          suffixText: isExternal ? ' External' : null,
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductDataTable.prepare(isExternal: isExternal),
        ),
      ],
    );
  }
}
