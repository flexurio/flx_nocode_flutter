import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart'
    as bloc;
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialDeleteButton extends StatelessWidget {
  const MaterialDeleteButton._({
    required this.material,
    required this.isExternal,
  });

  static Widget prepare({
    required model.Material material,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => bloc.MaterialBloc(isExternal: isExternal),
      child: MaterialDeleteButton._(material: material, isExternal: isExternal),
    );
  }

  final bool isExternal;
  final model.Material material;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterial.materialDelete(isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () async {
        final materialBloc = context.read<bloc.MaterialBloc>();
        final queryBloc = context.read<MaterialQueryBloc>();
        final success = await _showConfirmationDialog(context, materialBloc);
        if (success ?? false) {
          queryBloc.add(const MaterialQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    bloc.MaterialBloc materialBloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<bloc.MaterialBloc, bloc.MaterialState>(
          bloc: materialBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.material);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<bloc.MaterialBloc, bloc.MaterialState>(
            bloc: materialBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.material,
                label: material.name,
                onConfirm: () {
                  materialBloc.add(bloc.MaterialEvent.delete(id: material.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
