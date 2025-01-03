import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive/product_receive_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive_detail/product_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveFormEditPage extends StatefulWidget {
  const ProductReceiveFormEditPage._(this.productReceiveDetail);

  final ProductReceiveDetail productReceiveDetail;

  static Widget prepare({
    required ProductReceiveDetail productReceiveDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReceiveBloc(isExternal: isExternal),
        ),
      ],
      child: ProductReceiveFormEditPage._(
        productReceiveDetail,
      ),
    );
  }

  @override
  State<ProductReceiveFormEditPage> createState() =>
      _ProductReceiveFormEditPageState();
}

class _ProductReceiveFormEditPageState
    extends State<ProductReceiveFormEditPage> {
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
        body: BlocBuilder<ProductReceiveBloc, ProductReceiveState>(
          builder: (context, state) {
            return SingleFormPanel(
              action: action,
              entity: entity,
              children: [
                ProductReceiveEditForm.prepare(
                  productReceiveDetail: widget.productReceiveDetail,
                  onNext: () {},
                  onPrevious: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
