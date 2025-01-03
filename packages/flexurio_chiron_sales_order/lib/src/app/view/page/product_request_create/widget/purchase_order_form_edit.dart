import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'purchase_order_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductRequestCreatePurchaseOrderFormEditPage extends StatelessWidget {
  const ProductRequestCreatePurchaseOrderFormEditPage._({
    required this.productRequest,
  });

  static Route<bool?> route({
    required ProductRequestFormPurchaseOrder productRequest,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductRequestBloc(),
          ),
        ],
        child: ProductRequestCreatePurchaseOrderFormEditPage._(
          productRequest: productRequest,
        ),
      ),
    );
  }

  final ProductRequestFormPurchaseOrder productRequest;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = Entity.productRequest;

    return BlocListener<ProductRequestBloc, ProductRequestState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          children: [
            ProductRequestCreatePurchaseOrderForm.prepare(
              onNext: () {},
              productRequest: productRequest,
            ),
          ],
        ),
      ),
    );
  }
}
