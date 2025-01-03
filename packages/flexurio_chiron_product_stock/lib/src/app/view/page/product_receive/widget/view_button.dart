import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveViewButton extends StatelessWidget {
  const ProductReceiveViewButton({
    required this.productReceiveDetail,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final ProductReceiveDetail productReceiveDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionProductStock.productReceiveViewMenu(isExternal: isExternal),
      action: DataAction.view,
      onPressed: () async {
        final queryBloc = context.read<ProductReceiveDetailQueryBloc>();
        await Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => ProductReceiveDetailPage.prepare(
              productReceiveDetail: productReceiveDetail,
              isExternal: isExternal,
            ),
          ),
        );
        queryBloc.add(
          const ProductReceiveDetailQueryEvent.fetch(),
        );
      },
    );
  }
}
