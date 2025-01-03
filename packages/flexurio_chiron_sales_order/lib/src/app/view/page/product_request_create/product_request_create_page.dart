import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'widget/confirm_form_local.dart';
import 'widget/products_form.dart';
import 'widget/purchase_order_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductRequestCreatePage extends StatefulWidget {
  const ProductRequestCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductRequestBloc()),
        ],
        child: const ProductRequestCreatePage._(),
      ),
    );
  }

  @override
  State<ProductRequestCreatePage> createState() =>
      _ProductRequestCreatePageState();
}

class _ProductRequestCreatePageState extends State<ProductRequestCreatePage> {
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
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'purchase_order'.tr(),
                'product'.tr(),
                'review'.tr(),
              ],
              children: [
                ProductRequestCreatePurchaseOrderForm.prepare(
                  onNext: _nextPage,
                ),
                ProductRequestCreateProductForm(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                ProductRequestCreateConfirmFormLocal(
                  onPrevious: _previousPage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
