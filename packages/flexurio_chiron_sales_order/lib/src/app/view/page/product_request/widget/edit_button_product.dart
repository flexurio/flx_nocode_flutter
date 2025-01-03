import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import '../../product_request_create/widget/product_form_edit_input.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestDetailEditButton extends StatelessWidget {
  const ProductRequestDetailEditButton._({
    required this.productRequest,
    required this.bloc,
    this.productRequestDetail,
  });

  static Widget prepare({
    required ProductRequestFormPurchaseOrder productRequest,
    required ProductRequestBloc bloc,
    ProductRequestDetail? productRequestDetail,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductRequestBloc(),
        ),
      ],
      child: ProductRequestDetailEditButton._(
        productRequestDetail: productRequestDetail,
        productRequest: productRequest,
        bloc: bloc,
      ),
    );
  }

  final ProductRequestFormPurchaseOrder productRequest;
  final ProductRequestDetail? productRequestDetail;
  final ProductRequestBloc bloc;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productRequestEdit,
      action: DataAction.edit,
      onPressed: () async {
        await showDialog<ProductRequestDetail?>(
          context: context,
          builder: (context) {
            return ProductRequestEditProductPage.prepare(
              productRequest: productRequest,
              productRequestDetail: productRequestDetail,
            );
          },
        ).then((value) {
          bloc.add(
            ProductRequestEvent.initialize(productRequest),
          );
        });
      },
    );
  }
}
