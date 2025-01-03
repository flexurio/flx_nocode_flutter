import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnDetailDeleteButton extends StatelessWidget {
  const MaterialReturnDetailDeleteButton({
    required this.materialReturnDetail,
    required this.isExternal,
    this.blocTable,
    this.materialReturn,
    super.key,
  });

  static Widget prepare({
    required MaterialReturnDetail materialReturnDetail,
    required bool isExternal,
    MaterialReturnBloc? blocTable,
    MaterialReturn? materialReturn,
  }) {
    return BlocProvider(
      create: (context) => MaterialReturnBloc(),
      child: MaterialReturnDetailDeleteButton(
        materialReturnDetail: materialReturnDetail,
        blocTable: blocTable,
        materialReturn: materialReturn,
        isExternal: isExternal,
      ),
    );
  }

  final MaterialReturnDetail materialReturnDetail;
  final MaterialReturnBloc? blocTable;
  final MaterialReturn? materialReturn;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = Entity.materialReturnDetail;
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialReturnDetailDelete(isExternal: isExternal),
      action: action,
      onPressed: () {
        final bloc = context.read<MaterialReturnBloc>();
        _showDeleteDialog(context, bloc, blocTable).then(
          (value) {
            return () {
              blocTable!.add(
                MaterialReturnEvent.fetch(materialReturn!, isExternal),
              );
              Toast(context).dataChanged(action, entity);
              Navigator.pop(context, true);
            };
          },
        );
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    MaterialReturnBloc bloc,
    MaterialReturnBloc? blocTable,
  ) {
    const action = DataAction.delete;
    final entity = Entity.materialReturnDetail;
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return BlocListener<MaterialReturnBloc, MaterialReturnState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              success: () {
                blocTable!.add(
                  MaterialReturnEvent.fetch(materialReturn!, isExternal),
                );
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
            );
          },
          child: BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: materialReturnDetail.material.id,
                onConfirm: () {
                  bloc.add(
                    MaterialReturnEvent.materialDelete(
                      materialReturnDetail,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
