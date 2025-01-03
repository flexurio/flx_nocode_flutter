import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation_create/product_formulation_detail_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    required this.productFormulationDetailTemporary,
    this.productFormulationType,
    required this.isExternal,
    super.key,
  });
  final ProductFormulationDetailTemporary productFormulationDetailTemporary;
  final ProductFormulationType? productFormulationType;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.edit,
      onPressed: () => _showCreateDialog(context),
      permission: null,
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
              productFormulationType: productFormulationType,
              temporaryBloc: temporaryBloc,
              productFormulationDetailTemporary:
                  productFormulationDetailTemporary,
                  isExternal: isExternal,
            ),
          ],
        );
      },
    );
  }
}
