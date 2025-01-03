import 'package:flexurio_chiron_material/src/app/bloc/material_design/material_design_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_design_query/material_design_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialDesignDeleteButton extends StatelessWidget {
  const MaterialDesignDeleteButton._(
      {required this.materialDesign, required this.isExternal});
  final bool isExternal;

  static Widget prepare({
    required MaterialDesign materialDesign,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialDesignBloc(isExternal: isExternal),
      child: MaterialDesignDeleteButton._(
        materialDesign: materialDesign,
        isExternal: isExternal,
      ),
    );
  }

  final MaterialDesign materialDesign;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission:
          PermissionMaterial.materialDesignDelete(isExternal: isExternal),
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialDesignBloc>();
        final queryBloc = context.read<MaterialDesignQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const MaterialDesignQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    MaterialDesignBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<MaterialDesignBloc, MaterialDesignState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () => Navigator.pop(context, true),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialDesignBloc, MaterialDesignState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.materialDesign,
                label: materialDesign.designCode,
                onConfirm: () {
                  bloc.add(MaterialDesignEvent.delete(materialDesign));
                },
              );
            },
          ),
        );
      },
    );
  }
}
