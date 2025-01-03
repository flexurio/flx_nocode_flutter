import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductReturnNotePage extends StatelessWidget {
  const ProductReturnNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.productReturnNote),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductReturnNoteDataTable.prepare(),
        ),
      ],
    );
  }
}
