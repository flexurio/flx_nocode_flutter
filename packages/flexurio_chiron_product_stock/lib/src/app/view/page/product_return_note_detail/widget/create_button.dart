import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteDetailCreateButton extends StatelessWidget {
  const ProductReturnNoteDetailCreateButton({
    required this.productReturnNote,
    super.key,
  });

  final ProductReturnNote productReturnNote;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: PermissionProductStock.productReturnNoteCreate,
      action: DataAction.create,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReturnNoteDetailCreatePage.prepare(
              productReturnNote: productReturnNote,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<ProductReturnNoteDetailQueryBloc>().add(
                  ProductReturnNoteDetailQueryEvent.fetch(
                    productReturnNoteId: productReturnNote.id,
                  ),
                );
          }
        });
      },
    );
  }
}
