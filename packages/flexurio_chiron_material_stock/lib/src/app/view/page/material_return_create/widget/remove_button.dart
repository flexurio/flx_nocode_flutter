import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnDetailRemoveButton extends StatelessWidget {
  const MaterialReturnDetailRemoveButton({
    required this.materialReturnDetail,
    super.key,
  });

  final MaterialReturnDetail materialReturnDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialReturnBloc>();
        await _showRemoveDialog(context: context, bloc: bloc);
      },
    );
  }

  Future<bool?> _showRemoveDialog({
    required BuildContext context,
    required MaterialReturnBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.material;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CardConfirmation(
          isProgress: false,
          action: action,
          data: entity,
          label: materialReturnDetail.material.name,
          onConfirm: () {
            bloc.add(
              MaterialReturnEvent.materialRemove(materialReturnDetail),
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
