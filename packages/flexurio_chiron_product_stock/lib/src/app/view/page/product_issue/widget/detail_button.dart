import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_query/product_issue_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue_detail/product_issue_detail_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductIssueDetailButton extends StatelessWidget {
  const ProductIssueDetailButton({required this.productIssue, super.key});

  final ProductIssue productIssue;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.viewDetail,
      onPressed: () {
        Navigator.push(
          context,
          ProductIssueDetailPage.route(
            productIssue: productIssue,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<ProductIssueQueryBloc>()
                .add(const ProductIssueQueryEvent.fetch());
          }
        });
      },
    );
  }
}
