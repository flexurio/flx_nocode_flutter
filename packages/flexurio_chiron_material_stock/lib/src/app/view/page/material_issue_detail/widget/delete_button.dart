import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDetailDeleteButton extends StatelessWidget {
  const MaterialIssueDetailDeleteButton({
    required this.materialIssueDetail,
    required this.isExternal,
    super.key,
  });
  final bool isExternal;
  final MaterialIssueDetail materialIssueDetail;

  static Widget prepare({
    required MaterialIssueDetail materialIssueDetail,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => MaterialIssueDetailBloc(isExternal: isExternal),
      child: MaterialIssueDetailDeleteButton(
        materialIssueDetail: materialIssueDetail,
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialIssueDetail;
    return IconButtonSmall(
      permission:
          PermissionMaterialStock.materialIssueDelete(isExternal: isExternal),
      action: action,
      onPressed: () {
        final bloc = context.read<MaterialIssueDetailBloc>();
        final queryBloc = context.read<MaterialIssueDetailQueryBloc>();
        _showDeleteDialog(context, bloc).then((value) {
          if (value ?? false) {
            queryBloc.add(
              MaterialIssueDetailQueryEvent.fetch(
                materialIssue: materialIssueDetail.materialIssue,
              ),
            );
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
    MaterialIssueDetailBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = EntityMaterialStock.materialIssueDetail;

    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialIssueDetailBloc, MaterialIssueDetailState>(
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
          child: BlocBuilder<MaterialIssueDetailBloc, MaterialIssueDetailState>(
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
                label: materialIssueDetail.id.toString(),
                onConfirm: () {
                  bloc.add(
                    MaterialIssueDetailEvent.delete(
                      materialIssueDetail: materialIssueDetail,
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
