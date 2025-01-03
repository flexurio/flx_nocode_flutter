import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductReturnDetailViewPage extends StatelessWidget {
  const ProductReturnDetailViewPage._({required this.productReturnDetail});

  final ProductReturnDetail productReturnDetail;

  static Route<void> route(ProductReturnDetail productReturnDetail) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductReturnDetailQueryBloc()
              ..add(
                ProductReturnDetailQueryEvent.fetchById(
                    productReturnId: productReturnDetail.productReturn.id,
                    idDetail: productReturnDetail.id),
              ),
          ),
        ],
        child: ProductReturnDetailViewPage._(
          productReturnDetail: productReturnDetail,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<ProductReturnDetailQueryBloc, ProductReturnDetailQueryState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: SomethingWrong.new,
              loading: (_) => const ProgressingIndicator(),
              loaded: (productReturnDetail) => SingleFormPanel(
                action: DataAction.view,
                entity: Entity.productReturnDetail,
                size: SingleFormPanelSize.large,
                actions: _buildProductReturnDetailActions(
                    productReturnDetail.data.first, context),
                children: [
                  ProductReturnDetailReviewFormPage.prepare(
                    productReturnDetail: productReturnDetail.data.first,
                  ),
                ],
              ),
            );
          },
        ));
  }

  List<Widget> _buildProductReturnDetailActions(
      ProductReturnDetail productReturnDetail, BuildContext context) {
    return [
      if (productReturnDetail.productReturn.status ==
          ProductReturnStatus.confirmPPIC)
        ProductReturnDetailCheckButton(
          productReturnDetail: productReturnDetail,
          productReturn: productReturnDetail.productReturn,
          productReturnDetailQueryBloc:
              context.read<ProductReturnDetailQueryBloc>(),
        ),
      if (productReturnDetail.checkQcById == 0)
        ProductReturnDetailCheckQCButton.prepare(
          productReturnDetail: productReturnDetail,
        ),
      if (productReturnDetail.productReturn.status == ProductReturnStatus.input)
        ProductReturnDetailDeleteButton.prepare(
          productReturnDetail: productReturnDetail,
        )
      else if (productReturnDetail.checkQcById == 0)
        if (productReturnDetail.quantityCheck == 0)
          ProductReturnDetailDeleteButton.prepare(
            productReturnDetail: productReturnDetail,
          ),
    ];
  }
}
