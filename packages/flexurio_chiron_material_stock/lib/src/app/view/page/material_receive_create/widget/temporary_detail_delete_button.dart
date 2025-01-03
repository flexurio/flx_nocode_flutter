import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveTemporaryDetailDeleteButton extends StatelessWidget {
  const MaterialReceiveTemporaryDetailDeleteButton({
    required this.materialReceiveDetail,
    super.key,
  });

  final MaterialReceiveDetail materialReceiveDetail;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      action: DataAction.delete,
      permission: null,
      onPressed: () async {
        final bloc = context.read<MaterialReceiveBloc>();
        await _showRemoveDialog(context: context, bloc: bloc);
      },
    );
  }

  Future<bool?> _showRemoveDialog({
    required BuildContext context,
    required MaterialReceiveBloc bloc,
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
          label: materialReceiveDetail.material.name,
          onConfirm: () {
            bloc.add(
              MaterialReceiveEvent.materialRemove(materialReceiveDetail),
            );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
