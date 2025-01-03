import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/product_formulation_create_page.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/product_formulation_detail_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    required this.materialGroup,
    super.key,
    this.detail,
    this.productFormulation,
    required this.isExternal,
  });
  final ProductFormulationType? materialGroup;
  final bool? detail;
  final ProductFormulation? productFormulation;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return detail == false
        ? SizedBox(
            width: 120,
            child: Button(
              color: Colors.amber,
              onPressed: () {
                Navigator.push(
                  context,
                  ProductFormulationCreatePage.route(
                    productFormulation: productFormulation,
                    isExternal: isExternal,
                  ),
                ).then((success) {
                  if (success ?? false) {
                    Navigator.pop(context, true);
                  }
                });
              },
              action: DataAction.edit,
              permission: null,
            ),
          )
        : LightButton(
            permission: null,
            // icon: const Icon(Icons.add),
            // label: 'Add Product Formulation Detail',
            onPressed:
                materialGroup != null ? () => _showCreateDialog(context) : null,
            entity: Entity.billOfMaterial,
            action: DataAction.add,
          );
  }

  void _showCreateDialog(BuildContext context) {
    final temporaryBloc = context.read<ProductFormulationDetailBloc>();
    showDialog<void>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            PurchaseRequestDetailCreatePage.prepare(
              productFormulationType: materialGroup,
              temporaryBloc: temporaryBloc,
              isExternal: isExternal,
            ),
          ],
        );
      },
    );
  }
}
