import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request_query/product_request_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../product_request_view/product_request_view_page.dart';

class ProductRequestViewButton extends StatelessWidget {
  const ProductRequestViewButton({
    required this.productRequest,
    required this.refresh,
    super.key,
  });

  final ProductRequest productRequest;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productRequestViewMenu,
      action: DataAction.view,
      onPressed: () {
        Navigator.push(
          context,
          ProductRequestDetailPage.route(
            productRequest: productRequest,
          ),
        ).then((value) {
          refresh();
        });
      },
    );
  }
}
