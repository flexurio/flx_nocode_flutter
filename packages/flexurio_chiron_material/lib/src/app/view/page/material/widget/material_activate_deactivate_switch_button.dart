import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart' as bloc;
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialActivateDeactivateSwitchButton extends StatelessWidget {
  const MaterialActivateDeactivateSwitchButton._({
    required this.material,
  });

  final model.Material material;

  static Widget prepare({
    required model.Material material,
  }) {
    return BlocProvider(
      create: (context) => bloc.MaterialBloc(),
      child: MaterialActivateDeactivateSwitchButton._(material: material),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: material.isActive,
      onChanged: (_) async {
        final materialBloc = context.read<bloc.MaterialBloc>();
        final queryBloc = context.read<MaterialQueryBloc>();
        final action =
            material.isActive ? DataAction.deactivate : DataAction.activate;
        final success =
            await _showConfirmationDialog(context, materialBloc, action);
        if (success ?? false) {
          queryBloc.add(const MaterialQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    bloc.MaterialBloc materialBloc,
    DataAction action,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
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
                  if (action == DataAction.activate) {
                    materialBloc
                        .add(bloc.MaterialEvent.activate(id: material.id));
                  } else if (action == DataAction.deactivate) {
                    materialBloc
                        .add(bloc.MaterialEvent.deactivate(id: material.id));
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
