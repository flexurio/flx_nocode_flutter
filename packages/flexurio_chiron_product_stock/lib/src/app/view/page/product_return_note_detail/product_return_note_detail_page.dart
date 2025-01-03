import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note_detail/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductReturnNoteDetailPage extends StatelessWidget {
  const ProductReturnNoteDetailPage({
    required this.productReturnNote,
    super.key,
  });

  final ProductReturnNote productReturnNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          const Row(
            children: [
              BackButton(),
            ],
          ),
          TitlePage(entity: Entity.productReturnNoteDetail),
          const Gap(12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ProductReturnNoteDetailDataTable.prepare(
              productReturnNote: productReturnNote,
            ),
          ),
        ],
      ),
    );
  }
}
