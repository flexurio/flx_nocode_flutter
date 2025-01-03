import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return/product_return_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/confirmation_form.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/customer_form.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_create/widget/delivery_order_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnCreatePage extends StatefulWidget {
  const ProductReturnCreatePage({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductReturnBloc()),
      ],
      child: const ProductReturnCreatePage(),
    );
  }

  @override
  State<ProductReturnCreatePage> createState() =>
      _ProductReturnCreatePageState();
}

class _ProductReturnCreatePageState extends State<ProductReturnCreatePage> {
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
    final entity = Entity.productReturn;
    return BlocListener<ProductReturnBloc, ProductReturnState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          size: SingleFormPanelSize.large,
          action: action,
          entity: entity,
          children: [
            MultiForm(
              titles:  [
                'customer'.tr(),
                'delivery_order'.tr(),
                'confirmation'.tr(),
              ],
              page: _page,
              children: [
                ProductReturnCreateCustomerForm.prepare(
                  onNext: _nextPage,
                ),
                ProductReturnCreateDeliveryOrderForm(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                ProductReturnConfirmForm(
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
