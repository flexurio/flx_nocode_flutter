import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_create/product_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductUpdateButton extends StatelessWidget {
  const ProductUpdateButton({
    required this.product,
    super.key,
    required this.isExternal,
  });

  final Product product;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduct.productEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final queryBloc = context.read<ProductQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductCreatePage.route(
            product: product,
            isExternal: isExternal,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const ProductQueryEvent.fetch());
        }
      },
    );
  }
}
