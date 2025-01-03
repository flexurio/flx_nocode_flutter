import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDeleteButton extends StatelessWidget {
  const MaterialIssueDeleteButton({
    required this.materialIssue,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final MaterialIssue materialIssue;

  static Widget prepare({
    required MaterialIssue materialIssue,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialIssueBloc(isExternal: isExternal),
      child: MaterialIssueDeleteButton(
        materialIssue: materialIssue,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialIssue;
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialIssueDelete(isExternal: isExternal),
      action: action,
      onPressed: () {
        final bloc = context.read<MaterialIssueBloc>();
        final queryBloc = context.read<MaterialIssueQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          if (value ?? false) {
            queryBloc.add(const MaterialIssueQueryEvent.fetch());
          }
          return () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          };
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    MaterialIssueBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialIssue;

    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialIssueBloc, MaterialIssueState>(
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
          child: BlocBuilder<MaterialIssueBloc, MaterialIssueState>(
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
                label: materialIssue.id,
                onConfirm: () {
                  bloc.add(
                    MaterialIssueEvent.delete(materialIssue: materialIssue),
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
