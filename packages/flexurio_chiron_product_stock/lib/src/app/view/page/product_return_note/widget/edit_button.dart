import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteEditButton extends StatelessWidget {
  const ProductReturnNoteEditButton({
    required this.productReturnNote,
    super.key,
  });

  final ProductReturnNote productReturnNote;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: PermissionProductStock.productReturnNoteEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnNoteCreatePage.prepare(
              productReturnNote: productReturnNote,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductReturnNoteQueryBloc>()
                .add(ProductReturnNoteQueryEvent.fetchById(
                  productReturnNote.id,
                ));
          }
        });
      },
    );
  }
}
