import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnViewPage extends StatelessWidget {
  const ProductReturnViewPage._(
      {required this.productReturn, required this.statusSelect});

  final ProductReturn productReturn;
  final ProductReturnStatus statusSelect;

  static Route<void> route(
      ProductReturn productReturn, ProductReturnStatus statusSelect) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductReturnQueryBloc()
              ..add(ProductReturnQueryEvent.fetchById(productReturn.id)),
          ),
          BlocProvider(
            create: (context) => ProductReturnDetailQueryBloc()
              ..add(ProductReturnDetailQueryEvent.fetch(
                  productReturnId: productReturn.id,
                  pageOptions: PageOptions.emptyNoLimit())),
          ),
        ],
        child: ProductReturnViewPage._(
            productReturn: productReturn, statusSelect: statusSelect),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<ProductReturnQueryBloc, ProductReturnQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SomethingWrong.new,
            loading: (_) => const ProgressingIndicator(),
            loaded: (pageOptions) {
              final productReturn = pageOptions.data.first;
              return SingleFormPanel(
                action: DataAction.view,
                entity: Entity.productReturn,
                size: SingleFormPanelSize.large,
                actions: _buildProductReturnActions(productReturn, context),
                children: [
                  ProductReturnReviewForm.prepare(
                    productReturnDetailQueryBloc:
                        context.read<ProductReturnDetailQueryBloc>(),
                    productReturn: pageOptions.data.first,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> _buildProductReturnActions(
      ProductReturn productReturn, BuildContext context) {
    return [
      ExportPdfProductReturnPrintSrpButton.prepare(
          productReturnDetailQueryBloc:
              context.read<ProductReturnDetailQueryBloc>(),
          productReturn: productReturn),
      if (productReturn.status == ProductReturnStatus.input)
        ProductReturnEditButton(productReturn: productReturn),
      if (productReturn.status == ProductReturnStatus.input)
        ProductReturnConfirmMarketingButton.prepare(
          productReturn: productReturn,
        ),
      if (productReturn.status == ProductReturnStatus.confirmMarketing)
        ProductReturnConfirmPpicButton.prepare(
          productReturn: productReturn,
        ),
      if (productReturn.status == ProductReturnStatus.confirmMarketing)
        ProductReturnUndoConfirmMarketingButton.prepare(
          productReturn: productReturn,
        ),
      if (productReturn.status == ProductReturnStatus.confirmPPIC)
        ProductReturnUndoConfirmPPICButton.prepare(
          productReturn: productReturn,
        ),
      if (productReturn.status != ProductReturnStatus.confirmPPIC &&
          productReturn.status == ProductReturnStatus.input)
        ProductReturnDeleteButton.prepare(
          productReturn: productReturn,
          statusSelect: statusSelect,
        ),
    ];
  }
}
