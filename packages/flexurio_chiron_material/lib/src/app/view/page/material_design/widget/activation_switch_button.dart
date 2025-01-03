import 'package:flexurio_chiron_material/src/app/bloc/material_design/material_design_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivationSwitchButton extends StatelessWidget {
  const ActivationSwitchButton._(
      {required this.materialDesign, required this.isExternal});
  final bool isExternal;

  final MaterialDesign materialDesign;

  static Widget prepare({
    required MaterialDesign materialDesign,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialDesignBloc(isExternal: isExternal),
      child: ActivationSwitchButton._(
          materialDesign: materialDesign, isExternal: isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityPermission(
      permission: PermissionMaterial.materialDesignEdit(isExternal: isExternal),
      orElse: BoolIcon(!materialDesign.isLock),
      child: CupertinoSwitch(
        value: !materialDesign.isLock,
        onChanged: (_) async {
          final materialDesignBloc = context.read<MaterialDesignBloc>();
          final queryBloc = context.read<MaterialDesignQueryBloc>();
          final action = !materialDesign.isLock
              ? DataAction.deactivate
              : DataAction.activate;
          final success = await _showConfirmationDialog(
            context,
            materialDesignBloc,
            action,
          );
          if (success ?? false) {
            queryBloc.add(const MaterialDesignQueryEvent.fetch());
          }
        },
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    MaterialDesignBloc materialBloc,
    DataAction action,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialDesignBloc, MaterialDesignState>(
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
          child: BlocBuilder<MaterialDesignBloc, MaterialDesignState>(
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
                label: materialDesign.material.name,
                onConfirm: () {
                  if (action == DataAction.activate) {
                    materialBloc.add(
                      MaterialDesignEvent.activate(
                        materialDesign: materialDesign,
                      ),
                    );
                  } else if (action == DataAction.deactivate) {
                    materialBloc.add(
                      MaterialDesignEvent.deactivate(
                        materialDesign: materialDesign,
                      ),
                    );
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
