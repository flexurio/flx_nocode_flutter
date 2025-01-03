import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionLineDeleteButton extends StatelessWidget {
  const ProductionLineDeleteButton._({
    required this.id,
  });

  static Widget prepare({
    required int id,
  }) {
    return BlocProvider(
      create: (context) => ProductionLineBloc(),
      child: ProductionLineDeleteButton._(id: id),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionProduction.productionLineDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<ProductionLineBloc>();
        final queryBloc = context.read<ProductionLineQueryBloc>();
        final success = await _showConfirmationDialog(context, bloc);
        if (success ?? false) {
          queryBloc.add(const ProductionLineQueryEvent.get());
        }
      },
    );
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    ProductionLineBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        return BlocListener<ProductionLineBloc, ProductionLineState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context)
                    .success(Message.successCreated(Entity.productionLine));
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductionLineBloc, ProductionLineState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.productionLine,
                label: id.toString(),
                onConfirm: () {
                  bloc.add(ProductionLineEvent.delete(id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
