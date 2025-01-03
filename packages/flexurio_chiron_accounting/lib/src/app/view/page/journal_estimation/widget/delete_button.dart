import 'package:flexurio_chiron_accounting/src/app/bloc/jornal_estimation_query_bloc/journal_estimation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/journal_estimation/journal_estimation_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalEstimationDeleteButton extends StatelessWidget {
  const JournalEstimationDeleteButton({
    required this.journalEstimation,
    super.key,
  });

  static Widget prepare({
    required JournalEstimation journalEstimation,
  }) {
    return BlocProvider(
      create: (context) => JournalEstimationBloc(),
      child: JournalEstimationDeleteButton(
        journalEstimation: journalEstimation,
      ),
    );
  }

  final JournalEstimation journalEstimation;

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;
    final entity = Entity.journalEstimation;
    return IconButtonSmall(
      permission: Permission.journalEstimationDelete,
      action: action,
      onPressed: () {
        final bloc = context.read<JournalEstimationBloc>();
        final queryBloc = context.read<JournalEstimationQueryBloc>();
        final queryEvent = JournalEstimationQueryEvent.fetch();
        _showDeleteDialog(context, bloc).then(
          (value) {
            if (value ?? false) {
              queryBloc.add(queryEvent);
            }
            return () {
              Toast(context).dataChanged(action, entity);
              Navigator.pop(context, true);
            };
          },
        );
      },
    );
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
    JournalEstimationBloc bloc,
  ) {
    const action = DataAction.delete;
    final entity = Entity.journalEstimation;
    return showDialog(
      context: context,
      builder: (context) {
        return BlocListener<JournalEstimationBloc, JournalEstimationState>(
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
          child: BlocBuilder<JournalEstimationBloc, JournalEstimationState>(
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
                label: journalEstimation.name,
                onConfirm: () {
                  bloc.add(
                    JournalEstimationEvent.delete(
                      journalEstimation: journalEstimation,
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
