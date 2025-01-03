import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request_query/product_request_query_bloc.dart';
import '../../product_request_create/product_request_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestCreateButton extends StatelessWidget {
  const ProductRequestCreateButton({super.key, required this.refresh});
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: Permission.productRequestCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<ProductRequestQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductRequestCreatePage.route(),
        );
        if (success ?? false) {
          refresh();
        }
      },
    );
  }
}
