import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveCreateButton extends StatelessWidget {
  const ProductReceiveCreateButton({
    required this.statusSelected,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final String statusSelected;

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission:
          PermissionProductStock.productReceiveCreate(isExternal: isExternal),
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductReceiveDetailQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductReceiveCreatePage.route(isExternal: isExternal),
        );
        if (success ?? false) {
          queryBloc.add(
            ProductReceiveDetailQueryEvent.fetch(
              status: statusSelected,
            ),
          );
        }
      },
    );
  }
}
