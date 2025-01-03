import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request/product_request_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request_detail.dart';
import '../../product_request_create/widget/sales_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class ProductRequestCreateSalesOrderButton extends StatelessWidget {
  const ProductRequestCreateSalesOrderButton({
    super.key,
    required this.onRefresh,
    this.productRequest,
    this.productRequestDetail,
    this.bloc,
  });

  final ProductRequestFormPurchaseOrder? productRequest;
  final List<ProductRequestDetail>? productRequestDetail;
  final ProductRequestBloc? bloc;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return LightButton(
      permission: Permission.productRequestCreate,
      action: DataAction.createSalesOrder,
      onPressed: () async {
        await Navigator.push(
          context,
          ProductRequestCreateSalesOrderForm.route(
            productRequest: productRequest,
            productRequestDetail: productRequestDetail,
            bloc: bloc!,
            onRefresh: onRefresh,
          ),
        );
      },
    );
  }
}
