import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDetailCreateNewNaButton extends StatelessWidget {
  const MaterialIssueDetailCreateNewNaButton({
    required this.materialIssueDetail,
    required this.action,
    required this.product,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final MaterialIssueDetail materialIssueDetail;
  final Product? product;
  final DataAction action;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialIssueDetailCreate(
        isExternal: isExternal,
      ),
      action: DataAction.create,
      tooltipMessage: 'Add New NA',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => MaterialIssueDetailCreateNewNaPage.prepare(
              action: action,
              product: product,
              materialIssue: materialIssueDetail.materialIssue,
              materialIssueDetail: materialIssueDetail,
              isExternal: isExternal,
            ),
          ),
        ).then(
          (value) {
            if (value ?? false) {
              context.read<MaterialIssueDetailQueryBloc>().add(
                    MaterialIssueDetailQueryEvent.fetch(
                      materialIssue: materialIssueDetail.materialIssue,
                    ),
                  );
            }
          },
        );
      },
    );
  }
}
