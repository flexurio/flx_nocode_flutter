import 'package:flexurio_chiron_finance/src/app/bloc/rate_bloc/rate_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/rate.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.rate,
    super.key,
  });

  static Widget prepare({
    required Rate rate,
  }) {
    return BlocProvider(
      create: (context) => RateBloc(),
      child: DeleteButton(
        rate: rate,
      ),
    );
  }

  final Rate rate;

  @override
  Widget build(BuildContext context) {
    final deleteBloc = context.read<RateBloc>();
    final queryBloc = context.read<RateQueryBloc>();
    return IconButtonSmall(
      permission: PermissionFinance.rateDelete,
      action: DataAction.delete,
      onPressed: () {
        _showDeleteDialog(context, deleteBloc).then(
          (value) {
            if (value ?? false) {
              Toast(context).success(Message.successDeleted(Entity.rate));
              queryBloc.add(
                const RateQueryEvent.fetch(),
              );
            }
          },
        );
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    RateBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.delete;
        final entity = Entity.rate;
        return BlocListener<RateBloc, RateBlocState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<RateBloc, RateBlocState>(
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
                label: rate.currency.id,
                onConfirm: () {
                  bloc.add(RateBlocEvent.delete(rate.id));
                },
              );
            },
          ),
        );
      },
    );
  }
}
