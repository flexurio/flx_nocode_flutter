import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import '../../product_request_create/widget/purchase_order_form_edit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductRequestEditButton extends StatelessWidget {
  const ProductRequestEditButton({
    required this.productRequest,
    required this.bloc,
    super.key,
  });

  final ProductRequestFormPurchaseOrder productRequest;
  final ProductRequestBloc bloc;
  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productRequestEdit,
      action: DataAction.edit,
      onPressed: () async {
        final success = await Navigator.push(
          context,
          ProductRequestCreatePurchaseOrderFormEditPage.route(
            productRequest: productRequest,
          ),
        );
        if (success ?? false) {
          bloc.add(ProductRequestEvent.initialize(productRequest));
        }
      },
    );
  }
}
