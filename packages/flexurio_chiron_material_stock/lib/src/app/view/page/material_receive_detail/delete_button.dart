import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailDeleteButton extends StatelessWidget {
  const MaterialReceiveDetailDeleteButton._({
    required this.materialReceiveDetail,
    required this.isExternal,
    required this.isByNa,
  });

  static Widget prepare({
    required MaterialReceiveDetail materialReceiveDetail,
    required bool isExternal,
    required bool isByNa,
  }) {
    return BlocProvider(
      create: (context) => MaterialReceiveDetailBloc(
        isExternal: isExternal,
        isByNa: isByNa,
      ),
      child: MaterialReceiveDetailDeleteButton._(
        materialReceiveDetail: materialReceiveDetail,
        isExternal: isExternal,
        isByNa: isByNa,
      ),
    );
  }

  final MaterialReceiveDetail materialReceiveDetail;
  final bool isExternal;
  final bool isByNa;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterialStock.materialReceiveDetailDelete(
          isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () {
        final bloc = context.read<MaterialReceiveDetailBloc>();
        final queryBlocNa = context.read<MaterialReceiveByNaQueryBloc>();
        final queryBloc = context.read<MaterialReceiveDetailQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          if (value ?? false) {
            if (isByNa) {
              queryBlocNa.add(MaterialReceiveByNaQueryEvent.fetch());
            } else {
              queryBloc.add(MaterialReceiveDetailQueryEvent.fetch());
            }
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    MaterialReceiveDetailBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialReceive;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialReceiveDetailBloc,
            MaterialReceiveDetailState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(
                    DataAction.delete, EntityMaterialStock.materialReceive);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialReceiveDetailBloc,
              MaterialReceiveDetailState>(
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
                label: materialReceiveDetail.materialReceive.id,
                onConfirm: () {
                  bloc.add(
                    MaterialReceiveDetailEvent.delete(
                      materialReceiveDetail: materialReceiveDetail,
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
