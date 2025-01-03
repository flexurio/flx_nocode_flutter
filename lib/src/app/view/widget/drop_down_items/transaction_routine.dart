import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_routine_query/transaction_routine_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchTransactionRoutine extends StatelessWidget
    implements DropDownObject<TransactionRoutine> {
  const FDropDownSearchTransactionRoutine({
    required this.onChanged,
    this.onDataLoaded,
    this.isRequired = true,
    this.enabled = true,
    super.key,
    this.initialValue,
    this.label,
  });

  final void Function(List<TransactionRoutine> transactionRoutines)?
      onDataLoaded;

  @override
  final TransactionRoutine? initialValue;

  @override
  final void Function(TransactionRoutine?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(TransactionRoutine?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocListener<TransactionRoutineQueryBloc,
        TransactionRoutineQueryState>(
      listener: (context, state) {
        onDataLoaded?.call(
          state.maybeWhen(
            orElse: () => [],
            loaded: (transactionRoutines) {
              return transactionRoutines.data;
            },
          ),
        );
      },
      child: BlocBuilder<TransactionRoutineQueryBloc,
          TransactionRoutineQueryState>(
        builder: (context, state) {
          return FDropDownSearch<TransactionRoutine>(
            validator: validator,
            onChanged: (transactionRoutines) {
              onChanged(transactionRoutines);
              onDataLoaded?.call(
                state.maybeWhen(
                  orElse: () => [],
                  loaded: (transactionRoutines) {
                    return transactionRoutines.data;
                  },
                ),
              );
            },
            initialValue: initialValue,
            enabled: enabled,
            labelText: label ?? Entity.transactionRoutine.title,
            itemAsString: (transactionRoutine) => transactionRoutine.title,
            items: state.maybeWhen(
              orElse: () => [],
              loaded: (transactionRoutines) {
                return transactionRoutines.data;
              },
            ),
            status: state.maybeWhen(
              error: (error) => Status.error,
              loading: (_) => Status.progress,
              orElse: () => Status.loaded,
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement small
  bool get small => throw UnimplementedError();
}
