import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_detail_create/material_return_detail_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMaterialButton extends StatefulWidget {
  const AddMaterialButton({
    required this.materialReturnType,
    super.key,
  });

  final MaterialReturnType materialReturnType;

  @override
  State<AddMaterialButton> createState() => _AddMaterialButtonState();
}

class _AddMaterialButtonState extends State<AddMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: Container.new,
          initial: (materials, materialReturnFormProduct) {
            return LightButton(
              permission: null,
              action: DataAction.add,
              entity: Entity.material,
              onPressed: () {
                _showCreateDialog(
                  context: context,
                  materialReturnFormProduct: materialReturnFormProduct,
                  materialReturnType: widget.materialReturnType,
                  isExternal:
                      materialReturnFormProduct?.transactionType.id == '31',
                );
              },
            );
          },
        );
      },
    );
  }

  void _showCreateDialog({
    required BuildContext context,
    required MaterialReturnFormProduct? materialReturnFormProduct,
    required MaterialReturnType materialReturnType,
    required bool isExternal,
  }) {
    final bloc = context.read<MaterialReturnBloc>();
    showDialog<MaterialReturnDetail?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            MaterialReturnDetailCreatePage.prepare(
              bloc: bloc,
              materialReturnFormProduct: materialReturnFormProduct,
              materialReturnType: materialReturnType,
            ),
          ],
        );
      },
    ).then(
      (materialReturnDetail) {
        if (materialReturnDetail != null) {
          context.read<MaterialReturnBloc>().add(
                MaterialReturnEvent.materialAdd(materialReturnDetail),
              );
        }
      },
    );
  }
}
