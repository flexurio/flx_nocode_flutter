import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart'
    as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialTypeDeleteButton extends StatelessWidget {
  const MaterialTypeDeleteButton._({
    required this.materialType,
  });

  static Widget prepare({
    required model.MaterialType materialType,
  }) {
    return BlocProvider(
      create: (context) => MaterialTypeBloc(),
      child: MaterialTypeDeleteButton._(materialType: materialType),
    );
  }

  final model.MaterialType materialType;

  @override
  Widget build(BuildContext context) {
    final toast = Toast(context);
    return IconButtonSmall(
      permission: PermissionMaterial.materialTypeDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialTypeBloc>();
        final queryBloc = context.read<MaterialTypeQueryBloc>();
        final success =
            await _showDeleteDialog(bloc: bloc, context: context, toast: toast);
        if (success ?? false) {
          queryBloc.add(const MaterialTypeQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required MaterialTypeBloc bloc,
    required Toast toast,
  }) {
    const action = DataAction.delete;
    final entity = Entity.product;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialTypeBloc, MaterialTypeState>(
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
          child: BlocBuilder<MaterialTypeBloc, MaterialTypeState>(
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
                label: materialType.id,
                onConfirm: () {
                  bloc.add(MaterialTypeEvent.delete(materialType));
                },
              );
            },
          ),
        );
      },
    );
  }
}
