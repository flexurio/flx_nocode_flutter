import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_create/widget/form_step_1_transaction.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_create/widget/review_form.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_create/widget/form_step_2_products.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductReceiveCreatePage extends StatefulWidget {
  const ProductReceiveCreatePage._(this.isExternal);
  final bool isExternal;
  static Route<bool?> route({
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ProductReceiveBloc(isExternal: isExternal)),
          BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
          BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
        ],
        child: ProductReceiveCreatePage._(isExternal),
      ),
    );
  }

  @override
  State<ProductReceiveCreatePage> createState() =>
      _ProductReceiveCreatePageState();
}

class _ProductReceiveCreatePageState extends State<ProductReceiveCreatePage> {
  var _page = 0;

  @override
  void initState() {
    super.initState();
  }

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
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
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'transaction'.tr(),
                'products'.tr(),
                'review'.tr(),
              ],
              children: [
                ProductReceiveCreateTransactionForm.prepare(onNext: _nextPage),
                ProductReceiveCreateProductsForm(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                ProductReceiveCreateReviewForm(
                  onPrevious: _previousPage,
                  isExternal: widget.isExternal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
