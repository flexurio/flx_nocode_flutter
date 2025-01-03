import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/temporary_create_pop_up.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveAddTemporaryButton extends StatefulWidget {
  const MaterialReceiveAddTemporaryButton({
    required this.createType,
    required this.showMaterialDesign,
    required this.materialGroup,
    super.key,
  });

  final MaterialReceiveType createType;
  final bool showMaterialDesign;
  final MaterialGroup materialGroup;

  @override
  State<MaterialReceiveAddTemporaryButton> createState() =>
      _MaterialReceiveAddTemporaryButtonState();
}

class _MaterialReceiveAddTemporaryButtonState
    extends State<MaterialReceiveAddTemporaryButton> {
  @override
  Widget build(BuildContext context) {
    return LightButton(
      entity: EntityMaterialStock.materialReceive,
      action: DataAction.add,
      permission: null,
      onPressed: () {
        _showCreateDialog(context);
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog<MaterialReceiveDetail?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            MaterialReceiveDetailTemporaryCreate.prepare(
              materialGroup: widget.materialGroup,
              createType: widget.createType,
              showMaterialDesignDropdown: widget.showMaterialDesign,
            ),
          ],
        );
      },
    ).then(
      (materialReceiveDetail) {
        if (materialReceiveDetail != null) {
          context.read<MaterialReceiveBloc>().add(
                MaterialReceiveEvent.materialAdd(materialReceiveDetail),
              );
        }
      },
    );
  }
}
