import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProductReturnCheckViewPage extends StatelessWidget {
  const ProductReturnCheckViewPage._({
    required this.productReturnDetail,
    required this.productReturnCheck,
    required this.productReturnDetailQueryBloc,
  });

  final ProductReturnCheck productReturnCheck;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Route<void> route({
    required ProductReturnDetail productReturnDetail,
    required ProductReturnCheck productReturnCheck,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: ProductReturnCheckViewPage._(
        productReturnDetail: productReturnDetail,
        productReturnCheck: productReturnCheck,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: DataAction.view,
          entity: Entity.productReturnCheck,
          size: SingleFormPanelSize.large,
          actions:
              _buildProductReturnDetailActions(productReturnDetail, context),
          children: [
            ProductReturnCheckReviewFormPage.prepare(
              productReturnDetail: productReturnDetail,
              productReturnCheck: productReturnCheck,
            ),
          ],
        ));
  }

  List<Widget> _buildProductReturnDetailActions(
      ProductReturnDetail productReturnDetail, BuildContext context) {
    return [
      ProductReturnDetailPrintButton.prepare(
          productReturnDetail.productReturn,
          productReturnDetail,
          productReturnCheck),
      ProductReturnCheckDeleteButton.prepare(
        productReturnCheck: productReturnCheck,
        productReturnDetail: productReturnDetail,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    ];
  }
}
