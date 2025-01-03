import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import '../../product_request_create/widget/add_new_product_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestAddDetailButton extends StatelessWidget {
  const ProductRequestAddDetailButton._({
    required this.productRequest,
    required this.bloc,
    this.initialProducts,
  });

  static Widget prepare({
    required ProductRequestFormPurchaseOrder productRequest,
    required ProductRequestBloc bloc,
    List<ProductRequestDetail>? initialProducts,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductRequestBloc()),
      ],
      child: ProductRequestAddDetailButton._(
        productRequest: productRequest,
        bloc: bloc,
        initialProducts: initialProducts,
      ),
    );
  }

  final ProductRequestFormPurchaseOrder productRequest;
  final ProductRequestBloc bloc;
  final List<ProductRequestDetail>? initialProducts;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: Permission.productRequestEdit,
      action: DataAction.add,
      entity: Entity.productRequestDetail,
      onPressed: () async {
        if (initialProducts == null) {
          Toast(context).fail('Product Request Detail is empty');
          return;
        }

        await showDialog<ProductRequestDetail?>(
          context: context,
          builder: (context) {
            return ProductRequestAddNewDetailPage.prepare(
              productRequest: productRequest,
              productRequestBloc: bloc,
              initialProducts: initialProducts,
            );
          },
        ).then((value) {
          bloc.add(ProductRequestEvent.initialize(productRequest));
        });
      },
    );
  }
}
