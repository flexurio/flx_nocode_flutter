import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.id,
  });

  static Widget prepare({required String id}) {
    return BlocProvider(
      create: (context) => MaterialUnitBloc(),
      child: DeleteButton._(id: id),
    );
  }

  final String id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionMaterial.materialUnitDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialUnitBloc>();
        final queryBloc = context.read<MaterialUnitQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const MaterialUnitQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    MaterialUnitBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<MaterialUnitBloc, MaterialUnitState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .success(Message.successDeleted(Entity.materialUnit));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialUnitBloc, MaterialUnitState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.materialUnit,
                label: id,
                onConfirm: () {
                  bloc.add(MaterialUnitEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
