import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail/product_formulation_detail_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDetailDeleteButton extends StatelessWidget {
  const MaterialRequestDetailDeleteButton({
    required this.detail,
    super.key,
  });

  final ProductFormulationDetailTemporary detail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      onPressed: () => _showConfirmationDialog(context),
      permission: null,
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    final bloc = context.read<ProductFormulationDetailBloc>();
    final event = ProductFormulationDetailEvent.delete(detail.id);

    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: Entity.billOfMaterial,
          label: detail.material!.name,
          onConfirm: () {
            bloc.add(event);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
