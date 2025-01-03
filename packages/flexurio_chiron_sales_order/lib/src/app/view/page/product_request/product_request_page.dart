import 'widget/product_request_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductRequestPage extends StatelessWidget {
  const ProductRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productRequest),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductRequestDataTable.prepare(),
        ),
      ],
    );
  }
}
