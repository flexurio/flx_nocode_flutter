import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_query/product_issue_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/delivery_actual_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductIssueDeliveryActualButton extends StatelessWidget {
  const ProductIssueDeliveryActualButton({
    required this.productIssue,
    super.key,
  });

  final ProductIssue productIssue;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.productIssueDeliveryCreate,
      action: DataAction.deliveryActual,
      onPressed: () {
        final queryBloc = context.read<ProductIssueQueryBloc>();
        Navigator.push(
          context,
          ProductIssueDeliveryActualPage.route(
            productIssue: productIssue,
          ),
        ).then((success) {
          if (success ?? false) {
            queryBloc.add(const ProductIssueQueryEvent.fetch());
          }
        });
      },
    );
  }
}
