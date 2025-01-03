import 'package:flexurio_chiron_material/src/app/bloc/material_group/material_group_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required String id,
  }) {
    return BlocProvider(
      create: (context) => MaterialGroupBloc(),
      child: DeleteButton._(id: id),
    );
  }

  final String id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.materialGroupDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialGroupBloc>();
        final queryBloc = context.read<MaterialGroupQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const MaterialGroupQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    MaterialGroupBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<MaterialGroupBloc, MaterialGroupState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .dataChanged(DataAction.delete, Entity.materialGroup);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialGroupBloc, MaterialGroupState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.materialGroup,
                label: id,
                onConfirm: () {
                  bloc.add(MaterialGroupEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
