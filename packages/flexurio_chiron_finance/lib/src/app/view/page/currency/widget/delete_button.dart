import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({required this.id, super.key});

  static Widget prepare({
    required String id,
  }) {
    return BlocProvider(
      create: (context) => CurrencyBloc(),
      child: DeleteButton(
        id: id,
      ),
    );
  }

  final String id;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: PermissionFinance.currencyDelete,
      action: DataAction.delete,
      onPressed: () async {
        final bloc = context.read<CurrencyBloc>();
        final queryBloc = context.read<CurrencyQueryBloc>();
        await _showDeleteDialog(context, bloc).then((value) {
          const action = DataAction.delete;
          final entity = Entity.currency;
          if (value ?? false) {
            queryBloc.add(const CurrencyQueryEvent.fetch());
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
    CurrencyBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.currency;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<CurrencyBloc, CurrencyState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: (currency) {
                Toast(context).dataChanged(DataAction.delete, Entity.currency);
                Navigator.pop(context, currency);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<CurrencyBloc, CurrencyState>(
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
                label: id,
                onConfirm: () {
                  bloc.add(CurrencyBlocEvent.delete(id: id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
