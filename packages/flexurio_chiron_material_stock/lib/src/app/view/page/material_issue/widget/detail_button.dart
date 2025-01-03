import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialIssueDetailButton extends StatelessWidget {
  const MaterialIssueDetailButton({
    required this.action,
    required this.materialIssue,
    required this.product,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final MaterialIssue materialIssue;
  final Product product;
  final DataAction action;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.viewDetail,
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialIssueDetailPage.route(
            materialIssue: materialIssue,
            action: action,
            product: product,
            isExternal: isExternal,
          ),
        );
      },
    );
  }
}
