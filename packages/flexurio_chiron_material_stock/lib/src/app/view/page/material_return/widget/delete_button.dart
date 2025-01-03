import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnDeleteButton extends StatelessWidget {
  const MaterialReturnDeleteButton._({required this.materialReturn, required this.isExternal});

  static Widget prepare({
    required MaterialReturn materialReturn,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialReturnBloc(),
      child: MaterialReturnDeleteButton._(materialReturn: materialReturn, isExternal: isExternal),
    );
  }

  final MaterialReturn materialReturn;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialReturnDelete(isExternal: isExternal),
      action: action,
      onPressed: () async {
        final bloc = context.read<MaterialReturnBloc>();
        final queryBloc = context.read<MaterialReturnQueryBloc>();
        final success = await _showDeleteDialog(
          bloc: bloc,
          context: context,
          action: action,
        );
        if (success ?? false) {
          queryBloc.add(MaterialReturnQueryEvent.fetch(isExternal: isExternal));
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required MaterialReturnBloc bloc,
    required DataAction action,
  }) {
    final entity = Entity.materialReturn;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialReturnBloc, MaterialReturnState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: materialReturn.id,
                onConfirm: () {
                  bloc.add(MaterialReturnEvent.delete(materialReturn));
                },
              );
            },
          ),
        );
      },
    );
  }
}
