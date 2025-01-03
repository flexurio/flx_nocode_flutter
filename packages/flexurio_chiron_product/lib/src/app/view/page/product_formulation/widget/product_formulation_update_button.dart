import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
// import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/old/widget/product_formulation_create_page.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/product_formulation_create_page.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationUpdateButton extends StatelessWidget {
  const ProductFormulationUpdateButton({
    required this.productFormulation,
    required this.isExternal,
    super.key,
  });

  final ProductFormulation productFormulation;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduct.productFormulationEdit(isExternal: isExternal),
      action: DataAction.edit,
      onPressed: () async {
        final materialUnitQueryBloc = context.read<MaterialUnitQueryBloc>();
        final queryBloc = context.read<ProductFormulationQueryBloc>();
        final success = await Navigator.push(
          context,
          ProductFormulationCreatePage.route(
            productFormulation: productFormulation,
            isExternal:isExternal,
          ),
        );
        if (success ?? false) {
          queryBloc.add(const ProductFormulationQueryEvent.fetch());
          materialUnitQueryBloc.add(const MaterialUnitQueryEvent.fetch());
        }
      },
    );
  }
}
