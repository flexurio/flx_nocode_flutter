import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_create/widget/form_step_1_transaction.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductReceiveEditTransactionPage extends StatelessWidget {
  const ProductReceiveEditTransactionPage._(this.productReceive);

  static Route<bool?> route({
    required ProductReceive productReceive,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductReceiveBloc(isExternal: isExternal)),
        ],
        child: ProductReceiveEditTransactionPage._(productReceive),
      ),
    );
  }

  final ProductReceive productReceive;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = Entity.productReceive;

    return BlocListener<ProductReceiveBloc, ProductReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
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
            ProductReceiveCreateTransactionForm.prepare(
              onNext: () {},
              productReceive: productReceive,
            ),
          ],
        ),
      ),
    );
  }
}
