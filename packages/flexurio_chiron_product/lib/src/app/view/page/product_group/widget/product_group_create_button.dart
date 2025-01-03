import 'package:flexurio_chiron_product/src/app/bloc/product_group_query/product_group_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_group/widget/product_group_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGroupCreateButton extends StatelessWidget {
  const ProductGroupCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    return Button.small(
      permission: PermissionProduct.productGroupCreate,
      action: action,
      onPressed: () async {
        final queryBloc = context.read<ProductGroupQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductGroupCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(const ProductGroupQueryEvent.fetch());
        }
      },
    );
  }
}
