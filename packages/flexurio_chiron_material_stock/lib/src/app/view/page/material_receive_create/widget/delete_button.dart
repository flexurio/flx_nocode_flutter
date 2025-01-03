import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_query/material_receive_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/permission.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDeleteButton extends StatelessWidget {
  const MaterialReceiveDeleteButton._({
    required this.materialReceive,
    required this.isExternal,
  });

  static Widget prepare({
    required MaterialReceive materialReceive,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialReceiveBloc(
        isExternal: isExternal,
      ),
      child: MaterialReceiveDeleteButton._(
        isExternal: isExternal,
        materialReceive: materialReceive,
      ),
    );
  }

  final MaterialReceive materialReceive;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialReceiveDelete(isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () {
        final bloc = context.read<MaterialReceiveBloc>();
        final queryBloc = context.read<MaterialReceiveQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          if (value ?? false) {
            queryBloc.add(const MaterialReceiveQueryEvent.fetch());
          }
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    MaterialReceiveBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialReceive;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialReceiveBloc, MaterialReceiveState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(DataAction.delete, Entity.transactionType);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
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
                label: materialReceive.id,
                onConfirm: () {
                  bloc.add(
                    MaterialReceiveEvent.delete(
                      materialReceive: materialReceive,
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
