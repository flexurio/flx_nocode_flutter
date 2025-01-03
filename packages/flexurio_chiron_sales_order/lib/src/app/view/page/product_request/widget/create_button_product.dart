import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import '../../product_request_create/widget/product_request_detail_create_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductRequestCreateProductButton extends StatelessWidget {
  const ProductRequestCreateProductButton({
    required this.productRequestBloc,
    required this.productRequestFormPurchaseOrder,
    super.key,
  });

  final ProductRequestBloc productRequestBloc;
  final ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: null,
      action: DataAction.add,
      entity: Entity.product,
      onPressed: () async {
        await showDialog<ProductRequestDetail?>(
          context: context,
          builder: (context) {
            return ProductRequestAddProductPage.prepare(
              productRequestBloc: productRequestBloc,
              productRequest: productRequestFormPurchaseOrder,
            );
          },
        ).then((value) {
          if (value != null) {
            productRequestBloc.add(
              ProductRequestEvent.createFormProductToLocal(
                productRequestDetail: value,
              ),
            );
          }
        });
      },
    );
  }
}
