import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request/material_request_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestDeleteButton extends StatelessWidget {
  const MaterialRequestDeleteButton._({
    required this.materialRequest,
  });

  static Widget prepare({
    required MaterialRequest materialRequest,
  }) {
    return BlocProvider(
      create: (context) => MaterialRequestBloc(),
      child: MaterialRequestDeleteButton._(materialRequest: materialRequest),
    );
  }

  final MaterialRequest materialRequest;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.purchaseRequestDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<MaterialRequestBloc>();
        final queryBloc = context.read<PurchaseRequestQueryBloc>();
        final success = await _showDeleteDialog(context: context, bloc: bloc);
        if (success ?? false) {
          queryBloc.add(const PurchaseRequestQueryEvent.fetch());
        }
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required MaterialRequestBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.purchaseRequest;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<MaterialRequestBloc, MaterialRequestState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (materialRequest) {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<MaterialRequestBloc, MaterialRequestState>(
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
                label: materialRequest.id,
                onConfirm: () {
                  bloc.add(MaterialRequestEvent.delete(materialRequest.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
